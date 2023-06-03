/*
 *  Webkul Software.
 *  @package  Mobikul Application Code.
 *  @Category Mobikul
 *  @author Webkul <support@webkul.com>
 *  @Copyright (c) Webkul Software Private Limited (https://webkul.com)
 *  @license https://store.webkul.com/license.html 
 *  @link https://store.webkul.com/license.html
 *
 */
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mime/mime.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/configuration/mobikul_theme.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/constants/string_keys.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/helper/app_alert_message.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/helper/app_storage_pref.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/helper/application_localization.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/helper/utils.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/helper_widgets/loader.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/models/ticket/ticket_details.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/screens/ticketReply/bloc/ticket_reply_bloc.dart';

class TicketReplyScreen extends StatefulWidget {
  const TicketReplyScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return TicketReplyScreenState();
  }
}

class TicketReplyScreenState extends State<TicketReplyScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TicketReplyBloc? bloc;
  final replyMessageController = TextEditingController();
  bool _loading = false;
  var agentEmail = "";
  List<File> fileList = [];
  List<TicketStatuses> dataModel = [];

  @override
  void initState() {
    _loading = false;
    bloc = context.read<TicketReplyBloc>();
    bloc?.add(TicketReplyInitialEvent());
    fileList = [];
    agentEmail = appStoragePref.getAgentEmail();
    dataModel = bloc!.ticketData.ticketStatuses;
    dataModel.insert(0, const TicketStatuses(id: -1, code: "", colorCode: "", description: ""));
    super.initState();
  }

  @override
  void dispose() {
    bloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _ticketReplyBloc(context);
  }

  Widget _ticketReplyBloc(BuildContext context) {
    return BlocBuilder<TicketReplyBloc, TicketReplyState>(
        builder: (context, state) {
      if (state is TicketReplyInitialState) {
        _loading = false;
        return buildUI(context);
      } else if (state is TicketReplyLoadingState) {
        _loading = true;
        return buildUI(context);
      } else if (state is TicketReplySuccessState) {
        _loading = false;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          AlertMessage.showSuccess(state.model.success, context);
          Future.delayed(const Duration(milliseconds: 500))
              .then((value) => {Navigator.pop(context)});
        });
        return buildUI(context);
      } else if (state is TicketReplyErrorState) {
        _loading = false;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          AlertMessage.showError(state.message, context);
        });
        return buildUI(context);
      } else {
        return SafeArea(
          child: Stack(
            children: [
              Scaffold(
                  key: scaffoldKey,
                  appBar: AppBar(),
                  body: Container(
                    color: Colors.white,
                    child: Text(ApplicationLocalizations.instance!
                        .translate(StringKeys.errorMsgWrongPageLabel)),
                  )),
              Visibility(
                visible: _loading,
                child: const Loader(),
              ),
            ],
          ),
        );
      }
    });
  }

  Widget buildUI(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            ApplicationLocalizations.instance!
                .translate(StringKeys.replyButtonLabel)
                .toCapitalized(),
            style: MobikulTheme.mobikulTheme.textTheme.bodyLarge,
          ),
          actions: [
            IconButton(
              onPressed: () {
                onPressAttachmentButton();
              },
              icon: const Icon(Icons.attach_file),
            ),
            IconButton(
              onPressed: () {
                if (replyMessageController.text.trim().isNotEmpty) {
                  onPressSendButton(replyMessageController.text.trim());
                } else {
                  AlertMessage.showError(
                      ApplicationLocalizations.instance!
                          .translate(StringKeys.replyEmptyWarningMsg),
                      context);
                }
              },
              icon: const Icon(Icons.send),
            ),
          ],
        ),
        body: SafeArea(
          child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextField(
                    controller: replyMessageController,
                    minLines: 10,
                    maxLines: null,
                    style: MobikulTheme.mobikulTheme.textTheme.bodyMedium
                        ?.copyWith(
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.normal),
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                      hintText: ApplicationLocalizations.instance!
                          .translate(StringKeys.replyHintLabel),
                      hintStyle: MobikulTheme.mobikulTheme.textTheme.bodyMedium
                          ?.copyWith(
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.w300),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: fileList.isNotEmpty,
                    child: SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Tooltip(
                            message: fileList[index]
                                .path
                                .split(Platform.pathSeparator)
                                .last,
                            triggerMode: TooltipTriggerMode.tap,
                            child: isImage(fileList[index])
                                ? Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      Image.file(
                                        fileList[index],
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.fill,
                                      ),
                                      Material(
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              fileList.removeAt(index);
                                            });
                                          },
                                          child: const Icon(
                                            Icons.delete,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Material(
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              fileList.removeAt(index);
                                            });
                                          },
                                          child: const Icon(
                                            Icons.delete,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 100,
                                        child: Text(
                                          fileList[index]
                                              .path
                                              .split(Platform.pathSeparator)
                                              .last,
                                          overflow: TextOverflow.fade,
                                        ),
                                      ),
                                    ],
                                  ),
                          );
                        },
                        itemCount: fileList.length,
                      ),
                    ),
                  )
                ],
              )),
        ));
  }

  onPressSendButton(String message) async {
    List<MultipartFile> attachmentMultipartFileList = [];
    if (fileList.isNotEmpty) {
      attachmentMultipartFileList = await convertListToMultipart(fileList);
    }

    if (fileList.isNotEmpty && fileList.length > 5) {
      if (context.mounted) {
        AlertMessage.showError(
            ApplicationLocalizations.instance!
                .translate(StringKeys.attachmentCountMoreThan5Label),
            context);
      }
    } else {
      showSubmitOptionDialog(message, fileList.isNotEmpty ? attachmentMultipartFileList: null);
    }
  }

  showSubmitOptionDialog(String message, List<MultipartFile>? attachmentMultipartFileList) {
    showMenu(
        context: context,
        position: const RelativeRect.fromLTRB(10, 0, 0, 0),
        items: dataModel
            .map((ticketStatus) => PopupMenuItem(
            child: ticketStatus.id == -1
                ? Text(ApplicationLocalizations.instance!.translate(StringKeys.submitLabel))
                : Text("${ApplicationLocalizations.instance!.translate(StringKeys.submitAndPrefixLabel)} ${ticketStatus.description}"),
          onTap: (){
            bloc?.add(TicketReplyAddReplyEvent(
                "agent", agentEmail, "reply", message, fileList.isNotEmpty ? attachmentMultipartFileList: null,ticketStatus.id == -1 ? "" : ticketStatus.code));
          },
        )).toList());
  }

  bool isImage(File file) {
    final mimeType = lookupMimeType(file.path);
    return mimeType!.startsWith('image/');
  }

  Future<List<MultipartFile>> convertListToMultipart(List<File> files) async {
    final multipartFiles = <MultipartFile>[];

    for (final file in files) {
      final fileBytes = await file.readAsBytes();
      final multipartFile = MultipartFile.fromBytes(
        fileBytes,
        filename: file.path.split('/').last,
      );
      multipartFiles.add(multipartFile);
    }

    return multipartFiles;
  }

  onPressAttachmentButton() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowMultiple: true, dialogTitle: "Select");
    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      setState(() {
        fileList.addAll(files);
      });
    }
  }
}
