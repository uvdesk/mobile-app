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
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/constants/string_keys.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/helper/application_localization.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/helper/utils.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/screens/ticketUpdateInfo/bloc/ticket_update_info_bloc.dart';

class TicketUpdateInfoScreen extends StatefulWidget {
  const TicketUpdateInfoScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return TicketUpdateInfoScreenState();
  }
}

class TicketUpdateInfoScreenState extends State<TicketUpdateInfoScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TicketUpdateInfoBloc? bloc;

  @override
  void initState() {
    bloc = context.read<TicketUpdateInfoBloc>();
    bloc?.add(TicketUpdateInfoInitialEvent());
    super.initState();
  }

  @override
  void dispose() {
    bloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _ticketUpdateInfoBloc(context);
  }

  Widget _ticketUpdateInfoBloc(BuildContext context) {
    return BlocBuilder<TicketUpdateInfoBloc, TicketUpdateInfoState>(
        builder: (context, state) {
      if (state is TicketUpdateInfoInitialState) {
        var dataModel = state.model;
        String priorityColor = "#000000";
        String priorityLabel = "";
        String statusLabel ="";
        String ticketTypeLabel = "";
        var priority = dataModel.ticketPriorities
            .where((element) => element.id == dataModel.ticket!.priority)
            .toList();
        if (priority.isNotEmpty) {
          priorityColor = priority[0].colorCode;
          priorityLabel = priority[0].description;
        }

        var status = dataModel.ticketStatuses.where((element) => element.id == dataModel.ticket!.status).toList();
        if(status.isNotEmpty){
          statusLabel = status[0].description;
        }

        var type = dataModel.ticketTypes.where((element) => element.id == dataModel.ticket!.type).toList();
        if(type.isNotEmpty){
          ticketTypeLabel =  type[0].description;
        }



        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close),
              ),
            ],
            title: Text(
              ApplicationLocalizations.instance!
                  .translate(StringKeys.updateInfoPageTitle),
              style: MobikulTheme.mobikulTheme.textTheme.bodyLarge,
            ),
          ),
          body: SafeArea(
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    ApplicationLocalizations.instance!
                        .translate(StringKeys.agentLabel),
                  ),
                  titleTextStyle:
                      MobikulTheme.mobikulTheme.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.w500,
                  ),
                  subtitle: (dataModel.ticket!.agent == null  ||dataModel.ticket!.agent!.name.isEmpty)
                      ? Text(
                          ApplicationLocalizations.instance!
                              .translate(StringKeys.notAssignedLabel),
                          style: MobikulTheme.mobikulTheme.textTheme.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w500),
                        )
                      : Text(
                          dataModel.ticket!.agent!.name.toTitleCase(),
                          style: MobikulTheme.mobikulTheme.textTheme.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w500),
                        ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.grey.shade500,
                  ),
                ),
                const Divider(
                  height: 1,
                ),
                ListTile(
                  title: Text(
                    ApplicationLocalizations.instance!
                        .translate(StringKeys.priorityLabel),
                  ),
                  titleTextStyle:
                      MobikulTheme.mobikulTheme.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.w500,
                  ),
                  subtitle: Row(
                    children: [
                      Icon(
                        Icons.circle,
                        size: 12,
                        color: Utils.fromHex(priorityColor),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        priorityLabel.toTitleCase(),
                        style: MobikulTheme.mobikulTheme.textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.grey.shade500,
                  ),
                ),
                const Divider(
                  height: 1,
                ),
                ListTile(
                  title: Text(
                    ApplicationLocalizations.instance!
                        .translate(StringKeys.statusLabel),
                  ),
                  titleTextStyle:
                  MobikulTheme.mobikulTheme.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.w500,
                  ),
                  subtitle: (dataModel.ticket!.status <=0)
                      ? Text(
                    ApplicationLocalizations.instance!
                        .translate(StringKeys.notAssignedLabel),
                    style: MobikulTheme.mobikulTheme.textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w500),
                  )
                      : Text(
                    statusLabel.toTitleCase(),
                    style: MobikulTheme.mobikulTheme.textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.grey.shade500,
                  ),
                ),
                const Divider(
                  height: 1,
                ),
                ListTile(
                  title: Text(
                    ApplicationLocalizations.instance!
                        .translate(StringKeys.typeLabel),
                  ),
                  titleTextStyle:
                  MobikulTheme.mobikulTheme.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.w500,
                  ),
                  subtitle: (dataModel.ticket!.type <=0)
                      ? Text(
                    ApplicationLocalizations.instance!
                        .translate(StringKeys.notAssignedLabel),
                    style: MobikulTheme.mobikulTheme.textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w500),
                  )
                      : Text(
                    ticketTypeLabel.toTitleCase(),
                    style: MobikulTheme.mobikulTheme.textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.grey.shade500,
                  ),
                ),
                const Divider(
                  height: 1,
                ),
                ListTile(
                  title: Text(
                    ApplicationLocalizations.instance!
                        .translate(StringKeys.groupLabel),
                  ),
                  titleTextStyle:
                  MobikulTheme.mobikulTheme.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.w500,
                  ),
                  subtitle: (dataModel.ticket!.group == null || dataModel.ticket!.group!.name.isEmpty)
                      ? Text(
                    ApplicationLocalizations.instance!
                        .translate(StringKeys.notAssignedLabel),
                    style: MobikulTheme.mobikulTheme.textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w500),
                  )
                      : Text(
                    dataModel.ticket!.group!.name,
                    style: MobikulTheme.mobikulTheme.textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.grey.shade500,
                  ),
                ),
                const Divider(
                  height: 1,
                ),
                ListTile(
                  title: Text(
                    ApplicationLocalizations.instance!
                        .translate(StringKeys.teamLabel),
                  ),
                  titleTextStyle:
                  MobikulTheme.mobikulTheme.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.w500,
                  ),
                  subtitle: (dataModel.ticket!.team == null||dataModel.ticket!.team!.name.isEmpty )
                      ? Text(
                    ApplicationLocalizations.instance!
                        .translate(StringKeys.notAssignedLabel),
                    style: MobikulTheme.mobikulTheme.textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w500),
                  )
                      : Text(
                    dataModel.ticket!.team!.name,
                    style: MobikulTheme.mobikulTheme.textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.grey.shade500,
                  ),
                ),
                const Divider(
                  height: 1,
                ),

              ],
            ),
          ),
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
}
