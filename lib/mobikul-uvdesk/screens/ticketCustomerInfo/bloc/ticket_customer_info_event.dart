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
abstract class TicketCustomerInfoEvent extends Equatable {}

class TicketCustomerInfoEventInitial extends TicketCustomerInfoEvent {
  @override
  List<Object?> get props => [];
}