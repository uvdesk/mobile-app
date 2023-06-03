// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketDetails _$TicketDetailsFromJson(Map<String, dynamic> json) =>
    TicketDetails(
      ticket: json['ticket'] == null
          ? null
          : Ticket.fromJson(json['ticket'] as Map<String, dynamic>),
      totalCustomerTickets: json['totalCustomerTickets'] as int? ?? 0,
      supportGroups: (json['supportGroups'] as List<dynamic>?)
              ?.map((e) => SupportGroups.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      supportTeams: (json['supportTeams'] as List<dynamic>?)
              ?.map((e) => SupportTeams.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      ticketStatuses: (json['ticketStatuses'] as List<dynamic>?)
              ?.map((e) => TicketStatuses.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      ticketPriorities: (json['ticketPriorities'] as List<dynamic>?)
              ?.map((e) => TicketPriorities.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      ticketTypes: (json['ticketTypes'] as List<dynamic>?)
              ?.map((e) => TicketTypes.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$TicketDetailsToJson(TicketDetails instance) =>
    <String, dynamic>{
      'ticket': instance.ticket?.toJson(),
      'totalCustomerTickets': instance.totalCustomerTickets,
      'supportGroups': instance.supportGroups.map((e) => e.toJson()).toList(),
      'supportTeams': instance.supportTeams.map((e) => e.toJson()).toList(),
      'ticketStatuses': instance.ticketStatuses.map((e) => e.toJson()).toList(),
      'ticketPriorities':
          instance.ticketPriorities.map((e) => e.toJson()).toList(),
      'ticketTypes': instance.ticketTypes.map((e) => e.toJson()).toList(),
    };

Ticket _$TicketFromJson(Map<String, dynamic> json) => Ticket(
      id: json['id'] as int? ?? 0,
      source: json['source'] as String? ?? '',
      priority: json['priority'] as int? ?? 0,
      status: json['status'] as int? ?? 0,
      type: json['type'] as int? ?? 0,
      subject: json['subject'] as String? ?? '',
      isNew: json['isNew'] as bool? ?? false,
      isReplied: json['isReplied'] as bool? ?? false,
      isReplyEnabled: json['isReplyEnabled'] as bool? ?? false,
      isStarred: json['isStarred'] as bool? ?? false,
      isTrashed: json['isTrashed'] as bool? ?? false,
      isAgentViewed: json['isAgentViewed'] as bool? ?? false,
      isCustomerViewed: json['isCustomerViewed'] as bool? ?? false,
      createdAt: json['createdAt'] as String? ?? '',
      updatedAt: json['updatedAt'] as String? ?? '',
      group: json['group'] == null
          ? null
          : Group.fromJson(json['group'] as Map<String, dynamic>),
      team: json['team'] == null
          ? null
          : Team.fromJson(json['team'] as Map<String, dynamic>),
      threads: (json['threads'] as List<dynamic>?)
              ?.map((e) => Threads.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      agent: json['agent'] == null
          ? null
          : Agent.fromJson(json['agent'] as Map<String, dynamic>),
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
      totalThreads: json['totalThreads'] as int? ?? 0,
    );

Map<String, dynamic> _$TicketToJson(Ticket instance) => <String, dynamic>{
      'id': instance.id,
      'source': instance.source,
      'priority': instance.priority,
      'status': instance.status,
      'type': instance.type,
      'subject': instance.subject,
      'isNew': instance.isNew,
      'isReplied': instance.isReplied,
      'isReplyEnabled': instance.isReplyEnabled,
      'isStarred': instance.isStarred,
      'isTrashed': instance.isTrashed,
      'isAgentViewed': instance.isAgentViewed,
      'isCustomerViewed': instance.isCustomerViewed,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'group': instance.group?.toJson(),
      'team': instance.team?.toJson(),
      'threads': instance.threads.map((e) => e.toJson()).toList(),
      'agent': instance.agent?.toJson(),
      'customer': instance.customer?.toJson(),
      'totalThreads': instance.totalThreads,
    };

Group _$GroupFromJson(Map<String, dynamic> json) => Group(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Team _$TeamFromJson(Map<String, dynamic> json) => Team(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$TeamToJson(Team instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Threads _$ThreadsFromJson(Map<String, dynamic> json) => Threads(
      id: json['id'] as int? ?? 0,
      source: json['source'] as String? ?? '',
      threadType: json['threadType'] as String? ?? '',
      createdBy: json['createdBy'] as String? ?? '',
      isLocked: json['isLocked'] as bool? ?? false,
      isBookmarked: json['isBookmarked'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      createdAt: json['createdAt'] as String? ?? '',
      updatedAt: json['updatedAt'] as String? ?? '',
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      attachments: (json['attachments'] as List<dynamic>?)
              ?.map((e) => Attachments.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ThreadsToJson(Threads instance) => <String, dynamic>{
      'id': instance.id,
      'source': instance.source,
      'threadType': instance.threadType,
      'createdBy': instance.createdBy,
      'isLocked': instance.isLocked,
      'isBookmarked': instance.isBookmarked,
      'message': instance.message,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'user': instance.user?.toJson(),
      'attachments': instance.attachments.map((e) => e.toJson()).toList(),
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      thumbnail: json['thumbnail'] as String? ?? '',
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'thumbnail': instance.thumbnail,
    };

Attachments _$AttachmentsFromJson(Map<String, dynamic> json) => Attachments(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      path: json['path'] as String? ?? '',
      relativePath: json['relativePath'] as String? ?? '',
      iconURL: json['iconURL'] as String? ?? '',
      downloadURL: json['downloadURL'] as String? ?? '',
    );

Map<String, dynamic> _$AttachmentsToJson(Attachments instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'path': instance.path,
      'relativePath': instance.relativePath,
      'iconURL': instance.iconURL,
      'downloadURL': instance.downloadURL,
    };

Agent _$AgentFromJson(Map<String, dynamic> json) => Agent(
      id: json['id'] as int? ?? 0,
      email: json['email'] as String? ?? '',
      name: json['name'] as String? ?? '',
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      contactNumber: json['contactNumber'] as String? ?? '',
      thumbnail: json['thumbnail'] as String? ?? '',
    );

Map<String, dynamic> _$AgentToJson(Agent instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'contactNumber': instance.contactNumber,
      'thumbnail': instance.thumbnail,
    };

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
      id: json['id'] as int? ?? 0,
      email: json['email'] as String? ?? '',
      name: json['name'] as String? ?? '',
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      thumbnail: json['thumbnail'] as String? ?? '',
    );

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'thumbnail': instance.thumbnail,
    };

SupportGroups _$SupportGroupsFromJson(Map<String, dynamic> json) =>
    SupportGroups(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$SupportGroupsToJson(SupportGroups instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

SupportTeams _$SupportTeamsFromJson(Map<String, dynamic> json) => SupportTeams(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$SupportTeamsToJson(SupportTeams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

TicketStatuses _$TicketStatusesFromJson(Map<String, dynamic> json) =>
    TicketStatuses(
      id: json['id'] as int? ?? 0,
      code: json['code'] as String? ?? '',
      colorCode: json['colorCode'] as String? ?? '',
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$TicketStatusesToJson(TicketStatuses instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'colorCode': instance.colorCode,
      'description': instance.description,
    };

TicketPriorities _$TicketPrioritiesFromJson(Map<String, dynamic> json) =>
    TicketPriorities(
      id: json['id'] as int? ?? 0,
      code: json['code'] as String? ?? '',
      colorCode: json['colorCode'] as String? ?? '',
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$TicketPrioritiesToJson(TicketPriorities instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'colorCode': instance.colorCode,
      'description': instance.description,
    };

TicketTypes _$TicketTypesFromJson(Map<String, dynamic> json) => TicketTypes(
      id: json['id'] as int? ?? 0,
      code: json['code'] as String? ?? '',
      isActive: json['isActive'] as bool? ?? false,
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$TicketTypesToJson(TicketTypes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'isActive': instance.isActive,
      'description': instance.description,
    };
