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

part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardState {
  const DashboardState();
}

class DashboardStateInitial extends DashboardState {
  final int page;

  const DashboardStateInitial(this.page);
}

class DashboardStateSuccess extends DashboardState {
  final DashboardTicketList model;
  final bool isFromSearch;

  const DashboardStateSuccess(this.model, this.isFromSearch);
}

class DashboardStateError extends DashboardState {
  final String message;

  const DashboardStateError(this.message);
}
