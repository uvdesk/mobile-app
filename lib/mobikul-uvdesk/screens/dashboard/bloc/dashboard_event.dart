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
abstract class DashboardEvent extends Equatable {
  @override
  get props => [];
}

class DashboardEventInitial extends DashboardEvent {
  final int page;

  DashboardEventInitial(this.page);

  @override
  List<Object?> get props => [];
}

class DashboardEventSuccess extends DashboardEvent {
  @override
  List<Object?> get props => [];
}

class DashboardEventError extends DashboardEvent {
  final String message;

  DashboardEventError(this.message);

  @override
  List<Object?> get props => [];
}

class DashboardSearchEvent extends DashboardEvent {
  final String searchQuery;
  final int page;

  DashboardSearchEvent(this.searchQuery, this.page);

  @override
  List<Object?> get props => [];
}
