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

import 'package:json_annotation/json_annotation.dart';

part 'dashboard_ticket_list.g.dart';

@JsonSerializable(explicitToJson: true)
class DashboardTicketList {
  @JsonKey(defaultValue: [])
  final List<Tickets> tickets;
  final Pagination? pagination;
  final UserDetails? userDetails;
  @JsonKey(defaultValue: [])
  final List<Agents> agents;
  @JsonKey(defaultValue: [])
  final List<Status> status;
  @JsonKey(defaultValue: [])
  final List<Group> group;
  @JsonKey(defaultValue: [])
  final List<Team> team;
  @JsonKey(defaultValue: [])
  final List<Priority> priority;
  @JsonKey(defaultValue: [])
  final List<Type> type;
  final Source? source;

   DashboardTicketList({
    required this.tickets,
    this.pagination,
    this.userDetails,
    required this.agents,
    required this.status,
    required this.group,
    required this.team,
    required this.priority,
    required this.type,
    this.source,
  });

  factory DashboardTicketList.fromJson(Map<String, dynamic> json) =>
      _$DashboardTicketListFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardTicketListToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Tickets {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String subject;
  @JsonKey(defaultValue: false)
  final bool isCustomerView;
  final Status? status;
  final Group? group;
  @JsonKey(defaultValue: '')
  final String source;
  @JsonKey(defaultValue: false)
  final bool isStarred;
  final Type? type;
  final Priority? priority;
  @JsonKey(defaultValue: '')
  final String formatedCreatedAt;
  @JsonKey(defaultValue: '')
  final String totalThreads;
  final Agent? agent;
  final Customer? customer;

  const Tickets({
    required this.id,
    required this.subject,
    required this.isCustomerView,
    this.status,
    this.group,
    required this.source,
    required this.isStarred,
    this.type,
    this.priority,
    required this.formatedCreatedAt,
    required this.totalThreads,
    this.agent,
    this.customer,
  });

  factory Tickets.fromJson(Map<String, dynamic> json) =>
      _$TicketsFromJson(json);

  Map<String, dynamic> toJson() => _$TicketsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Status {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String code;
  @JsonKey(defaultValue: '')
  final String description;
  @JsonKey(defaultValue: '')
  final String colorCode;
  @JsonKey(defaultValue: 0)
  final int sortOrder;

  const Status({
    required this.id,
    required this.code,
    required this.description,
    required this.colorCode,
    required this.sortOrder,
  });

  factory Status.fromJson(Map<String, dynamic> json) =>
      _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Group {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String name;

  const Group({
    required this.id,
    required this.name,
  });

  factory Group.fromJson(Map<String, dynamic> json) =>
      _$GroupFromJson(json);

  Map<String, dynamic> toJson() => _$GroupToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreatedAt {
  @JsonKey(defaultValue: '')
  final String date;
  @JsonKey(name: 'timezone_type', defaultValue: 0)
  final int timezoneType;
  @JsonKey(defaultValue: '')
  final String timezone;

  const CreatedAt({
    required this.date,
    required this.timezoneType,
    required this.timezone,
  });

  factory CreatedAt.fromJson(Map<String, dynamic> json) =>
      _$CreatedAtFromJson(json);

  Map<String, dynamic> toJson() => _$CreatedAtToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Type {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String name;

  const Type({
    required this.id,
    required this.name,
  });

  factory Type.fromJson(Map<String, dynamic> json) =>
      _$TypeFromJson(json);

  Map<String, dynamic> toJson() => _$TypeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Priority {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String code;
  @JsonKey(defaultValue: '')
  final String description;
  @JsonKey(defaultValue: '')
  final String colorCode;

  const Priority({
    required this.id,
    required this.code,
    required this.description,
    required this.colorCode,
  });

  factory Priority.fromJson(Map<String, dynamic> json) =>
      _$PriorityFromJson(json);

  Map<String, dynamic> toJson() => _$PriorityToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Agent {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String email;
  @JsonKey(defaultValue: '')
  final String name;
  @JsonKey(defaultValue: '')
  final String firstName;
  @JsonKey(defaultValue: '')
  final String lastName;
  @JsonKey(defaultValue: false)
  final bool isEnabled;
  @JsonKey(defaultValue: '')
  final String profileImagePath;
  @JsonKey(defaultValue: '')
  final String smallThumbnail;
  @JsonKey(defaultValue: false)
  final bool isActive;
  @JsonKey(defaultValue: false)
  final bool isVerified;

  const Agent({
    required this.id,
    required this.email,
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.isEnabled,
    required this.profileImagePath,
    required this.smallThumbnail,
    required this.isActive,
    required this.isVerified,
  });

  factory Agent.fromJson(Map<String, dynamic> json) =>
      _$AgentFromJson(json);

  Map<String, dynamic> toJson() => _$AgentToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Customer {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String email;
  @JsonKey(defaultValue: '')
  final String name;
  @JsonKey(defaultValue: '')
  final String firstName;
  @JsonKey(defaultValue: '')
  final String lastName;
  @JsonKey(defaultValue: '')
  final String profileImagePath;
  @JsonKey(defaultValue: '')
  final String smallThumbnail;

  const Customer({
    required this.id,
    required this.email,
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.profileImagePath,
    required this.smallThumbnail,
  });

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Pagination {
  @JsonKey(defaultValue: 0)
  final int last;
  @JsonKey(defaultValue: 0)
  final int current;
  @JsonKey(defaultValue: 0)
  final int numItemsPerPage;
  @JsonKey(defaultValue: 0)
  final int first;
  @JsonKey(defaultValue: 0)
  final int pageCount;
  @JsonKey(defaultValue: 0)
  final int totalCount;
  @JsonKey(defaultValue: 0)
  final int pageRange;
  @JsonKey(defaultValue: 0)
  final int startPage;
  @JsonKey(defaultValue: 0)
  final int endPage;
  @JsonKey(defaultValue: 0)
  final int next;
  @JsonKey(defaultValue: [])
  final List<int> pagesInRange;
  @JsonKey(defaultValue: 0)
  final int firstPageInRange;
  @JsonKey(defaultValue: 0)
  final int lastPageInRange;
  @JsonKey(defaultValue: 0)
  final int currentItemCount;
  @JsonKey(defaultValue: 0)
  final int firstItemNumber;
  @JsonKey(defaultValue: 0)
  final int lastItemNumber;
  @JsonKey(defaultValue: '')
  final String url;

  const Pagination({
    required this.last,
    required this.current,
    required this.numItemsPerPage,
    required this.first,
    required this.pageCount,
    required this.totalCount,
    required this.pageRange,
    required this.startPage,
    required this.endPage,
    required this.next,
    required this.pagesInRange,
    required this.firstPageInRange,
    required this.lastPageInRange,
    required this.currentItemCount,
    required this.firstItemNumber,
    required this.lastItemNumber,
    required this.url,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserDetails {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String email;
  @JsonKey(defaultValue: '')
  final String name;
  @JsonKey(defaultValue: '')
  final String profileImagePath;

  const UserDetails({
    required this.id,
    required this.email,
    required this.name,
    required this.profileImagePath,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Agents {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: 0)
  final int udId;
  @JsonKey(defaultValue: '')
  final String email;
  @JsonKey(defaultValue: '')
  final String name;

  const Agents({
    required this.id,
    required this.udId,
    required this.email,
    required this.name,
  });

  factory Agents.fromJson(Map<String, dynamic> json) =>
      _$AgentsFromJson(json);

  Map<String, dynamic> toJson() => _$AgentsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Team {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String name;

  const Team({
    required this.id,
    required this.name,
  });

  factory Team.fromJson(Map<String, dynamic> json) =>
      _$TeamFromJson(json);

  Map<String, dynamic> toJson() => _$TeamToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Source {
  @JsonKey(defaultValue: '')
  final String email;
  @JsonKey(defaultValue: '')
  final String website;

  const Source({
    required this.email,
    required this.website,
  });

  factory Source.fromJson(Map<String, dynamic> json) =>
      _$SourceFromJson(json);

  Map<String, dynamic> toJson() => _$SourceToJson(this);
}
