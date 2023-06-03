// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_ticket_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardTicketList _$DashboardTicketListFromJson(Map<String, dynamic> json) =>
    DashboardTicketList(
      tickets: (json['tickets'] as List<dynamic>?)
              ?.map((e) => Tickets.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
      userDetails: json['userDetails'] == null
          ? null
          : UserDetails.fromJson(json['userDetails'] as Map<String, dynamic>),
      agents: (json['agents'] as List<dynamic>?)
              ?.map((e) => Agents.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      status: (json['status'] as List<dynamic>?)
              ?.map((e) => Status.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      group: (json['group'] as List<dynamic>?)
              ?.map((e) => Group.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      team: (json['team'] as List<dynamic>?)
              ?.map((e) => Team.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      priority: (json['priority'] as List<dynamic>?)
              ?.map((e) => Priority.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      type: (json['type'] as List<dynamic>?)
              ?.map((e) => Type.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      source: json['source'] == null
          ? null
          : Source.fromJson(json['source'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DashboardTicketListToJson(
        DashboardTicketList instance) =>
    <String, dynamic>{
      'tickets': instance.tickets.map((e) => e.toJson()).toList(),
      'pagination': instance.pagination?.toJson(),
      'userDetails': instance.userDetails?.toJson(),
      'agents': instance.agents.map((e) => e.toJson()).toList(),
      'status': instance.status.map((e) => e.toJson()).toList(),
      'group': instance.group.map((e) => e.toJson()).toList(),
      'team': instance.team.map((e) => e.toJson()).toList(),
      'priority': instance.priority.map((e) => e.toJson()).toList(),
      'type': instance.type.map((e) => e.toJson()).toList(),
      'source': instance.source?.toJson(),
    };

Tickets _$TicketsFromJson(Map<String, dynamic> json) => Tickets(
      id: json['id'] as int? ?? 0,
      subject: json['subject'] as String? ?? '',
      isCustomerView: json['isCustomerView'] as bool? ?? false,
      status: json['status'] == null
          ? null
          : Status.fromJson(json['status'] as Map<String, dynamic>),
      group: json['group'] == null
          ? null
          : Group.fromJson(json['group'] as Map<String, dynamic>),
      source: json['source'] as String? ?? '',
      isStarred: json['isStarred'] as bool? ?? false,
      type: json['type'] == null
          ? null
          : Type.fromJson(json['type'] as Map<String, dynamic>),
      priority: json['priority'] == null
          ? null
          : Priority.fromJson(json['priority'] as Map<String, dynamic>),
      formatedCreatedAt: json['formatedCreatedAt'] as String? ?? '',
      totalThreads: json['totalThreads'] as String? ?? '',
      agent: json['agent'] == null
          ? null
          : Agent.fromJson(json['agent'] as Map<String, dynamic>),
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TicketsToJson(Tickets instance) => <String, dynamic>{
      'id': instance.id,
      'subject': instance.subject,
      'isCustomerView': instance.isCustomerView,
      'status': instance.status?.toJson(),
      'group': instance.group?.toJson(),
      'source': instance.source,
      'isStarred': instance.isStarred,
      'type': instance.type?.toJson(),
      'priority': instance.priority?.toJson(),
      'formatedCreatedAt': instance.formatedCreatedAt,
      'totalThreads': instance.totalThreads,
      'agent': instance.agent?.toJson(),
      'customer': instance.customer?.toJson(),
    };

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
      id: json['id'] as int? ?? 0,
      code: json['code'] as String? ?? '',
      description: json['description'] as String? ?? '',
      colorCode: json['colorCode'] as String? ?? '',
      sortOrder: json['sortOrder'] as int? ?? 0,
    );

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'description': instance.description,
      'colorCode': instance.colorCode,
      'sortOrder': instance.sortOrder,
    };

Group _$GroupFromJson(Map<String, dynamic> json) => Group(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

CreatedAt _$CreatedAtFromJson(Map<String, dynamic> json) => CreatedAt(
      date: json['date'] as String? ?? '',
      timezoneType: json['timezone_type'] as int? ?? 0,
      timezone: json['timezone'] as String? ?? '',
    );

Map<String, dynamic> _$CreatedAtToJson(CreatedAt instance) => <String, dynamic>{
      'date': instance.date,
      'timezone_type': instance.timezoneType,
      'timezone': instance.timezone,
    };

Type _$TypeFromJson(Map<String, dynamic> json) => Type(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$TypeToJson(Type instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Priority _$PriorityFromJson(Map<String, dynamic> json) => Priority(
      id: json['id'] as int? ?? 0,
      code: json['code'] as String? ?? '',
      description: json['description'] as String? ?? '',
      colorCode: json['colorCode'] as String? ?? '',
    );

Map<String, dynamic> _$PriorityToJson(Priority instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'description': instance.description,
      'colorCode': instance.colorCode,
    };

Agent _$AgentFromJson(Map<String, dynamic> json) => Agent(
      id: json['id'] as int? ?? 0,
      email: json['email'] as String? ?? '',
      name: json['name'] as String? ?? '',
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      isEnabled: json['isEnabled'] as bool? ?? false,
      profileImagePath: json['profileImagePath'] as String? ?? '',
      smallThumbnail: json['smallThumbnail'] as String? ?? '',
      isActive: json['isActive'] as bool? ?? false,
      isVerified: json['isVerified'] as bool? ?? false,
    );

Map<String, dynamic> _$AgentToJson(Agent instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'isEnabled': instance.isEnabled,
      'profileImagePath': instance.profileImagePath,
      'smallThumbnail': instance.smallThumbnail,
      'isActive': instance.isActive,
      'isVerified': instance.isVerified,
    };

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
      id: json['id'] as int? ?? 0,
      email: json['email'] as String? ?? '',
      name: json['name'] as String? ?? '',
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      profileImagePath: json['profileImagePath'] as String? ?? '',
      smallThumbnail: json['smallThumbnail'] as String? ?? '',
    );

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'profileImagePath': instance.profileImagePath,
      'smallThumbnail': instance.smallThumbnail,
    };

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
      last: json['last'] as int? ?? 0,
      current: json['current'] as int? ?? 0,
      numItemsPerPage: json['numItemsPerPage'] as int? ?? 0,
      first: json['first'] as int? ?? 0,
      pageCount: json['pageCount'] as int? ?? 0,
      totalCount: json['totalCount'] as int? ?? 0,
      pageRange: json['pageRange'] as int? ?? 0,
      startPage: json['startPage'] as int? ?? 0,
      endPage: json['endPage'] as int? ?? 0,
      next: json['next'] as int? ?? 0,
      pagesInRange: (json['pagesInRange'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          [],
      firstPageInRange: json['firstPageInRange'] as int? ?? 0,
      lastPageInRange: json['lastPageInRange'] as int? ?? 0,
      currentItemCount: json['currentItemCount'] as int? ?? 0,
      firstItemNumber: json['firstItemNumber'] as int? ?? 0,
      lastItemNumber: json['lastItemNumber'] as int? ?? 0,
      url: json['url'] as String? ?? '',
    );

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'last': instance.last,
      'current': instance.current,
      'numItemsPerPage': instance.numItemsPerPage,
      'first': instance.first,
      'pageCount': instance.pageCount,
      'totalCount': instance.totalCount,
      'pageRange': instance.pageRange,
      'startPage': instance.startPage,
      'endPage': instance.endPage,
      'next': instance.next,
      'pagesInRange': instance.pagesInRange,
      'firstPageInRange': instance.firstPageInRange,
      'lastPageInRange': instance.lastPageInRange,
      'currentItemCount': instance.currentItemCount,
      'firstItemNumber': instance.firstItemNumber,
      'lastItemNumber': instance.lastItemNumber,
      'url': instance.url,
    };

UserDetails _$UserDetailsFromJson(Map<String, dynamic> json) => UserDetails(
      id: json['id'] as int? ?? 0,
      email: json['email'] as String? ?? '',
      name: json['name'] as String? ?? '',
      profileImagePath: json['profileImagePath'] as String? ?? '',
    );

Map<String, dynamic> _$UserDetailsToJson(UserDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'profileImagePath': instance.profileImagePath,
    };

Agents _$AgentsFromJson(Map<String, dynamic> json) => Agents(
      id: json['id'] as int? ?? 0,
      udId: json['udId'] as int? ?? 0,
      email: json['email'] as String? ?? '',
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$AgentsToJson(Agents instance) => <String, dynamic>{
      'id': instance.id,
      'udId': instance.udId,
      'email': instance.email,
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

Source _$SourceFromJson(Map<String, dynamic> json) => Source(
      email: json['email'] as String? ?? '',
      website: json['website'] as String? ?? '',
    );

Map<String, dynamic> _$SourceToJson(Source instance) => <String, dynamic>{
      'email': instance.email,
      'website': instance.website,
    };
