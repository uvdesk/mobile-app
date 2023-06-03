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
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/screens/ticketCustomerInfo/bloc/ticket_customer_info_bloc.dart';

class TicketCustomerInfoScreen extends StatefulWidget {
  const TicketCustomerInfoScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return TicketCustomerInfoScreenState();
  }
}

class TicketCustomerInfoScreenState extends State<TicketCustomerInfoScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TicketCustomerInfoBloc? bloc;

  @override
  void initState() {
    bloc = context.read<TicketCustomerInfoBloc>();
    bloc?.add(TicketCustomerInfoEventInitial());
    super.initState();
  }

  @override
  void dispose() {
    bloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _ticketCustomerInfoBloc(context);
  }

  Widget _ticketCustomerInfoBloc(BuildContext context) {
    return BlocBuilder<TicketCustomerInfoBloc, TicketCustomerInfoState>(
        builder: (context, state) {
      if (state is TicketCustomerInfoInitial) {
        var dataModel = state.model;
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
                  .translate(StringKeys.customerInfoPageTitle),
              style: MobikulTheme.mobikulTheme.textTheme.bodyLarge,
            ),
          ),
          body: SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ApplicationLocalizations.instance!
                        .translate(StringKeys.customerInformationLabel),
                    style: MobikulTheme.mobikulTheme.textTheme.titleLarge
                        ?.copyWith(color: Colors.grey.shade500),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child:

                        dataModel.ticket!.customer!.thumbnail.isNotEmpty ?
                        Image.network(
                          dataModel.ticket!.customer!.thumbnail,
                          fit: BoxFit.cover,
                          width: 80,
                          height: 80,
                        ) :  Icon(
                          Icons.account_box,
                          size: 80,
                          color: Colors.grey.shade500,
                        ),

                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              dataModel.ticket!.customer!.name,
                              style: MobikulTheme
                                  .mobikulTheme.textTheme.bodyMedium,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              dataModel.ticket!.customer!.email,
                              style: MobikulTheme
                                  .mobikulTheme.textTheme.bodyMedium
                                  ?.copyWith(color: Colors.grey.shade600),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.alarm,
                                color: Colors.grey.shade500,
                                size: 20,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                dataModel.ticket!.createdAt,
                                style: MobikulTheme
                                    .mobikulTheme.textTheme.titleMedium
                                    ?.copyWith(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Text(
                            ApplicationLocalizations.instance!
                                .translate(StringKeys.timeStampLabel),
                            style: MobikulTheme
                                .mobikulTheme.textTheme.titleMedium
                                ?.copyWith(
                                    color: Colors.grey.shade500,
                                    fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.reply_rounded,
                                color: Colors.grey.shade500,
                                size: 20,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                dataModel.ticket!.totalThreads.toString(),
                                style: MobikulTheme
                                    .mobikulTheme.textTheme.titleMedium
                                    ?.copyWith(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Text(
                            ApplicationLocalizations.instance!
                                .translate(StringKeys.totalRepliesLabel),
                            style: MobikulTheme
                                .mobikulTheme.textTheme.titleMedium
                                ?.copyWith(
                                    color: Colors.grey.shade500,
                                    fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Utils.getSourceIcon(dataModel.ticket!.source),
                                color: Colors.grey.shade500,
                                size: 20,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                dataModel.ticket!.source.toTitleCase(),
                                style: MobikulTheme
                                    .mobikulTheme.textTheme.titleMedium
                                    ?.copyWith(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Text(
                            ApplicationLocalizations.instance!
                                .translate(StringKeys.channelNameLabel),
                            style: MobikulTheme
                                .mobikulTheme.textTheme.titleMedium
                                ?.copyWith(
                                color: Colors.grey.shade500,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
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
