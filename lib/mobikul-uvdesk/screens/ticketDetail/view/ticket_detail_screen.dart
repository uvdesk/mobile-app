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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/configuration/mobikul_theme.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/constants/app_routes.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/constants/string_keys.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/helper/application_localization.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/helper/utils.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/helper_widgets/app_dialog_helper.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/helper_widgets/expandable_text.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/models/ticket/ticket_details.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/screens/ticketDetail/bloc/ticket_detail_bloc.dart';

class TicketDetailScreen extends StatefulWidget {
  final int ticketId;
  const TicketDetailScreen({super.key, required this.ticketId});

  @override
  State<StatefulWidget> createState() {
    return TicketDetailScreenState();
  }
}

class TicketDetailScreenState extends State<TicketDetailScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TicketDetailBloc? bloc;

  @override
  void initState() {
    bloc = context.read<TicketDetailBloc>();
    bloc?.add(TicketDetailEventInitial());
    super.initState();
  }

  @override
  void dispose() {
    bloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _ticketDetailBloc(context);
  }

  Widget _ticketDetailBloc(BuildContext context) {
    return BlocBuilder<TicketDetailBloc, TicketDetailState>(
        builder: (context, state) {
      if (state is TicketDetailStateInitial) {
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(),
          body: SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: MobikulTheme.primaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: MobikulTheme.accentColor),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    ApplicationLocalizations.instance
                            ?.translate(StringKeys.pleaseWaitLabel) ??
                        "",
                    style: MobikulTheme.mobikulTheme.textTheme.headlineSmall,
                  ),
                  Text(ApplicationLocalizations.instance?.translate(
                          StringKeys.dashboardPageFetchingTicketsMsg) ??
                      "")
                ],
              ),
            ),
          ),
        );
      } else if (state is TicketDetailStateSuccess) {
        return _buildTicketView(context, state.model);
      } else if (state is TicketDetailStateError) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          AppDialogHelper.errorDialog(
              state.message, context, ApplicationLocalizations.instance,
              title: StringKeys.errorDialogTitleLabel,
              cancelable: true,
              barrierDismissible: true,
              showTryAgainButton: false,
              cancelButtonTitle: StringKeys.ok);
        });
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(),
          body: Container(),
        );
      } else {
        return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(),
            body: Container(
              color: Colors.white,
              child: Text(ApplicationLocalizations.instance!
                  .translate(StringKeys.errorMsgWrongPageLabel)),
            ));
      }
    });
  }

  Widget _buildTicketView(BuildContext context, TicketDetails dataModel) {
    String priorityColor = "#000000";
    var priority = dataModel.ticketPriorities
        .where((element) => element.id == dataModel.ticket!.priority)
        .toList();
    if (priority.isNotEmpty) {
      priorityColor = priority[0].colorCode;
    }
    return Scaffold(
      key: scaffoldKey,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.ticketCustomerInfo,
                        arguments: dataModel);
                  },
                  icon: const Icon(Icons.info_outline)),
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.ticketUpdateInfo,
                        arguments: dataModel);
                  },
                  icon: const Icon(Icons.edit_note_rounded))
            ],
            snap: false,
            pinned: true,
            floating: false,
            centerTitle: true,
            toolbarTextStyle: MobikulTheme.mobikulTheme.textTheme.bodyMedium
                ?.copyWith(overflow: TextOverflow.ellipsis),
            expandedHeight: 100,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              titlePadding: const EdgeInsets.symmetric(vertical: 20),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.circle,
                    size: 12,
                    color: Utils.fromHex(priorityColor),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      dataModel.ticket!.subject,
                      style: MobikulTheme.mobikulTheme.textTheme.bodyMedium
                          ?.copyWith(
                              overflow: TextOverflow.ellipsis, fontSize: 10),
                      maxLines: 2,
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverList.separated(
            itemCount: dataModel.ticket?.threads.length,
            itemBuilder: (context, index) {
              GlobalKey<ExpandableThreadViewState> textKey =
                  GlobalKey<ExpandableThreadViewState>();
              return Container(
                color: dataModel.ticket?.threads[index].threadType == "note"
                    ? Colors.yellow.shade200
                    : Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Image.network(
                        dataModel.ticket!.threads[index].user!.thumbnail,
                        fit: BoxFit.cover,
                        width: 40,
                        height: 40,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 100,
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Utils.getThreadIcon(dataModel
                                    .ticket!.threads[index].threadType),
                                color: Colors.grey.shade400,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                "${dataModel.ticket!.threads[index].user!.name}, ${dataModel.ticket!.threads[index].updatedAt}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.grey.shade600),
                              )
                            ],
                          ),
                          Material(
                            color:
                                dataModel.ticket?.threads[index].threadType ==
                                        "note"
                                    ? Colors.yellow.shade200
                                    : Colors.white,
                            child: InkWell(
                              child: ExpandableThreadView(
                                text: Utils.parseHtmlString(
                                    dataModel.ticket!.threads[index].message),
                                attachmentList: dataModel
                                    .ticket!.threads[index].attachments,
                                key: textKey,
                              ),
                              onTap: () {
                                textKey.currentState?.toggleExpansion();
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                height: 1,
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(12.0),
        child: OutlinedButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.ticketReply,
                    arguments: dataModel)
                .then((_) => bloc?.add(TicketDetailEventInitial()));
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.reply_rounded,
                color: Colors.grey.shade900,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                ApplicationLocalizations.instance!
                    .translate(StringKeys.replyButtonLabel),
                style: MobikulTheme.mobikulTheme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
