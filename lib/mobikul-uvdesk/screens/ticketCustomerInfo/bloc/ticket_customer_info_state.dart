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

part of 'ticket_customer_info_bloc.dart';

@immutable
abstract class TicketCustomerInfoState {}

class TicketCustomerInfoInitial extends TicketCustomerInfoState {
  final TicketDetails model;

  TicketCustomerInfoInitial(this.model);
}
