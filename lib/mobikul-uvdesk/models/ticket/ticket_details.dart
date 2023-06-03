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

part 'ticket_details.g.dart';

@JsonSerializable(explicitToJson: true)
class TicketDetails {
  final Ticket? ticket;
  @JsonKey(defaultValue: 0)
  final int totalCustomerTickets;
  @JsonKey(defaultValue: [])
  final List<SupportGroups> supportGroups;
  @JsonKey(defaultValue: [])
  final List<SupportTeams> supportTeams;
  @JsonKey(defaultValue: [])
  final List<TicketStatuses> ticketStatuses;
  @JsonKey(defaultValue: [])
  final List<TicketPriorities> ticketPriorities;
  @JsonKey(defaultValue: [])
  final List<TicketTypes> ticketTypes;

  const TicketDetails({
    this.ticket,
    required this.totalCustomerTickets,
    required this.supportGroups,
    required this.supportTeams,
    required this.ticketStatuses,
    required this.ticketPriorities,
    required this.ticketTypes,
  });

  factory TicketDetails.fromJson(Map<String, dynamic> json) =>
      _$TicketDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$TicketDetailsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Ticket {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String source;
  @JsonKey(defaultValue: 0)
  final int priority;
  @JsonKey(defaultValue: 0)
  final int status;
  @JsonKey(defaultValue: 0)
  final int type;
  @JsonKey(defaultValue: '')
  final String subject;
  @JsonKey(defaultValue: false)
  final bool isNew;
  @JsonKey(defaultValue: false)
  final bool isReplied;
  @JsonKey(defaultValue: false)
  final bool isReplyEnabled;
  @JsonKey(defaultValue: false)
  final bool isStarred;
  @JsonKey(defaultValue: false)
  final bool isTrashed;
  @JsonKey(defaultValue: false)
  final bool isAgentViewed;
  @JsonKey(defaultValue: false)
  final bool isCustomerViewed;
  @JsonKey(defaultValue: '')
  final String createdAt;
  @JsonKey(defaultValue: '')
  final String updatedAt;
  final Group? group;
  final Team? team;
  @JsonKey(defaultValue: [])
  final List<Threads> threads;
  final Agent? agent;
  final Customer? customer;
  @JsonKey(defaultValue: 0)
  final int totalThreads;

  const Ticket({
    required this.id,
    required this.source,
    required this.priority,
    required this.status,
    required this.type,
    required this.subject,
    required this.isNew,
    required this.isReplied,
    required this.isReplyEnabled,
    required this.isStarred,
    required this.isTrashed,
    required this.isAgentViewed,
    required this.isCustomerViewed,
    required this.createdAt,
    required this.updatedAt,
    this.group,
    this.team,
    required this.threads,
    this.agent,
    this.customer,
    required this.totalThreads,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) =>
      _$TicketFromJson(json);

  Map<String, dynamic> toJson() => _$TicketToJson(this);
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
class Threads {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String source;
  @JsonKey(defaultValue: '')
  final String threadType;
  @JsonKey(defaultValue: '')
  final String createdBy;
  @JsonKey(defaultValue: false)
  final bool isLocked;
  @JsonKey(defaultValue: false)
  final bool isBookmarked;
  @JsonKey(defaultValue: '')
  final String message;
  @JsonKey(defaultValue: '')
  final String createdAt;
  @JsonKey(defaultValue: '')
  final String updatedAt;
  final User? user;
  @JsonKey(defaultValue: [])
  final List<Attachments> attachments;

  const Threads({
    required this.id,
    required this.source,
    required this.threadType,
    required this.createdBy,
    required this.isLocked,
    required this.isBookmarked,
    required this.message,
    required this.createdAt,
    required this.updatedAt,
    this.user,
    required this.attachments,
  });

  factory Threads.fromJson(Map<String, dynamic> json) =>
      _$ThreadsFromJson(json);

  Map<String, dynamic> toJson() => _$ThreadsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class User {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String name;
  @JsonKey(defaultValue: '')
  final String email;
  @JsonKey(defaultValue: '')
  final String thumbnail;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.thumbnail,
  });

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Attachments {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String name;
  @JsonKey(defaultValue: '')
  final String path;
  @JsonKey(defaultValue: '')
  final String relativePath;
  @JsonKey(defaultValue: '')
  final String iconURL;
  @JsonKey(defaultValue: '')
  final String downloadURL;

  const Attachments({
    required this.id,
    required this.name,
    required this.path,
    required this.relativePath,
    required this.iconURL,
    required this.downloadURL,
  });

  factory Attachments.fromJson(Map<String, dynamic> json) =>
      _$AttachmentsFromJson(json);

  Map<String, dynamic> toJson() => _$AttachmentsToJson(this);
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
  @JsonKey(defaultValue: '')
  final String contactNumber;
  @JsonKey(defaultValue: '')
  final String thumbnail;

  const Agent({
    required this.id,
    required this.email,
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.contactNumber,
    required this.thumbnail,
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
  final String thumbnail;

  const Customer({
    required this.id,
    required this.email,
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.thumbnail,
  });

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SupportGroups {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String name;

  const SupportGroups({
    required this.id,
    required this.name,
  });

  factory SupportGroups.fromJson(Map<String, dynamic> json) =>
      _$SupportGroupsFromJson(json);

  Map<String, dynamic> toJson() => _$SupportGroupsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SupportTeams {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String name;

  const SupportTeams({
    required this.id,
    required this.name,
  });

  factory SupportTeams.fromJson(Map<String, dynamic> json) =>
      _$SupportTeamsFromJson(json);

  Map<String, dynamic> toJson() => _$SupportTeamsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TicketStatuses {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String code;
  @JsonKey(defaultValue: '')
  final String colorCode;
  @JsonKey(defaultValue: '')
  final String description;

  const TicketStatuses({
    required this.id,
    required this.code,
    required this.colorCode,
    required this.description,
  });

  factory TicketStatuses.fromJson(Map<String, dynamic> json) =>
      _$TicketStatusesFromJson(json);

  Map<String, dynamic> toJson() => _$TicketStatusesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TicketPriorities {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String code;
  @JsonKey(defaultValue: '')
  final String colorCode;
  @JsonKey(defaultValue: '')
  final String description;

  const TicketPriorities({
    required this.id,
    required this.code,
    required this.colorCode,
    required this.description,
  });

  factory TicketPriorities.fromJson(Map<String, dynamic> json) =>
      _$TicketPrioritiesFromJson(json);

  Map<String, dynamic> toJson() => _$TicketPrioritiesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TicketTypes {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String code;
  @JsonKey(defaultValue: false)
  final bool isActive;
  @JsonKey(defaultValue: '')
  final String description;

  const TicketTypes({
    required this.id,
    required this.code,
    required this.isActive,
    required this.description,
  });

  factory TicketTypes.fromJson(Map<String, dynamic> json) =>
      _$TicketTypesFromJson(json);

  Map<String, dynamic> toJson() => _$TicketTypesToJson(this);
}
