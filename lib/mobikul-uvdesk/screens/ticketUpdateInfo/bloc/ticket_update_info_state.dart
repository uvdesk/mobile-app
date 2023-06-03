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

part of 'ticket_update_info_bloc.dart';

@immutable
abstract class TicketUpdateInfoState {}

class TicketUpdateInfoInitialState extends TicketUpdateInfoState {
  final TicketDetails model;

  TicketUpdateInfoInitialState(this.model);
}
