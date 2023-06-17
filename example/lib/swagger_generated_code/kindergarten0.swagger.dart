// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

import 'overriden_models.dart';
import 'package:chopper/chopper.dart';

import 'client_mapping.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:chopper/chopper.dart' as chopper;
import 'kindergarten0.enums.swagger.dart' as enums;
export 'kindergarten0.enums.swagger.dart';

part 'kindergarten0.swagger.chopper.dart';
part 'kindergarten0.swagger.g.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class Kindergarten0 extends ChopperService {
  static Kindergarten0 create({
    ChopperClient? client,
    http.Client? httpClient,
    Authenticator? authenticator,
    Converter? converter,
    Uri? baseUrl,
    Iterable<dynamic>? interceptors,
  }) {
    if (client != null) {
      return _$Kindergarten0(client);
    }

    final newClient = ChopperClient(
        services: [_$Kindergarten0()],
        converter: converter ?? $JsonSerializableConverter(),
        interceptors: interceptors ?? [],
        client: httpClient,
        authenticator: authenticator,
        baseUrl:
            baseUrl ?? Uri.parse('http://kindergarten0.dev.lesgenies.io/api'));
    return _$Kindergarten0(newClient);
  }

  ///
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  Future<chopper.Response<ChatGroupsGet$Response>> chatGroupsGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        ChatGroupsGet$Response, () => ChatGroupsGet$Response.fromJsonFactory);

    return _chatGroupsGet(
        page: page, pageSize: pageSize, cacheControl: cacheControl);
  }

  ///
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  @Get(path: '/chat/groups/')
  Future<chopper.Response<ChatGroupsGet$Response>> _chatGroupsGet({
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param data
  Future<chopper.Response<ChatGroupCreate>> chatGroupsPost({
    required ChatGroupCreate? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        ChatGroupCreate, () => ChatGroupCreate.fromJsonFactory);

    return _chatGroupsPost(data: data, cacheControl: cacheControl);
  }

  ///
  ///@param data
  @Post(path: '/chat/groups/')
  Future<chopper.Response<ChatGroupCreate>> _chatGroupsPost({
    @Body() required ChatGroupCreate? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  Future<chopper.Response<CurrentChatMember>>
      chatGroupsGroupIdCurrentChatMemberGet({
    required String? groupId,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        CurrentChatMember, () => CurrentChatMember.fromJsonFactory);

    return _chatGroupsGroupIdCurrentChatMemberGet(
        groupId: groupId, cacheControl: cacheControl);
  }

  ///
  @Get(path: '/chat/groups/{group_id}/current_chat_member')
  Future<chopper.Response<CurrentChatMember>>
      _chatGroupsGroupIdCurrentChatMemberGet({
    @Path('group_id') required String? groupId,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param data
  Future<chopper.Response<CurrentChatMember>>
      chatGroupsGroupIdCurrentChatMemberPut({
    required CurrentChatMember? data,
    required String? groupId,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        CurrentChatMember, () => CurrentChatMember.fromJsonFactory);

    return _chatGroupsGroupIdCurrentChatMemberPut(
        data: data, groupId: groupId, cacheControl: cacheControl);
  }

  ///
  ///@param data
  @Put(path: '/chat/groups/{group_id}/current_chat_member')
  Future<chopper.Response<CurrentChatMember>>
      _chatGroupsGroupIdCurrentChatMemberPut({
    @Body() required CurrentChatMember? data,
    @Path('group_id') required String? groupId,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param data
  Future<chopper.Response<CurrentChatMember>>
      chatGroupsGroupIdCurrentChatMemberPatch({
    required CurrentChatMember? data,
    required String? groupId,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        CurrentChatMember, () => CurrentChatMember.fromJsonFactory);

    return _chatGroupsGroupIdCurrentChatMemberPatch(
        data: data, groupId: groupId, cacheControl: cacheControl);
  }

  ///
  ///@param data
  @Patch(path: '/chat/groups/{group_id}/current_chat_member')
  Future<chopper.Response<CurrentChatMember>>
      _chatGroupsGroupIdCurrentChatMemberPatch({
    @Body() required CurrentChatMember? data,
    @Path('group_id') required String? groupId,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param search A search term.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  Future<chopper.Response<ChatGroupsGroupIdMessagesGet$Response>>
      chatGroupsGroupIdMessagesGet({
    String? search,
    int? page,
    int? pageSize,
    required String? groupId,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(ChatGroupsGroupIdMessagesGet$Response,
        () => ChatGroupsGroupIdMessagesGet$Response.fromJsonFactory);

    return _chatGroupsGroupIdMessagesGet(
        search: search,
        page: page,
        pageSize: pageSize,
        groupId: groupId,
        cacheControl: cacheControl);
  }

  ///
  ///@param search A search term.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  @Get(path: '/chat/groups/{group_id}/messages')
  Future<chopper.Response<ChatGroupsGroupIdMessagesGet$Response>>
      _chatGroupsGroupIdMessagesGet({
    @Query('search') String? search,
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Path('group_id') required String? groupId,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  ///@param file_type The type of files to retrieve.
  Future<chopper.Response<ChatGroupsGroupIdMessagesUploadGet$Response>>
      chatGroupsGroupIdMessagesUploadGet({
    int? page,
    int? pageSize,
    String? fileType,
    required String? groupId,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(ChatGroupsGroupIdMessagesUploadGet$Response,
        () => ChatGroupsGroupIdMessagesUploadGet$Response.fromJsonFactory);

    return _chatGroupsGroupIdMessagesUploadGet(
        page: page,
        pageSize: pageSize,
        fileType: fileType,
        groupId: groupId,
        cacheControl: cacheControl);
  }

  ///
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  ///@param file_type The type of files to retrieve.
  @Get(path: '/chat/groups/{group_id}/messages/upload')
  Future<chopper.Response<ChatGroupsGroupIdMessagesUploadGet$Response>>
      _chatGroupsGroupIdMessagesUploadGet({
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Query('file_type') String? fileType,
    @Path('group_id') required String? groupId,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param data
  Future<chopper.Response<ChatMessageFile>>
      chatGroupsGroupIdMessagesUploadPost({
    required ChatMessageFile? data,
    required String? groupId,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        ChatMessageFile, () => ChatMessageFile.fromJsonFactory);

    return _chatGroupsGroupIdMessagesUploadPost(
        data: data, groupId: groupId, cacheControl: cacheControl);
  }

  ///
  ///@param data
  @Post(path: '/chat/groups/{group_id}/messages/upload')
  Future<chopper.Response<ChatMessageFile>>
      _chatGroupsGroupIdMessagesUploadPost({
    @Body() required ChatMessageFile? data,
    @Path('group_id') required String? groupId,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  Future<chopper.Response<ChatGroupsGroupIdSharedLinksGet$Response>>
      chatGroupsGroupIdSharedLinksGet({
    int? page,
    int? pageSize,
    required String? groupId,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(ChatGroupsGroupIdSharedLinksGet$Response,
        () => ChatGroupsGroupIdSharedLinksGet$Response.fromJsonFactory);

    return _chatGroupsGroupIdSharedLinksGet(
        page: page,
        pageSize: pageSize,
        groupId: groupId,
        cacheControl: cacheControl);
  }

  ///
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  @Get(path: '/chat/groups/{group_id}/shared_links')
  Future<chopper.Response<ChatGroupsGroupIdSharedLinksGet$Response>>
      _chatGroupsGroupIdSharedLinksGet({
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Path('group_id') required String? groupId,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  Future<chopper.Response<ChatGroup>> chatGroupsIdGet({
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(ChatGroup, () => ChatGroup.fromJsonFactory);

    return _chatGroupsIdGet(id: id, cacheControl: cacheControl);
  }

  ///
  @Get(path: '/chat/groups/{id}/')
  Future<chopper.Response<ChatGroup>> _chatGroupsIdGet({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param data
  Future<chopper.Response<ChatGroup>> chatGroupsIdPut({
    required ChatGroup? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(ChatGroup, () => ChatGroup.fromJsonFactory);

    return _chatGroupsIdPut(data: data, id: id, cacheControl: cacheControl);
  }

  ///
  ///@param data
  @Put(path: '/chat/groups/{id}/')
  Future<chopper.Response<ChatGroup>> _chatGroupsIdPut({
    @Body() required ChatGroup? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param data
  Future<chopper.Response<ChatGroup>> chatGroupsIdPatch({
    required ChatGroup? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(ChatGroup, () => ChatGroup.fromJsonFactory);

    return _chatGroupsIdPatch(data: data, id: id, cacheControl: cacheControl);
  }

  ///
  ///@param data
  @Patch(path: '/chat/groups/{id}/')
  Future<chopper.Response<ChatGroup>> _chatGroupsIdPatch({
    @Body() required ChatGroup? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  Future<chopper.Response> chatGroupsIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    return _chatGroupsIdDelete(id: id, cacheControl: cacheControl);
  }

  ///
  @Delete(path: '/chat/groups/{id}/')
  Future<chopper.Response> _chatGroupsIdDelete({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///List Child : Child Notes Child Notes.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  Future<chopper.Response<ChildDailySummaryGet$Response>> childDailySummaryGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(ChildDailySummaryGet$Response,
        () => ChildDailySummaryGet$Response.fromJsonFactory);

    return _childDailySummaryGet(
        page: page, pageSize: pageSize, cacheControl: cacheControl);
  }

  ///List Child : Child Notes Child Notes.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  @Get(path: '/child/daily_summary/')
  Future<chopper.Response<ChildDailySummaryGet$Response>>
      _childDailySummaryGet({
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Create Child : Child Notes Child Notes.
  ///@param data
  Future<chopper.Response<DaySummary>> childDailySummaryPost({
    required DaySummary? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(DaySummary, () => DaySummary.fromJsonFactory);

    return _childDailySummaryPost(data: data, cacheControl: cacheControl);
  }

  ///Create Child : Child Notes Child Notes.
  ///@param data
  @Post(path: '/child/daily_summary/')
  Future<chopper.Response<DaySummary>> _childDailySummaryPost({
    @Body() required DaySummary? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Retrieve Child : Child Notes Child Notes.
  Future<chopper.Response<DaySummary>> childDailySummaryIdGet({
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(DaySummary, () => DaySummary.fromJsonFactory);

    return _childDailySummaryIdGet(id: id, cacheControl: cacheControl);
  }

  ///Retrieve Child : Child Notes Child Notes.
  @Get(path: '/child/daily_summary/{id}/')
  Future<chopper.Response<DaySummary>> _childDailySummaryIdGet({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update Child : Child Notes Child Notes.
  ///@param data
  Future<chopper.Response<DaySummary>> childDailySummaryIdPut({
    required DaySummary? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(DaySummary, () => DaySummary.fromJsonFactory);

    return _childDailySummaryIdPut(
        data: data, id: id, cacheControl: cacheControl);
  }

  ///Update Child : Child Notes Child Notes.
  ///@param data
  @Put(path: '/child/daily_summary/{id}/')
  Future<chopper.Response<DaySummary>> _childDailySummaryIdPut({
    @Body() required DaySummary? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update Child : Child Notes Child Notes.
  ///@param data
  Future<chopper.Response<DaySummary>> childDailySummaryIdPatch({
    required DaySummary? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(DaySummary, () => DaySummary.fromJsonFactory);

    return _childDailySummaryIdPatch(
        data: data, id: id, cacheControl: cacheControl);
  }

  ///Update Child : Child Notes Child Notes.
  ///@param data
  @Patch(path: '/child/daily_summary/{id}/')
  Future<chopper.Response<DaySummary>> _childDailySummaryIdPatch({
    @Body() required DaySummary? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Delete Child : Child Notes Child Notes.
  Future<chopper.Response> childDailySummaryIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    return _childDailySummaryIdDelete(id: id, cacheControl: cacheControl);
  }

  ///Delete Child : Child Notes Child Notes.
  @Delete(path: '/child/daily_summary/{id}/')
  Future<chopper.Response> _childDailySummaryIdDelete({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///List EducatorTimeSheet EducatorAvailability.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  Future<chopper.Response<EducatorTimesheetAvailabilityGet$Response>>
      educatorTimesheetAvailabilityGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(EducatorTimesheetAvailabilityGet$Response,
        () => EducatorTimesheetAvailabilityGet$Response.fromJsonFactory);

    return _educatorTimesheetAvailabilityGet(
        page: page, pageSize: pageSize, cacheControl: cacheControl);
  }

  ///List EducatorTimeSheet EducatorAvailability.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  @Get(path: '/educator_timesheet/availability/')
  Future<chopper.Response<EducatorTimesheetAvailabilityGet$Response>>
      _educatorTimesheetAvailabilityGet({
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Create EducatorTimeSheet EducatorAvailability.
  ///@param data
  Future<chopper.Response<EducatorAvailability>>
      educatorTimesheetAvailabilityPost({
    required EducatorAvailability? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        EducatorAvailability, () => EducatorAvailability.fromJsonFactory);

    return _educatorTimesheetAvailabilityPost(
        data: data, cacheControl: cacheControl);
  }

  ///Create EducatorTimeSheet EducatorAvailability.
  ///@param data
  @Post(path: '/educator_timesheet/availability/')
  Future<chopper.Response<EducatorAvailability>>
      _educatorTimesheetAvailabilityPost({
    @Body() required EducatorAvailability? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param data
  Future<chopper.Response<EducatorAvailability>>
      educatorTimesheetAvailabilityPut({
    required EducatorAvailability? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        EducatorAvailability, () => EducatorAvailability.fromJsonFactory);

    return _educatorTimesheetAvailabilityPut(
        data: data, cacheControl: cacheControl);
  }

  ///
  ///@param data
  @Put(path: '/educator_timesheet/availability/')
  Future<chopper.Response<EducatorAvailability>>
      _educatorTimesheetAvailabilityPut({
    @Body() required EducatorAvailability? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param data
  Future<chopper.Response<EducatorAvailability>>
      educatorTimesheetAvailabilityPatch({
    required EducatorAvailability? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        EducatorAvailability, () => EducatorAvailability.fromJsonFactory);

    return _educatorTimesheetAvailabilityPatch(
        data: data, cacheControl: cacheControl);
  }

  ///
  ///@param data
  @Patch(path: '/educator_timesheet/availability/')
  Future<chopper.Response<EducatorAvailability>>
      _educatorTimesheetAvailabilityPatch({
    @Body() required EducatorAvailability? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  Future<chopper.Response> educatorTimesheetAvailabilityDelete(
      {String? cacheControl}) {
    return _educatorTimesheetAvailabilityDelete(cacheControl: cacheControl);
  }

  ///
  @Delete(path: '/educator_timesheet/availability/')
  Future<chopper.Response> _educatorTimesheetAvailabilityDelete(
      {@Header('Cache-Control') String? cacheControl});

  ///Retrieve EducatorTimeSheet EducatorAvailability.
  Future<chopper.Response<EducatorAvailability>>
      educatorTimesheetAvailabilityIdGet({
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        EducatorAvailability, () => EducatorAvailability.fromJsonFactory);

    return _educatorTimesheetAvailabilityIdGet(
        id: id, cacheControl: cacheControl);
  }

  ///Retrieve EducatorTimeSheet EducatorAvailability.
  @Get(path: '/educator_timesheet/availability/{id}/')
  Future<chopper.Response<EducatorAvailability>>
      _educatorTimesheetAvailabilityIdGet({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update EducatorTimeSheet EducatorAvailability.
  ///@param data
  Future<chopper.Response<EducatorAvailability>>
      educatorTimesheetAvailabilityIdPut({
    required EducatorAvailability? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        EducatorAvailability, () => EducatorAvailability.fromJsonFactory);

    return _educatorTimesheetAvailabilityIdPut(
        data: data, id: id, cacheControl: cacheControl);
  }

  ///Update EducatorTimeSheet EducatorAvailability.
  ///@param data
  @Put(path: '/educator_timesheet/availability/{id}/')
  Future<chopper.Response<EducatorAvailability>>
      _educatorTimesheetAvailabilityIdPut({
    @Body() required EducatorAvailability? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update EducatorTimeSheet EducatorAvailability.
  ///@param data
  Future<chopper.Response<EducatorAvailability>>
      educatorTimesheetAvailabilityIdPatch({
    required EducatorAvailability? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        EducatorAvailability, () => EducatorAvailability.fromJsonFactory);

    return _educatorTimesheetAvailabilityIdPatch(
        data: data, id: id, cacheControl: cacheControl);
  }

  ///Update EducatorTimeSheet EducatorAvailability.
  ///@param data
  @Patch(path: '/educator_timesheet/availability/{id}/')
  Future<chopper.Response<EducatorAvailability>>
      _educatorTimesheetAvailabilityIdPatch({
    @Body() required EducatorAvailability? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Delete EducatorTimeSheet EducatorAvailability.
  Future<chopper.Response> educatorTimesheetAvailabilityIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    return _educatorTimesheetAvailabilityIdDelete(
        id: id, cacheControl: cacheControl);
  }

  ///Delete EducatorTimeSheet EducatorAvailability.
  @Delete(path: '/educator_timesheet/availability/{id}/')
  Future<chopper.Response> _educatorTimesheetAvailabilityIdDelete({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///List EducatorTimeSheet EducatorSchedule.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  Future<chopper.Response<EducatorTimesheetScheduleGet$Response>>
      educatorTimesheetScheduleGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(EducatorTimesheetScheduleGet$Response,
        () => EducatorTimesheetScheduleGet$Response.fromJsonFactory);

    return _educatorTimesheetScheduleGet(
        page: page, pageSize: pageSize, cacheControl: cacheControl);
  }

  ///List EducatorTimeSheet EducatorSchedule.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  @Get(path: '/educator_timesheet/schedule/')
  Future<chopper.Response<EducatorTimesheetScheduleGet$Response>>
      _educatorTimesheetScheduleGet({
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Create EducatorTimeSheet EducatorSchedule.
  ///@param data
  Future<chopper.Response<EducatorSchedule>> educatorTimesheetSchedulePost({
    required EducatorSchedule? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        EducatorSchedule, () => EducatorSchedule.fromJsonFactory);

    return _educatorTimesheetSchedulePost(
        data: data, cacheControl: cacheControl);
  }

  ///Create EducatorTimeSheet EducatorSchedule.
  ///@param data
  @Post(path: '/educator_timesheet/schedule/')
  Future<chopper.Response<EducatorSchedule>> _educatorTimesheetSchedulePost({
    @Body() required EducatorSchedule? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param data
  Future<chopper.Response<EducatorSchedule>> educatorTimesheetSchedulePut({
    required EducatorSchedule? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        EducatorSchedule, () => EducatorSchedule.fromJsonFactory);

    return _educatorTimesheetSchedulePut(
        data: data, cacheControl: cacheControl);
  }

  ///
  ///@param data
  @Put(path: '/educator_timesheet/schedule/')
  Future<chopper.Response<EducatorSchedule>> _educatorTimesheetSchedulePut({
    @Body() required EducatorSchedule? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param data
  Future<chopper.Response<EducatorSchedule>> educatorTimesheetSchedulePatch({
    required EducatorSchedule? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        EducatorSchedule, () => EducatorSchedule.fromJsonFactory);

    return _educatorTimesheetSchedulePatch(
        data: data, cacheControl: cacheControl);
  }

  ///
  ///@param data
  @Patch(path: '/educator_timesheet/schedule/')
  Future<chopper.Response<EducatorSchedule>> _educatorTimesheetSchedulePatch({
    @Body() required EducatorSchedule? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  Future<chopper.Response> educatorTimesheetScheduleDelete(
      {String? cacheControl}) {
    return _educatorTimesheetScheduleDelete(cacheControl: cacheControl);
  }

  ///
  @Delete(path: '/educator_timesheet/schedule/')
  Future<chopper.Response> _educatorTimesheetScheduleDelete(
      {@Header('Cache-Control') String? cacheControl});

  ///Retrieve EducatorTimeSheet EducatorSchedule.
  Future<chopper.Response<EducatorSchedule>> educatorTimesheetScheduleIdGet({
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        EducatorSchedule, () => EducatorSchedule.fromJsonFactory);

    return _educatorTimesheetScheduleIdGet(id: id, cacheControl: cacheControl);
  }

  ///Retrieve EducatorTimeSheet EducatorSchedule.
  @Get(path: '/educator_timesheet/schedule/{id}/')
  Future<chopper.Response<EducatorSchedule>> _educatorTimesheetScheduleIdGet({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update EducatorTimeSheet EducatorSchedule.
  ///@param data
  Future<chopper.Response<EducatorSchedule>> educatorTimesheetScheduleIdPut({
    required EducatorSchedule? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        EducatorSchedule, () => EducatorSchedule.fromJsonFactory);

    return _educatorTimesheetScheduleIdPut(
        data: data, id: id, cacheControl: cacheControl);
  }

  ///Update EducatorTimeSheet EducatorSchedule.
  ///@param data
  @Put(path: '/educator_timesheet/schedule/{id}/')
  Future<chopper.Response<EducatorSchedule>> _educatorTimesheetScheduleIdPut({
    @Body() required EducatorSchedule? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update EducatorTimeSheet EducatorSchedule.
  ///@param data
  Future<chopper.Response<EducatorSchedule>> educatorTimesheetScheduleIdPatch({
    required EducatorSchedule? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        EducatorSchedule, () => EducatorSchedule.fromJsonFactory);

    return _educatorTimesheetScheduleIdPatch(
        data: data, id: id, cacheControl: cacheControl);
  }

  ///Update EducatorTimeSheet EducatorSchedule.
  ///@param data
  @Patch(path: '/educator_timesheet/schedule/{id}/')
  Future<chopper.Response<EducatorSchedule>> _educatorTimesheetScheduleIdPatch({
    @Body() required EducatorSchedule? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Delete EducatorTimeSheet EducatorSchedule.
  Future<chopper.Response> educatorTimesheetScheduleIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    return _educatorTimesheetScheduleIdDelete(
        id: id, cacheControl: cacheControl);
  }

  ///Delete EducatorTimeSheet EducatorSchedule.
  @Delete(path: '/educator_timesheet/schedule/{id}/')
  Future<chopper.Response> _educatorTimesheetScheduleIdDelete({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Create EducatorTimeSheet EducatorSchedule Clone.
  ///@param data
  Future<chopper.Response<List<EducatorSchedule>>>
      educatorTimesheetScheduleClonePost({
    required Object? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        EducatorSchedule, () => EducatorSchedule.fromJsonFactory);

    return _educatorTimesheetScheduleClonePost(
        data: data, cacheControl: cacheControl);
  }

  ///Create EducatorTimeSheet EducatorSchedule Clone.
  ///@param data
  @Post(path: '/educator_timesheet/schedule_clone/')
  Future<chopper.Response<List<EducatorSchedule>>>
      _educatorTimesheetScheduleClonePost({
    @Body() required Object? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///List EducatorTimeSheet EducatorTimeSheetSettings.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  Future<chopper.Response<EducatorTimesheetSettingsGet$Response>>
      educatorTimesheetSettingsGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(EducatorTimesheetSettingsGet$Response,
        () => EducatorTimesheetSettingsGet$Response.fromJsonFactory);

    return _educatorTimesheetSettingsGet(
        page: page, pageSize: pageSize, cacheControl: cacheControl);
  }

  ///List EducatorTimeSheet EducatorTimeSheetSettings.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  @Get(path: '/educator_timesheet/settings/')
  Future<chopper.Response<EducatorTimesheetSettingsGet$Response>>
      _educatorTimesheetSettingsGet({
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Create EducatorTimeSheet EducatorTimeSheetSettings.
  ///@param data
  Future<chopper.Response<GeneralEducatorTimeSheetSettings>>
      educatorTimesheetSettingsPost({
    required GeneralEducatorTimeSheetSettings? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(GeneralEducatorTimeSheetSettings,
        () => GeneralEducatorTimeSheetSettings.fromJsonFactory);

    return _educatorTimesheetSettingsPost(
        data: data, cacheControl: cacheControl);
  }

  ///Create EducatorTimeSheet EducatorTimeSheetSettings.
  ///@param data
  @Post(path: '/educator_timesheet/settings/')
  Future<chopper.Response<GeneralEducatorTimeSheetSettings>>
      _educatorTimesheetSettingsPost({
    @Body() required GeneralEducatorTimeSheetSettings? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///List EducatorTimeSheet EducatorExperienceLevelSettings.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  Future<chopper.Response<EducatorTimesheetSettingsExperienceGet$Response>>
      educatorTimesheetSettingsExperienceGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        EducatorTimesheetSettingsExperienceGet$Response,
        () => EducatorTimesheetSettingsExperienceGet$Response.fromJsonFactory);

    return _educatorTimesheetSettingsExperienceGet(
        page: page, pageSize: pageSize, cacheControl: cacheControl);
  }

  ///List EducatorTimeSheet EducatorExperienceLevelSettings.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  @Get(path: '/educator_timesheet/settings/experience/')
  Future<chopper.Response<EducatorTimesheetSettingsExperienceGet$Response>>
      _educatorTimesheetSettingsExperienceGet({
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Create EducatorTimeSheet EducatorExperienceLevelSettings.
  ///@param data
  Future<chopper.Response<EducatorExperienceLevelSettings>>
      educatorTimesheetSettingsExperiencePost({
    required EducatorExperienceLevelSettings? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(EducatorExperienceLevelSettings,
        () => EducatorExperienceLevelSettings.fromJsonFactory);

    return _educatorTimesheetSettingsExperiencePost(
        data: data, cacheControl: cacheControl);
  }

  ///Create EducatorTimeSheet EducatorExperienceLevelSettings.
  ///@param data
  @Post(path: '/educator_timesheet/settings/experience/')
  Future<chopper.Response<EducatorExperienceLevelSettings>>
      _educatorTimesheetSettingsExperiencePost({
    @Body() required EducatorExperienceLevelSettings? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Retrieve EducatorTimeSheet EducatorExperienceLevelSettings.
  Future<chopper.Response<EducatorExperienceLevelSettings>>
      educatorTimesheetSettingsExperienceIdGet({
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(EducatorExperienceLevelSettings,
        () => EducatorExperienceLevelSettings.fromJsonFactory);

    return _educatorTimesheetSettingsExperienceIdGet(
        id: id, cacheControl: cacheControl);
  }

  ///Retrieve EducatorTimeSheet EducatorExperienceLevelSettings.
  @Get(path: '/educator_timesheet/settings/experience/{id}/')
  Future<chopper.Response<EducatorExperienceLevelSettings>>
      _educatorTimesheetSettingsExperienceIdGet({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update EducatorTimeSheet EducatorExperienceLevelSettings.
  ///@param data
  Future<chopper.Response<EducatorExperienceLevelSettings>>
      educatorTimesheetSettingsExperienceIdPut({
    required EducatorExperienceLevelSettings? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(EducatorExperienceLevelSettings,
        () => EducatorExperienceLevelSettings.fromJsonFactory);

    return _educatorTimesheetSettingsExperienceIdPut(
        data: data, id: id, cacheControl: cacheControl);
  }

  ///Update EducatorTimeSheet EducatorExperienceLevelSettings.
  ///@param data
  @Put(path: '/educator_timesheet/settings/experience/{id}/')
  Future<chopper.Response<EducatorExperienceLevelSettings>>
      _educatorTimesheetSettingsExperienceIdPut({
    @Body() required EducatorExperienceLevelSettings? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update EducatorTimeSheet EducatorExperienceLevelSettings.
  ///@param data
  Future<chopper.Response<EducatorExperienceLevelSettings>>
      educatorTimesheetSettingsExperienceIdPatch({
    required EducatorExperienceLevelSettings? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(EducatorExperienceLevelSettings,
        () => EducatorExperienceLevelSettings.fromJsonFactory);

    return _educatorTimesheetSettingsExperienceIdPatch(
        data: data, id: id, cacheControl: cacheControl);
  }

  ///Update EducatorTimeSheet EducatorExperienceLevelSettings.
  ///@param data
  @Patch(path: '/educator_timesheet/settings/experience/{id}/')
  Future<chopper.Response<EducatorExperienceLevelSettings>>
      _educatorTimesheetSettingsExperienceIdPatch({
    @Body() required EducatorExperienceLevelSettings? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Delete EducatorTimeSheet EducatorExperienceLevelSettings.
  Future<chopper.Response> educatorTimesheetSettingsExperienceIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    return _educatorTimesheetSettingsExperienceIdDelete(
        id: id, cacheControl: cacheControl);
  }

  ///Delete EducatorTimeSheet EducatorExperienceLevelSettings.
  @Delete(path: '/educator_timesheet/settings/experience/{id}/')
  Future<chopper.Response> _educatorTimesheetSettingsExperienceIdDelete({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///List EducatorTimeSheet IndividualEmployeeTimeSheetSettings.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  Future<chopper.Response<EducatorTimesheetSettingsIndividualGet$Response>>
      educatorTimesheetSettingsIndividualGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        EducatorTimesheetSettingsIndividualGet$Response,
        () => EducatorTimesheetSettingsIndividualGet$Response.fromJsonFactory);

    return _educatorTimesheetSettingsIndividualGet(
        page: page, pageSize: pageSize, cacheControl: cacheControl);
  }

  ///List EducatorTimeSheet IndividualEmployeeTimeSheetSettings.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  @Get(path: '/educator_timesheet/settings/individual/')
  Future<chopper.Response<EducatorTimesheetSettingsIndividualGet$Response>>
      _educatorTimesheetSettingsIndividualGet({
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Create EducatorTimeSheet IndividualEmployeeTimeSheetSettings.
  ///@param data
  Future<chopper.Response<IndividualEmployeeTimeSheetSettings>>
      educatorTimesheetSettingsIndividualPost({
    required IndividualEmployeeTimeSheetSettings? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(IndividualEmployeeTimeSheetSettings,
        () => IndividualEmployeeTimeSheetSettings.fromJsonFactory);

    return _educatorTimesheetSettingsIndividualPost(
        data: data, cacheControl: cacheControl);
  }

  ///Create EducatorTimeSheet IndividualEmployeeTimeSheetSettings.
  ///@param data
  @Post(path: '/educator_timesheet/settings/individual/')
  Future<chopper.Response<IndividualEmployeeTimeSheetSettings>>
      _educatorTimesheetSettingsIndividualPost({
    @Body() required IndividualEmployeeTimeSheetSettings? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Retrieve EducatorTimeSheet IndividualEmployeeTimeSheetSettings.
  Future<chopper.Response<IndividualEmployeeTimeSheetSettings>>
      educatorTimesheetSettingsIndividualIdGet({
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(IndividualEmployeeTimeSheetSettings,
        () => IndividualEmployeeTimeSheetSettings.fromJsonFactory);

    return _educatorTimesheetSettingsIndividualIdGet(
        id: id, cacheControl: cacheControl);
  }

  ///Retrieve EducatorTimeSheet IndividualEmployeeTimeSheetSettings.
  @Get(path: '/educator_timesheet/settings/individual/{id}/')
  Future<chopper.Response<IndividualEmployeeTimeSheetSettings>>
      _educatorTimesheetSettingsIndividualIdGet({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update EducatorTimeSheet IndividualEmployeeTimeSheetSettings.
  ///@param data
  Future<chopper.Response<IndividualEmployeeTimeSheetSettings>>
      educatorTimesheetSettingsIndividualIdPut({
    required IndividualEmployeeTimeSheetSettings? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(IndividualEmployeeTimeSheetSettings,
        () => IndividualEmployeeTimeSheetSettings.fromJsonFactory);

    return _educatorTimesheetSettingsIndividualIdPut(
        data: data, id: id, cacheControl: cacheControl);
  }

  ///Update EducatorTimeSheet IndividualEmployeeTimeSheetSettings.
  ///@param data
  @Put(path: '/educator_timesheet/settings/individual/{id}/')
  Future<chopper.Response<IndividualEmployeeTimeSheetSettings>>
      _educatorTimesheetSettingsIndividualIdPut({
    @Body() required IndividualEmployeeTimeSheetSettings? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update EducatorTimeSheet IndividualEmployeeTimeSheetSettings.
  ///@param data
  Future<chopper.Response<IndividualEmployeeTimeSheetSettings>>
      educatorTimesheetSettingsIndividualIdPatch({
    required IndividualEmployeeTimeSheetSettings? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(IndividualEmployeeTimeSheetSettings,
        () => IndividualEmployeeTimeSheetSettings.fromJsonFactory);

    return _educatorTimesheetSettingsIndividualIdPatch(
        data: data, id: id, cacheControl: cacheControl);
  }

  ///Update EducatorTimeSheet IndividualEmployeeTimeSheetSettings.
  ///@param data
  @Patch(path: '/educator_timesheet/settings/individual/{id}/')
  Future<chopper.Response<IndividualEmployeeTimeSheetSettings>>
      _educatorTimesheetSettingsIndividualIdPatch({
    @Body() required IndividualEmployeeTimeSheetSettings? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Delete EducatorTimeSheet IndividualEmployeeTimeSheetSettings.
  Future<chopper.Response> educatorTimesheetSettingsIndividualIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    return _educatorTimesheetSettingsIndividualIdDelete(
        id: id, cacheControl: cacheControl);
  }

  ///Delete EducatorTimeSheet IndividualEmployeeTimeSheetSettings.
  @Delete(path: '/educator_timesheet/settings/individual/{id}/')
  Future<chopper.Response> _educatorTimesheetSettingsIndividualIdDelete({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Retrieve EducatorTimeSheet EducatorTimeSheetSettings.
  Future<chopper.Response<GeneralEducatorTimeSheetSettings>>
      educatorTimesheetSettingsIdGet({
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(GeneralEducatorTimeSheetSettings,
        () => GeneralEducatorTimeSheetSettings.fromJsonFactory);

    return _educatorTimesheetSettingsIdGet(id: id, cacheControl: cacheControl);
  }

  ///Retrieve EducatorTimeSheet EducatorTimeSheetSettings.
  @Get(path: '/educator_timesheet/settings/{id}/')
  Future<chopper.Response<GeneralEducatorTimeSheetSettings>>
      _educatorTimesheetSettingsIdGet({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update EducatorTimeSheet EducatorTimeSheetSettings.
  ///@param data
  Future<chopper.Response<GeneralEducatorTimeSheetSettings>>
      educatorTimesheetSettingsIdPut({
    required GeneralEducatorTimeSheetSettings? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(GeneralEducatorTimeSheetSettings,
        () => GeneralEducatorTimeSheetSettings.fromJsonFactory);

    return _educatorTimesheetSettingsIdPut(
        data: data, id: id, cacheControl: cacheControl);
  }

  ///Update EducatorTimeSheet EducatorTimeSheetSettings.
  ///@param data
  @Put(path: '/educator_timesheet/settings/{id}/')
  Future<chopper.Response<GeneralEducatorTimeSheetSettings>>
      _educatorTimesheetSettingsIdPut({
    @Body() required GeneralEducatorTimeSheetSettings? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update EducatorTimeSheet EducatorTimeSheetSettings.
  ///@param data
  Future<chopper.Response<GeneralEducatorTimeSheetSettings>>
      educatorTimesheetSettingsIdPatch({
    required GeneralEducatorTimeSheetSettings? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(GeneralEducatorTimeSheetSettings,
        () => GeneralEducatorTimeSheetSettings.fromJsonFactory);

    return _educatorTimesheetSettingsIdPatch(
        data: data, id: id, cacheControl: cacheControl);
  }

  ///Update EducatorTimeSheet EducatorTimeSheetSettings.
  ///@param data
  @Patch(path: '/educator_timesheet/settings/{id}/')
  Future<chopper.Response<GeneralEducatorTimeSheetSettings>>
      _educatorTimesheetSettingsIdPatch({
    @Body() required GeneralEducatorTimeSheetSettings? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Delete EducatorTimeSheet EducatorTimeSheetSettings.
  Future<chopper.Response> educatorTimesheetSettingsIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    return _educatorTimesheetSettingsIdDelete(
        id: id, cacheControl: cacheControl);
  }

  ///Delete EducatorTimeSheet EducatorTimeSheetSettings.
  @Delete(path: '/educator_timesheet/settings/{id}/')
  Future<chopper.Response> _educatorTimesheetSettingsIdDelete({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///List EducatorTimeSheet EducatorTimeSheet.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  Future<chopper.Response<EducatorTimesheetTimesheetGet$Response>>
      educatorTimesheetTimesheetGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(EducatorTimesheetTimesheetGet$Response,
        () => EducatorTimesheetTimesheetGet$Response.fromJsonFactory);

    return _educatorTimesheetTimesheetGet(
        page: page, pageSize: pageSize, cacheControl: cacheControl);
  }

  ///List EducatorTimeSheet EducatorTimeSheet.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  @Get(path: '/educator_timesheet/timesheet/')
  Future<chopper.Response<EducatorTimesheetTimesheetGet$Response>>
      _educatorTimesheetTimesheetGet({
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Create EducatorTimeSheet EducatorTimeSheet.
  ///@param data
  Future<chopper.Response<EducatorTimeSheet>> educatorTimesheetTimesheetPost({
    required EducatorTimeSheet? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        EducatorTimeSheet, () => EducatorTimeSheet.fromJsonFactory);

    return _educatorTimesheetTimesheetPost(
        data: data, cacheControl: cacheControl);
  }

  ///Create EducatorTimeSheet EducatorTimeSheet.
  ///@param data
  @Post(path: '/educator_timesheet/timesheet/')
  Future<chopper.Response<EducatorTimeSheet>> _educatorTimesheetTimesheetPost({
    @Body() required EducatorTimeSheet? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param data
  Future<chopper.Response<EducatorTimeSheet>> educatorTimesheetTimesheetPut({
    required EducatorTimeSheet? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        EducatorTimeSheet, () => EducatorTimeSheet.fromJsonFactory);

    return _educatorTimesheetTimesheetPut(
        data: data, cacheControl: cacheControl);
  }

  ///
  ///@param data
  @Put(path: '/educator_timesheet/timesheet/')
  Future<chopper.Response<EducatorTimeSheet>> _educatorTimesheetTimesheetPut({
    @Body() required EducatorTimeSheet? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param data
  Future<chopper.Response<EducatorTimeSheet>> educatorTimesheetTimesheetPatch({
    required EducatorTimeSheet? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        EducatorTimeSheet, () => EducatorTimeSheet.fromJsonFactory);

    return _educatorTimesheetTimesheetPatch(
        data: data, cacheControl: cacheControl);
  }

  ///
  ///@param data
  @Patch(path: '/educator_timesheet/timesheet/')
  Future<chopper.Response<EducatorTimeSheet>> _educatorTimesheetTimesheetPatch({
    @Body() required EducatorTimeSheet? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  Future<chopper.Response> educatorTimesheetTimesheetDelete(
      {String? cacheControl}) {
    return _educatorTimesheetTimesheetDelete(cacheControl: cacheControl);
  }

  ///
  @Delete(path: '/educator_timesheet/timesheet/')
  Future<chopper.Response> _educatorTimesheetTimesheetDelete(
      {@Header('Cache-Control') String? cacheControl});

  ///Retrieve EducatorTimeSheet EducatorTimeSheet.
  Future<chopper.Response<EducatorTimeSheet>> educatorTimesheetTimesheetIdGet({
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        EducatorTimeSheet, () => EducatorTimeSheet.fromJsonFactory);

    return _educatorTimesheetTimesheetIdGet(id: id, cacheControl: cacheControl);
  }

  ///Retrieve EducatorTimeSheet EducatorTimeSheet.
  @Get(path: '/educator_timesheet/timesheet/{id}/')
  Future<chopper.Response<EducatorTimeSheet>> _educatorTimesheetTimesheetIdGet({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update EducatorTimeSheet EducatorTimeSheet.
  ///@param data
  Future<chopper.Response<EducatorTimeSheet>> educatorTimesheetTimesheetIdPut({
    required EducatorTimeSheet? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        EducatorTimeSheet, () => EducatorTimeSheet.fromJsonFactory);

    return _educatorTimesheetTimesheetIdPut(
        data: data, id: id, cacheControl: cacheControl);
  }

  ///Update EducatorTimeSheet EducatorTimeSheet.
  ///@param data
  @Put(path: '/educator_timesheet/timesheet/{id}/')
  Future<chopper.Response<EducatorTimeSheet>> _educatorTimesheetTimesheetIdPut({
    @Body() required EducatorTimeSheet? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update EducatorTimeSheet EducatorTimeSheet.
  ///@param data
  Future<chopper.Response<EducatorTimeSheet>>
      educatorTimesheetTimesheetIdPatch({
    required EducatorTimeSheet? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        EducatorTimeSheet, () => EducatorTimeSheet.fromJsonFactory);

    return _educatorTimesheetTimesheetIdPatch(
        data: data, id: id, cacheControl: cacheControl);
  }

  ///Update EducatorTimeSheet EducatorTimeSheet.
  ///@param data
  @Patch(path: '/educator_timesheet/timesheet/{id}/')
  Future<chopper.Response<EducatorTimeSheet>>
      _educatorTimesheetTimesheetIdPatch({
    @Body() required EducatorTimeSheet? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Delete EducatorTimeSheet EducatorTimeSheet.
  Future<chopper.Response> educatorTimesheetTimesheetIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    return _educatorTimesheetTimesheetIdDelete(
        id: id, cacheControl: cacheControl);
  }

  ///Delete EducatorTimeSheet EducatorTimeSheet.
  @Delete(path: '/educator_timesheet/timesheet/{id}/')
  Future<chopper.Response> _educatorTimesheetTimesheetIdDelete({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///List Calendar : Event Event.
  ///@param search A search term.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  Future<chopper.Response<EventsGet$Response>> eventsGet({
    String? search,
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        EventsGet$Response, () => EventsGet$Response.fromJsonFactory);

    return _eventsGet(
        search: search,
        page: page,
        pageSize: pageSize,
        cacheControl: cacheControl);
  }

  ///List Calendar : Event Event.
  ///@param search A search term.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  @Get(path: '/events/')
  Future<chopper.Response<EventsGet$Response>> _eventsGet({
    @Query('search') String? search,
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Create Calendar : Event Event.
  ///@param data
  Future<chopper.Response<Event>> eventsPost({
    required Event? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(Event, () => Event.fromJsonFactory);

    return _eventsPost(data: data, cacheControl: cacheControl);
  }

  ///Create Calendar : Event Event.
  ///@param data
  @Post(path: '/events/')
  Future<chopper.Response<Event>> _eventsPost({
    @Body() required Event? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///List Calendar : Event EventOccurrence.
  ///@param ordering Which field to use when ordering the results.
  ///@param search A search term.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  Future<chopper.Response<EventsEventsOccurrenceGet$Response>>
      eventsEventsOccurrenceGet({
    String? ordering,
    String? search,
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(EventsEventsOccurrenceGet$Response,
        () => EventsEventsOccurrenceGet$Response.fromJsonFactory);

    return _eventsEventsOccurrenceGet(
        ordering: ordering,
        search: search,
        page: page,
        pageSize: pageSize,
        cacheControl: cacheControl);
  }

  ///List Calendar : Event EventOccurrence.
  ///@param ordering Which field to use when ordering the results.
  ///@param search A search term.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  @Get(path: '/events/events_occurrence/')
  Future<chopper.Response<EventsEventsOccurrenceGet$Response>>
      _eventsEventsOccurrenceGet({
    @Query('ordering') String? ordering,
    @Query('search') String? search,
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Retrieve Calendar : Event Event.
  Future<chopper.Response<Event>> eventsIdGet({
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(Event, () => Event.fromJsonFactory);

    return _eventsIdGet(id: id, cacheControl: cacheControl);
  }

  ///Retrieve Calendar : Event Event.
  @Get(path: '/events/{id}/')
  Future<chopper.Response<Event>> _eventsIdGet({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update Calendar : Event Event.
  ///@param data
  Future<chopper.Response<Event>> eventsIdPut({
    required Event? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(Event, () => Event.fromJsonFactory);

    return _eventsIdPut(data: data, id: id, cacheControl: cacheControl);
  }

  ///Update Calendar : Event Event.
  ///@param data
  @Put(path: '/events/{id}/')
  Future<chopper.Response<Event>> _eventsIdPut({
    @Body() required Event? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update Calendar : Event Event.
  ///@param data
  Future<chopper.Response<Event>> eventsIdPatch({
    required Event? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(Event, () => Event.fromJsonFactory);

    return _eventsIdPatch(data: data, id: id, cacheControl: cacheControl);
  }

  ///Update Calendar : Event Event.
  ///@param data
  @Patch(path: '/events/{id}/')
  Future<chopper.Response<Event>> _eventsIdPatch({
    @Body() required Event? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Delete Calendar : Event Event.
  Future<chopper.Response> eventsIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    return _eventsIdDelete(id: id, cacheControl: cacheControl);
  }

  ///Delete Calendar : Event Event.
  @Delete(path: '/events/{id}/')
  Future<chopper.Response> _eventsIdDelete({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  Future<chopper.Response<FormsFormMedicalfileGet$Response>>
      formsFormMedicalfileGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(FormsFormMedicalfileGet$Response,
        () => FormsFormMedicalfileGet$Response.fromJsonFactory);

    return _formsFormMedicalfileGet(
        page: page, pageSize: pageSize, cacheControl: cacheControl);
  }

  ///
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  @Get(path: '/forms/form/medicalfile/')
  Future<chopper.Response<FormsFormMedicalfileGet$Response>>
      _formsFormMedicalfileGet({
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param data
  Future<chopper.Response<MedicalFileForm>> formsFormMedicalfilePost({
    required MedicalFileForm? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        MedicalFileForm, () => MedicalFileForm.fromJsonFactory);

    return _formsFormMedicalfilePost(data: data, cacheControl: cacheControl);
  }

  ///
  ///@param data
  @Post(path: '/forms/form/medicalfile/')
  Future<chopper.Response<MedicalFileForm>> _formsFormMedicalfilePost({
    @Body() required MedicalFileForm? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  Future<chopper.Response<FormsFormMedicalfileTemplateGet$Response>>
      formsFormMedicalfileTemplateGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(FormsFormMedicalfileTemplateGet$Response,
        () => FormsFormMedicalfileTemplateGet$Response.fromJsonFactory);

    return _formsFormMedicalfileTemplateGet(
        page: page, pageSize: pageSize, cacheControl: cacheControl);
  }

  ///
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  @Get(path: '/forms/form/medicalfile/template/')
  Future<chopper.Response<FormsFormMedicalfileTemplateGet$Response>>
      _formsFormMedicalfileTemplateGet({
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  Future<chopper.Response<MedicalFileTemplate>>
      formsFormMedicalfileTemplateIdGet({
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        MedicalFileTemplate, () => MedicalFileTemplate.fromJsonFactory);

    return _formsFormMedicalfileTemplateIdGet(
        id: id, cacheControl: cacheControl);
  }

  ///
  @Get(path: '/forms/form/medicalfile/template/{id}/')
  Future<chopper.Response<MedicalFileTemplate>>
      _formsFormMedicalfileTemplateIdGet({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  Future<chopper.Response<MedicalFileForm>> formsFormMedicalfileIdGet({
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        MedicalFileForm, () => MedicalFileForm.fromJsonFactory);

    return _formsFormMedicalfileIdGet(id: id, cacheControl: cacheControl);
  }

  ///
  @Get(path: '/forms/form/medicalfile/{id}/')
  Future<chopper.Response<MedicalFileForm>> _formsFormMedicalfileIdGet({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param data
  Future<chopper.Response<MedicalFileForm>> formsFormMedicalfileIdPut({
    required MedicalFileForm? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        MedicalFileForm, () => MedicalFileForm.fromJsonFactory);

    return _formsFormMedicalfileIdPut(
        data: data, id: id, cacheControl: cacheControl);
  }

  ///
  ///@param data
  @Put(path: '/forms/form/medicalfile/{id}/')
  Future<chopper.Response<MedicalFileForm>> _formsFormMedicalfileIdPut({
    @Body() required MedicalFileForm? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param data
  Future<chopper.Response<MedicalFileForm>> formsFormMedicalfileIdPatch({
    required MedicalFileForm? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        MedicalFileForm, () => MedicalFileForm.fromJsonFactory);

    return _formsFormMedicalfileIdPatch(
        data: data, id: id, cacheControl: cacheControl);
  }

  ///
  ///@param data
  @Patch(path: '/forms/form/medicalfile/{id}/')
  Future<chopper.Response<MedicalFileForm>> _formsFormMedicalfileIdPatch({
    @Body() required MedicalFileForm? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  Future<chopper.Response> formsFormMedicalfileIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    return _formsFormMedicalfileIdDelete(id: id, cacheControl: cacheControl);
  }

  ///
  @Delete(path: '/forms/form/medicalfile/{id}/')
  Future<chopper.Response> _formsFormMedicalfileIdDelete({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  Future<chopper.Response<MedicalFileForm>> formsFormMedicalfileIdPdfGet({
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        MedicalFileForm, () => MedicalFileForm.fromJsonFactory);

    return _formsFormMedicalfileIdPdfGet(id: id, cacheControl: cacheControl);
  }

  ///
  @Get(path: '/forms/form/medicalfile/{id}/pdf/')
  Future<chopper.Response<MedicalFileForm>> _formsFormMedicalfileIdPdfGet({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  Future<chopper.Response<FormsFormTpzGet$Response>> formsFormTpzGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(FormsFormTpzGet$Response,
        () => FormsFormTpzGet$Response.fromJsonFactory);

    return _formsFormTpzGet(
        page: page, pageSize: pageSize, cacheControl: cacheControl);
  }

  ///
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  @Get(path: '/forms/form/tpz/')
  Future<chopper.Response<FormsFormTpzGet$Response>> _formsFormTpzGet({
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param data
  Future<chopper.Response<TPZForm>> formsFormTpzPost({
    required TPZForm? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(TPZForm, () => TPZForm.fromJsonFactory);

    return _formsFormTpzPost(data: data, cacheControl: cacheControl);
  }

  ///
  ///@param data
  @Post(path: '/forms/form/tpz/')
  Future<chopper.Response<TPZForm>> _formsFormTpzPost({
    @Body() required TPZForm? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  Future<chopper.Response<FormsFormTpzTemplateGet$Response>>
      formsFormTpzTemplateGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(FormsFormTpzTemplateGet$Response,
        () => FormsFormTpzTemplateGet$Response.fromJsonFactory);

    return _formsFormTpzTemplateGet(
        page: page, pageSize: pageSize, cacheControl: cacheControl);
  }

  ///
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  @Get(path: '/forms/form/tpz/template/')
  Future<chopper.Response<FormsFormTpzTemplateGet$Response>>
      _formsFormTpzTemplateGet({
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  Future<chopper.Response<TPZTemplate>> formsFormTpzTemplateIdGet({
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        TPZTemplate, () => TPZTemplate.fromJsonFactory);

    return _formsFormTpzTemplateIdGet(id: id, cacheControl: cacheControl);
  }

  ///
  @Get(path: '/forms/form/tpz/template/{id}/')
  Future<chopper.Response<TPZTemplate>> _formsFormTpzTemplateIdGet({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  Future<chopper.Response<TPZForm>> formsFormTpzIdGet({
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(TPZForm, () => TPZForm.fromJsonFactory);

    return _formsFormTpzIdGet(id: id, cacheControl: cacheControl);
  }

  ///
  @Get(path: '/forms/form/tpz/{id}/')
  Future<chopper.Response<TPZForm>> _formsFormTpzIdGet({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param data
  Future<chopper.Response<TPZForm>> formsFormTpzIdPut({
    required TPZForm? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(TPZForm, () => TPZForm.fromJsonFactory);

    return _formsFormTpzIdPut(data: data, id: id, cacheControl: cacheControl);
  }

  ///
  ///@param data
  @Put(path: '/forms/form/tpz/{id}/')
  Future<chopper.Response<TPZForm>> _formsFormTpzIdPut({
    @Body() required TPZForm? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param data
  Future<chopper.Response<TPZForm>> formsFormTpzIdPatch({
    required TPZForm? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(TPZForm, () => TPZForm.fromJsonFactory);

    return _formsFormTpzIdPatch(data: data, id: id, cacheControl: cacheControl);
  }

  ///
  ///@param data
  @Patch(path: '/forms/form/tpz/{id}/')
  Future<chopper.Response<TPZForm>> _formsFormTpzIdPatch({
    @Body() required TPZForm? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  Future<chopper.Response> formsFormTpzIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    return _formsFormTpzIdDelete(id: id, cacheControl: cacheControl);
  }

  ///
  @Delete(path: '/forms/form/tpz/{id}/')
  Future<chopper.Response> _formsFormTpzIdDelete({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  Future<chopper.Response<TPZForm>> formsFormTpzIdPdfGet({
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(TPZForm, () => TPZForm.fromJsonFactory);

    return _formsFormTpzIdPdfGet(id: id, cacheControl: cacheControl);
  }

  ///
  @Get(path: '/forms/form/tpz/{id}/pdf/')
  Future<chopper.Response<TPZForm>> _formsFormTpzIdPdfGet({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param data
  Future<chopper.Response<DocumentsFicheContacts>>
      governanceDocsDocumentsFicheContactPost({
    required DocumentsFicheContacts? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        DocumentsFicheContacts, () => DocumentsFicheContacts.fromJsonFactory);

    return _governanceDocsDocumentsFicheContactPost(
        data: data, cacheControl: cacheControl);
  }

  ///
  ///@param data
  @Post(path: '/governance_docs/documents/fiche_contact/')
  Future<chopper.Response<DocumentsFicheContacts>>
      _governanceDocsDocumentsFicheContactPost({
    @Body() required DocumentsFicheContacts? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param data
  Future<chopper.Response<RequestReport>>
      governanceDocsReportsPersonalizedReportPost({
    required RequestReport? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        RequestReport, () => RequestReport.fromJsonFactory);

    return _governanceDocsReportsPersonalizedReportPost(
        data: data, cacheControl: cacheControl);
  }

  ///
  ///@param data
  @Post(path: '/governance_docs/reports/personalized_report/')
  Future<chopper.Response<RequestReport>>
      _governanceDocsReportsPersonalizedReportPost({
    @Body() required RequestReport? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///List Group Group.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  Future<chopper.Response<GroupGet$Response>> groupGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        GroupGet$Response, () => GroupGet$Response.fromJsonFactory);

    return _groupGet(
        page: page, pageSize: pageSize, cacheControl: cacheControl);
  }

  ///List Group Group.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  @Get(path: '/group/')
  Future<chopper.Response<GroupGet$Response>> _groupGet({
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Create Group Group.
  ///@param data
  Future<chopper.Response<Group>> groupPost({
    required Group? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(Group, () => Group.fromJsonFactory);

    return _groupPost(data: data, cacheControl: cacheControl);
  }

  ///Create Group Group.
  ///@param data
  @Post(path: '/group/')
  Future<chopper.Response<Group>> _groupPost({
    @Body() required Group? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Retrieve Group Group.
  Future<chopper.Response<Group>> groupIdGet({
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(Group, () => Group.fromJsonFactory);

    return _groupIdGet(id: id, cacheControl: cacheControl);
  }

  ///Retrieve Group Group.
  @Get(path: '/group/{id}/')
  Future<chopper.Response<Group>> _groupIdGet({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update Group Group.
  ///@param data
  Future<chopper.Response<Group>> groupIdPut({
    required Group? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(Group, () => Group.fromJsonFactory);

    return _groupIdPut(data: data, id: id, cacheControl: cacheControl);
  }

  ///Update Group Group.
  ///@param data
  @Put(path: '/group/{id}/')
  Future<chopper.Response<Group>> _groupIdPut({
    @Body() required Group? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update Group Group.
  ///@param data
  Future<chopper.Response<Group>> groupIdPatch({
    required Group? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(Group, () => Group.fromJsonFactory);

    return _groupIdPatch(data: data, id: id, cacheControl: cacheControl);
  }

  ///Update Group Group.
  ///@param data
  @Patch(path: '/group/{id}/')
  Future<chopper.Response<Group>> _groupIdPatch({
    @Body() required Group? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Delete Group Group.
  Future<chopper.Response> groupIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    return _groupIdDelete(id: id, cacheControl: cacheControl);
  }

  ///Delete Group Group.
  @Delete(path: '/group/{id}/')
  Future<chopper.Response> _groupIdDelete({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///List Menu Menu.
  ///@param search A search term.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  Future<chopper.Response<MenuGet$Response>> menuGet({
    String? search,
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        MenuGet$Response, () => MenuGet$Response.fromJsonFactory);

    return _menuGet(
        search: search,
        page: page,
        pageSize: pageSize,
        cacheControl: cacheControl);
  }

  ///List Menu Menu.
  ///@param search A search term.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  @Get(path: '/menu/')
  Future<chopper.Response<MenuGet$Response>> _menuGet({
    @Query('search') String? search,
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Create Menu Menu.
  ///@param data
  Future<chopper.Response<Menu>> menuPost({
    required Menu? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(Menu, () => Menu.fromJsonFactory);

    return _menuPost(data: data, cacheControl: cacheControl);
  }

  ///Create Menu Menu.
  ///@param data
  @Post(path: '/menu/')
  Future<chopper.Response<Menu>> _menuPost({
    @Body() required Menu? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///List Menu MenuOccurrence.
  ///@param ordering Which field to use when ordering the results.
  ///@param search A search term.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  Future<chopper.Response<MenuMealOccurrenceGet$Response>>
      menuMealOccurrenceGet({
    String? ordering,
    String? search,
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(MenuMealOccurrenceGet$Response,
        () => MenuMealOccurrenceGet$Response.fromJsonFactory);

    return _menuMealOccurrenceGet(
        ordering: ordering,
        search: search,
        page: page,
        pageSize: pageSize,
        cacheControl: cacheControl);
  }

  ///List Menu MenuOccurrence.
  ///@param ordering Which field to use when ordering the results.
  ///@param search A search term.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  @Get(path: '/menu/meal_occurrence/')
  Future<chopper.Response<MenuMealOccurrenceGet$Response>>
      _menuMealOccurrenceGet({
    @Query('ordering') String? ordering,
    @Query('search') String? search,
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Retrieve Menu Menu.
  Future<chopper.Response<Menu>> menuIdGet({
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(Menu, () => Menu.fromJsonFactory);

    return _menuIdGet(id: id, cacheControl: cacheControl);
  }

  ///Retrieve Menu Menu.
  @Get(path: '/menu/{id}/')
  Future<chopper.Response<Menu>> _menuIdGet({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update Menu Menu.
  ///@param data
  Future<chopper.Response<Menu>> menuIdPut({
    required Menu? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(Menu, () => Menu.fromJsonFactory);

    return _menuIdPut(data: data, id: id, cacheControl: cacheControl);
  }

  ///Update Menu Menu.
  ///@param data
  @Put(path: '/menu/{id}/')
  Future<chopper.Response<Menu>> _menuIdPut({
    @Body() required Menu? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update Menu Menu.
  ///@param data
  Future<chopper.Response<Menu>> menuIdPatch({
    required Menu? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(Menu, () => Menu.fromJsonFactory);

    return _menuIdPatch(data: data, id: id, cacheControl: cacheControl);
  }

  ///Update Menu Menu.
  ///@param data
  @Patch(path: '/menu/{id}/')
  Future<chopper.Response<Menu>> _menuIdPatch({
    @Body() required Menu? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Delete Menu Menu.
  Future<chopper.Response> menuIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    return _menuIdDelete(id: id, cacheControl: cacheControl);
  }

  ///Delete Menu Menu.
  @Delete(path: '/menu/{id}/')
  Future<chopper.Response> _menuIdDelete({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  Future<chopper.Response<NotificationsGet$Response>> notificationsGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(NotificationsGet$Response,
        () => NotificationsGet$Response.fromJsonFactory);

    return _notificationsGet(
        page: page, pageSize: pageSize, cacheControl: cacheControl);
  }

  ///
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  @Get(path: '/notifications/')
  Future<chopper.Response<NotificationsGet$Response>> _notificationsGet({
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param data
  Future<chopper.Response<NotificationSerializerCreate>> notificationsPost({
    required NotificationSerializerCreate? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(NotificationSerializerCreate,
        () => NotificationSerializerCreate.fromJsonFactory);

    return _notificationsPost(data: data, cacheControl: cacheControl);
  }

  ///
  ///@param data
  @Post(path: '/notifications/')
  Future<chopper.Response<NotificationSerializerCreate>> _notificationsPost({
    @Body() required NotificationSerializerCreate? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///List Payment Payment.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  Future<chopper.Response<PaymentGet$Response>> paymentGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        PaymentGet$Response, () => PaymentGet$Response.fromJsonFactory);

    return _paymentGet(
        page: page, pageSize: pageSize, cacheControl: cacheControl);
  }

  ///List Payment Payment.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  @Get(path: '/payment/')
  Future<chopper.Response<PaymentGet$Response>> _paymentGet({
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Create Payment Payment.
  ///@param data
  Future<chopper.Response<Payment>> paymentPost({
    required Payment? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(Payment, () => Payment.fromJsonFactory);

    return _paymentPost(data: data, cacheControl: cacheControl);
  }

  ///Create Payment Payment.
  ///@param data
  @Post(path: '/payment/')
  Future<chopper.Response<Payment>> _paymentPost({
    @Body() required Payment? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Retrieve Payment Payment.
  Future<chopper.Response<Payment>> paymentIdGet({
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(Payment, () => Payment.fromJsonFactory);

    return _paymentIdGet(id: id, cacheControl: cacheControl);
  }

  ///Retrieve Payment Payment.
  @Get(path: '/payment/{id}/')
  Future<chopper.Response<Payment>> _paymentIdGet({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update Payment Payment.
  ///@param data
  Future<chopper.Response<Payment>> paymentIdPut({
    required Payment? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(Payment, () => Payment.fromJsonFactory);

    return _paymentIdPut(data: data, id: id, cacheControl: cacheControl);
  }

  ///Update Payment Payment.
  ///@param data
  @Put(path: '/payment/{id}/')
  Future<chopper.Response<Payment>> _paymentIdPut({
    @Body() required Payment? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update Payment Payment.
  ///@param data
  Future<chopper.Response<Payment>> paymentIdPatch({
    required Payment? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(Payment, () => Payment.fromJsonFactory);

    return _paymentIdPatch(data: data, id: id, cacheControl: cacheControl);
  }

  ///Update Payment Payment.
  ///@param data
  @Patch(path: '/payment/{id}/')
  Future<chopper.Response<Payment>> _paymentIdPatch({
    @Body() required Payment? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Delete Payment Payment.
  Future<chopper.Response> paymentIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    return _paymentIdDelete(id: id, cacheControl: cacheControl);
  }

  ///Delete Payment Payment.
  @Delete(path: '/payment/{id}/')
  Future<chopper.Response> _paymentIdDelete({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  Future<chopper.Response<PermissionsEducatorPermissionsGet$Response>>
      permissionsEducatorPermissionsGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(PermissionsEducatorPermissionsGet$Response,
        () => PermissionsEducatorPermissionsGet$Response.fromJsonFactory);

    return _permissionsEducatorPermissionsGet(
        page: page, pageSize: pageSize, cacheControl: cacheControl);
  }

  ///
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  @Get(path: '/permissions/educator_permissions/')
  Future<chopper.Response<PermissionsEducatorPermissionsGet$Response>>
      _permissionsEducatorPermissionsGet({
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  Future<chopper.Response<EducatorKindergartenPermission>>
      permissionsEducatorPermissionsIdGet({
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(EducatorKindergartenPermission,
        () => EducatorKindergartenPermission.fromJsonFactory);

    return _permissionsEducatorPermissionsIdGet(
        id: id, cacheControl: cacheControl);
  }

  ///
  @Get(path: '/permissions/educator_permissions/{id}/')
  Future<chopper.Response<EducatorKindergartenPermission>>
      _permissionsEducatorPermissionsIdGet({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param data
  Future<chopper.Response<EducatorKindergartenPermission>>
      permissionsEducatorPermissionsIdPut({
    required EducatorKindergartenPermission? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(EducatorKindergartenPermission,
        () => EducatorKindergartenPermission.fromJsonFactory);

    return _permissionsEducatorPermissionsIdPut(
        data: data, id: id, cacheControl: cacheControl);
  }

  ///
  ///@param data
  @Put(path: '/permissions/educator_permissions/{id}/')
  Future<chopper.Response<EducatorKindergartenPermission>>
      _permissionsEducatorPermissionsIdPut({
    @Body() required EducatorKindergartenPermission? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param data
  Future<chopper.Response<EducatorKindergartenPermission>>
      permissionsEducatorPermissionsIdPatch({
    required EducatorKindergartenPermission? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(EducatorKindergartenPermission,
        () => EducatorKindergartenPermission.fromJsonFactory);

    return _permissionsEducatorPermissionsIdPatch(
        data: data, id: id, cacheControl: cacheControl);
  }

  ///
  ///@param data
  @Patch(path: '/permissions/educator_permissions/{id}/')
  Future<chopper.Response<EducatorKindergartenPermission>>
      _permissionsEducatorPermissionsIdPatch({
    @Body() required EducatorKindergartenPermission? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///List Presence Attendance.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  Future<chopper.Response<PresenceAttendanceGet$Response>>
      presenceAttendanceGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(PresenceAttendanceGet$Response,
        () => PresenceAttendanceGet$Response.fromJsonFactory);

    return _presenceAttendanceGet(
        page: page, pageSize: pageSize, cacheControl: cacheControl);
  }

  ///List Presence Attendance.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  @Get(path: '/presence/attendance/')
  Future<chopper.Response<PresenceAttendanceGet$Response>>
      _presenceAttendanceGet({
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Create Presence Attendance.
  ///@param data
  Future<chopper.Response<Presence>> presenceAttendancePost({
    required Presence? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(Presence, () => Presence.fromJsonFactory);

    return _presenceAttendancePost(data: data, cacheControl: cacheControl);
  }

  ///Create Presence Attendance.
  ///@param data
  @Post(path: '/presence/attendance/')
  Future<chopper.Response<Presence>> _presenceAttendancePost({
    @Body() required Presence? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Retrieve Presence Attendance.
  Future<chopper.Response<Presence>> presenceAttendanceIdGet({
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(Presence, () => Presence.fromJsonFactory);

    return _presenceAttendanceIdGet(id: id, cacheControl: cacheControl);
  }

  ///Retrieve Presence Attendance.
  @Get(path: '/presence/attendance/{id}/')
  Future<chopper.Response<Presence>> _presenceAttendanceIdGet({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update Presence Attendance.
  ///@param data
  Future<chopper.Response<Presence>> presenceAttendanceIdPut({
    required Presence? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(Presence, () => Presence.fromJsonFactory);

    return _presenceAttendanceIdPut(
        data: data, id: id, cacheControl: cacheControl);
  }

  ///Update Presence Attendance.
  ///@param data
  @Put(path: '/presence/attendance/{id}/')
  Future<chopper.Response<Presence>> _presenceAttendanceIdPut({
    @Body() required Presence? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update Presence Attendance.
  ///@param data
  Future<chopper.Response<Presence>> presenceAttendanceIdPatch({
    required Presence? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(Presence, () => Presence.fromJsonFactory);

    return _presenceAttendanceIdPatch(
        data: data, id: id, cacheControl: cacheControl);
  }

  ///Update Presence Attendance.
  ///@param data
  @Patch(path: '/presence/attendance/{id}/')
  Future<chopper.Response<Presence>> _presenceAttendanceIdPatch({
    @Body() required Presence? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Delete Presence Attendance.
  Future<chopper.Response> presenceAttendanceIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    return _presenceAttendanceIdDelete(id: id, cacheControl: cacheControl);
  }

  ///Delete Presence Attendance.
  @Delete(path: '/presence/attendance/{id}/')
  Future<chopper.Response> _presenceAttendanceIdDelete({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///List Presence ExpectedPickUp.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  Future<chopper.Response<PresenceExpectedPickupGet$Response>>
      presenceExpectedPickupGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(PresenceExpectedPickupGet$Response,
        () => PresenceExpectedPickupGet$Response.fromJsonFactory);

    return _presenceExpectedPickupGet(
        page: page, pageSize: pageSize, cacheControl: cacheControl);
  }

  ///List Presence ExpectedPickUp.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  @Get(path: '/presence/expected_pickup/')
  Future<chopper.Response<PresenceExpectedPickupGet$Response>>
      _presenceExpectedPickupGet({
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Create Presence ExpectedPickUp.
  ///@param data
  Future<chopper.Response<ExpectedPickUp>> presenceExpectedPickupPost({
    required ExpectedPickUp? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        ExpectedPickUp, () => ExpectedPickUp.fromJsonFactory);

    return _presenceExpectedPickupPost(data: data, cacheControl: cacheControl);
  }

  ///Create Presence ExpectedPickUp.
  ///@param data
  @Post(path: '/presence/expected_pickup/')
  Future<chopper.Response<ExpectedPickUp>> _presenceExpectedPickupPost({
    @Body() required ExpectedPickUp? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Retrieve Presence ExpectedPickUp.
  Future<chopper.Response<ExpectedPickUp>> presenceExpectedPickupIdGet({
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        ExpectedPickUp, () => ExpectedPickUp.fromJsonFactory);

    return _presenceExpectedPickupIdGet(id: id, cacheControl: cacheControl);
  }

  ///Retrieve Presence ExpectedPickUp.
  @Get(path: '/presence/expected_pickup/{id}/')
  Future<chopper.Response<ExpectedPickUp>> _presenceExpectedPickupIdGet({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update Presence ExpectedPickUp.
  ///@param data
  Future<chopper.Response<ExpectedPickUp>> presenceExpectedPickupIdPut({
    required ExpectedPickUp? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        ExpectedPickUp, () => ExpectedPickUp.fromJsonFactory);

    return _presenceExpectedPickupIdPut(
        data: data, id: id, cacheControl: cacheControl);
  }

  ///Update Presence ExpectedPickUp.
  ///@param data
  @Put(path: '/presence/expected_pickup/{id}/')
  Future<chopper.Response<ExpectedPickUp>> _presenceExpectedPickupIdPut({
    @Body() required ExpectedPickUp? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update Presence ExpectedPickUp.
  ///@param data
  Future<chopper.Response<ExpectedPickUp>> presenceExpectedPickupIdPatch({
    required ExpectedPickUp? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        ExpectedPickUp, () => ExpectedPickUp.fromJsonFactory);

    return _presenceExpectedPickupIdPatch(
        data: data, id: id, cacheControl: cacheControl);
  }

  ///Update Presence ExpectedPickUp.
  ///@param data
  @Patch(path: '/presence/expected_pickup/{id}/')
  Future<chopper.Response<ExpectedPickUp>> _presenceExpectedPickupIdPatch({
    @Body() required ExpectedPickUp? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Delete Presence ExpectedPickUp.
  Future<chopper.Response> presenceExpectedPickupIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    return _presenceExpectedPickupIdDelete(id: id, cacheControl: cacheControl);
  }

  ///Delete Presence ExpectedPickUp.
  @Delete(path: '/presence/expected_pickup/{id}/')
  Future<chopper.Response> _presenceExpectedPickupIdDelete({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  Future<chopper.Response<PublicationsCommentsGet$Response>>
      publicationsCommentsGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(PublicationsCommentsGet$Response,
        () => PublicationsCommentsGet$Response.fromJsonFactory);

    return _publicationsCommentsGet(
        page: page, pageSize: pageSize, cacheControl: cacheControl);
  }

  ///
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  @Get(path: '/publications/comments/')
  Future<chopper.Response<PublicationsCommentsGet$Response>>
      _publicationsCommentsGet({
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param data
  Future<chopper.Response<Comment>> publicationsCommentsPost({
    required Comment? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(Comment, () => Comment.fromJsonFactory);

    return _publicationsCommentsPost(data: data, cacheControl: cacheControl);
  }

  ///
  ///@param data
  @Post(path: '/publications/comments/')
  Future<chopper.Response<Comment>> _publicationsCommentsPost({
    @Body() required Comment? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  Future<chopper.Response<Comment>> publicationsCommentsIdGet({
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(Comment, () => Comment.fromJsonFactory);

    return _publicationsCommentsIdGet(id: id, cacheControl: cacheControl);
  }

  ///
  @Get(path: '/publications/comments/{id}/')
  Future<chopper.Response<Comment>> _publicationsCommentsIdGet({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param data
  Future<chopper.Response<CommentSerializerUpdate>> publicationsCommentsIdPut({
    required CommentSerializerUpdate? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        CommentSerializerUpdate, () => CommentSerializerUpdate.fromJsonFactory);

    return _publicationsCommentsIdPut(
        data: data, id: id, cacheControl: cacheControl);
  }

  ///
  ///@param data
  @Put(path: '/publications/comments/{id}/')
  Future<chopper.Response<CommentSerializerUpdate>> _publicationsCommentsIdPut({
    @Body() required CommentSerializerUpdate? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param data
  Future<chopper.Response<CommentSerializerUpdate>>
      publicationsCommentsIdPatch({
    required CommentSerializerUpdate? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        CommentSerializerUpdate, () => CommentSerializerUpdate.fromJsonFactory);

    return _publicationsCommentsIdPatch(
        data: data, id: id, cacheControl: cacheControl);
  }

  ///
  ///@param data
  @Patch(path: '/publications/comments/{id}/')
  Future<chopper.Response<CommentSerializerUpdate>>
      _publicationsCommentsIdPatch({
    @Body() required CommentSerializerUpdate? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  Future<chopper.Response> publicationsCommentsIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    return _publicationsCommentsIdDelete(id: id, cacheControl: cacheControl);
  }

  ///
  @Delete(path: '/publications/comments/{id}/')
  Future<chopper.Response> _publicationsCommentsIdDelete({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  Future<chopper.Response<PublicationsDocsContentGet$Response>>
      publicationsDocsContentGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(PublicationsDocsContentGet$Response,
        () => PublicationsDocsContentGet$Response.fromJsonFactory);

    return _publicationsDocsContentGet(
        page: page, pageSize: pageSize, cacheControl: cacheControl);
  }

  ///
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  @Get(path: '/publications/docs/content/')
  Future<chopper.Response<PublicationsDocsContentGet$Response>>
      _publicationsDocsContentGet({
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  Future<chopper.Response<PublicationsPublicationsGet$Response>>
      publicationsPublicationsGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(PublicationsPublicationsGet$Response,
        () => PublicationsPublicationsGet$Response.fromJsonFactory);

    return _publicationsPublicationsGet(
        page: page, pageSize: pageSize, cacheControl: cacheControl);
  }

  ///
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  @Get(path: '/publications/publications/')
  Future<chopper.Response<PublicationsPublicationsGet$Response>>
      _publicationsPublicationsGet({
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param data
  Future<chopper.Response<Publication>> publicationsPublicationsPost({
    required Publication? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        Publication, () => Publication.fromJsonFactory);

    return _publicationsPublicationsPost(
        data: data, cacheControl: cacheControl);
  }

  ///
  ///@param data
  @Post(path: '/publications/publications/')
  Future<chopper.Response<Publication>> _publicationsPublicationsPost({
    @Body() required Publication? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  Future<chopper.Response<Publication>> publicationsPublicationsIdGet({
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        Publication, () => Publication.fromJsonFactory);

    return _publicationsPublicationsIdGet(id: id, cacheControl: cacheControl);
  }

  ///
  @Get(path: '/publications/publications/{id}/')
  Future<chopper.Response<Publication>> _publicationsPublicationsIdGet({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param data
  Future<chopper.Response<PublicationUpdate>> publicationsPublicationsIdPut({
    required PublicationUpdate? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        PublicationUpdate, () => PublicationUpdate.fromJsonFactory);

    return _publicationsPublicationsIdPut(
        data: data, id: id, cacheControl: cacheControl);
  }

  ///
  ///@param data
  @Put(path: '/publications/publications/{id}/')
  Future<chopper.Response<PublicationUpdate>> _publicationsPublicationsIdPut({
    @Body() required PublicationUpdate? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param data
  Future<chopper.Response<PublicationUpdate>> publicationsPublicationsIdPatch({
    required PublicationUpdate? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        PublicationUpdate, () => PublicationUpdate.fromJsonFactory);

    return _publicationsPublicationsIdPatch(
        data: data, id: id, cacheControl: cacheControl);
  }

  ///
  ///@param data
  @Patch(path: '/publications/publications/{id}/')
  Future<chopper.Response<PublicationUpdate>> _publicationsPublicationsIdPatch({
    @Body() required PublicationUpdate? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  Future<chopper.Response> publicationsPublicationsIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    return _publicationsPublicationsIdDelete(
        id: id, cacheControl: cacheControl);
  }

  ///
  @Delete(path: '/publications/publications/{id}/')
  Future<chopper.Response> _publicationsPublicationsIdDelete({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param data
  Future<chopper.Response<QAUserVote>> publicationsQaUserVotesPost({
    required QAUserVote? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(QAUserVote, () => QAUserVote.fromJsonFactory);

    return _publicationsQaUserVotesPost(data: data, cacheControl: cacheControl);
  }

  ///
  ///@param data
  @Post(path: '/publications/qa_user_votes/')
  Future<chopper.Response<QAUserVote>> _publicationsQaUserVotesPost({
    @Body() required QAUserVote? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  Future<chopper.Response> publicationsQaUserVotesIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    return _publicationsQaUserVotesIdDelete(id: id, cacheControl: cacheControl);
  }

  ///
  @Delete(path: '/publications/qa_user_votes/{id}/')
  Future<chopper.Response> _publicationsQaUserVotesIdDelete({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param data
  Future<chopper.Response<CommentReaction>>
      publicationsReactionsCommentReactionsPost({
    required CommentReaction? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        CommentReaction, () => CommentReaction.fromJsonFactory);

    return _publicationsReactionsCommentReactionsPost(
        data: data, cacheControl: cacheControl);
  }

  ///
  ///@param data
  @Post(path: '/publications/reactions/comment_reactions/')
  Future<chopper.Response<CommentReaction>>
      _publicationsReactionsCommentReactionsPost({
    @Body() required CommentReaction? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  Future<chopper.Response> publicationsReactionsCommentReactionsIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    return _publicationsReactionsCommentReactionsIdDelete(
        id: id, cacheControl: cacheControl);
  }

  ///
  @Delete(path: '/publications/reactions/comment_reactions/{id}/')
  Future<chopper.Response> _publicationsReactionsCommentReactionsIdDelete({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param data
  Future<chopper.Response<PublicationReaction>>
      publicationsReactionsPublicationReactionsPost({
    required PublicationReaction? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        PublicationReaction, () => PublicationReaction.fromJsonFactory);

    return _publicationsReactionsPublicationReactionsPost(
        data: data, cacheControl: cacheControl);
  }

  ///
  ///@param data
  @Post(path: '/publications/reactions/publication_reactions/')
  Future<chopper.Response<PublicationReaction>>
      _publicationsReactionsPublicationReactionsPost({
    @Body() required PublicationReaction? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  Future<chopper.Response> publicationsReactionsPublicationReactionsIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    return _publicationsReactionsPublicationReactionsIdDelete(
        id: id, cacheControl: cacheControl);
  }

  ///
  @Delete(path: '/publications/reactions/publication_reactions/{id}/')
  Future<chopper.Response> _publicationsReactionsPublicationReactionsIdDelete({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///List Search Kindergarten members.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  ///@param query The search query
  Future<chopper.Response<SearchKindergartenMembersGet$Response>>
      searchKindergartenMembersGet({
    int? page,
    int? pageSize,
    required String? query,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(SearchKindergartenMembersGet$Response,
        () => SearchKindergartenMembersGet$Response.fromJsonFactory);

    return _searchKindergartenMembersGet(
        page: page,
        pageSize: pageSize,
        query: query,
        cacheControl: cacheControl);
  }

  ///List Search Kindergarten members.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  ///@param query The search query
  @Get(path: '/search/kindergarten_members/')
  Future<chopper.Response<SearchKindergartenMembersGet$Response>>
      _searchKindergartenMembersGet({
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Query('query') required String? query,
    @Header('Cache-Control') String? cacheControl,
  });

  ///List Child : Child Search Child Search.
  ///@param search A search term.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  Future<chopper.Response<SearchChildGet$Response>> searchChildGet({
    String? search,
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        SearchChildGet$Response, () => SearchChildGet$Response.fromJsonFactory);

    return _searchChildGet(
        search: search,
        page: page,
        pageSize: pageSize,
        cacheControl: cacheControl);
  }

  ///List Child : Child Search Child Search.
  ///@param search A search term.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  @Get(path: '/search_child/')
  Future<chopper.Response<SearchChildGet$Response>> _searchChildGet({
    @Query('search') String? search,
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Header('Cache-Control') String? cacheControl,
  });

  ///List Child : Whole Child Whole Child.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  Future<chopper.Response<WholeChildGet$Response>> wholeChildGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        WholeChildGet$Response, () => WholeChildGet$Response.fromJsonFactory);

    return _wholeChildGet(
        page: page, pageSize: pageSize, cacheControl: cacheControl);
  }

  ///List Child : Whole Child Whole Child.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  @Get(path: '/whole_child/')
  Future<chopper.Response<WholeChildGet$Response>> _wholeChildGet({
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Retrieve Child : History logs History logs.
  Future<chopper.Response> wholeChildHistoryIdGet({
    required int? id,
    String? cacheControl,
  }) {
    return _wholeChildHistoryIdGet(id: id, cacheControl: cacheControl);
  }

  ///Retrieve Child : History logs History logs.
  @Get(path: '/whole_child/history/{id}/')
  Future<chopper.Response> _wholeChildHistoryIdGet({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Retrieve Child : Whole Child Whole Child.
  Future<chopper.Response<WholeChild>> wholeChildIdGet({
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(WholeChild, () => WholeChild.fromJsonFactory);

    return _wholeChildIdGet(id: id, cacheControl: cacheControl);
  }

  ///Retrieve Child : Whole Child Whole Child.
  @Get(path: '/whole_child/{id}/')
  Future<chopper.Response<WholeChild>> _wholeChildIdGet({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });
}

@JsonSerializable(explicitToJson: true)
class ChatMember {
  ChatMember({
    this.id,
    this.user,
    this.removed,
    this.notificationsEnabled,
    this.username,
  });

  factory ChatMember.fromJson(Map<String, dynamic> json) =>
      _$ChatMemberFromJson(json);

  static const toJsonFactory = _$ChatMemberToJson;
  Map<String, dynamic> toJson() => _$ChatMemberToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'user', includeIfNull: false)
  final int? user;
  @JsonKey(name: 'removed', includeIfNull: false)
  final bool? removed;
  @JsonKey(name: 'notifications_enabled', includeIfNull: false)
  final bool? notificationsEnabled;
  @JsonKey(name: 'username', includeIfNull: false, defaultValue: '')
  final String? username;
  static const fromJsonFactory = _$ChatMemberFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChatMember &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.removed, removed) ||
                const DeepCollectionEquality()
                    .equals(other.removed, removed)) &&
            (identical(other.notificationsEnabled, notificationsEnabled) ||
                const DeepCollectionEquality().equals(
                    other.notificationsEnabled, notificationsEnabled)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(removed) ^
      const DeepCollectionEquality().hash(notificationsEnabled) ^
      const DeepCollectionEquality().hash(username) ^
      runtimeType.hashCode;
}

extension $ChatMemberExtension on ChatMember {
  ChatMember copyWith(
      {int? id,
      int? user,
      bool? removed,
      bool? notificationsEnabled,
      String? username}) {
    return ChatMember(
        id: id ?? this.id,
        user: user ?? this.user,
        removed: removed ?? this.removed,
        notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
        username: username ?? this.username);
  }

  ChatMember copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<int?>? user,
      Wrapped<bool?>? removed,
      Wrapped<bool?>? notificationsEnabled,
      Wrapped<String?>? username}) {
    return ChatMember(
        id: (id != null ? id.value : this.id),
        user: (user != null ? user.value : this.user),
        removed: (removed != null ? removed.value : this.removed),
        notificationsEnabled: (notificationsEnabled != null
            ? notificationsEnabled.value
            : this.notificationsEnabled),
        username: (username != null ? username.value : this.username));
  }
}

@JsonSerializable(explicitToJson: true)
class ChatMessage {
  ChatMessage({
    this.id,
    this.member,
    this.content,
    this.createdAt,
    this.group,
    this.seenBy,
    this.files,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);

  static const toJsonFactory = _$ChatMessageToJson;
  Map<String, dynamic> toJson() => _$ChatMessageToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'member', includeIfNull: false)
  final int? member;
  @JsonKey(name: 'content', includeIfNull: false, defaultValue: '')
  final String? content;
  @JsonKey(name: 'created_at', includeIfNull: false)
  final DateTime? createdAt;
  @JsonKey(name: 'group', includeIfNull: false)
  final int? group;
  @JsonKey(name: 'seen_by', includeIfNull: false, defaultValue: <int>[])
  final List<int>? seenBy;
  @JsonKey(name: 'files', includeIfNull: false, defaultValue: <int>[])
  final List<int>? files;
  static const fromJsonFactory = _$ChatMessageFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChatMessage &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.member, member) ||
                const DeepCollectionEquality().equals(other.member, member)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.group, group) ||
                const DeepCollectionEquality().equals(other.group, group)) &&
            (identical(other.seenBy, seenBy) ||
                const DeepCollectionEquality().equals(other.seenBy, seenBy)) &&
            (identical(other.files, files) ||
                const DeepCollectionEquality().equals(other.files, files)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(member) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(group) ^
      const DeepCollectionEquality().hash(seenBy) ^
      const DeepCollectionEquality().hash(files) ^
      runtimeType.hashCode;
}

extension $ChatMessageExtension on ChatMessage {
  ChatMessage copyWith(
      {int? id,
      int? member,
      String? content,
      DateTime? createdAt,
      int? group,
      List<int>? seenBy,
      List<int>? files}) {
    return ChatMessage(
        id: id ?? this.id,
        member: member ?? this.member,
        content: content ?? this.content,
        createdAt: createdAt ?? this.createdAt,
        group: group ?? this.group,
        seenBy: seenBy ?? this.seenBy,
        files: files ?? this.files);
  }

  ChatMessage copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<int?>? member,
      Wrapped<String?>? content,
      Wrapped<DateTime?>? createdAt,
      Wrapped<int?>? group,
      Wrapped<List<int>?>? seenBy,
      Wrapped<List<int>?>? files}) {
    return ChatMessage(
        id: (id != null ? id.value : this.id),
        member: (member != null ? member.value : this.member),
        content: (content != null ? content.value : this.content),
        createdAt: (createdAt != null ? createdAt.value : this.createdAt),
        group: (group != null ? group.value : this.group),
        seenBy: (seenBy != null ? seenBy.value : this.seenBy),
        files: (files != null ? files.value : this.files));
  }
}

@JsonSerializable(explicitToJson: true)
class ChatGroup {
  ChatGroup({
    this.id,
    this.members,
    this.name,
    this.displayName,
    this.createdAt,
    this.lastMessage,
    this.avatar,
  });

  factory ChatGroup.fromJson(Map<String, dynamic> json) =>
      _$ChatGroupFromJson(json);

  static const toJsonFactory = _$ChatGroupToJson;
  Map<String, dynamic> toJson() => _$ChatGroupToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'members', includeIfNull: false, defaultValue: <ChatMember>[])
  final List<ChatMember>? members;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  @JsonKey(name: 'display_name', includeIfNull: false, defaultValue: '')
  final String? displayName;
  @JsonKey(name: 'created_at', includeIfNull: false)
  final DateTime? createdAt;
  @JsonKey(name: 'last_message', includeIfNull: false)
  final ChatMessage? lastMessage;
  @JsonKey(name: 'avatar', includeIfNull: false, defaultValue: '')
  final String? avatar;
  static const fromJsonFactory = _$ChatGroupFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChatGroup &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.members, members) ||
                const DeepCollectionEquality()
                    .equals(other.members, members)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.displayName, displayName) ||
                const DeepCollectionEquality()
                    .equals(other.displayName, displayName)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.lastMessage, lastMessage) ||
                const DeepCollectionEquality()
                    .equals(other.lastMessage, lastMessage)) &&
            (identical(other.avatar, avatar) ||
                const DeepCollectionEquality().equals(other.avatar, avatar)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(members) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(displayName) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(lastMessage) ^
      const DeepCollectionEquality().hash(avatar) ^
      runtimeType.hashCode;
}

extension $ChatGroupExtension on ChatGroup {
  ChatGroup copyWith(
      {int? id,
      List<ChatMember>? members,
      String? name,
      String? displayName,
      DateTime? createdAt,
      ChatMessage? lastMessage,
      String? avatar}) {
    return ChatGroup(
        id: id ?? this.id,
        members: members ?? this.members,
        name: name ?? this.name,
        displayName: displayName ?? this.displayName,
        createdAt: createdAt ?? this.createdAt,
        lastMessage: lastMessage ?? this.lastMessage,
        avatar: avatar ?? this.avatar);
  }

  ChatGroup copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<List<ChatMember>?>? members,
      Wrapped<String?>? name,
      Wrapped<String?>? displayName,
      Wrapped<DateTime?>? createdAt,
      Wrapped<ChatMessage?>? lastMessage,
      Wrapped<String?>? avatar}) {
    return ChatGroup(
        id: (id != null ? id.value : this.id),
        members: (members != null ? members.value : this.members),
        name: (name != null ? name.value : this.name),
        displayName:
            (displayName != null ? displayName.value : this.displayName),
        createdAt: (createdAt != null ? createdAt.value : this.createdAt),
        lastMessage:
            (lastMessage != null ? lastMessage.value : this.lastMessage),
        avatar: (avatar != null ? avatar.value : this.avatar));
  }
}

@JsonSerializable(explicitToJson: true)
class ChatMemberCreate {
  ChatMemberCreate({
    this.id,
    this.user,
    this.removed,
    this.notificationsEnabled,
    this.username,
  });

  factory ChatMemberCreate.fromJson(Map<String, dynamic> json) =>
      _$ChatMemberCreateFromJson(json);

  static const toJsonFactory = _$ChatMemberCreateToJson;
  Map<String, dynamic> toJson() => _$ChatMemberCreateToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'user', includeIfNull: false)
  final int? user;
  @JsonKey(name: 'removed', includeIfNull: false)
  final bool? removed;
  @JsonKey(name: 'notifications_enabled', includeIfNull: false)
  final bool? notificationsEnabled;
  @JsonKey(name: 'username', includeIfNull: false, defaultValue: '')
  final String? username;
  static const fromJsonFactory = _$ChatMemberCreateFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChatMemberCreate &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.removed, removed) ||
                const DeepCollectionEquality()
                    .equals(other.removed, removed)) &&
            (identical(other.notificationsEnabled, notificationsEnabled) ||
                const DeepCollectionEquality().equals(
                    other.notificationsEnabled, notificationsEnabled)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(removed) ^
      const DeepCollectionEquality().hash(notificationsEnabled) ^
      const DeepCollectionEquality().hash(username) ^
      runtimeType.hashCode;
}

extension $ChatMemberCreateExtension on ChatMemberCreate {
  ChatMemberCreate copyWith(
      {int? id,
      int? user,
      bool? removed,
      bool? notificationsEnabled,
      String? username}) {
    return ChatMemberCreate(
        id: id ?? this.id,
        user: user ?? this.user,
        removed: removed ?? this.removed,
        notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
        username: username ?? this.username);
  }

  ChatMemberCreate copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<int?>? user,
      Wrapped<bool?>? removed,
      Wrapped<bool?>? notificationsEnabled,
      Wrapped<String?>? username}) {
    return ChatMemberCreate(
        id: (id != null ? id.value : this.id),
        user: (user != null ? user.value : this.user),
        removed: (removed != null ? removed.value : this.removed),
        notificationsEnabled: (notificationsEnabled != null
            ? notificationsEnabled.value
            : this.notificationsEnabled),
        username: (username != null ? username.value : this.username));
  }
}

@JsonSerializable(explicitToJson: true)
class ChatGroupCreate {
  ChatGroupCreate({
    this.id,
    this.members,
    this.name,
    this.displayName,
    this.createdAt,
    this.avatar,
  });

  factory ChatGroupCreate.fromJson(Map<String, dynamic> json) =>
      _$ChatGroupCreateFromJson(json);

  static const toJsonFactory = _$ChatGroupCreateToJson;
  Map<String, dynamic> toJson() => _$ChatGroupCreateToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(
      name: 'members', includeIfNull: false, defaultValue: <ChatMemberCreate>[])
  final List<ChatMemberCreate>? members;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  @JsonKey(name: 'display_name', includeIfNull: false, defaultValue: '')
  final String? displayName;
  @JsonKey(name: 'created_at', includeIfNull: false)
  final DateTime? createdAt;
  @JsonKey(name: 'avatar', includeIfNull: false, defaultValue: '')
  final String? avatar;
  static const fromJsonFactory = _$ChatGroupCreateFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChatGroupCreate &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.members, members) ||
                const DeepCollectionEquality()
                    .equals(other.members, members)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.displayName, displayName) ||
                const DeepCollectionEquality()
                    .equals(other.displayName, displayName)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.avatar, avatar) ||
                const DeepCollectionEquality().equals(other.avatar, avatar)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(members) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(displayName) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(avatar) ^
      runtimeType.hashCode;
}

extension $ChatGroupCreateExtension on ChatGroupCreate {
  ChatGroupCreate copyWith(
      {int? id,
      List<ChatMemberCreate>? members,
      String? name,
      String? displayName,
      DateTime? createdAt,
      String? avatar}) {
    return ChatGroupCreate(
        id: id ?? this.id,
        members: members ?? this.members,
        name: name ?? this.name,
        displayName: displayName ?? this.displayName,
        createdAt: createdAt ?? this.createdAt,
        avatar: avatar ?? this.avatar);
  }

  ChatGroupCreate copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<List<ChatMemberCreate>?>? members,
      Wrapped<String?>? name,
      Wrapped<String?>? displayName,
      Wrapped<DateTime?>? createdAt,
      Wrapped<String?>? avatar}) {
    return ChatGroupCreate(
        id: (id != null ? id.value : this.id),
        members: (members != null ? members.value : this.members),
        name: (name != null ? name.value : this.name),
        displayName:
            (displayName != null ? displayName.value : this.displayName),
        createdAt: (createdAt != null ? createdAt.value : this.createdAt),
        avatar: (avatar != null ? avatar.value : this.avatar));
  }
}

@JsonSerializable(explicitToJson: true)
class CurrentChatMember {
  CurrentChatMember({
    this.id,
    this.notificationsEnabled,
    this.removed,
  });

  factory CurrentChatMember.fromJson(Map<String, dynamic> json) =>
      _$CurrentChatMemberFromJson(json);

  static const toJsonFactory = _$CurrentChatMemberToJson;
  Map<String, dynamic> toJson() => _$CurrentChatMemberToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'notifications_enabled', includeIfNull: false)
  final bool? notificationsEnabled;
  @JsonKey(name: 'removed', includeIfNull: false)
  final bool? removed;
  static const fromJsonFactory = _$CurrentChatMemberFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CurrentChatMember &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.notificationsEnabled, notificationsEnabled) ||
                const DeepCollectionEquality().equals(
                    other.notificationsEnabled, notificationsEnabled)) &&
            (identical(other.removed, removed) ||
                const DeepCollectionEquality().equals(other.removed, removed)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(notificationsEnabled) ^
      const DeepCollectionEquality().hash(removed) ^
      runtimeType.hashCode;
}

extension $CurrentChatMemberExtension on CurrentChatMember {
  CurrentChatMember copyWith(
      {int? id, bool? notificationsEnabled, bool? removed}) {
    return CurrentChatMember(
        id: id ?? this.id,
        notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
        removed: removed ?? this.removed);
  }

  CurrentChatMember copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<bool?>? notificationsEnabled,
      Wrapped<bool?>? removed}) {
    return CurrentChatMember(
        id: (id != null ? id.value : this.id),
        notificationsEnabled: (notificationsEnabled != null
            ? notificationsEnabled.value
            : this.notificationsEnabled),
        removed: (removed != null ? removed.value : this.removed));
  }
}

@JsonSerializable(explicitToJson: true)
class ChatMessageFile {
  ChatMessageFile({
    this.id,
    this.file,
    this.message,
  });

  factory ChatMessageFile.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFileFromJson(json);

  static const toJsonFactory = _$ChatMessageFileToJson;
  Map<String, dynamic> toJson() => _$ChatMessageFileToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'file', includeIfNull: false, defaultValue: '')
  final String? file;
  @JsonKey(name: 'message', includeIfNull: false)
  final int? message;
  static const fromJsonFactory = _$ChatMessageFileFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChatMessageFile &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.file, file) ||
                const DeepCollectionEquality().equals(other.file, file)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(file) ^
      const DeepCollectionEquality().hash(message) ^
      runtimeType.hashCode;
}

extension $ChatMessageFileExtension on ChatMessageFile {
  ChatMessageFile copyWith({int? id, String? file, int? message}) {
    return ChatMessageFile(
        id: id ?? this.id,
        file: file ?? this.file,
        message: message ?? this.message);
  }

  ChatMessageFile copyWithWrapped(
      {Wrapped<int?>? id, Wrapped<String?>? file, Wrapped<int?>? message}) {
    return ChatMessageFile(
        id: (id != null ? id.value : this.id),
        file: (file != null ? file.value : this.file),
        message: (message != null ? message.value : this.message));
  }
}

@JsonSerializable(explicitToJson: true)
class SharedLink {
  SharedLink({
    this.id,
    this.links,
  });

  factory SharedLink.fromJson(Map<String, dynamic> json) =>
      _$SharedLinkFromJson(json);

  static const toJsonFactory = _$SharedLinkToJson;
  Map<String, dynamic> toJson() => _$SharedLinkToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'links', includeIfNull: false, defaultValue: '')
  final String? links;
  static const fromJsonFactory = _$SharedLinkFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SharedLink &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.links, links) ||
                const DeepCollectionEquality().equals(other.links, links)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(links) ^
      runtimeType.hashCode;
}

extension $SharedLinkExtension on SharedLink {
  SharedLink copyWith({int? id, String? links}) {
    return SharedLink(id: id ?? this.id, links: links ?? this.links);
  }

  SharedLink copyWithWrapped({Wrapped<int?>? id, Wrapped<String?>? links}) {
    return SharedLink(
        id: (id != null ? id.value : this.id),
        links: (links != null ? links.value : this.links));
  }
}

@JsonSerializable(explicitToJson: true)
class Activity {
  Activity({
    this.id,
    this.name,
    this.description,
    this.avatar,
  });

  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);

  static const toJsonFactory = _$ActivityToJson;
  Map<String, dynamic> toJson() => _$ActivityToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  @JsonKey(name: 'description', includeIfNull: false, defaultValue: '')
  final String? description;
  @JsonKey(name: 'avatar', includeIfNull: false, defaultValue: '')
  final String? avatar;
  static const fromJsonFactory = _$ActivityFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Activity &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.avatar, avatar) ||
                const DeepCollectionEquality().equals(other.avatar, avatar)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(avatar) ^
      runtimeType.hashCode;
}

extension $ActivityExtension on Activity {
  Activity copyWith(
      {int? id, String? name, String? description, String? avatar}) {
    return Activity(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        avatar: avatar ?? this.avatar);
  }

  Activity copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String?>? name,
      Wrapped<String?>? description,
      Wrapped<String?>? avatar}) {
    return Activity(
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name),
        description:
            (description != null ? description.value : this.description),
        avatar: (avatar != null ? avatar.value : this.avatar));
  }
}

@JsonSerializable(explicitToJson: true)
class DaySummary {
  DaySummary({
    this.id,
    this.activities,
    this.humor,
    this.humorNote,
    this.hunger,
    this.hungerNote,
    this.activityParticipation,
    this.activityParticipationNote,
    this.nap,
    this.napNote,
    this.interactions,
    this.interactionsNote,
    this.outsidePlaytime,
    this.outsidePlaytimeNote,
    this.pooping,
    this.poopingNote,
    this.date,
    this.note,
    this.child,
  });

  factory DaySummary.fromJson(Map<String, dynamic> json) =>
      _$DaySummaryFromJson(json);

  static const toJsonFactory = _$DaySummaryToJson;
  Map<String, dynamic> toJson() => _$DaySummaryToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'activities', includeIfNull: false, defaultValue: <Activity>[])
  final List<Activity>? activities;
  @JsonKey(
    name: 'humor',
    includeIfNull: false,
    toJson: daySummaryHumorToJson,
    fromJson: daySummaryHumorFromJson,
  )
  final enums.DaySummaryHumor? humor;
  @JsonKey(name: 'humor_note', includeIfNull: false, defaultValue: '')
  final String? humorNote;
  @JsonKey(
    name: 'hunger',
    includeIfNull: false,
    toJson: daySummaryHungerToJson,
    fromJson: daySummaryHungerFromJson,
  )
  final enums.DaySummaryHunger? hunger;
  @JsonKey(name: 'hunger_note', includeIfNull: false, defaultValue: '')
  final String? hungerNote;
  @JsonKey(
    name: 'activity_participation',
    includeIfNull: false,
    toJson: daySummaryActivityParticipationToJson,
    fromJson: daySummaryActivityParticipationFromJson,
  )
  final enums.DaySummaryActivityParticipation? activityParticipation;
  @JsonKey(
      name: 'activity_participation_note',
      includeIfNull: false,
      defaultValue: '')
  final String? activityParticipationNote;
  @JsonKey(
    name: 'nap',
    includeIfNull: false,
    toJson: daySummaryNapToJson,
    fromJson: daySummaryNapFromJson,
  )
  final enums.DaySummaryNap? nap;
  @JsonKey(name: 'nap_note', includeIfNull: false, defaultValue: '')
  final String? napNote;
  @JsonKey(
    name: 'interactions',
    includeIfNull: false,
    toJson: daySummaryInteractionsToJson,
    fromJson: daySummaryInteractionsFromJson,
  )
  final enums.DaySummaryInteractions? interactions;
  @JsonKey(name: 'interactions_note', includeIfNull: false, defaultValue: '')
  final String? interactionsNote;
  @JsonKey(
    name: 'outside_playtime',
    includeIfNull: false,
    toJson: daySummaryOutsidePlaytimeToJson,
    fromJson: daySummaryOutsidePlaytimeFromJson,
  )
  final enums.DaySummaryOutsidePlaytime? outsidePlaytime;
  @JsonKey(
      name: 'outside_playtime_note', includeIfNull: false, defaultValue: '')
  final String? outsidePlaytimeNote;
  @JsonKey(
    name: 'pooping',
    includeIfNull: false,
    toJson: daySummaryPoopingToJson,
    fromJson: daySummaryPoopingFromJson,
  )
  final enums.DaySummaryPooping? pooping;
  @JsonKey(name: 'pooping_note', includeIfNull: false, defaultValue: '')
  final String? poopingNote;
  @JsonKey(name: 'date', includeIfNull: false)
  final DateTime? date;
  @JsonKey(name: 'note', includeIfNull: false, defaultValue: '')
  final String? note;
  @JsonKey(name: 'child', includeIfNull: false)
  final int? child;
  static const fromJsonFactory = _$DaySummaryFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DaySummary &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.activities, activities) ||
                const DeepCollectionEquality()
                    .equals(other.activities, activities)) &&
            (identical(other.humor, humor) ||
                const DeepCollectionEquality().equals(other.humor, humor)) &&
            (identical(other.humorNote, humorNote) ||
                const DeepCollectionEquality()
                    .equals(other.humorNote, humorNote)) &&
            (identical(other.hunger, hunger) ||
                const DeepCollectionEquality().equals(other.hunger, hunger)) &&
            (identical(other.hungerNote, hungerNote) ||
                const DeepCollectionEquality()
                    .equals(other.hungerNote, hungerNote)) &&
            (identical(other.activityParticipation, activityParticipation) ||
                const DeepCollectionEquality().equals(
                    other.activityParticipation, activityParticipation)) &&
            (identical(other.activityParticipationNote,
                    activityParticipationNote) ||
                const DeepCollectionEquality().equals(
                    other.activityParticipationNote,
                    activityParticipationNote)) &&
            (identical(other.nap, nap) ||
                const DeepCollectionEquality().equals(other.nap, nap)) &&
            (identical(other.napNote, napNote) ||
                const DeepCollectionEquality()
                    .equals(other.napNote, napNote)) &&
            (identical(other.interactions, interactions) ||
                const DeepCollectionEquality()
                    .equals(other.interactions, interactions)) &&
            (identical(other.interactionsNote, interactionsNote) ||
                const DeepCollectionEquality()
                    .equals(other.interactionsNote, interactionsNote)) &&
            (identical(other.outsidePlaytime, outsidePlaytime) ||
                const DeepCollectionEquality()
                    .equals(other.outsidePlaytime, outsidePlaytime)) &&
            (identical(other.outsidePlaytimeNote, outsidePlaytimeNote) ||
                const DeepCollectionEquality()
                    .equals(other.outsidePlaytimeNote, outsidePlaytimeNote)) &&
            (identical(other.pooping, pooping) ||
                const DeepCollectionEquality()
                    .equals(other.pooping, pooping)) &&
            (identical(other.poopingNote, poopingNote) ||
                const DeepCollectionEquality()
                    .equals(other.poopingNote, poopingNote)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.note, note) ||
                const DeepCollectionEquality().equals(other.note, note)) &&
            (identical(other.child, child) ||
                const DeepCollectionEquality().equals(other.child, child)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(activities) ^
      const DeepCollectionEquality().hash(humor) ^
      const DeepCollectionEquality().hash(humorNote) ^
      const DeepCollectionEquality().hash(hunger) ^
      const DeepCollectionEquality().hash(hungerNote) ^
      const DeepCollectionEquality().hash(activityParticipation) ^
      const DeepCollectionEquality().hash(activityParticipationNote) ^
      const DeepCollectionEquality().hash(nap) ^
      const DeepCollectionEquality().hash(napNote) ^
      const DeepCollectionEquality().hash(interactions) ^
      const DeepCollectionEquality().hash(interactionsNote) ^
      const DeepCollectionEquality().hash(outsidePlaytime) ^
      const DeepCollectionEquality().hash(outsidePlaytimeNote) ^
      const DeepCollectionEquality().hash(pooping) ^
      const DeepCollectionEquality().hash(poopingNote) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(note) ^
      const DeepCollectionEquality().hash(child) ^
      runtimeType.hashCode;
}

extension $DaySummaryExtension on DaySummary {
  DaySummary copyWith(
      {int? id,
      List<Activity>? activities,
      enums.DaySummaryHumor? humor,
      String? humorNote,
      enums.DaySummaryHunger? hunger,
      String? hungerNote,
      enums.DaySummaryActivityParticipation? activityParticipation,
      String? activityParticipationNote,
      enums.DaySummaryNap? nap,
      String? napNote,
      enums.DaySummaryInteractions? interactions,
      String? interactionsNote,
      enums.DaySummaryOutsidePlaytime? outsidePlaytime,
      String? outsidePlaytimeNote,
      enums.DaySummaryPooping? pooping,
      String? poopingNote,
      DateTime? date,
      String? note,
      int? child}) {
    return DaySummary(
        id: id ?? this.id,
        activities: activities ?? this.activities,
        humor: humor ?? this.humor,
        humorNote: humorNote ?? this.humorNote,
        hunger: hunger ?? this.hunger,
        hungerNote: hungerNote ?? this.hungerNote,
        activityParticipation:
            activityParticipation ?? this.activityParticipation,
        activityParticipationNote:
            activityParticipationNote ?? this.activityParticipationNote,
        nap: nap ?? this.nap,
        napNote: napNote ?? this.napNote,
        interactions: interactions ?? this.interactions,
        interactionsNote: interactionsNote ?? this.interactionsNote,
        outsidePlaytime: outsidePlaytime ?? this.outsidePlaytime,
        outsidePlaytimeNote: outsidePlaytimeNote ?? this.outsidePlaytimeNote,
        pooping: pooping ?? this.pooping,
        poopingNote: poopingNote ?? this.poopingNote,
        date: date ?? this.date,
        note: note ?? this.note,
        child: child ?? this.child);
  }

  DaySummary copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<List<Activity>?>? activities,
      Wrapped<enums.DaySummaryHumor?>? humor,
      Wrapped<String?>? humorNote,
      Wrapped<enums.DaySummaryHunger?>? hunger,
      Wrapped<String?>? hungerNote,
      Wrapped<enums.DaySummaryActivityParticipation?>? activityParticipation,
      Wrapped<String?>? activityParticipationNote,
      Wrapped<enums.DaySummaryNap?>? nap,
      Wrapped<String?>? napNote,
      Wrapped<enums.DaySummaryInteractions?>? interactions,
      Wrapped<String?>? interactionsNote,
      Wrapped<enums.DaySummaryOutsidePlaytime?>? outsidePlaytime,
      Wrapped<String?>? outsidePlaytimeNote,
      Wrapped<enums.DaySummaryPooping?>? pooping,
      Wrapped<String?>? poopingNote,
      Wrapped<DateTime?>? date,
      Wrapped<String?>? note,
      Wrapped<int?>? child}) {
    return DaySummary(
        id: (id != null ? id.value : this.id),
        activities: (activities != null ? activities.value : this.activities),
        humor: (humor != null ? humor.value : this.humor),
        humorNote: (humorNote != null ? humorNote.value : this.humorNote),
        hunger: (hunger != null ? hunger.value : this.hunger),
        hungerNote: (hungerNote != null ? hungerNote.value : this.hungerNote),
        activityParticipation: (activityParticipation != null
            ? activityParticipation.value
            : this.activityParticipation),
        activityParticipationNote: (activityParticipationNote != null
            ? activityParticipationNote.value
            : this.activityParticipationNote),
        nap: (nap != null ? nap.value : this.nap),
        napNote: (napNote != null ? napNote.value : this.napNote),
        interactions:
            (interactions != null ? interactions.value : this.interactions),
        interactionsNote: (interactionsNote != null
            ? interactionsNote.value
            : this.interactionsNote),
        outsidePlaytime: (outsidePlaytime != null
            ? outsidePlaytime.value
            : this.outsidePlaytime),
        outsidePlaytimeNote: (outsidePlaytimeNote != null
            ? outsidePlaytimeNote.value
            : this.outsidePlaytimeNote),
        pooping: (pooping != null ? pooping.value : this.pooping),
        poopingNote:
            (poopingNote != null ? poopingNote.value : this.poopingNote),
        date: (date != null ? date.value : this.date),
        note: (note != null ? note.value : this.note),
        child: (child != null ? child.value : this.child));
  }
}

@JsonSerializable(explicitToJson: true)
class EducatorProfile {
  EducatorProfile({
    this.avatar,
    this.firstName,
    this.lastName,
  });

  factory EducatorProfile.fromJson(Map<String, dynamic> json) =>
      _$EducatorProfileFromJson(json);

  static const toJsonFactory = _$EducatorProfileToJson;
  Map<String, dynamic> toJson() => _$EducatorProfileToJson(this);

  @JsonKey(name: 'avatar', includeIfNull: false, defaultValue: '')
  final String? avatar;
  @JsonKey(name: 'first_name', includeIfNull: false, defaultValue: '')
  final String? firstName;
  @JsonKey(name: 'last_name', includeIfNull: false, defaultValue: '')
  final String? lastName;
  static const fromJsonFactory = _$EducatorProfileFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EducatorProfile &&
            (identical(other.avatar, avatar) ||
                const DeepCollectionEquality().equals(other.avatar, avatar)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(avatar) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      runtimeType.hashCode;
}

extension $EducatorProfileExtension on EducatorProfile {
  EducatorProfile copyWith(
      {String? avatar, String? firstName, String? lastName}) {
    return EducatorProfile(
        avatar: avatar ?? this.avatar,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName);
  }

  EducatorProfile copyWithWrapped(
      {Wrapped<String?>? avatar,
      Wrapped<String?>? firstName,
      Wrapped<String?>? lastName}) {
    return EducatorProfile(
        avatar: (avatar != null ? avatar.value : this.avatar),
        firstName: (firstName != null ? firstName.value : this.firstName),
        lastName: (lastName != null ? lastName.value : this.lastName));
  }
}

@JsonSerializable(explicitToJson: true)
class EducatorAvailability {
  EducatorAvailability({
    this.id,
    this.educatorId,
    this.educatorInfos,
    this.date,
    this.startTime,
    this.endTime,
  });

  factory EducatorAvailability.fromJson(Map<String, dynamic> json) =>
      _$EducatorAvailabilityFromJson(json);

  static const toJsonFactory = _$EducatorAvailabilityToJson;
  Map<String, dynamic> toJson() => _$EducatorAvailabilityToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'educator_id', includeIfNull: false, defaultValue: '')
  final String? educatorId;
  @JsonKey(name: 'educator_infos', includeIfNull: false)
  final EducatorProfile? educatorInfos;
  @JsonKey(name: 'date', includeIfNull: false, toJson: _dateToJson)
  final DateTime? date;
  @JsonKey(name: 'start_time', includeIfNull: false, defaultValue: '')
  final String? startTime;
  @JsonKey(name: 'end_time', includeIfNull: false, defaultValue: '')
  final String? endTime;
  static const fromJsonFactory = _$EducatorAvailabilityFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EducatorAvailability &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.educatorId, educatorId) ||
                const DeepCollectionEquality()
                    .equals(other.educatorId, educatorId)) &&
            (identical(other.educatorInfos, educatorInfos) ||
                const DeepCollectionEquality()
                    .equals(other.educatorInfos, educatorInfos)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.startTime, startTime) ||
                const DeepCollectionEquality()
                    .equals(other.startTime, startTime)) &&
            (identical(other.endTime, endTime) ||
                const DeepCollectionEquality().equals(other.endTime, endTime)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(educatorId) ^
      const DeepCollectionEquality().hash(educatorInfos) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(startTime) ^
      const DeepCollectionEquality().hash(endTime) ^
      runtimeType.hashCode;
}

extension $EducatorAvailabilityExtension on EducatorAvailability {
  EducatorAvailability copyWith(
      {int? id,
      String? educatorId,
      EducatorProfile? educatorInfos,
      DateTime? date,
      String? startTime,
      String? endTime}) {
    return EducatorAvailability(
        id: id ?? this.id,
        educatorId: educatorId ?? this.educatorId,
        educatorInfos: educatorInfos ?? this.educatorInfos,
        date: date ?? this.date,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime);
  }

  EducatorAvailability copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String?>? educatorId,
      Wrapped<EducatorProfile?>? educatorInfos,
      Wrapped<DateTime?>? date,
      Wrapped<String?>? startTime,
      Wrapped<String?>? endTime}) {
    return EducatorAvailability(
        id: (id != null ? id.value : this.id),
        educatorId: (educatorId != null ? educatorId.value : this.educatorId),
        educatorInfos:
            (educatorInfos != null ? educatorInfos.value : this.educatorInfos),
        date: (date != null ? date.value : this.date),
        startTime: (startTime != null ? startTime.value : this.startTime),
        endTime: (endTime != null ? endTime.value : this.endTime));
  }
}

@JsonSerializable(explicitToJson: true)
class EducatorSchedule {
  EducatorSchedule({
    this.id,
    this.educatorId,
    this.educatorInfos,
    this.date,
    this.startTime,
    this.endTime,
  });

  factory EducatorSchedule.fromJson(Map<String, dynamic> json) =>
      _$EducatorScheduleFromJson(json);

  static const toJsonFactory = _$EducatorScheduleToJson;
  Map<String, dynamic> toJson() => _$EducatorScheduleToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'educator_id', includeIfNull: false, defaultValue: '')
  final String? educatorId;
  @JsonKey(name: 'educator_infos', includeIfNull: false)
  final EducatorProfile? educatorInfos;
  @JsonKey(name: 'date', includeIfNull: false, toJson: _dateToJson)
  final DateTime? date;
  @JsonKey(name: 'start_time', includeIfNull: false, defaultValue: '')
  final String? startTime;
  @JsonKey(name: 'end_time', includeIfNull: false, defaultValue: '')
  final String? endTime;
  static const fromJsonFactory = _$EducatorScheduleFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EducatorSchedule &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.educatorId, educatorId) ||
                const DeepCollectionEquality()
                    .equals(other.educatorId, educatorId)) &&
            (identical(other.educatorInfos, educatorInfos) ||
                const DeepCollectionEquality()
                    .equals(other.educatorInfos, educatorInfos)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.startTime, startTime) ||
                const DeepCollectionEquality()
                    .equals(other.startTime, startTime)) &&
            (identical(other.endTime, endTime) ||
                const DeepCollectionEquality().equals(other.endTime, endTime)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(educatorId) ^
      const DeepCollectionEquality().hash(educatorInfos) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(startTime) ^
      const DeepCollectionEquality().hash(endTime) ^
      runtimeType.hashCode;
}

extension $EducatorScheduleExtension on EducatorSchedule {
  EducatorSchedule copyWith(
      {int? id,
      String? educatorId,
      EducatorProfile? educatorInfos,
      DateTime? date,
      String? startTime,
      String? endTime}) {
    return EducatorSchedule(
        id: id ?? this.id,
        educatorId: educatorId ?? this.educatorId,
        educatorInfos: educatorInfos ?? this.educatorInfos,
        date: date ?? this.date,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime);
  }

  EducatorSchedule copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String?>? educatorId,
      Wrapped<EducatorProfile?>? educatorInfos,
      Wrapped<DateTime?>? date,
      Wrapped<String?>? startTime,
      Wrapped<String?>? endTime}) {
    return EducatorSchedule(
        id: (id != null ? id.value : this.id),
        educatorId: (educatorId != null ? educatorId.value : this.educatorId),
        educatorInfos:
            (educatorInfos != null ? educatorInfos.value : this.educatorInfos),
        date: (date != null ? date.value : this.date),
        startTime: (startTime != null ? startTime.value : this.startTime),
        endTime: (endTime != null ? endTime.value : this.endTime));
  }
}

@JsonSerializable(explicitToJson: true)
class EducatorBreakSettings {
  EducatorBreakSettings({
    this.id,
    this.name,
    this.startTime,
    this.endTime,
    this.generalSettings,
  });

  factory EducatorBreakSettings.fromJson(Map<String, dynamic> json) =>
      _$EducatorBreakSettingsFromJson(json);

  static const toJsonFactory = _$EducatorBreakSettingsToJson;
  Map<String, dynamic> toJson() => _$EducatorBreakSettingsToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  @JsonKey(name: 'start_time', includeIfNull: false, defaultValue: '')
  final String? startTime;
  @JsonKey(name: 'end_time', includeIfNull: false, defaultValue: '')
  final String? endTime;
  @JsonKey(name: 'general_settings', includeIfNull: false)
  final int? generalSettings;
  static const fromJsonFactory = _$EducatorBreakSettingsFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EducatorBreakSettings &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.startTime, startTime) ||
                const DeepCollectionEquality()
                    .equals(other.startTime, startTime)) &&
            (identical(other.endTime, endTime) ||
                const DeepCollectionEquality()
                    .equals(other.endTime, endTime)) &&
            (identical(other.generalSettings, generalSettings) ||
                const DeepCollectionEquality()
                    .equals(other.generalSettings, generalSettings)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(startTime) ^
      const DeepCollectionEquality().hash(endTime) ^
      const DeepCollectionEquality().hash(generalSettings) ^
      runtimeType.hashCode;
}

extension $EducatorBreakSettingsExtension on EducatorBreakSettings {
  EducatorBreakSettings copyWith(
      {int? id,
      String? name,
      String? startTime,
      String? endTime,
      int? generalSettings}) {
    return EducatorBreakSettings(
        id: id ?? this.id,
        name: name ?? this.name,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        generalSettings: generalSettings ?? this.generalSettings);
  }

  EducatorBreakSettings copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String?>? name,
      Wrapped<String?>? startTime,
      Wrapped<String?>? endTime,
      Wrapped<int?>? generalSettings}) {
    return EducatorBreakSettings(
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name),
        startTime: (startTime != null ? startTime.value : this.startTime),
        endTime: (endTime != null ? endTime.value : this.endTime),
        generalSettings: (generalSettings != null
            ? generalSettings.value
            : this.generalSettings));
  }
}

@JsonSerializable(explicitToJson: true)
class GeneralEducatorTimeSheetSettings {
  GeneralEducatorTimeSheetSettings({
    this.id,
    this.breaks,
    this.workingHoursStart,
    this.workingHoursEnd,
    this.workingDayMonday,
    this.workingDayTuesday,
    this.workingDayWednesday,
    this.workingDayThursday,
    this.workingDayFriday,
    this.workingDaySaturday,
    this.workingDaySunday,
    this.maximumHoursAwarded,
    this.minShiftLength,
    this.maxShiftLength,
  });

  factory GeneralEducatorTimeSheetSettings.fromJson(
          Map<String, dynamic> json) =>
      _$GeneralEducatorTimeSheetSettingsFromJson(json);

  static const toJsonFactory = _$GeneralEducatorTimeSheetSettingsToJson;
  Map<String, dynamic> toJson() =>
      _$GeneralEducatorTimeSheetSettingsToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(
      name: 'breaks',
      includeIfNull: false,
      defaultValue: <EducatorBreakSettings>[])
  final List<EducatorBreakSettings>? breaks;
  @JsonKey(name: 'working_hours_start', includeIfNull: false, defaultValue: '')
  final String? workingHoursStart;
  @JsonKey(name: 'working_hours_end', includeIfNull: false, defaultValue: '')
  final String? workingHoursEnd;
  @JsonKey(name: 'working_day_monday', includeIfNull: false)
  final bool? workingDayMonday;
  @JsonKey(name: 'working_day_tuesday', includeIfNull: false)
  final bool? workingDayTuesday;
  @JsonKey(name: 'working_day_wednesday', includeIfNull: false)
  final bool? workingDayWednesday;
  @JsonKey(name: 'working_day_thursday', includeIfNull: false)
  final bool? workingDayThursday;
  @JsonKey(name: 'working_day_friday', includeIfNull: false)
  final bool? workingDayFriday;
  @JsonKey(name: 'working_day_saturday', includeIfNull: false)
  final bool? workingDaySaturday;
  @JsonKey(name: 'working_day_sunday', includeIfNull: false)
  final bool? workingDaySunday;
  @JsonKey(name: 'maximum_hours_awarded', includeIfNull: false)
  final int? maximumHoursAwarded;
  @JsonKey(name: 'min_shift_length', includeIfNull: false)
  final int? minShiftLength;
  @JsonKey(name: 'max_shift_length', includeIfNull: false)
  final int? maxShiftLength;
  static const fromJsonFactory = _$GeneralEducatorTimeSheetSettingsFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GeneralEducatorTimeSheetSettings &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.breaks, breaks) ||
                const DeepCollectionEquality().equals(other.breaks, breaks)) &&
            (identical(other.workingHoursStart, workingHoursStart) ||
                const DeepCollectionEquality()
                    .equals(other.workingHoursStart, workingHoursStart)) &&
            (identical(other.workingHoursEnd, workingHoursEnd) ||
                const DeepCollectionEquality()
                    .equals(other.workingHoursEnd, workingHoursEnd)) &&
            (identical(other.workingDayMonday, workingDayMonday) ||
                const DeepCollectionEquality()
                    .equals(other.workingDayMonday, workingDayMonday)) &&
            (identical(other.workingDayTuesday, workingDayTuesday) ||
                const DeepCollectionEquality()
                    .equals(other.workingDayTuesday, workingDayTuesday)) &&
            (identical(other.workingDayWednesday, workingDayWednesday) ||
                const DeepCollectionEquality()
                    .equals(other.workingDayWednesday, workingDayWednesday)) &&
            (identical(other.workingDayThursday, workingDayThursday) ||
                const DeepCollectionEquality()
                    .equals(other.workingDayThursday, workingDayThursday)) &&
            (identical(other.workingDayFriday, workingDayFriday) ||
                const DeepCollectionEquality()
                    .equals(other.workingDayFriday, workingDayFriday)) &&
            (identical(other.workingDaySaturday, workingDaySaturday) ||
                const DeepCollectionEquality()
                    .equals(other.workingDaySaturday, workingDaySaturday)) &&
            (identical(other.workingDaySunday, workingDaySunday) ||
                const DeepCollectionEquality()
                    .equals(other.workingDaySunday, workingDaySunday)) &&
            (identical(other.maximumHoursAwarded, maximumHoursAwarded) ||
                const DeepCollectionEquality()
                    .equals(other.maximumHoursAwarded, maximumHoursAwarded)) &&
            (identical(other.minShiftLength, minShiftLength) ||
                const DeepCollectionEquality()
                    .equals(other.minShiftLength, minShiftLength)) &&
            (identical(other.maxShiftLength, maxShiftLength) ||
                const DeepCollectionEquality()
                    .equals(other.maxShiftLength, maxShiftLength)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(breaks) ^
      const DeepCollectionEquality().hash(workingHoursStart) ^
      const DeepCollectionEquality().hash(workingHoursEnd) ^
      const DeepCollectionEquality().hash(workingDayMonday) ^
      const DeepCollectionEquality().hash(workingDayTuesday) ^
      const DeepCollectionEquality().hash(workingDayWednesday) ^
      const DeepCollectionEquality().hash(workingDayThursday) ^
      const DeepCollectionEquality().hash(workingDayFriday) ^
      const DeepCollectionEquality().hash(workingDaySaturday) ^
      const DeepCollectionEquality().hash(workingDaySunday) ^
      const DeepCollectionEquality().hash(maximumHoursAwarded) ^
      const DeepCollectionEquality().hash(minShiftLength) ^
      const DeepCollectionEquality().hash(maxShiftLength) ^
      runtimeType.hashCode;
}

extension $GeneralEducatorTimeSheetSettingsExtension
    on GeneralEducatorTimeSheetSettings {
  GeneralEducatorTimeSheetSettings copyWith(
      {int? id,
      List<EducatorBreakSettings>? breaks,
      String? workingHoursStart,
      String? workingHoursEnd,
      bool? workingDayMonday,
      bool? workingDayTuesday,
      bool? workingDayWednesday,
      bool? workingDayThursday,
      bool? workingDayFriday,
      bool? workingDaySaturday,
      bool? workingDaySunday,
      int? maximumHoursAwarded,
      int? minShiftLength,
      int? maxShiftLength}) {
    return GeneralEducatorTimeSheetSettings(
        id: id ?? this.id,
        breaks: breaks ?? this.breaks,
        workingHoursStart: workingHoursStart ?? this.workingHoursStart,
        workingHoursEnd: workingHoursEnd ?? this.workingHoursEnd,
        workingDayMonday: workingDayMonday ?? this.workingDayMonday,
        workingDayTuesday: workingDayTuesday ?? this.workingDayTuesday,
        workingDayWednesday: workingDayWednesday ?? this.workingDayWednesday,
        workingDayThursday: workingDayThursday ?? this.workingDayThursday,
        workingDayFriday: workingDayFriday ?? this.workingDayFriday,
        workingDaySaturday: workingDaySaturday ?? this.workingDaySaturday,
        workingDaySunday: workingDaySunday ?? this.workingDaySunday,
        maximumHoursAwarded: maximumHoursAwarded ?? this.maximumHoursAwarded,
        minShiftLength: minShiftLength ?? this.minShiftLength,
        maxShiftLength: maxShiftLength ?? this.maxShiftLength);
  }

  GeneralEducatorTimeSheetSettings copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<List<EducatorBreakSettings>?>? breaks,
      Wrapped<String?>? workingHoursStart,
      Wrapped<String?>? workingHoursEnd,
      Wrapped<bool?>? workingDayMonday,
      Wrapped<bool?>? workingDayTuesday,
      Wrapped<bool?>? workingDayWednesday,
      Wrapped<bool?>? workingDayThursday,
      Wrapped<bool?>? workingDayFriday,
      Wrapped<bool?>? workingDaySaturday,
      Wrapped<bool?>? workingDaySunday,
      Wrapped<int?>? maximumHoursAwarded,
      Wrapped<int?>? minShiftLength,
      Wrapped<int?>? maxShiftLength}) {
    return GeneralEducatorTimeSheetSettings(
        id: (id != null ? id.value : this.id),
        breaks: (breaks != null ? breaks.value : this.breaks),
        workingHoursStart: (workingHoursStart != null
            ? workingHoursStart.value
            : this.workingHoursStart),
        workingHoursEnd: (workingHoursEnd != null
            ? workingHoursEnd.value
            : this.workingHoursEnd),
        workingDayMonday: (workingDayMonday != null
            ? workingDayMonday.value
            : this.workingDayMonday),
        workingDayTuesday: (workingDayTuesday != null
            ? workingDayTuesday.value
            : this.workingDayTuesday),
        workingDayWednesday: (workingDayWednesday != null
            ? workingDayWednesday.value
            : this.workingDayWednesday),
        workingDayThursday: (workingDayThursday != null
            ? workingDayThursday.value
            : this.workingDayThursday),
        workingDayFriday: (workingDayFriday != null
            ? workingDayFriday.value
            : this.workingDayFriday),
        workingDaySaturday: (workingDaySaturday != null
            ? workingDaySaturday.value
            : this.workingDaySaturday),
        workingDaySunday: (workingDaySunday != null
            ? workingDaySunday.value
            : this.workingDaySunday),
        maximumHoursAwarded: (maximumHoursAwarded != null
            ? maximumHoursAwarded.value
            : this.maximumHoursAwarded),
        minShiftLength: (minShiftLength != null
            ? minShiftLength.value
            : this.minShiftLength),
        maxShiftLength: (maxShiftLength != null
            ? maxShiftLength.value
            : this.maxShiftLength));
  }
}

@JsonSerializable(explicitToJson: true)
class EducatorExperienceLevelSettings {
  EducatorExperienceLevelSettings({
    this.id,
    this.title,
    this.minNumber,
  });

  factory EducatorExperienceLevelSettings.fromJson(Map<String, dynamic> json) =>
      _$EducatorExperienceLevelSettingsFromJson(json);

  static const toJsonFactory = _$EducatorExperienceLevelSettingsToJson;
  Map<String, dynamic> toJson() =>
      _$EducatorExperienceLevelSettingsToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'title', includeIfNull: false, defaultValue: '')
  final String? title;
  @JsonKey(name: 'min_number', includeIfNull: false)
  final int? minNumber;
  static const fromJsonFactory = _$EducatorExperienceLevelSettingsFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EducatorExperienceLevelSettings &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.minNumber, minNumber) ||
                const DeepCollectionEquality()
                    .equals(other.minNumber, minNumber)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(minNumber) ^
      runtimeType.hashCode;
}

extension $EducatorExperienceLevelSettingsExtension
    on EducatorExperienceLevelSettings {
  EducatorExperienceLevelSettings copyWith(
      {int? id, String? title, int? minNumber}) {
    return EducatorExperienceLevelSettings(
        id: id ?? this.id,
        title: title ?? this.title,
        minNumber: minNumber ?? this.minNumber);
  }

  EducatorExperienceLevelSettings copyWithWrapped(
      {Wrapped<int?>? id, Wrapped<String?>? title, Wrapped<int?>? minNumber}) {
    return EducatorExperienceLevelSettings(
        id: (id != null ? id.value : this.id),
        title: (title != null ? title.value : this.title),
        minNumber: (minNumber != null ? minNumber.value : this.minNumber));
  }
}

@JsonSerializable(explicitToJson: true)
class IndividualEmployeeTimeSheetSettings {
  IndividualEmployeeTimeSheetSettings({
    this.id,
    this.experienceLevel,
    this.minNbHoursPerWeek,
    this.maxNbHoursPerWeek,
    this.code,
    this.educator,
  });

  factory IndividualEmployeeTimeSheetSettings.fromJson(
          Map<String, dynamic> json) =>
      _$IndividualEmployeeTimeSheetSettingsFromJson(json);

  static const toJsonFactory = _$IndividualEmployeeTimeSheetSettingsToJson;
  Map<String, dynamic> toJson() =>
      _$IndividualEmployeeTimeSheetSettingsToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'experience_level', includeIfNull: false)
  final EducatorExperienceLevelSettings? experienceLevel;
  @JsonKey(name: 'min_nb_hours_per_week', includeIfNull: false)
  final int? minNbHoursPerWeek;
  @JsonKey(name: 'max_nb_hours_per_week', includeIfNull: false)
  final int? maxNbHoursPerWeek;
  @JsonKey(name: 'code', includeIfNull: false, defaultValue: '')
  final String? code;
  @JsonKey(name: 'educator', includeIfNull: false, defaultValue: '')
  final String? educator;
  static const fromJsonFactory = _$IndividualEmployeeTimeSheetSettingsFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is IndividualEmployeeTimeSheetSettings &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.experienceLevel, experienceLevel) ||
                const DeepCollectionEquality()
                    .equals(other.experienceLevel, experienceLevel)) &&
            (identical(other.minNbHoursPerWeek, minNbHoursPerWeek) ||
                const DeepCollectionEquality()
                    .equals(other.minNbHoursPerWeek, minNbHoursPerWeek)) &&
            (identical(other.maxNbHoursPerWeek, maxNbHoursPerWeek) ||
                const DeepCollectionEquality()
                    .equals(other.maxNbHoursPerWeek, maxNbHoursPerWeek)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.educator, educator) ||
                const DeepCollectionEquality()
                    .equals(other.educator, educator)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(experienceLevel) ^
      const DeepCollectionEquality().hash(minNbHoursPerWeek) ^
      const DeepCollectionEquality().hash(maxNbHoursPerWeek) ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(educator) ^
      runtimeType.hashCode;
}

extension $IndividualEmployeeTimeSheetSettingsExtension
    on IndividualEmployeeTimeSheetSettings {
  IndividualEmployeeTimeSheetSettings copyWith(
      {int? id,
      EducatorExperienceLevelSettings? experienceLevel,
      int? minNbHoursPerWeek,
      int? maxNbHoursPerWeek,
      String? code,
      String? educator}) {
    return IndividualEmployeeTimeSheetSettings(
        id: id ?? this.id,
        experienceLevel: experienceLevel ?? this.experienceLevel,
        minNbHoursPerWeek: minNbHoursPerWeek ?? this.minNbHoursPerWeek,
        maxNbHoursPerWeek: maxNbHoursPerWeek ?? this.maxNbHoursPerWeek,
        code: code ?? this.code,
        educator: educator ?? this.educator);
  }

  IndividualEmployeeTimeSheetSettings copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<EducatorExperienceLevelSettings?>? experienceLevel,
      Wrapped<int?>? minNbHoursPerWeek,
      Wrapped<int?>? maxNbHoursPerWeek,
      Wrapped<String?>? code,
      Wrapped<String?>? educator}) {
    return IndividualEmployeeTimeSheetSettings(
        id: (id != null ? id.value : this.id),
        experienceLevel: (experienceLevel != null
            ? experienceLevel.value
            : this.experienceLevel),
        minNbHoursPerWeek: (minNbHoursPerWeek != null
            ? minNbHoursPerWeek.value
            : this.minNbHoursPerWeek),
        maxNbHoursPerWeek: (maxNbHoursPerWeek != null
            ? maxNbHoursPerWeek.value
            : this.maxNbHoursPerWeek),
        code: (code != null ? code.value : this.code),
        educator: (educator != null ? educator.value : this.educator));
  }
}

@JsonSerializable(explicitToJson: true)
class EducatorTimeSheet {
  EducatorTimeSheet({
    this.id,
    this.educatorId,
    this.educatorInfos,
    this.date,
    this.startTime,
    this.endTime,
    this.photo,
  });

  factory EducatorTimeSheet.fromJson(Map<String, dynamic> json) =>
      _$EducatorTimeSheetFromJson(json);

  static const toJsonFactory = _$EducatorTimeSheetToJson;
  Map<String, dynamic> toJson() => _$EducatorTimeSheetToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'educator_id', includeIfNull: false, defaultValue: '')
  final String? educatorId;
  @JsonKey(name: 'educator_infos', includeIfNull: false)
  final EducatorProfile? educatorInfos;
  @JsonKey(name: 'date', includeIfNull: false, toJson: _dateToJson)
  final DateTime? date;
  @JsonKey(name: 'start_time', includeIfNull: false, defaultValue: '')
  final String? startTime;
  @JsonKey(name: 'end_time', includeIfNull: false, defaultValue: '')
  final String? endTime;
  @JsonKey(name: 'photo', includeIfNull: false, defaultValue: '')
  final String? photo;
  static const fromJsonFactory = _$EducatorTimeSheetFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EducatorTimeSheet &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.educatorId, educatorId) ||
                const DeepCollectionEquality()
                    .equals(other.educatorId, educatorId)) &&
            (identical(other.educatorInfos, educatorInfos) ||
                const DeepCollectionEquality()
                    .equals(other.educatorInfos, educatorInfos)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.startTime, startTime) ||
                const DeepCollectionEquality()
                    .equals(other.startTime, startTime)) &&
            (identical(other.endTime, endTime) ||
                const DeepCollectionEquality()
                    .equals(other.endTime, endTime)) &&
            (identical(other.photo, photo) ||
                const DeepCollectionEquality().equals(other.photo, photo)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(educatorId) ^
      const DeepCollectionEquality().hash(educatorInfos) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(startTime) ^
      const DeepCollectionEquality().hash(endTime) ^
      const DeepCollectionEquality().hash(photo) ^
      runtimeType.hashCode;
}

extension $EducatorTimeSheetExtension on EducatorTimeSheet {
  EducatorTimeSheet copyWith(
      {int? id,
      String? educatorId,
      EducatorProfile? educatorInfos,
      DateTime? date,
      String? startTime,
      String? endTime,
      String? photo}) {
    return EducatorTimeSheet(
        id: id ?? this.id,
        educatorId: educatorId ?? this.educatorId,
        educatorInfos: educatorInfos ?? this.educatorInfos,
        date: date ?? this.date,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        photo: photo ?? this.photo);
  }

  EducatorTimeSheet copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String?>? educatorId,
      Wrapped<EducatorProfile?>? educatorInfos,
      Wrapped<DateTime?>? date,
      Wrapped<String?>? startTime,
      Wrapped<String?>? endTime,
      Wrapped<String?>? photo}) {
    return EducatorTimeSheet(
        id: (id != null ? id.value : this.id),
        educatorId: (educatorId != null ? educatorId.value : this.educatorId),
        educatorInfos:
            (educatorInfos != null ? educatorInfos.value : this.educatorInfos),
        date: (date != null ? date.value : this.date),
        startTime: (startTime != null ? startTime.value : this.startTime),
        endTime: (endTime != null ? endTime.value : this.endTime),
        photo: (photo != null ? photo.value : this.photo));
  }
}

@JsonSerializable(explicitToJson: true)
class EventFile {
  EventFile({
    this.file,
    this.id,
  });

  factory EventFile.fromJson(Map<String, dynamic> json) =>
      _$EventFileFromJson(json);

  static const toJsonFactory = _$EventFileToJson;
  Map<String, dynamic> toJson() => _$EventFileToJson(this);

  @JsonKey(name: 'file', includeIfNull: false, defaultValue: '')
  final String? file;
  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  static const fromJsonFactory = _$EventFileFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EventFile &&
            (identical(other.file, file) ||
                const DeepCollectionEquality().equals(other.file, file)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(file) ^
      const DeepCollectionEquality().hash(id) ^
      runtimeType.hashCode;
}

extension $EventFileExtension on EventFile {
  EventFile copyWith({String? file, int? id}) {
    return EventFile(file: file ?? this.file, id: id ?? this.id);
  }

  EventFile copyWithWrapped({Wrapped<String?>? file, Wrapped<int?>? id}) {
    return EventFile(
        file: (file != null ? file.value : this.file),
        id: (id != null ? id.value : this.id));
  }
}

@JsonSerializable(explicitToJson: true)
class EventUserTag {
  EventUserTag({
    this.user,
  });

  factory EventUserTag.fromJson(Map<String, dynamic> json) =>
      _$EventUserTagFromJson(json);

  static const toJsonFactory = _$EventUserTagToJson;
  Map<String, dynamic> toJson() => _$EventUserTagToJson(this);

  @JsonKey(name: 'user', includeIfNull: false)
  final int? user;
  static const fromJsonFactory = _$EventUserTagFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EventUserTag &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(user) ^ runtimeType.hashCode;
}

extension $EventUserTagExtension on EventUserTag {
  EventUserTag copyWith({int? user}) {
    return EventUserTag(user: user ?? this.user);
  }

  EventUserTag copyWithWrapped({Wrapped<int?>? user}) {
    return EventUserTag(user: (user != null ? user.value : this.user));
  }
}

@JsonSerializable(explicitToJson: true)
class Event {
  Event({
    this.id,
    this.start,
    this.end,
    this.repeatUntil,
    this.recurrence,
    this.visibleByParents,
    this.files,
    this.invitedUsers,
    this.title,
    this.content,
    this.userTags,
  });

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  static const toJsonFactory = _$EventToJson;
  Map<String, dynamic> toJson() => _$EventToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'start', includeIfNull: false)
  final DateTime? start;
  @JsonKey(name: 'end', includeIfNull: false)
  final DateTime? end;
  @JsonKey(name: 'repeat_until', includeIfNull: false)
  final DateTime? repeatUntil;
  @JsonKey(
    name: 'recurrence',
    includeIfNull: false,
    toJson: eventRecurrenceToJson,
    fromJson: eventRecurrenceFromJson,
  )
  final enums.EventRecurrence? recurrence;
  @JsonKey(name: 'visible_by_parents', includeIfNull: false)
  final bool? visibleByParents;
  @JsonKey(name: 'files', includeIfNull: false, defaultValue: <EventFile>[])
  final List<EventFile>? files;
  @JsonKey(name: 'invited_users', includeIfNull: false, defaultValue: <int>[])
  final List<int>? invitedUsers;
  @JsonKey(name: 'title', includeIfNull: false, defaultValue: '')
  final String? title;
  @JsonKey(name: 'content', includeIfNull: false, defaultValue: '')
  final String? content;
  @JsonKey(
      name: 'user_tags', includeIfNull: false, defaultValue: <EventUserTag>[])
  final List<EventUserTag>? userTags;
  static const fromJsonFactory = _$EventFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Event &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.start, start) ||
                const DeepCollectionEquality().equals(other.start, start)) &&
            (identical(other.end, end) ||
                const DeepCollectionEquality().equals(other.end, end)) &&
            (identical(other.repeatUntil, repeatUntil) ||
                const DeepCollectionEquality()
                    .equals(other.repeatUntil, repeatUntil)) &&
            (identical(other.recurrence, recurrence) ||
                const DeepCollectionEquality()
                    .equals(other.recurrence, recurrence)) &&
            (identical(other.visibleByParents, visibleByParents) ||
                const DeepCollectionEquality()
                    .equals(other.visibleByParents, visibleByParents)) &&
            (identical(other.files, files) ||
                const DeepCollectionEquality().equals(other.files, files)) &&
            (identical(other.invitedUsers, invitedUsers) ||
                const DeepCollectionEquality()
                    .equals(other.invitedUsers, invitedUsers)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.userTags, userTags) ||
                const DeepCollectionEquality()
                    .equals(other.userTags, userTags)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(start) ^
      const DeepCollectionEquality().hash(end) ^
      const DeepCollectionEquality().hash(repeatUntil) ^
      const DeepCollectionEquality().hash(recurrence) ^
      const DeepCollectionEquality().hash(visibleByParents) ^
      const DeepCollectionEquality().hash(files) ^
      const DeepCollectionEquality().hash(invitedUsers) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(userTags) ^
      runtimeType.hashCode;
}

extension $EventExtension on Event {
  Event copyWith(
      {int? id,
      DateTime? start,
      DateTime? end,
      DateTime? repeatUntil,
      enums.EventRecurrence? recurrence,
      bool? visibleByParents,
      List<EventFile>? files,
      List<int>? invitedUsers,
      String? title,
      String? content,
      List<EventUserTag>? userTags}) {
    return Event(
        id: id ?? this.id,
        start: start ?? this.start,
        end: end ?? this.end,
        repeatUntil: repeatUntil ?? this.repeatUntil,
        recurrence: recurrence ?? this.recurrence,
        visibleByParents: visibleByParents ?? this.visibleByParents,
        files: files ?? this.files,
        invitedUsers: invitedUsers ?? this.invitedUsers,
        title: title ?? this.title,
        content: content ?? this.content,
        userTags: userTags ?? this.userTags);
  }

  Event copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<DateTime?>? start,
      Wrapped<DateTime?>? end,
      Wrapped<DateTime?>? repeatUntil,
      Wrapped<enums.EventRecurrence?>? recurrence,
      Wrapped<bool?>? visibleByParents,
      Wrapped<List<EventFile>?>? files,
      Wrapped<List<int>?>? invitedUsers,
      Wrapped<String?>? title,
      Wrapped<String?>? content,
      Wrapped<List<EventUserTag>?>? userTags}) {
    return Event(
        id: (id != null ? id.value : this.id),
        start: (start != null ? start.value : this.start),
        end: (end != null ? end.value : this.end),
        repeatUntil:
            (repeatUntil != null ? repeatUntil.value : this.repeatUntil),
        recurrence: (recurrence != null ? recurrence.value : this.recurrence),
        visibleByParents: (visibleByParents != null
            ? visibleByParents.value
            : this.visibleByParents),
        files: (files != null ? files.value : this.files),
        invitedUsers:
            (invitedUsers != null ? invitedUsers.value : this.invitedUsers),
        title: (title != null ? title.value : this.title),
        content: (content != null ? content.value : this.content),
        userTags: (userTags != null ? userTags.value : this.userTags));
  }
}

@JsonSerializable(explicitToJson: true)
class EventOccurrence {
  EventOccurrence({
    this.occurrenceStart,
    this.occurrenceEnd,
    this.event,
  });

  factory EventOccurrence.fromJson(Map<String, dynamic> json) =>
      _$EventOccurrenceFromJson(json);

  static const toJsonFactory = _$EventOccurrenceToJson;
  Map<String, dynamic> toJson() => _$EventOccurrenceToJson(this);

  @JsonKey(name: 'occurrence_start', includeIfNull: false)
  final DateTime? occurrenceStart;
  @JsonKey(name: 'occurrence_end', includeIfNull: false)
  final DateTime? occurrenceEnd;
  @JsonKey(name: 'event', includeIfNull: false)
  final Event? event;
  static const fromJsonFactory = _$EventOccurrenceFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EventOccurrence &&
            (identical(other.occurrenceStart, occurrenceStart) ||
                const DeepCollectionEquality()
                    .equals(other.occurrenceStart, occurrenceStart)) &&
            (identical(other.occurrenceEnd, occurrenceEnd) ||
                const DeepCollectionEquality()
                    .equals(other.occurrenceEnd, occurrenceEnd)) &&
            (identical(other.event, event) ||
                const DeepCollectionEquality().equals(other.event, event)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(occurrenceStart) ^
      const DeepCollectionEquality().hash(occurrenceEnd) ^
      const DeepCollectionEquality().hash(event) ^
      runtimeType.hashCode;
}

extension $EventOccurrenceExtension on EventOccurrence {
  EventOccurrence copyWith(
      {DateTime? occurrenceStart, DateTime? occurrenceEnd, Event? event}) {
    return EventOccurrence(
        occurrenceStart: occurrenceStart ?? this.occurrenceStart,
        occurrenceEnd: occurrenceEnd ?? this.occurrenceEnd,
        event: event ?? this.event);
  }

  EventOccurrence copyWithWrapped(
      {Wrapped<DateTime?>? occurrenceStart,
      Wrapped<DateTime?>? occurrenceEnd,
      Wrapped<Event?>? event}) {
    return EventOccurrence(
        occurrenceStart: (occurrenceStart != null
            ? occurrenceStart.value
            : this.occurrenceStart),
        occurrenceEnd:
            (occurrenceEnd != null ? occurrenceEnd.value : this.occurrenceEnd),
        event: (event != null ? event.value : this.event));
  }
}

@JsonSerializable(explicitToJson: true)
class MedicalFileForm {
  MedicalFileForm({
    this.id,
    this.schema,
    this.version,
  });

  factory MedicalFileForm.fromJson(Map<String, dynamic> json) =>
      _$MedicalFileFormFromJson(json);

  static const toJsonFactory = _$MedicalFileFormToJson;
  Map<String, dynamic> toJson() => _$MedicalFileFormToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'schema', includeIfNull: false)
  final Object? schema;
  @JsonKey(name: 'version', includeIfNull: false)
  final int? version;
  static const fromJsonFactory = _$MedicalFileFormFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MedicalFileForm &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.schema, schema) ||
                const DeepCollectionEquality().equals(other.schema, schema)) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality().equals(other.version, version)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(schema) ^
      const DeepCollectionEquality().hash(version) ^
      runtimeType.hashCode;
}

extension $MedicalFileFormExtension on MedicalFileForm {
  MedicalFileForm copyWith({int? id, Object? schema, int? version}) {
    return MedicalFileForm(
        id: id ?? this.id,
        schema: schema ?? this.schema,
        version: version ?? this.version);
  }

  MedicalFileForm copyWithWrapped(
      {Wrapped<int?>? id, Wrapped<Object?>? schema, Wrapped<int?>? version}) {
    return MedicalFileForm(
        id: (id != null ? id.value : this.id),
        schema: (schema != null ? schema.value : this.schema),
        version: (version != null ? version.value : this.version));
  }
}

@JsonSerializable(explicitToJson: true)
class MedicalFileTemplate {
  MedicalFileTemplate({
    this.id,
    this.schema,
    this.version,
  });

  factory MedicalFileTemplate.fromJson(Map<String, dynamic> json) =>
      _$MedicalFileTemplateFromJson(json);

  static const toJsonFactory = _$MedicalFileTemplateToJson;
  Map<String, dynamic> toJson() => _$MedicalFileTemplateToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'schema', includeIfNull: false)
  final Object? schema;
  @JsonKey(name: 'version', includeIfNull: false)
  final int? version;
  static const fromJsonFactory = _$MedicalFileTemplateFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MedicalFileTemplate &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.schema, schema) ||
                const DeepCollectionEquality().equals(other.schema, schema)) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality().equals(other.version, version)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(schema) ^
      const DeepCollectionEquality().hash(version) ^
      runtimeType.hashCode;
}

extension $MedicalFileTemplateExtension on MedicalFileTemplate {
  MedicalFileTemplate copyWith({int? id, Object? schema, int? version}) {
    return MedicalFileTemplate(
        id: id ?? this.id,
        schema: schema ?? this.schema,
        version: version ?? this.version);
  }

  MedicalFileTemplate copyWithWrapped(
      {Wrapped<int?>? id, Wrapped<Object?>? schema, Wrapped<int?>? version}) {
    return MedicalFileTemplate(
        id: (id != null ? id.value : this.id),
        schema: (schema != null ? schema.value : this.schema),
        version: (version != null ? version.value : this.version));
  }
}

@JsonSerializable(explicitToJson: true)
class TPZForm {
  TPZForm({
    this.id,
    this.schema,
    this.version,
  });

  factory TPZForm.fromJson(Map<String, dynamic> json) =>
      _$TPZFormFromJson(json);

  static const toJsonFactory = _$TPZFormToJson;
  Map<String, dynamic> toJson() => _$TPZFormToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'schema', includeIfNull: false)
  final Object? schema;
  @JsonKey(name: 'version', includeIfNull: false)
  final int? version;
  static const fromJsonFactory = _$TPZFormFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TPZForm &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.schema, schema) ||
                const DeepCollectionEquality().equals(other.schema, schema)) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality().equals(other.version, version)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(schema) ^
      const DeepCollectionEquality().hash(version) ^
      runtimeType.hashCode;
}

extension $TPZFormExtension on TPZForm {
  TPZForm copyWith({int? id, Object? schema, int? version}) {
    return TPZForm(
        id: id ?? this.id,
        schema: schema ?? this.schema,
        version: version ?? this.version);
  }

  TPZForm copyWithWrapped(
      {Wrapped<int?>? id, Wrapped<Object?>? schema, Wrapped<int?>? version}) {
    return TPZForm(
        id: (id != null ? id.value : this.id),
        schema: (schema != null ? schema.value : this.schema),
        version: (version != null ? version.value : this.version));
  }
}

@JsonSerializable(explicitToJson: true)
class TPZTemplate {
  TPZTemplate({
    this.id,
    this.schema,
    this.version,
  });

  factory TPZTemplate.fromJson(Map<String, dynamic> json) =>
      _$TPZTemplateFromJson(json);

  static const toJsonFactory = _$TPZTemplateToJson;
  Map<String, dynamic> toJson() => _$TPZTemplateToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'schema', includeIfNull: false)
  final Object? schema;
  @JsonKey(name: 'version', includeIfNull: false)
  final int? version;
  static const fromJsonFactory = _$TPZTemplateFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TPZTemplate &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.schema, schema) ||
                const DeepCollectionEquality().equals(other.schema, schema)) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality().equals(other.version, version)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(schema) ^
      const DeepCollectionEquality().hash(version) ^
      runtimeType.hashCode;
}

extension $TPZTemplateExtension on TPZTemplate {
  TPZTemplate copyWith({int? id, Object? schema, int? version}) {
    return TPZTemplate(
        id: id ?? this.id,
        schema: schema ?? this.schema,
        version: version ?? this.version);
  }

  TPZTemplate copyWithWrapped(
      {Wrapped<int?>? id, Wrapped<Object?>? schema, Wrapped<int?>? version}) {
    return TPZTemplate(
        id: (id != null ? id.value : this.id),
        schema: (schema != null ? schema.value : this.schema),
        version: (version != null ? version.value : this.version));
  }
}

@JsonSerializable(explicitToJson: true)
class DocumentsFicheContacts {
  DocumentsFicheContacts({
    this.allChildren,
    this.allTime,
    this.children,
    this.groups,
    this.startDate,
    this.endDate,
  });

  factory DocumentsFicheContacts.fromJson(Map<String, dynamic> json) =>
      _$DocumentsFicheContactsFromJson(json);

  static const toJsonFactory = _$DocumentsFicheContactsToJson;
  Map<String, dynamic> toJson() => _$DocumentsFicheContactsToJson(this);

  @JsonKey(name: 'all_children', includeIfNull: false, defaultValue: false)
  final bool? allChildren;
  @JsonKey(name: 'all_time', includeIfNull: false, defaultValue: false)
  final bool? allTime;
  @JsonKey(name: 'children', includeIfNull: false, defaultValue: <int>[])
  final List<int>? children;
  @JsonKey(name: 'groups', includeIfNull: false, defaultValue: <int>[])
  final List<int>? groups;
  @JsonKey(name: 'start_date', includeIfNull: false, toJson: _dateToJson)
  final DateTime? startDate;
  @JsonKey(name: 'end_date', includeIfNull: false, toJson: _dateToJson)
  final DateTime? endDate;
  static const fromJsonFactory = _$DocumentsFicheContactsFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DocumentsFicheContacts &&
            (identical(other.allChildren, allChildren) ||
                const DeepCollectionEquality()
                    .equals(other.allChildren, allChildren)) &&
            (identical(other.allTime, allTime) ||
                const DeepCollectionEquality()
                    .equals(other.allTime, allTime)) &&
            (identical(other.children, children) ||
                const DeepCollectionEquality()
                    .equals(other.children, children)) &&
            (identical(other.groups, groups) ||
                const DeepCollectionEquality().equals(other.groups, groups)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality().equals(other.endDate, endDate)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(allChildren) ^
      const DeepCollectionEquality().hash(allTime) ^
      const DeepCollectionEquality().hash(children) ^
      const DeepCollectionEquality().hash(groups) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      runtimeType.hashCode;
}

extension $DocumentsFicheContactsExtension on DocumentsFicheContacts {
  DocumentsFicheContacts copyWith(
      {bool? allChildren,
      bool? allTime,
      List<int>? children,
      List<int>? groups,
      DateTime? startDate,
      DateTime? endDate}) {
    return DocumentsFicheContacts(
        allChildren: allChildren ?? this.allChildren,
        allTime: allTime ?? this.allTime,
        children: children ?? this.children,
        groups: groups ?? this.groups,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate);
  }

  DocumentsFicheContacts copyWithWrapped(
      {Wrapped<bool?>? allChildren,
      Wrapped<bool?>? allTime,
      Wrapped<List<int>?>? children,
      Wrapped<List<int>?>? groups,
      Wrapped<DateTime?>? startDate,
      Wrapped<DateTime?>? endDate}) {
    return DocumentsFicheContacts(
        allChildren:
            (allChildren != null ? allChildren.value : this.allChildren),
        allTime: (allTime != null ? allTime.value : this.allTime),
        children: (children != null ? children.value : this.children),
        groups: (groups != null ? groups.value : this.groups),
        startDate: (startDate != null ? startDate.value : this.startDate),
        endDate: (endDate != null ? endDate.value : this.endDate));
  }
}

@JsonSerializable(explicitToJson: true)
class ChildInfoField {
  ChildInfoField({
    this.name,
    this.subFields,
  });

  factory ChildInfoField.fromJson(Map<String, dynamic> json) =>
      _$ChildInfoFieldFromJson(json);

  static const toJsonFactory = _$ChildInfoFieldToJson;
  Map<String, dynamic> toJson() => _$ChildInfoFieldToJson(this);

  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  @JsonKey(name: 'sub_fields', includeIfNull: false, defaultValue: <String>[])
  final List<String>? subFields;
  static const fromJsonFactory = _$ChildInfoFieldFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChildInfoField &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.subFields, subFields) ||
                const DeepCollectionEquality()
                    .equals(other.subFields, subFields)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(subFields) ^
      runtimeType.hashCode;
}

extension $ChildInfoFieldExtension on ChildInfoField {
  ChildInfoField copyWith({String? name, List<String>? subFields}) {
    return ChildInfoField(
        name: name ?? this.name, subFields: subFields ?? this.subFields);
  }

  ChildInfoField copyWithWrapped(
      {Wrapped<String?>? name, Wrapped<List<String>?>? subFields}) {
    return ChildInfoField(
        name: (name != null ? name.value : this.name),
        subFields: (subFields != null ? subFields.value : this.subFields));
  }
}

@JsonSerializable(explicitToJson: true)
class RequestReport {
  RequestReport({
    this.allChildren,
    this.allTime,
    this.children,
    this.groups,
    this.startDate,
    this.endDate,
    this.lookupFields,
  });

  factory RequestReport.fromJson(Map<String, dynamic> json) =>
      _$RequestReportFromJson(json);

  static const toJsonFactory = _$RequestReportToJson;
  Map<String, dynamic> toJson() => _$RequestReportToJson(this);

  @JsonKey(name: 'all_children', includeIfNull: false, defaultValue: false)
  final bool? allChildren;
  @JsonKey(name: 'all_time', includeIfNull: false, defaultValue: false)
  final bool? allTime;
  @JsonKey(name: 'children', includeIfNull: false, defaultValue: <int>[])
  final List<int>? children;
  @JsonKey(name: 'groups', includeIfNull: false, defaultValue: <int>[])
  final List<int>? groups;
  @JsonKey(name: 'start_date', includeIfNull: false, toJson: _dateToJson)
  final DateTime? startDate;
  @JsonKey(name: 'end_date', includeIfNull: false, toJson: _dateToJson)
  final DateTime? endDate;
  @JsonKey(
      name: 'lookup_fields',
      includeIfNull: false,
      defaultValue: <ChildInfoField>[])
  final List<ChildInfoField>? lookupFields;
  static const fromJsonFactory = _$RequestReportFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RequestReport &&
            (identical(other.allChildren, allChildren) ||
                const DeepCollectionEquality()
                    .equals(other.allChildren, allChildren)) &&
            (identical(other.allTime, allTime) ||
                const DeepCollectionEquality()
                    .equals(other.allTime, allTime)) &&
            (identical(other.children, children) ||
                const DeepCollectionEquality()
                    .equals(other.children, children)) &&
            (identical(other.groups, groups) ||
                const DeepCollectionEquality().equals(other.groups, groups)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.lookupFields, lookupFields) ||
                const DeepCollectionEquality()
                    .equals(other.lookupFields, lookupFields)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(allChildren) ^
      const DeepCollectionEquality().hash(allTime) ^
      const DeepCollectionEquality().hash(children) ^
      const DeepCollectionEquality().hash(groups) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(lookupFields) ^
      runtimeType.hashCode;
}

extension $RequestReportExtension on RequestReport {
  RequestReport copyWith(
      {bool? allChildren,
      bool? allTime,
      List<int>? children,
      List<int>? groups,
      DateTime? startDate,
      DateTime? endDate,
      List<ChildInfoField>? lookupFields}) {
    return RequestReport(
        allChildren: allChildren ?? this.allChildren,
        allTime: allTime ?? this.allTime,
        children: children ?? this.children,
        groups: groups ?? this.groups,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        lookupFields: lookupFields ?? this.lookupFields);
  }

  RequestReport copyWithWrapped(
      {Wrapped<bool?>? allChildren,
      Wrapped<bool?>? allTime,
      Wrapped<List<int>?>? children,
      Wrapped<List<int>?>? groups,
      Wrapped<DateTime?>? startDate,
      Wrapped<DateTime?>? endDate,
      Wrapped<List<ChildInfoField>?>? lookupFields}) {
    return RequestReport(
        allChildren:
            (allChildren != null ? allChildren.value : this.allChildren),
        allTime: (allTime != null ? allTime.value : this.allTime),
        children: (children != null ? children.value : this.children),
        groups: (groups != null ? groups.value : this.groups),
        startDate: (startDate != null ? startDate.value : this.startDate),
        endDate: (endDate != null ? endDate.value : this.endDate),
        lookupFields:
            (lookupFields != null ? lookupFields.value : this.lookupFields));
  }
}

@JsonSerializable(explicitToJson: true)
class Group {
  Group({
    this.id,
    this.name,
    this.avatar,
    this.educators,
    this.children,
    this.capacity,
    this.description,
    this.color,
  });

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

  static const toJsonFactory = _$GroupToJson;
  Map<String, dynamic> toJson() => _$GroupToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  @JsonKey(name: 'avatar', includeIfNull: false, defaultValue: '')
  final String? avatar;
  @JsonKey(name: 'educators', includeIfNull: false, defaultValue: <String>[])
  final List<String>? educators;
  @JsonKey(name: 'children', includeIfNull: false, defaultValue: <int>[])
  final List<int>? children;
  @JsonKey(name: 'capacity', includeIfNull: false)
  final int? capacity;
  @JsonKey(name: 'description', includeIfNull: false, defaultValue: '')
  final String? description;
  @JsonKey(name: 'color', includeIfNull: false, defaultValue: '')
  final String? color;
  static const fromJsonFactory = _$GroupFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Group &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.avatar, avatar) ||
                const DeepCollectionEquality().equals(other.avatar, avatar)) &&
            (identical(other.educators, educators) ||
                const DeepCollectionEquality()
                    .equals(other.educators, educators)) &&
            (identical(other.children, children) ||
                const DeepCollectionEquality()
                    .equals(other.children, children)) &&
            (identical(other.capacity, capacity) ||
                const DeepCollectionEquality()
                    .equals(other.capacity, capacity)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(avatar) ^
      const DeepCollectionEquality().hash(educators) ^
      const DeepCollectionEquality().hash(children) ^
      const DeepCollectionEquality().hash(capacity) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(color) ^
      runtimeType.hashCode;
}

extension $GroupExtension on Group {
  Group copyWith(
      {int? id,
      String? name,
      String? avatar,
      List<String>? educators,
      List<int>? children,
      int? capacity,
      String? description,
      String? color}) {
    return Group(
        id: id ?? this.id,
        name: name ?? this.name,
        avatar: avatar ?? this.avatar,
        educators: educators ?? this.educators,
        children: children ?? this.children,
        capacity: capacity ?? this.capacity,
        description: description ?? this.description,
        color: color ?? this.color);
  }

  Group copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String?>? name,
      Wrapped<String?>? avatar,
      Wrapped<List<String>?>? educators,
      Wrapped<List<int>?>? children,
      Wrapped<int?>? capacity,
      Wrapped<String?>? description,
      Wrapped<String?>? color}) {
    return Group(
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name),
        avatar: (avatar != null ? avatar.value : this.avatar),
        educators: (educators != null ? educators.value : this.educators),
        children: (children != null ? children.value : this.children),
        capacity: (capacity != null ? capacity.value : this.capacity),
        description:
            (description != null ? description.value : this.description),
        color: (color != null ? color.value : this.color));
  }
}

@JsonSerializable(explicitToJson: true)
class MenuGroup {
  MenuGroup({
    this.id,
    this.name,
    this.color,
  });

  factory MenuGroup.fromJson(Map<String, dynamic> json) =>
      _$MenuGroupFromJson(json);

  static const toJsonFactory = _$MenuGroupToJson;
  Map<String, dynamic> toJson() => _$MenuGroupToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  @JsonKey(name: 'color', includeIfNull: false, defaultValue: '')
  final String? color;
  static const fromJsonFactory = _$MenuGroupFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MenuGroup &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(color) ^
      runtimeType.hashCode;
}

extension $MenuGroupExtension on MenuGroup {
  MenuGroup copyWith({int? id, String? name, String? color}) {
    return MenuGroup(
        id: id ?? this.id, name: name ?? this.name, color: color ?? this.color);
  }

  MenuGroup copyWithWrapped(
      {Wrapped<int?>? id, Wrapped<String?>? name, Wrapped<String?>? color}) {
    return MenuGroup(
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name),
        color: (color != null ? color.value : this.color));
  }
}

@JsonSerializable(explicitToJson: true)
class MealItemPhoto {
  MealItemPhoto({
    this.id,
    this.photo,
  });

  factory MealItemPhoto.fromJson(Map<String, dynamic> json) =>
      _$MealItemPhotoFromJson(json);

  static const toJsonFactory = _$MealItemPhotoToJson;
  Map<String, dynamic> toJson() => _$MealItemPhotoToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'photo', includeIfNull: false, defaultValue: '')
  final String? photo;
  static const fromJsonFactory = _$MealItemPhotoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MealItemPhoto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.photo, photo) ||
                const DeepCollectionEquality().equals(other.photo, photo)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(photo) ^
      runtimeType.hashCode;
}

extension $MealItemPhotoExtension on MealItemPhoto {
  MealItemPhoto copyWith({int? id, String? photo}) {
    return MealItemPhoto(id: id ?? this.id, photo: photo ?? this.photo);
  }

  MealItemPhoto copyWithWrapped({Wrapped<int?>? id, Wrapped<String?>? photo}) {
    return MealItemPhoto(
        id: (id != null ? id.value : this.id),
        photo: (photo != null ? photo.value : this.photo));
  }
}

@JsonSerializable(explicitToJson: true)
class MealItem {
  MealItem({
    this.id,
    this.name,
    this.ingredients,
    this.description,
    this.allergens,
    this.photos,
  });

  factory MealItem.fromJson(Map<String, dynamic> json) =>
      _$MealItemFromJson(json);

  static const toJsonFactory = _$MealItemToJson;
  Map<String, dynamic> toJson() => _$MealItemToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  @JsonKey(name: 'ingredients', includeIfNull: false, defaultValue: '')
  final String? ingredients;
  @JsonKey(name: 'description', includeIfNull: false, defaultValue: '')
  final String? description;
  @JsonKey(name: 'allergens', includeIfNull: false)
  final Object? allergens;
  @JsonKey(
      name: 'photos', includeIfNull: false, defaultValue: <MealItemPhoto>[])
  final List<MealItemPhoto>? photos;
  static const fromJsonFactory = _$MealItemFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MealItem &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.ingredients, ingredients) ||
                const DeepCollectionEquality()
                    .equals(other.ingredients, ingredients)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.allergens, allergens) ||
                const DeepCollectionEquality()
                    .equals(other.allergens, allergens)) &&
            (identical(other.photos, photos) ||
                const DeepCollectionEquality().equals(other.photos, photos)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(ingredients) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(allergens) ^
      const DeepCollectionEquality().hash(photos) ^
      runtimeType.hashCode;
}

extension $MealItemExtension on MealItem {
  MealItem copyWith(
      {int? id,
      String? name,
      String? ingredients,
      String? description,
      Object? allergens,
      List<MealItemPhoto>? photos}) {
    return MealItem(
        id: id ?? this.id,
        name: name ?? this.name,
        ingredients: ingredients ?? this.ingredients,
        description: description ?? this.description,
        allergens: allergens ?? this.allergens,
        photos: photos ?? this.photos);
  }

  MealItem copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String?>? name,
      Wrapped<String?>? ingredients,
      Wrapped<String?>? description,
      Wrapped<Object?>? allergens,
      Wrapped<List<MealItemPhoto>?>? photos}) {
    return MealItem(
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name),
        ingredients:
            (ingredients != null ? ingredients.value : this.ingredients),
        description:
            (description != null ? description.value : this.description),
        allergens: (allergens != null ? allergens.value : this.allergens),
        photos: (photos != null ? photos.value : this.photos));
  }
}

@JsonSerializable(explicitToJson: true)
class Meal {
  Meal({
    this.id,
    this.name,
    this.startTime,
    this.endTime,
    this.items,
  });

  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);

  static const toJsonFactory = _$MealToJson;
  Map<String, dynamic> toJson() => _$MealToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  @JsonKey(name: 'start_time', includeIfNull: false, defaultValue: '')
  final String? startTime;
  @JsonKey(name: 'end_time', includeIfNull: false, defaultValue: '')
  final String? endTime;
  @JsonKey(name: 'items', includeIfNull: false, defaultValue: <MealItem>[])
  final List<MealItem>? items;
  static const fromJsonFactory = _$MealFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Meal &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.startTime, startTime) ||
                const DeepCollectionEquality()
                    .equals(other.startTime, startTime)) &&
            (identical(other.endTime, endTime) ||
                const DeepCollectionEquality()
                    .equals(other.endTime, endTime)) &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(startTime) ^
      const DeepCollectionEquality().hash(endTime) ^
      const DeepCollectionEquality().hash(items) ^
      runtimeType.hashCode;
}

extension $MealExtension on Meal {
  Meal copyWith(
      {int? id,
      String? name,
      String? startTime,
      String? endTime,
      List<MealItem>? items}) {
    return Meal(
        id: id ?? this.id,
        name: name ?? this.name,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        items: items ?? this.items);
  }

  Meal copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String?>? name,
      Wrapped<String?>? startTime,
      Wrapped<String?>? endTime,
      Wrapped<List<MealItem>?>? items}) {
    return Meal(
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name),
        startTime: (startTime != null ? startTime.value : this.startTime),
        endTime: (endTime != null ? endTime.value : this.endTime),
        items: (items != null ? items.value : this.items));
  }
}

@JsonSerializable(explicitToJson: true)
class Menu {
  Menu({
    this.id,
    this.name,
    this.groups,
    this.description,
    this.cycle,
    this.startDate,
    this.endDate,
    this.repeatUntil,
    this.meals,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);

  static const toJsonFactory = _$MenuToJson;
  Map<String, dynamic> toJson() => _$MenuToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  @JsonKey(name: 'groups', includeIfNull: false, defaultValue: <MenuGroup>[])
  final List<MenuGroup>? groups;
  @JsonKey(name: 'description', includeIfNull: false, defaultValue: '')
  final String? description;
  @JsonKey(name: 'cycle', includeIfNull: false, defaultValue: '')
  final String? cycle;
  @JsonKey(name: 'start_date', includeIfNull: false, toJson: _dateToJson)
  final DateTime? startDate;
  @JsonKey(name: 'end_date', includeIfNull: false, toJson: _dateToJson)
  final DateTime? endDate;
  @JsonKey(name: 'repeat_until', includeIfNull: false, toJson: _dateToJson)
  final DateTime? repeatUntil;
  @JsonKey(name: 'meals', includeIfNull: false, defaultValue: <Meal>[])
  final List<Meal>? meals;
  static const fromJsonFactory = _$MenuFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Menu &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.groups, groups) ||
                const DeepCollectionEquality().equals(other.groups, groups)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.cycle, cycle) ||
                const DeepCollectionEquality().equals(other.cycle, cycle)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.repeatUntil, repeatUntil) ||
                const DeepCollectionEquality()
                    .equals(other.repeatUntil, repeatUntil)) &&
            (identical(other.meals, meals) ||
                const DeepCollectionEquality().equals(other.meals, meals)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(groups) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(cycle) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(repeatUntil) ^
      const DeepCollectionEquality().hash(meals) ^
      runtimeType.hashCode;
}

extension $MenuExtension on Menu {
  Menu copyWith(
      {int? id,
      String? name,
      List<MenuGroup>? groups,
      String? description,
      String? cycle,
      DateTime? startDate,
      DateTime? endDate,
      DateTime? repeatUntil,
      List<Meal>? meals}) {
    return Menu(
        id: id ?? this.id,
        name: name ?? this.name,
        groups: groups ?? this.groups,
        description: description ?? this.description,
        cycle: cycle ?? this.cycle,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        repeatUntil: repeatUntil ?? this.repeatUntil,
        meals: meals ?? this.meals);
  }

  Menu copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String?>? name,
      Wrapped<List<MenuGroup>?>? groups,
      Wrapped<String?>? description,
      Wrapped<String?>? cycle,
      Wrapped<DateTime?>? startDate,
      Wrapped<DateTime?>? endDate,
      Wrapped<DateTime?>? repeatUntil,
      Wrapped<List<Meal>?>? meals}) {
    return Menu(
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name),
        groups: (groups != null ? groups.value : this.groups),
        description:
            (description != null ? description.value : this.description),
        cycle: (cycle != null ? cycle.value : this.cycle),
        startDate: (startDate != null ? startDate.value : this.startDate),
        endDate: (endDate != null ? endDate.value : this.endDate),
        repeatUntil:
            (repeatUntil != null ? repeatUntil.value : this.repeatUntil),
        meals: (meals != null ? meals.value : this.meals));
  }
}

@JsonSerializable(explicitToJson: true)
class MealOccurrence {
  MealOccurrence({
    this.occurrenceDate,
    this.startTime,
    this.endTime,
    this.mealName,
    this.menuId,
    this.mealId,
    this.items,
  });

  factory MealOccurrence.fromJson(Map<String, dynamic> json) =>
      _$MealOccurrenceFromJson(json);

  static const toJsonFactory = _$MealOccurrenceToJson;
  Map<String, dynamic> toJson() => _$MealOccurrenceToJson(this);

  @JsonKey(name: 'occurrence_date', includeIfNull: false, toJson: _dateToJson)
  final DateTime? occurrenceDate;
  @JsonKey(name: 'start_time', includeIfNull: false, defaultValue: '')
  final String? startTime;
  @JsonKey(name: 'end_time', includeIfNull: false, defaultValue: '')
  final String? endTime;
  @JsonKey(name: 'meal_name', includeIfNull: false, defaultValue: '')
  final String? mealName;
  @JsonKey(name: 'menu_id', includeIfNull: false)
  final int? menuId;
  @JsonKey(name: 'meal_id', includeIfNull: false)
  final int? mealId;
  @JsonKey(name: 'items', includeIfNull: false, defaultValue: <MealItem>[])
  final List<MealItem>? items;
  static const fromJsonFactory = _$MealOccurrenceFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MealOccurrence &&
            (identical(other.occurrenceDate, occurrenceDate) ||
                const DeepCollectionEquality()
                    .equals(other.occurrenceDate, occurrenceDate)) &&
            (identical(other.startTime, startTime) ||
                const DeepCollectionEquality()
                    .equals(other.startTime, startTime)) &&
            (identical(other.endTime, endTime) ||
                const DeepCollectionEquality()
                    .equals(other.endTime, endTime)) &&
            (identical(other.mealName, mealName) ||
                const DeepCollectionEquality()
                    .equals(other.mealName, mealName)) &&
            (identical(other.menuId, menuId) ||
                const DeepCollectionEquality().equals(other.menuId, menuId)) &&
            (identical(other.mealId, mealId) ||
                const DeepCollectionEquality().equals(other.mealId, mealId)) &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(occurrenceDate) ^
      const DeepCollectionEquality().hash(startTime) ^
      const DeepCollectionEquality().hash(endTime) ^
      const DeepCollectionEquality().hash(mealName) ^
      const DeepCollectionEquality().hash(menuId) ^
      const DeepCollectionEquality().hash(mealId) ^
      const DeepCollectionEquality().hash(items) ^
      runtimeType.hashCode;
}

extension $MealOccurrenceExtension on MealOccurrence {
  MealOccurrence copyWith(
      {DateTime? occurrenceDate,
      String? startTime,
      String? endTime,
      String? mealName,
      int? menuId,
      int? mealId,
      List<MealItem>? items}) {
    return MealOccurrence(
        occurrenceDate: occurrenceDate ?? this.occurrenceDate,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        mealName: mealName ?? this.mealName,
        menuId: menuId ?? this.menuId,
        mealId: mealId ?? this.mealId,
        items: items ?? this.items);
  }

  MealOccurrence copyWithWrapped(
      {Wrapped<DateTime?>? occurrenceDate,
      Wrapped<String?>? startTime,
      Wrapped<String?>? endTime,
      Wrapped<String?>? mealName,
      Wrapped<int?>? menuId,
      Wrapped<int?>? mealId,
      Wrapped<List<MealItem>?>? items}) {
    return MealOccurrence(
        occurrenceDate: (occurrenceDate != null
            ? occurrenceDate.value
            : this.occurrenceDate),
        startTime: (startTime != null ? startTime.value : this.startTime),
        endTime: (endTime != null ? endTime.value : this.endTime),
        mealName: (mealName != null ? mealName.value : this.mealName),
        menuId: (menuId != null ? menuId.value : this.menuId),
        mealId: (mealId != null ? mealId.value : this.mealId),
        items: (items != null ? items.value : this.items));
  }
}

@JsonSerializable(explicitToJson: true)
class NotificationSerializerUserReadOnly {
  NotificationSerializerUserReadOnly({
    this.id,
    this.created,
    this.subject,
    this.message,
    this.nType,
    this.optionalData,
    this.user,
    this.createdBy,
  });

  factory NotificationSerializerUserReadOnly.fromJson(
          Map<String, dynamic> json) =>
      _$NotificationSerializerUserReadOnlyFromJson(json);

  static const toJsonFactory = _$NotificationSerializerUserReadOnlyToJson;
  Map<String, dynamic> toJson() =>
      _$NotificationSerializerUserReadOnlyToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'created', includeIfNull: false)
  final DateTime? created;
  @JsonKey(name: 'subject', includeIfNull: false, defaultValue: '')
  final String? subject;
  @JsonKey(name: 'message', includeIfNull: false, defaultValue: '')
  final String? message;
  @JsonKey(
    name: 'n_type',
    includeIfNull: false,
    toJson: notificationSerializerUserReadOnlyNTypeToJson,
    fromJson: notificationSerializerUserReadOnlyNTypeFromJson,
  )
  final enums.NotificationSerializerUserReadOnlyNType? nType;
  @JsonKey(name: 'optional_data', includeIfNull: false)
  final Object? optionalData;
  @JsonKey(name: 'user', includeIfNull: false)
  final int? user;
  @JsonKey(name: 'created_by', includeIfNull: false)
  final int? createdBy;
  static const fromJsonFactory = _$NotificationSerializerUserReadOnlyFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NotificationSerializerUserReadOnly &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.created, created) ||
                const DeepCollectionEquality()
                    .equals(other.created, created)) &&
            (identical(other.subject, subject) ||
                const DeepCollectionEquality()
                    .equals(other.subject, subject)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.nType, nType) ||
                const DeepCollectionEquality().equals(other.nType, nType)) &&
            (identical(other.optionalData, optionalData) ||
                const DeepCollectionEquality()
                    .equals(other.optionalData, optionalData)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality()
                    .equals(other.createdBy, createdBy)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(created) ^
      const DeepCollectionEquality().hash(subject) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(nType) ^
      const DeepCollectionEquality().hash(optionalData) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(createdBy) ^
      runtimeType.hashCode;
}

extension $NotificationSerializerUserReadOnlyExtension
    on NotificationSerializerUserReadOnly {
  NotificationSerializerUserReadOnly copyWith(
      {int? id,
      DateTime? created,
      String? subject,
      String? message,
      enums.NotificationSerializerUserReadOnlyNType? nType,
      Object? optionalData,
      int? user,
      int? createdBy}) {
    return NotificationSerializerUserReadOnly(
        id: id ?? this.id,
        created: created ?? this.created,
        subject: subject ?? this.subject,
        message: message ?? this.message,
        nType: nType ?? this.nType,
        optionalData: optionalData ?? this.optionalData,
        user: user ?? this.user,
        createdBy: createdBy ?? this.createdBy);
  }

  NotificationSerializerUserReadOnly copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<DateTime?>? created,
      Wrapped<String?>? subject,
      Wrapped<String?>? message,
      Wrapped<enums.NotificationSerializerUserReadOnlyNType?>? nType,
      Wrapped<Object?>? optionalData,
      Wrapped<int?>? user,
      Wrapped<int?>? createdBy}) {
    return NotificationSerializerUserReadOnly(
        id: (id != null ? id.value : this.id),
        created: (created != null ? created.value : this.created),
        subject: (subject != null ? subject.value : this.subject),
        message: (message != null ? message.value : this.message),
        nType: (nType != null ? nType.value : this.nType),
        optionalData:
            (optionalData != null ? optionalData.value : this.optionalData),
        user: (user != null ? user.value : this.user),
        createdBy: (createdBy != null ? createdBy.value : this.createdBy));
  }
}

@JsonSerializable(explicitToJson: true)
class NotificationSerializerCreate {
  NotificationSerializerCreate({
    this.users,
    this.message,
    this.subject,
  });

  factory NotificationSerializerCreate.fromJson(Map<String, dynamic> json) =>
      _$NotificationSerializerCreateFromJson(json);

  static const toJsonFactory = _$NotificationSerializerCreateToJson;
  Map<String, dynamic> toJson() => _$NotificationSerializerCreateToJson(this);

  @JsonKey(name: 'users', includeIfNull: false, defaultValue: <int>[])
  final List<int>? users;
  @JsonKey(name: 'message', includeIfNull: false, defaultValue: '')
  final String? message;
  @JsonKey(name: 'subject', includeIfNull: false, defaultValue: '')
  final String? subject;
  static const fromJsonFactory = _$NotificationSerializerCreateFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NotificationSerializerCreate &&
            (identical(other.users, users) ||
                const DeepCollectionEquality().equals(other.users, users)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.subject, subject) ||
                const DeepCollectionEquality().equals(other.subject, subject)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(users) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(subject) ^
      runtimeType.hashCode;
}

extension $NotificationSerializerCreateExtension
    on NotificationSerializerCreate {
  NotificationSerializerCreate copyWith(
      {List<int>? users, String? message, String? subject}) {
    return NotificationSerializerCreate(
        users: users ?? this.users,
        message: message ?? this.message,
        subject: subject ?? this.subject);
  }

  NotificationSerializerCreate copyWithWrapped(
      {Wrapped<List<int>?>? users,
      Wrapped<String?>? message,
      Wrapped<String?>? subject}) {
    return NotificationSerializerCreate(
        users: (users != null ? users.value : this.users),
        message: (message != null ? message.value : this.message),
        subject: (subject != null ? subject.value : this.subject));
  }
}

@JsonSerializable(explicitToJson: true)
class Payment {
  Payment({
    this.id,
    this.status,
    this.declinedReason,
    this.issueDate,
    this.settlementDate,
    this.amount,
    this.comment,
    this.payer,
    this.child,
  });

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);

  static const toJsonFactory = _$PaymentToJson;
  Map<String, dynamic> toJson() => _$PaymentToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(
    name: 'status',
    includeIfNull: false,
    toJson: paymentStatusToJson,
    fromJson: paymentStatusFromJson,
  )
  final enums.PaymentStatus? status;
  @JsonKey(
    name: 'declined_reason',
    includeIfNull: false,
    toJson: paymentDeclinedReasonToJson,
    fromJson: paymentDeclinedReasonFromJson,
  )
  final enums.PaymentDeclinedReason? declinedReason;
  @JsonKey(name: 'issue_date', includeIfNull: false)
  final DateTime? issueDate;
  @JsonKey(name: 'settlement_date', includeIfNull: false, toJson: _dateToJson)
  final DateTime? settlementDate;
  @JsonKey(name: 'amount', includeIfNull: false)
  final int? amount;
  @JsonKey(name: 'comment', includeIfNull: false, defaultValue: '')
  final String? comment;
  @JsonKey(name: 'payer', includeIfNull: false, defaultValue: '')
  final String? payer;
  @JsonKey(name: 'child', includeIfNull: false)
  final int? child;
  static const fromJsonFactory = _$PaymentFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Payment &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.declinedReason, declinedReason) ||
                const DeepCollectionEquality()
                    .equals(other.declinedReason, declinedReason)) &&
            (identical(other.issueDate, issueDate) ||
                const DeepCollectionEquality()
                    .equals(other.issueDate, issueDate)) &&
            (identical(other.settlementDate, settlementDate) ||
                const DeepCollectionEquality()
                    .equals(other.settlementDate, settlementDate)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.comment, comment) ||
                const DeepCollectionEquality()
                    .equals(other.comment, comment)) &&
            (identical(other.payer, payer) ||
                const DeepCollectionEquality().equals(other.payer, payer)) &&
            (identical(other.child, child) ||
                const DeepCollectionEquality().equals(other.child, child)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(declinedReason) ^
      const DeepCollectionEquality().hash(issueDate) ^
      const DeepCollectionEquality().hash(settlementDate) ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(comment) ^
      const DeepCollectionEquality().hash(payer) ^
      const DeepCollectionEquality().hash(child) ^
      runtimeType.hashCode;
}

extension $PaymentExtension on Payment {
  Payment copyWith(
      {int? id,
      enums.PaymentStatus? status,
      enums.PaymentDeclinedReason? declinedReason,
      DateTime? issueDate,
      DateTime? settlementDate,
      int? amount,
      String? comment,
      String? payer,
      int? child}) {
    return Payment(
        id: id ?? this.id,
        status: status ?? this.status,
        declinedReason: declinedReason ?? this.declinedReason,
        issueDate: issueDate ?? this.issueDate,
        settlementDate: settlementDate ?? this.settlementDate,
        amount: amount ?? this.amount,
        comment: comment ?? this.comment,
        payer: payer ?? this.payer,
        child: child ?? this.child);
  }

  Payment copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<enums.PaymentStatus?>? status,
      Wrapped<enums.PaymentDeclinedReason?>? declinedReason,
      Wrapped<DateTime?>? issueDate,
      Wrapped<DateTime?>? settlementDate,
      Wrapped<int?>? amount,
      Wrapped<String?>? comment,
      Wrapped<String?>? payer,
      Wrapped<int?>? child}) {
    return Payment(
        id: (id != null ? id.value : this.id),
        status: (status != null ? status.value : this.status),
        declinedReason: (declinedReason != null
            ? declinedReason.value
            : this.declinedReason),
        issueDate: (issueDate != null ? issueDate.value : this.issueDate),
        settlementDate: (settlementDate != null
            ? settlementDate.value
            : this.settlementDate),
        amount: (amount != null ? amount.value : this.amount),
        comment: (comment != null ? comment.value : this.comment),
        payer: (payer != null ? payer.value : this.payer),
        child: (child != null ? child.value : this.child));
  }
}

@JsonSerializable(explicitToJson: true)
class EducatorKindergartenPermission {
  EducatorKindergartenPermission({
    this.id,
    this.menu,
    this.calendar,
    this.educatorContracts,
    this.payments,
    this.presence,
    this.dayEvaluation,
    this.groups,
    this.fastPickup,
    this.childDevelopmentProfile,
    this.posting,
    this.chat,
    this.inscriptions,
    this.parentsFamilyProfile,
    this.educatorProfile,
    this.medicalFileForm,
    this.kindergarten,
    this.educator,
  });

  factory EducatorKindergartenPermission.fromJson(Map<String, dynamic> json) =>
      _$EducatorKindergartenPermissionFromJson(json);

  static const toJsonFactory = _$EducatorKindergartenPermissionToJson;
  Map<String, dynamic> toJson() => _$EducatorKindergartenPermissionToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'menu', includeIfNull: false)
  final int? menu;
  @JsonKey(name: 'calendar', includeIfNull: false)
  final int? calendar;
  @JsonKey(name: 'educator_contracts', includeIfNull: false)
  final int? educatorContracts;
  @JsonKey(name: 'payments', includeIfNull: false)
  final int? payments;
  @JsonKey(name: 'presence', includeIfNull: false)
  final int? presence;
  @JsonKey(name: 'day_evaluation', includeIfNull: false)
  final int? dayEvaluation;
  @JsonKey(name: 'groups', includeIfNull: false)
  final int? groups;
  @JsonKey(name: 'fast_pickup', includeIfNull: false)
  final int? fastPickup;
  @JsonKey(name: 'child_development_profile', includeIfNull: false)
  final int? childDevelopmentProfile;
  @JsonKey(name: 'posting', includeIfNull: false)
  final int? posting;
  @JsonKey(name: 'chat', includeIfNull: false)
  final int? chat;
  @JsonKey(name: 'inscriptions', includeIfNull: false)
  final int? inscriptions;
  @JsonKey(name: 'parents_family_profile', includeIfNull: false)
  final int? parentsFamilyProfile;
  @JsonKey(name: 'educator_profile', includeIfNull: false)
  final int? educatorProfile;
  @JsonKey(name: 'medical_file_form', includeIfNull: false)
  final int? medicalFileForm;
  @JsonKey(name: 'kindergarten', includeIfNull: false, defaultValue: '')
  final String? kindergarten;
  @JsonKey(name: 'educator', includeIfNull: false, defaultValue: '')
  final String? educator;
  static const fromJsonFactory = _$EducatorKindergartenPermissionFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EducatorKindergartenPermission &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.menu, menu) ||
                const DeepCollectionEquality().equals(other.menu, menu)) &&
            (identical(other.calendar, calendar) ||
                const DeepCollectionEquality()
                    .equals(other.calendar, calendar)) &&
            (identical(other.educatorContracts, educatorContracts) ||
                const DeepCollectionEquality()
                    .equals(other.educatorContracts, educatorContracts)) &&
            (identical(other.payments, payments) ||
                const DeepCollectionEquality()
                    .equals(other.payments, payments)) &&
            (identical(other.presence, presence) ||
                const DeepCollectionEquality()
                    .equals(other.presence, presence)) &&
            (identical(other.dayEvaluation, dayEvaluation) ||
                const DeepCollectionEquality()
                    .equals(other.dayEvaluation, dayEvaluation)) &&
            (identical(other.groups, groups) ||
                const DeepCollectionEquality().equals(other.groups, groups)) &&
            (identical(other.fastPickup, fastPickup) ||
                const DeepCollectionEquality()
                    .equals(other.fastPickup, fastPickup)) &&
            (identical(
                    other.childDevelopmentProfile, childDevelopmentProfile) ||
                const DeepCollectionEquality().equals(
                    other.childDevelopmentProfile, childDevelopmentProfile)) &&
            (identical(other.posting, posting) ||
                const DeepCollectionEquality()
                    .equals(other.posting, posting)) &&
            (identical(other.chat, chat) ||
                const DeepCollectionEquality().equals(other.chat, chat)) &&
            (identical(other.inscriptions, inscriptions) ||
                const DeepCollectionEquality()
                    .equals(other.inscriptions, inscriptions)) &&
            (identical(other.parentsFamilyProfile, parentsFamilyProfile) ||
                const DeepCollectionEquality().equals(
                    other.parentsFamilyProfile, parentsFamilyProfile)) &&
            (identical(other.educatorProfile, educatorProfile) ||
                const DeepCollectionEquality()
                    .equals(other.educatorProfile, educatorProfile)) &&
            (identical(other.medicalFileForm, medicalFileForm) ||
                const DeepCollectionEquality()
                    .equals(other.medicalFileForm, medicalFileForm)) &&
            (identical(other.kindergarten, kindergarten) ||
                const DeepCollectionEquality()
                    .equals(other.kindergarten, kindergarten)) &&
            (identical(other.educator, educator) ||
                const DeepCollectionEquality()
                    .equals(other.educator, educator)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(menu) ^
      const DeepCollectionEquality().hash(calendar) ^
      const DeepCollectionEquality().hash(educatorContracts) ^
      const DeepCollectionEquality().hash(payments) ^
      const DeepCollectionEquality().hash(presence) ^
      const DeepCollectionEquality().hash(dayEvaluation) ^
      const DeepCollectionEquality().hash(groups) ^
      const DeepCollectionEquality().hash(fastPickup) ^
      const DeepCollectionEquality().hash(childDevelopmentProfile) ^
      const DeepCollectionEquality().hash(posting) ^
      const DeepCollectionEquality().hash(chat) ^
      const DeepCollectionEquality().hash(inscriptions) ^
      const DeepCollectionEquality().hash(parentsFamilyProfile) ^
      const DeepCollectionEquality().hash(educatorProfile) ^
      const DeepCollectionEquality().hash(medicalFileForm) ^
      const DeepCollectionEquality().hash(kindergarten) ^
      const DeepCollectionEquality().hash(educator) ^
      runtimeType.hashCode;
}

extension $EducatorKindergartenPermissionExtension
    on EducatorKindergartenPermission {
  EducatorKindergartenPermission copyWith(
      {int? id,
      int? menu,
      int? calendar,
      int? educatorContracts,
      int? payments,
      int? presence,
      int? dayEvaluation,
      int? groups,
      int? fastPickup,
      int? childDevelopmentProfile,
      int? posting,
      int? chat,
      int? inscriptions,
      int? parentsFamilyProfile,
      int? educatorProfile,
      int? medicalFileForm,
      String? kindergarten,
      String? educator}) {
    return EducatorKindergartenPermission(
        id: id ?? this.id,
        menu: menu ?? this.menu,
        calendar: calendar ?? this.calendar,
        educatorContracts: educatorContracts ?? this.educatorContracts,
        payments: payments ?? this.payments,
        presence: presence ?? this.presence,
        dayEvaluation: dayEvaluation ?? this.dayEvaluation,
        groups: groups ?? this.groups,
        fastPickup: fastPickup ?? this.fastPickup,
        childDevelopmentProfile:
            childDevelopmentProfile ?? this.childDevelopmentProfile,
        posting: posting ?? this.posting,
        chat: chat ?? this.chat,
        inscriptions: inscriptions ?? this.inscriptions,
        parentsFamilyProfile: parentsFamilyProfile ?? this.parentsFamilyProfile,
        educatorProfile: educatorProfile ?? this.educatorProfile,
        medicalFileForm: medicalFileForm ?? this.medicalFileForm,
        kindergarten: kindergarten ?? this.kindergarten,
        educator: educator ?? this.educator);
  }

  EducatorKindergartenPermission copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<int?>? menu,
      Wrapped<int?>? calendar,
      Wrapped<int?>? educatorContracts,
      Wrapped<int?>? payments,
      Wrapped<int?>? presence,
      Wrapped<int?>? dayEvaluation,
      Wrapped<int?>? groups,
      Wrapped<int?>? fastPickup,
      Wrapped<int?>? childDevelopmentProfile,
      Wrapped<int?>? posting,
      Wrapped<int?>? chat,
      Wrapped<int?>? inscriptions,
      Wrapped<int?>? parentsFamilyProfile,
      Wrapped<int?>? educatorProfile,
      Wrapped<int?>? medicalFileForm,
      Wrapped<String?>? kindergarten,
      Wrapped<String?>? educator}) {
    return EducatorKindergartenPermission(
        id: (id != null ? id.value : this.id),
        menu: (menu != null ? menu.value : this.menu),
        calendar: (calendar != null ? calendar.value : this.calendar),
        educatorContracts: (educatorContracts != null
            ? educatorContracts.value
            : this.educatorContracts),
        payments: (payments != null ? payments.value : this.payments),
        presence: (presence != null ? presence.value : this.presence),
        dayEvaluation:
            (dayEvaluation != null ? dayEvaluation.value : this.dayEvaluation),
        groups: (groups != null ? groups.value : this.groups),
        fastPickup: (fastPickup != null ? fastPickup.value : this.fastPickup),
        childDevelopmentProfile: (childDevelopmentProfile != null
            ? childDevelopmentProfile.value
            : this.childDevelopmentProfile),
        posting: (posting != null ? posting.value : this.posting),
        chat: (chat != null ? chat.value : this.chat),
        inscriptions:
            (inscriptions != null ? inscriptions.value : this.inscriptions),
        parentsFamilyProfile: (parentsFamilyProfile != null
            ? parentsFamilyProfile.value
            : this.parentsFamilyProfile),
        educatorProfile: (educatorProfile != null
            ? educatorProfile.value
            : this.educatorProfile),
        medicalFileForm: (medicalFileForm != null
            ? medicalFileForm.value
            : this.medicalFileForm),
        kindergarten:
            (kindergarten != null ? kindergarten.value : this.kindergarten),
        educator: (educator != null ? educator.value : this.educator));
  }
}

@JsonSerializable(explicitToJson: true)
class ChildMedicalFileMedication {
  ChildMedicalFileMedication({
    this.id,
    this.name,
    this.type,
    this.description,
    this.comments,
  });

  factory ChildMedicalFileMedication.fromJson(Map<String, dynamic> json) =>
      _$ChildMedicalFileMedicationFromJson(json);

  static const toJsonFactory = _$ChildMedicalFileMedicationToJson;
  Map<String, dynamic> toJson() => _$ChildMedicalFileMedicationToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  @JsonKey(name: 'type', includeIfNull: false, defaultValue: '')
  final String? type;
  @JsonKey(name: 'description', includeIfNull: false, defaultValue: '')
  final String? description;
  @JsonKey(name: 'comments', includeIfNull: false, defaultValue: '')
  final String? comments;
  static const fromJsonFactory = _$ChildMedicalFileMedicationFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChildMedicalFileMedication &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.comments, comments) ||
                const DeepCollectionEquality()
                    .equals(other.comments, comments)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(comments) ^
      runtimeType.hashCode;
}

extension $ChildMedicalFileMedicationExtension on ChildMedicalFileMedication {
  ChildMedicalFileMedication copyWith(
      {int? id,
      String? name,
      String? type,
      String? description,
      String? comments}) {
    return ChildMedicalFileMedication(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
        description: description ?? this.description,
        comments: comments ?? this.comments);
  }

  ChildMedicalFileMedication copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String?>? name,
      Wrapped<String?>? type,
      Wrapped<String?>? description,
      Wrapped<String?>? comments}) {
    return ChildMedicalFileMedication(
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name),
        type: (type != null ? type.value : this.type),
        description:
            (description != null ? description.value : this.description),
        comments: (comments != null ? comments.value : this.comments));
  }
}

@JsonSerializable(explicitToJson: true)
class ChildMedicalFileAllergy {
  ChildMedicalFileAllergy({
    this.id,
    this.name,
    this.type,
    this.severity,
    this.description,
    this.comments,
  });

  factory ChildMedicalFileAllergy.fromJson(Map<String, dynamic> json) =>
      _$ChildMedicalFileAllergyFromJson(json);

  static const toJsonFactory = _$ChildMedicalFileAllergyToJson;
  Map<String, dynamic> toJson() => _$ChildMedicalFileAllergyToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  @JsonKey(name: 'type', includeIfNull: false, defaultValue: '')
  final String? type;
  @JsonKey(
    name: 'severity',
    includeIfNull: false,
    toJson: childMedicalFileAllergySeverityToJson,
    fromJson: childMedicalFileAllergySeverityFromJson,
  )
  final enums.ChildMedicalFileAllergySeverity? severity;
  @JsonKey(name: 'description', includeIfNull: false, defaultValue: '')
  final String? description;
  @JsonKey(name: 'comments', includeIfNull: false, defaultValue: '')
  final String? comments;
  static const fromJsonFactory = _$ChildMedicalFileAllergyFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChildMedicalFileAllergy &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.severity, severity) ||
                const DeepCollectionEquality()
                    .equals(other.severity, severity)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.comments, comments) ||
                const DeepCollectionEquality()
                    .equals(other.comments, comments)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(severity) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(comments) ^
      runtimeType.hashCode;
}

extension $ChildMedicalFileAllergyExtension on ChildMedicalFileAllergy {
  ChildMedicalFileAllergy copyWith(
      {int? id,
      String? name,
      String? type,
      enums.ChildMedicalFileAllergySeverity? severity,
      String? description,
      String? comments}) {
    return ChildMedicalFileAllergy(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
        severity: severity ?? this.severity,
        description: description ?? this.description,
        comments: comments ?? this.comments);
  }

  ChildMedicalFileAllergy copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String?>? name,
      Wrapped<String?>? type,
      Wrapped<enums.ChildMedicalFileAllergySeverity?>? severity,
      Wrapped<String?>? description,
      Wrapped<String?>? comments}) {
    return ChildMedicalFileAllergy(
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name),
        type: (type != null ? type.value : this.type),
        severity: (severity != null ? severity.value : this.severity),
        description:
            (description != null ? description.value : this.description),
        comments: (comments != null ? comments.value : this.comments));
  }
}

@JsonSerializable(explicitToJson: true)
class ChildMedicalFileMedicalCondition {
  ChildMedicalFileMedicalCondition({
    this.id,
    this.name,
    this.severity,
    this.description,
    this.comments,
  });

  factory ChildMedicalFileMedicalCondition.fromJson(
          Map<String, dynamic> json) =>
      _$ChildMedicalFileMedicalConditionFromJson(json);

  static const toJsonFactory = _$ChildMedicalFileMedicalConditionToJson;
  Map<String, dynamic> toJson() =>
      _$ChildMedicalFileMedicalConditionToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  @JsonKey(
    name: 'severity',
    includeIfNull: false,
    toJson: childMedicalFileMedicalConditionSeverityToJson,
    fromJson: childMedicalFileMedicalConditionSeverityFromJson,
  )
  final enums.ChildMedicalFileMedicalConditionSeverity? severity;
  @JsonKey(name: 'description', includeIfNull: false, defaultValue: '')
  final String? description;
  @JsonKey(name: 'comments', includeIfNull: false, defaultValue: '')
  final String? comments;
  static const fromJsonFactory = _$ChildMedicalFileMedicalConditionFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChildMedicalFileMedicalCondition &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.severity, severity) ||
                const DeepCollectionEquality()
                    .equals(other.severity, severity)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.comments, comments) ||
                const DeepCollectionEquality()
                    .equals(other.comments, comments)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(severity) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(comments) ^
      runtimeType.hashCode;
}

extension $ChildMedicalFileMedicalConditionExtension
    on ChildMedicalFileMedicalCondition {
  ChildMedicalFileMedicalCondition copyWith(
      {int? id,
      String? name,
      enums.ChildMedicalFileMedicalConditionSeverity? severity,
      String? description,
      String? comments}) {
    return ChildMedicalFileMedicalCondition(
        id: id ?? this.id,
        name: name ?? this.name,
        severity: severity ?? this.severity,
        description: description ?? this.description,
        comments: comments ?? this.comments);
  }

  ChildMedicalFileMedicalCondition copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String?>? name,
      Wrapped<enums.ChildMedicalFileMedicalConditionSeverity?>? severity,
      Wrapped<String?>? description,
      Wrapped<String?>? comments}) {
    return ChildMedicalFileMedicalCondition(
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name),
        severity: (severity != null ? severity.value : this.severity),
        description:
            (description != null ? description.value : this.description),
        comments: (comments != null ? comments.value : this.comments));
  }
}

@JsonSerializable(explicitToJson: true)
class ChildMedicalFile {
  ChildMedicalFile({
    this.medications,
    this.allergies,
    this.medicalConditions,
  });

  factory ChildMedicalFile.fromJson(Map<String, dynamic> json) =>
      _$ChildMedicalFileFromJson(json);

  static const toJsonFactory = _$ChildMedicalFileToJson;
  Map<String, dynamic> toJson() => _$ChildMedicalFileToJson(this);

  @JsonKey(
      name: 'medications',
      includeIfNull: false,
      defaultValue: <ChildMedicalFileMedication>[])
  final List<ChildMedicalFileMedication>? medications;
  @JsonKey(
      name: 'allergies',
      includeIfNull: false,
      defaultValue: <ChildMedicalFileAllergy>[])
  final List<ChildMedicalFileAllergy>? allergies;
  @JsonKey(
      name: 'medical_conditions',
      includeIfNull: false,
      defaultValue: <ChildMedicalFileMedicalCondition>[])
  final List<ChildMedicalFileMedicalCondition>? medicalConditions;
  static const fromJsonFactory = _$ChildMedicalFileFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChildMedicalFile &&
            (identical(other.medications, medications) ||
                const DeepCollectionEquality()
                    .equals(other.medications, medications)) &&
            (identical(other.allergies, allergies) ||
                const DeepCollectionEquality()
                    .equals(other.allergies, allergies)) &&
            (identical(other.medicalConditions, medicalConditions) ||
                const DeepCollectionEquality()
                    .equals(other.medicalConditions, medicalConditions)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(medications) ^
      const DeepCollectionEquality().hash(allergies) ^
      const DeepCollectionEquality().hash(medicalConditions) ^
      runtimeType.hashCode;
}

extension $ChildMedicalFileExtension on ChildMedicalFile {
  ChildMedicalFile copyWith(
      {List<ChildMedicalFileMedication>? medications,
      List<ChildMedicalFileAllergy>? allergies,
      List<ChildMedicalFileMedicalCondition>? medicalConditions}) {
    return ChildMedicalFile(
        medications: medications ?? this.medications,
        allergies: allergies ?? this.allergies,
        medicalConditions: medicalConditions ?? this.medicalConditions);
  }

  ChildMedicalFile copyWithWrapped(
      {Wrapped<List<ChildMedicalFileMedication>?>? medications,
      Wrapped<List<ChildMedicalFileAllergy>?>? allergies,
      Wrapped<List<ChildMedicalFileMedicalCondition>?>? medicalConditions}) {
    return ChildMedicalFile(
        medications:
            (medications != null ? medications.value : this.medications),
        allergies: (allergies != null ? allergies.value : this.allergies),
        medicalConditions: (medicalConditions != null
            ? medicalConditions.value
            : this.medicalConditions));
  }
}

@JsonSerializable(explicitToJson: true)
class Child {
  Child({
    this.id,
    this.deleted,
    this.family,
    this.firstName,
    this.lastName,
    this.birthDate,
    this.sex,
    this.avatar,
    this.medicalFile,
  });

  factory Child.fromJson(Map<String, dynamic> json) => _$ChildFromJson(json);

  static const toJsonFactory = _$ChildToJson;
  Map<String, dynamic> toJson() => _$ChildToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'deleted', includeIfNull: false)
  final bool? deleted;
  @JsonKey(name: 'family', includeIfNull: false)
  final int? family;
  @JsonKey(name: 'first_name', includeIfNull: false, defaultValue: '')
  final String? firstName;
  @JsonKey(name: 'last_name', includeIfNull: false, defaultValue: '')
  final String? lastName;
  @JsonKey(name: 'birth_date', includeIfNull: false)
  final DateTime? birthDate;
  @JsonKey(
    name: 'sex',
    includeIfNull: false,
    toJson: childSexToJson,
    fromJson: childSexFromJson,
  )
  final enums.ChildSex? sex;
  @JsonKey(name: 'avatar', includeIfNull: false, defaultValue: '')
  final String? avatar;
  @JsonKey(name: 'medical_file', includeIfNull: false)
  final ChildMedicalFile? medicalFile;
  static const fromJsonFactory = _$ChildFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Child &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.deleted, deleted) ||
                const DeepCollectionEquality()
                    .equals(other.deleted, deleted)) &&
            (identical(other.family, family) ||
                const DeepCollectionEquality().equals(other.family, family)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.birthDate, birthDate) ||
                const DeepCollectionEquality()
                    .equals(other.birthDate, birthDate)) &&
            (identical(other.sex, sex) ||
                const DeepCollectionEquality().equals(other.sex, sex)) &&
            (identical(other.avatar, avatar) ||
                const DeepCollectionEquality().equals(other.avatar, avatar)) &&
            (identical(other.medicalFile, medicalFile) ||
                const DeepCollectionEquality()
                    .equals(other.medicalFile, medicalFile)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(deleted) ^
      const DeepCollectionEquality().hash(family) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(birthDate) ^
      const DeepCollectionEquality().hash(sex) ^
      const DeepCollectionEquality().hash(avatar) ^
      const DeepCollectionEquality().hash(medicalFile) ^
      runtimeType.hashCode;
}

extension $ChildExtension on Child {
  Child copyWith(
      {int? id,
      bool? deleted,
      int? family,
      String? firstName,
      String? lastName,
      DateTime? birthDate,
      enums.ChildSex? sex,
      String? avatar,
      ChildMedicalFile? medicalFile}) {
    return Child(
        id: id ?? this.id,
        deleted: deleted ?? this.deleted,
        family: family ?? this.family,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        birthDate: birthDate ?? this.birthDate,
        sex: sex ?? this.sex,
        avatar: avatar ?? this.avatar,
        medicalFile: medicalFile ?? this.medicalFile);
  }

  Child copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<bool?>? deleted,
      Wrapped<int?>? family,
      Wrapped<String?>? firstName,
      Wrapped<String?>? lastName,
      Wrapped<DateTime?>? birthDate,
      Wrapped<enums.ChildSex?>? sex,
      Wrapped<String?>? avatar,
      Wrapped<ChildMedicalFile?>? medicalFile}) {
    return Child(
        id: (id != null ? id.value : this.id),
        deleted: (deleted != null ? deleted.value : this.deleted),
        family: (family != null ? family.value : this.family),
        firstName: (firstName != null ? firstName.value : this.firstName),
        lastName: (lastName != null ? lastName.value : this.lastName),
        birthDate: (birthDate != null ? birthDate.value : this.birthDate),
        sex: (sex != null ? sex.value : this.sex),
        avatar: (avatar != null ? avatar.value : this.avatar),
        medicalFile:
            (medicalFile != null ? medicalFile.value : this.medicalFile));
  }
}

@JsonSerializable(explicitToJson: true)
class Address {
  Address({
    this.street,
    this.number,
    this.zipCode,
    this.city,
    this.province,
    this.country,
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  static const toJsonFactory = _$AddressToJson;
  Map<String, dynamic> toJson() => _$AddressToJson(this);

  @JsonKey(name: 'street', includeIfNull: false, defaultValue: '')
  final String? street;
  @JsonKey(name: 'number', includeIfNull: false, defaultValue: '')
  final String? number;
  @JsonKey(name: 'zip_code', includeIfNull: false, defaultValue: '')
  final String? zipCode;
  @JsonKey(name: 'city', includeIfNull: false, defaultValue: '')
  final String? city;
  @JsonKey(name: 'province', includeIfNull: false, defaultValue: '')
  final String? province;
  @JsonKey(name: 'country', includeIfNull: false, defaultValue: '')
  final String? country;
  static const fromJsonFactory = _$AddressFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Address &&
            (identical(other.street, street) ||
                const DeepCollectionEquality().equals(other.street, street)) &&
            (identical(other.number, number) ||
                const DeepCollectionEquality().equals(other.number, number)) &&
            (identical(other.zipCode, zipCode) ||
                const DeepCollectionEquality()
                    .equals(other.zipCode, zipCode)) &&
            (identical(other.city, city) ||
                const DeepCollectionEquality().equals(other.city, city)) &&
            (identical(other.province, province) ||
                const DeepCollectionEquality()
                    .equals(other.province, province)) &&
            (identical(other.country, country) ||
                const DeepCollectionEquality().equals(other.country, country)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(street) ^
      const DeepCollectionEquality().hash(number) ^
      const DeepCollectionEquality().hash(zipCode) ^
      const DeepCollectionEquality().hash(city) ^
      const DeepCollectionEquality().hash(province) ^
      const DeepCollectionEquality().hash(country) ^
      runtimeType.hashCode;
}

extension $AddressExtension on Address {
  Address copyWith(
      {String? street,
      String? number,
      String? zipCode,
      String? city,
      String? province,
      String? country}) {
    return Address(
        street: street ?? this.street,
        number: number ?? this.number,
        zipCode: zipCode ?? this.zipCode,
        city: city ?? this.city,
        province: province ?? this.province,
        country: country ?? this.country);
  }

  Address copyWithWrapped(
      {Wrapped<String?>? street,
      Wrapped<String?>? number,
      Wrapped<String?>? zipCode,
      Wrapped<String?>? city,
      Wrapped<String?>? province,
      Wrapped<String?>? country}) {
    return Address(
        street: (street != null ? street.value : this.street),
        number: (number != null ? number.value : this.number),
        zipCode: (zipCode != null ? zipCode.value : this.zipCode),
        city: (city != null ? city.value : this.city),
        province: (province != null ? province.value : this.province),
        country: (country != null ? country.value : this.country));
  }
}

@JsonSerializable(explicitToJson: true)
class TrustedPerson {
  TrustedPerson({
    this.id,
    this.phone,
    this.address,
    this.avatar,
    this.birthDate,
    this.firstName,
    this.lastName,
    this.sex,
    this.dateJoined,
    this.email,
    this.link,
    this.pickupCode,
    this.family,
  });

  factory TrustedPerson.fromJson(Map<String, dynamic> json) =>
      _$TrustedPersonFromJson(json);

  static const toJsonFactory = _$TrustedPersonToJson;
  Map<String, dynamic> toJson() => _$TrustedPersonToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'phone', includeIfNull: false)
  final TrustedPerson$Phone? phone;
  @JsonKey(name: 'address', includeIfNull: false)
  final Address? address;
  @JsonKey(name: 'avatar', includeIfNull: false, defaultValue: '')
  final String? avatar;
  @JsonKey(name: 'birth_date', includeIfNull: false)
  final DateTime? birthDate;
  @JsonKey(name: 'first_name', includeIfNull: false, defaultValue: '')
  final String? firstName;
  @JsonKey(name: 'last_name', includeIfNull: false, defaultValue: '')
  final String? lastName;
  @JsonKey(
    name: 'sex',
    includeIfNull: false,
    toJson: trustedPersonSexToJson,
    fromJson: trustedPersonSexFromJson,
  )
  final enums.TrustedPersonSex? sex;
  @JsonKey(name: 'date_joined', includeIfNull: false)
  final DateTime? dateJoined;
  @JsonKey(name: 'email', includeIfNull: false, defaultValue: '')
  final String? email;
  @JsonKey(
    name: 'link',
    includeIfNull: false,
    toJson: trustedPersonLinkToJson,
    fromJson: trustedPersonLinkFromJson,
  )
  final enums.TrustedPersonLink? link;
  @JsonKey(name: 'pickup_code', includeIfNull: false, defaultValue: '')
  final String? pickupCode;
  @JsonKey(name: 'family', includeIfNull: false)
  final int? family;
  static const fromJsonFactory = _$TrustedPersonFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TrustedPerson &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.avatar, avatar) ||
                const DeepCollectionEquality().equals(other.avatar, avatar)) &&
            (identical(other.birthDate, birthDate) ||
                const DeepCollectionEquality()
                    .equals(other.birthDate, birthDate)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.sex, sex) ||
                const DeepCollectionEquality().equals(other.sex, sex)) &&
            (identical(other.dateJoined, dateJoined) ||
                const DeepCollectionEquality()
                    .equals(other.dateJoined, dateJoined)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.link, link) ||
                const DeepCollectionEquality().equals(other.link, link)) &&
            (identical(other.pickupCode, pickupCode) ||
                const DeepCollectionEquality()
                    .equals(other.pickupCode, pickupCode)) &&
            (identical(other.family, family) ||
                const DeepCollectionEquality().equals(other.family, family)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(avatar) ^
      const DeepCollectionEquality().hash(birthDate) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(sex) ^
      const DeepCollectionEquality().hash(dateJoined) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(link) ^
      const DeepCollectionEquality().hash(pickupCode) ^
      const DeepCollectionEquality().hash(family) ^
      runtimeType.hashCode;
}

extension $TrustedPersonExtension on TrustedPerson {
  TrustedPerson copyWith(
      {int? id,
      TrustedPerson$Phone? phone,
      Address? address,
      String? avatar,
      DateTime? birthDate,
      String? firstName,
      String? lastName,
      enums.TrustedPersonSex? sex,
      DateTime? dateJoined,
      String? email,
      enums.TrustedPersonLink? link,
      String? pickupCode,
      int? family}) {
    return TrustedPerson(
        id: id ?? this.id,
        phone: phone ?? this.phone,
        address: address ?? this.address,
        avatar: avatar ?? this.avatar,
        birthDate: birthDate ?? this.birthDate,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        sex: sex ?? this.sex,
        dateJoined: dateJoined ?? this.dateJoined,
        email: email ?? this.email,
        link: link ?? this.link,
        pickupCode: pickupCode ?? this.pickupCode,
        family: family ?? this.family);
  }

  TrustedPerson copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<TrustedPerson$Phone?>? phone,
      Wrapped<Address?>? address,
      Wrapped<String?>? avatar,
      Wrapped<DateTime?>? birthDate,
      Wrapped<String?>? firstName,
      Wrapped<String?>? lastName,
      Wrapped<enums.TrustedPersonSex?>? sex,
      Wrapped<DateTime?>? dateJoined,
      Wrapped<String?>? email,
      Wrapped<enums.TrustedPersonLink?>? link,
      Wrapped<String?>? pickupCode,
      Wrapped<int?>? family}) {
    return TrustedPerson(
        id: (id != null ? id.value : this.id),
        phone: (phone != null ? phone.value : this.phone),
        address: (address != null ? address.value : this.address),
        avatar: (avatar != null ? avatar.value : this.avatar),
        birthDate: (birthDate != null ? birthDate.value : this.birthDate),
        firstName: (firstName != null ? firstName.value : this.firstName),
        lastName: (lastName != null ? lastName.value : this.lastName),
        sex: (sex != null ? sex.value : this.sex),
        dateJoined: (dateJoined != null ? dateJoined.value : this.dateJoined),
        email: (email != null ? email.value : this.email),
        link: (link != null ? link.value : this.link),
        pickupCode: (pickupCode != null ? pickupCode.value : this.pickupCode),
        family: (family != null ? family.value : this.family));
  }
}

@JsonSerializable(explicitToJson: true)
class TemporaryTrustedPerson {
  TemporaryTrustedPerson({
    this.id,
    this.firstName,
    this.lastName,
    this.phone,
    this.email,
    this.pickupCode,
    this.createdAt,
    this.familyId,
  });

  factory TemporaryTrustedPerson.fromJson(Map<String, dynamic> json) =>
      _$TemporaryTrustedPersonFromJson(json);

  static const toJsonFactory = _$TemporaryTrustedPersonToJson;
  Map<String, dynamic> toJson() => _$TemporaryTrustedPersonToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'first_name', includeIfNull: false, defaultValue: '')
  final String? firstName;
  @JsonKey(name: 'last_name', includeIfNull: false, defaultValue: '')
  final String? lastName;
  @JsonKey(name: 'phone', includeIfNull: false, defaultValue: '')
  final String? phone;
  @JsonKey(name: 'email', includeIfNull: false, defaultValue: '')
  final String? email;
  @JsonKey(name: 'pickup_code', includeIfNull: false, defaultValue: '')
  final String? pickupCode;
  @JsonKey(name: 'created_at', includeIfNull: false)
  final DateTime? createdAt;
  @JsonKey(name: 'family_id', includeIfNull: false)
  final int? familyId;
  static const fromJsonFactory = _$TemporaryTrustedPersonFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TemporaryTrustedPerson &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.pickupCode, pickupCode) ||
                const DeepCollectionEquality()
                    .equals(other.pickupCode, pickupCode)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.familyId, familyId) ||
                const DeepCollectionEquality()
                    .equals(other.familyId, familyId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(pickupCode) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(familyId) ^
      runtimeType.hashCode;
}

extension $TemporaryTrustedPersonExtension on TemporaryTrustedPerson {
  TemporaryTrustedPerson copyWith(
      {int? id,
      String? firstName,
      String? lastName,
      String? phone,
      String? email,
      String? pickupCode,
      DateTime? createdAt,
      int? familyId}) {
    return TemporaryTrustedPerson(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        pickupCode: pickupCode ?? this.pickupCode,
        createdAt: createdAt ?? this.createdAt,
        familyId: familyId ?? this.familyId);
  }

  TemporaryTrustedPerson copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String?>? firstName,
      Wrapped<String?>? lastName,
      Wrapped<String?>? phone,
      Wrapped<String?>? email,
      Wrapped<String?>? pickupCode,
      Wrapped<DateTime?>? createdAt,
      Wrapped<int?>? familyId}) {
    return TemporaryTrustedPerson(
        id: (id != null ? id.value : this.id),
        firstName: (firstName != null ? firstName.value : this.firstName),
        lastName: (lastName != null ? lastName.value : this.lastName),
        phone: (phone != null ? phone.value : this.phone),
        email: (email != null ? email.value : this.email),
        pickupCode: (pickupCode != null ? pickupCode.value : this.pickupCode),
        createdAt: (createdAt != null ? createdAt.value : this.createdAt),
        familyId: (familyId != null ? familyId.value : this.familyId));
  }
}

@JsonSerializable(explicitToJson: true)
class Parent {
  Parent({
    this.id,
    this.email,
    this.password1,
    this.password2,
    this.isEmailVerified,
    this.parentprofile,
    this.signature,
  });

  factory Parent.fromJson(Map<String, dynamic> json) => _$ParentFromJson(json);

  static const toJsonFactory = _$ParentToJson;
  Map<String, dynamic> toJson() => _$ParentToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'email', includeIfNull: false, defaultValue: '')
  final String? email;
  @JsonKey(name: 'password1', includeIfNull: false, defaultValue: '')
  final String? password1;
  @JsonKey(name: 'password2', includeIfNull: false, defaultValue: '')
  final String? password2;
  @JsonKey(name: 'is_email_verified', includeIfNull: false, defaultValue: '')
  final String? isEmailVerified;
  @JsonKey(name: 'parentprofile', includeIfNull: false, defaultValue: '')
  final String? parentprofile;
  @JsonKey(name: 'signature', includeIfNull: false)
  final int? signature;
  static const fromJsonFactory = _$ParentFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Parent &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password1, password1) ||
                const DeepCollectionEquality()
                    .equals(other.password1, password1)) &&
            (identical(other.password2, password2) ||
                const DeepCollectionEquality()
                    .equals(other.password2, password2)) &&
            (identical(other.isEmailVerified, isEmailVerified) ||
                const DeepCollectionEquality()
                    .equals(other.isEmailVerified, isEmailVerified)) &&
            (identical(other.parentprofile, parentprofile) ||
                const DeepCollectionEquality()
                    .equals(other.parentprofile, parentprofile)) &&
            (identical(other.signature, signature) ||
                const DeepCollectionEquality()
                    .equals(other.signature, signature)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password1) ^
      const DeepCollectionEquality().hash(password2) ^
      const DeepCollectionEquality().hash(isEmailVerified) ^
      const DeepCollectionEquality().hash(parentprofile) ^
      const DeepCollectionEquality().hash(signature) ^
      runtimeType.hashCode;
}

extension $ParentExtension on Parent {
  Parent copyWith(
      {int? id,
      String? email,
      String? password1,
      String? password2,
      String? isEmailVerified,
      String? parentprofile,
      int? signature}) {
    return Parent(
        id: id ?? this.id,
        email: email ?? this.email,
        password1: password1 ?? this.password1,
        password2: password2 ?? this.password2,
        isEmailVerified: isEmailVerified ?? this.isEmailVerified,
        parentprofile: parentprofile ?? this.parentprofile,
        signature: signature ?? this.signature);
  }

  Parent copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String?>? email,
      Wrapped<String?>? password1,
      Wrapped<String?>? password2,
      Wrapped<String?>? isEmailVerified,
      Wrapped<String?>? parentprofile,
      Wrapped<int?>? signature}) {
    return Parent(
        id: (id != null ? id.value : this.id),
        email: (email != null ? email.value : this.email),
        password1: (password1 != null ? password1.value : this.password1),
        password2: (password2 != null ? password2.value : this.password2),
        isEmailVerified: (isEmailVerified != null
            ? isEmailVerified.value
            : this.isEmailVerified),
        parentprofile:
            (parentprofile != null ? parentprofile.value : this.parentprofile),
        signature: (signature != null ? signature.value : this.signature));
  }
}

@JsonSerializable(explicitToJson: true)
class Presence {
  Presence({
    this.id,
    this.child,
    this.clockInTrustedPerson,
    this.clockInTemporaryTrustedPerson,
    this.clockInParent,
    this.clockOutTrustedPerson,
    this.clockOutTemporaryTrustedPerson,
    this.clockOutParent,
    this.date,
    this.clockInTime,
    this.clockOutTime,
    this.absent,
  });

  factory Presence.fromJson(Map<String, dynamic> json) =>
      _$PresenceFromJson(json);

  static const toJsonFactory = _$PresenceToJson;
  Map<String, dynamic> toJson() => _$PresenceToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'child', includeIfNull: false)
  final Child? child;
  @JsonKey(name: 'clock_in_trusted_person', includeIfNull: false)
  final TrustedPerson? clockInTrustedPerson;
  @JsonKey(name: 'clock_in_temporary_trusted_person', includeIfNull: false)
  final TemporaryTrustedPerson? clockInTemporaryTrustedPerson;
  @JsonKey(name: 'clock_in_parent', includeIfNull: false)
  final Parent? clockInParent;
  @JsonKey(name: 'clock_out_trusted_person', includeIfNull: false)
  final TrustedPerson? clockOutTrustedPerson;
  @JsonKey(name: 'clock_out_temporary_trusted_person', includeIfNull: false)
  final TemporaryTrustedPerson? clockOutTemporaryTrustedPerson;
  @JsonKey(name: 'clock_out_parent', includeIfNull: false)
  final Parent? clockOutParent;
  @JsonKey(name: 'date', includeIfNull: false, toJson: _dateToJson)
  final DateTime? date;
  @JsonKey(name: 'clock_in_time', includeIfNull: false, defaultValue: '')
  final String? clockInTime;
  @JsonKey(name: 'clock_out_time', includeIfNull: false, defaultValue: '')
  final String? clockOutTime;
  @JsonKey(name: 'absent', includeIfNull: false)
  final bool? absent;
  static const fromJsonFactory = _$PresenceFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Presence &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.child, child) ||
                const DeepCollectionEquality().equals(other.child, child)) &&
            (identical(other.clockInTrustedPerson, clockInTrustedPerson) ||
                const DeepCollectionEquality().equals(
                    other.clockInTrustedPerson, clockInTrustedPerson)) &&
            (identical(other.clockInTemporaryTrustedPerson,
                    clockInTemporaryTrustedPerson) ||
                const DeepCollectionEquality().equals(
                    other.clockInTemporaryTrustedPerson,
                    clockInTemporaryTrustedPerson)) &&
            (identical(other.clockInParent, clockInParent) ||
                const DeepCollectionEquality()
                    .equals(other.clockInParent, clockInParent)) &&
            (identical(other.clockOutTrustedPerson, clockOutTrustedPerson) ||
                const DeepCollectionEquality().equals(
                    other.clockOutTrustedPerson, clockOutTrustedPerson)) &&
            (identical(other.clockOutTemporaryTrustedPerson,
                    clockOutTemporaryTrustedPerson) ||
                const DeepCollectionEquality().equals(
                    other.clockOutTemporaryTrustedPerson,
                    clockOutTemporaryTrustedPerson)) &&
            (identical(other.clockOutParent, clockOutParent) ||
                const DeepCollectionEquality()
                    .equals(other.clockOutParent, clockOutParent)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.clockInTime, clockInTime) ||
                const DeepCollectionEquality()
                    .equals(other.clockInTime, clockInTime)) &&
            (identical(other.clockOutTime, clockOutTime) ||
                const DeepCollectionEquality()
                    .equals(other.clockOutTime, clockOutTime)) &&
            (identical(other.absent, absent) ||
                const DeepCollectionEquality().equals(other.absent, absent)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(child) ^
      const DeepCollectionEquality().hash(clockInTrustedPerson) ^
      const DeepCollectionEquality().hash(clockInTemporaryTrustedPerson) ^
      const DeepCollectionEquality().hash(clockInParent) ^
      const DeepCollectionEquality().hash(clockOutTrustedPerson) ^
      const DeepCollectionEquality().hash(clockOutTemporaryTrustedPerson) ^
      const DeepCollectionEquality().hash(clockOutParent) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(clockInTime) ^
      const DeepCollectionEquality().hash(clockOutTime) ^
      const DeepCollectionEquality().hash(absent) ^
      runtimeType.hashCode;
}

extension $PresenceExtension on Presence {
  Presence copyWith(
      {int? id,
      Child? child,
      TrustedPerson? clockInTrustedPerson,
      TemporaryTrustedPerson? clockInTemporaryTrustedPerson,
      Parent? clockInParent,
      TrustedPerson? clockOutTrustedPerson,
      TemporaryTrustedPerson? clockOutTemporaryTrustedPerson,
      Parent? clockOutParent,
      DateTime? date,
      String? clockInTime,
      String? clockOutTime,
      bool? absent}) {
    return Presence(
        id: id ?? this.id,
        child: child ?? this.child,
        clockInTrustedPerson: clockInTrustedPerson ?? this.clockInTrustedPerson,
        clockInTemporaryTrustedPerson:
            clockInTemporaryTrustedPerson ?? this.clockInTemporaryTrustedPerson,
        clockInParent: clockInParent ?? this.clockInParent,
        clockOutTrustedPerson:
            clockOutTrustedPerson ?? this.clockOutTrustedPerson,
        clockOutTemporaryTrustedPerson: clockOutTemporaryTrustedPerson ??
            this.clockOutTemporaryTrustedPerson,
        clockOutParent: clockOutParent ?? this.clockOutParent,
        date: date ?? this.date,
        clockInTime: clockInTime ?? this.clockInTime,
        clockOutTime: clockOutTime ?? this.clockOutTime,
        absent: absent ?? this.absent);
  }

  Presence copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<Child?>? child,
      Wrapped<TrustedPerson?>? clockInTrustedPerson,
      Wrapped<TemporaryTrustedPerson?>? clockInTemporaryTrustedPerson,
      Wrapped<Parent?>? clockInParent,
      Wrapped<TrustedPerson?>? clockOutTrustedPerson,
      Wrapped<TemporaryTrustedPerson?>? clockOutTemporaryTrustedPerson,
      Wrapped<Parent?>? clockOutParent,
      Wrapped<DateTime?>? date,
      Wrapped<String?>? clockInTime,
      Wrapped<String?>? clockOutTime,
      Wrapped<bool?>? absent}) {
    return Presence(
        id: (id != null ? id.value : this.id),
        child: (child != null ? child.value : this.child),
        clockInTrustedPerson: (clockInTrustedPerson != null
            ? clockInTrustedPerson.value
            : this.clockInTrustedPerson),
        clockInTemporaryTrustedPerson: (clockInTemporaryTrustedPerson != null
            ? clockInTemporaryTrustedPerson.value
            : this.clockInTemporaryTrustedPerson),
        clockInParent:
            (clockInParent != null ? clockInParent.value : this.clockInParent),
        clockOutTrustedPerson: (clockOutTrustedPerson != null
            ? clockOutTrustedPerson.value
            : this.clockOutTrustedPerson),
        clockOutTemporaryTrustedPerson: (clockOutTemporaryTrustedPerson != null
            ? clockOutTemporaryTrustedPerson.value
            : this.clockOutTemporaryTrustedPerson),
        clockOutParent: (clockOutParent != null
            ? clockOutParent.value
            : this.clockOutParent),
        date: (date != null ? date.value : this.date),
        clockInTime:
            (clockInTime != null ? clockInTime.value : this.clockInTime),
        clockOutTime:
            (clockOutTime != null ? clockOutTime.value : this.clockOutTime),
        absent: (absent != null ? absent.value : this.absent));
  }
}

@JsonSerializable(explicitToJson: true)
class ExpectedPickUp {
  ExpectedPickUp({
    this.id,
    this.startDate,
    this.endDate,
    this.clockIn,
    this.clockOut,
    this.children,
    this.parents,
    this.trustedPersons,
    this.temporaryTrustedPersons,
  });

  factory ExpectedPickUp.fromJson(Map<String, dynamic> json) =>
      _$ExpectedPickUpFromJson(json);

  static const toJsonFactory = _$ExpectedPickUpToJson;
  Map<String, dynamic> toJson() => _$ExpectedPickUpToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'start_date', includeIfNull: false, toJson: _dateToJson)
  final DateTime? startDate;
  @JsonKey(name: 'end_date', includeIfNull: false, toJson: _dateToJson)
  final DateTime? endDate;
  @JsonKey(name: 'clock_in', includeIfNull: false)
  final bool? clockIn;
  @JsonKey(name: 'clock_out', includeIfNull: false)
  final bool? clockOut;
  @JsonKey(name: 'children', includeIfNull: false, defaultValue: <Child>[])
  final List<Child>? children;
  @JsonKey(name: 'parents', includeIfNull: false, defaultValue: <Parent>[])
  final List<Parent>? parents;
  @JsonKey(
      name: 'trusted_persons',
      includeIfNull: false,
      defaultValue: <TrustedPerson>[])
  final List<TrustedPerson>? trustedPersons;
  @JsonKey(name: 'temporary_trusted_persons', includeIfNull: false)
  final TemporaryTrustedPerson? temporaryTrustedPersons;
  static const fromJsonFactory = _$ExpectedPickUpFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExpectedPickUp &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.clockIn, clockIn) ||
                const DeepCollectionEquality()
                    .equals(other.clockIn, clockIn)) &&
            (identical(other.clockOut, clockOut) ||
                const DeepCollectionEquality()
                    .equals(other.clockOut, clockOut)) &&
            (identical(other.children, children) ||
                const DeepCollectionEquality()
                    .equals(other.children, children)) &&
            (identical(other.parents, parents) ||
                const DeepCollectionEquality()
                    .equals(other.parents, parents)) &&
            (identical(other.trustedPersons, trustedPersons) ||
                const DeepCollectionEquality()
                    .equals(other.trustedPersons, trustedPersons)) &&
            (identical(
                    other.temporaryTrustedPersons, temporaryTrustedPersons) ||
                const DeepCollectionEquality().equals(
                    other.temporaryTrustedPersons, temporaryTrustedPersons)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(clockIn) ^
      const DeepCollectionEquality().hash(clockOut) ^
      const DeepCollectionEquality().hash(children) ^
      const DeepCollectionEquality().hash(parents) ^
      const DeepCollectionEquality().hash(trustedPersons) ^
      const DeepCollectionEquality().hash(temporaryTrustedPersons) ^
      runtimeType.hashCode;
}

extension $ExpectedPickUpExtension on ExpectedPickUp {
  ExpectedPickUp copyWith(
      {int? id,
      DateTime? startDate,
      DateTime? endDate,
      bool? clockIn,
      bool? clockOut,
      List<Child>? children,
      List<Parent>? parents,
      List<TrustedPerson>? trustedPersons,
      TemporaryTrustedPerson? temporaryTrustedPersons}) {
    return ExpectedPickUp(
        id: id ?? this.id,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        clockIn: clockIn ?? this.clockIn,
        clockOut: clockOut ?? this.clockOut,
        children: children ?? this.children,
        parents: parents ?? this.parents,
        trustedPersons: trustedPersons ?? this.trustedPersons,
        temporaryTrustedPersons:
            temporaryTrustedPersons ?? this.temporaryTrustedPersons);
  }

  ExpectedPickUp copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<DateTime?>? startDate,
      Wrapped<DateTime?>? endDate,
      Wrapped<bool?>? clockIn,
      Wrapped<bool?>? clockOut,
      Wrapped<List<Child>?>? children,
      Wrapped<List<Parent>?>? parents,
      Wrapped<List<TrustedPerson>?>? trustedPersons,
      Wrapped<TemporaryTrustedPerson?>? temporaryTrustedPersons}) {
    return ExpectedPickUp(
        id: (id != null ? id.value : this.id),
        startDate: (startDate != null ? startDate.value : this.startDate),
        endDate: (endDate != null ? endDate.value : this.endDate),
        clockIn: (clockIn != null ? clockIn.value : this.clockIn),
        clockOut: (clockOut != null ? clockOut.value : this.clockOut),
        children: (children != null ? children.value : this.children),
        parents: (parents != null ? parents.value : this.parents),
        trustedPersons: (trustedPersons != null
            ? trustedPersons.value
            : this.trustedPersons),
        temporaryTrustedPersons: (temporaryTrustedPersons != null
            ? temporaryTrustedPersons.value
            : this.temporaryTrustedPersons));
  }
}

@JsonSerializable(explicitToJson: true)
class TagUser {
  TagUser({
    this.taggedUser,
  });

  factory TagUser.fromJson(Map<String, dynamic> json) =>
      _$TagUserFromJson(json);

  static const toJsonFactory = _$TagUserToJson;
  Map<String, dynamic> toJson() => _$TagUserToJson(this);

  @JsonKey(name: 'tagged_user', includeIfNull: false)
  final int? taggedUser;
  static const fromJsonFactory = _$TagUserFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TagUser &&
            (identical(other.taggedUser, taggedUser) ||
                const DeepCollectionEquality()
                    .equals(other.taggedUser, taggedUser)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(taggedUser) ^ runtimeType.hashCode;
}

extension $TagUserExtension on TagUser {
  TagUser copyWith({int? taggedUser}) {
    return TagUser(taggedUser: taggedUser ?? this.taggedUser);
  }

  TagUser copyWithWrapped({Wrapped<int?>? taggedUser}) {
    return TagUser(
        taggedUser: (taggedUser != null ? taggedUser.value : this.taggedUser));
  }
}

@JsonSerializable(explicitToJson: true)
class TagGroup {
  TagGroup({
    this.taggedGroup,
  });

  factory TagGroup.fromJson(Map<String, dynamic> json) =>
      _$TagGroupFromJson(json);

  static const toJsonFactory = _$TagGroupToJson;
  Map<String, dynamic> toJson() => _$TagGroupToJson(this);

  @JsonKey(name: 'tagged_group', includeIfNull: false)
  final int? taggedGroup;
  static const fromJsonFactory = _$TagGroupFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TagGroup &&
            (identical(other.taggedGroup, taggedGroup) ||
                const DeepCollectionEquality()
                    .equals(other.taggedGroup, taggedGroup)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(taggedGroup) ^ runtimeType.hashCode;
}

extension $TagGroupExtension on TagGroup {
  TagGroup copyWith({int? taggedGroup}) {
    return TagGroup(taggedGroup: taggedGroup ?? this.taggedGroup);
  }

  TagGroup copyWithWrapped({Wrapped<int?>? taggedGroup}) {
    return TagGroup(
        taggedGroup:
            (taggedGroup != null ? taggedGroup.value : this.taggedGroup));
  }
}

@JsonSerializable(explicitToJson: true)
class CommentReaction {
  CommentReaction({
    this.id,
    this.user,
    this.comment,
    this.reaction,
  });

  factory CommentReaction.fromJson(Map<String, dynamic> json) =>
      _$CommentReactionFromJson(json);

  static const toJsonFactory = _$CommentReactionToJson;
  Map<String, dynamic> toJson() => _$CommentReactionToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'user', includeIfNull: false)
  final int? user;
  @JsonKey(name: 'comment', includeIfNull: false)
  final int? comment;
  @JsonKey(
    name: 'reaction',
    includeIfNull: false,
    toJson: commentReactionReactionToJson,
    fromJson: commentReactionReactionFromJson,
  )
  final enums.CommentReactionReaction? reaction;
  static const fromJsonFactory = _$CommentReactionFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CommentReaction &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.comment, comment) ||
                const DeepCollectionEquality()
                    .equals(other.comment, comment)) &&
            (identical(other.reaction, reaction) ||
                const DeepCollectionEquality()
                    .equals(other.reaction, reaction)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(comment) ^
      const DeepCollectionEquality().hash(reaction) ^
      runtimeType.hashCode;
}

extension $CommentReactionExtension on CommentReaction {
  CommentReaction copyWith(
      {int? id,
      int? user,
      int? comment,
      enums.CommentReactionReaction? reaction}) {
    return CommentReaction(
        id: id ?? this.id,
        user: user ?? this.user,
        comment: comment ?? this.comment,
        reaction: reaction ?? this.reaction);
  }

  CommentReaction copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<int?>? user,
      Wrapped<int?>? comment,
      Wrapped<enums.CommentReactionReaction?>? reaction}) {
    return CommentReaction(
        id: (id != null ? id.value : this.id),
        user: (user != null ? user.value : this.user),
        comment: (comment != null ? comment.value : this.comment),
        reaction: (reaction != null ? reaction.value : this.reaction));
  }
}

@JsonSerializable(explicitToJson: true)
class Comment {
  Comment({
    this.id,
    this.user,
    this.publication,
    this.parentComment,
    this.dateCreated,
    this.dateModified,
    this.content,
    this.tagUsers,
    this.tagGroups,
    this.reactions,
    this.deleted,
  });

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  static const toJsonFactory = _$CommentToJson;
  Map<String, dynamic> toJson() => _$CommentToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'user', includeIfNull: false)
  final int? user;
  @JsonKey(name: 'publication', includeIfNull: false)
  final int? publication;
  @JsonKey(name: 'parent_comment', includeIfNull: false)
  final int? parentComment;
  @JsonKey(name: 'date_created', includeIfNull: false)
  final DateTime? dateCreated;
  @JsonKey(name: 'date_modified', includeIfNull: false)
  final DateTime? dateModified;
  @JsonKey(name: 'content', includeIfNull: false, defaultValue: '')
  final String? content;
  @JsonKey(name: 'tag_users', includeIfNull: false, defaultValue: <TagUser>[])
  final List<TagUser>? tagUsers;
  @JsonKey(name: 'tag_groups', includeIfNull: false, defaultValue: <TagGroup>[])
  final List<TagGroup>? tagGroups;
  @JsonKey(
      name: 'reactions',
      includeIfNull: false,
      defaultValue: <CommentReaction>[])
  final List<CommentReaction>? reactions;
  @JsonKey(name: 'deleted', includeIfNull: false)
  final bool? deleted;
  static const fromJsonFactory = _$CommentFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Comment &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.publication, publication) ||
                const DeepCollectionEquality()
                    .equals(other.publication, publication)) &&
            (identical(other.parentComment, parentComment) ||
                const DeepCollectionEquality()
                    .equals(other.parentComment, parentComment)) &&
            (identical(other.dateCreated, dateCreated) ||
                const DeepCollectionEquality()
                    .equals(other.dateCreated, dateCreated)) &&
            (identical(other.dateModified, dateModified) ||
                const DeepCollectionEquality()
                    .equals(other.dateModified, dateModified)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.tagUsers, tagUsers) ||
                const DeepCollectionEquality()
                    .equals(other.tagUsers, tagUsers)) &&
            (identical(other.tagGroups, tagGroups) ||
                const DeepCollectionEquality()
                    .equals(other.tagGroups, tagGroups)) &&
            (identical(other.reactions, reactions) ||
                const DeepCollectionEquality()
                    .equals(other.reactions, reactions)) &&
            (identical(other.deleted, deleted) ||
                const DeepCollectionEquality().equals(other.deleted, deleted)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(publication) ^
      const DeepCollectionEquality().hash(parentComment) ^
      const DeepCollectionEquality().hash(dateCreated) ^
      const DeepCollectionEquality().hash(dateModified) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(tagUsers) ^
      const DeepCollectionEquality().hash(tagGroups) ^
      const DeepCollectionEquality().hash(reactions) ^
      const DeepCollectionEquality().hash(deleted) ^
      runtimeType.hashCode;
}

extension $CommentExtension on Comment {
  Comment copyWith(
      {int? id,
      int? user,
      int? publication,
      int? parentComment,
      DateTime? dateCreated,
      DateTime? dateModified,
      String? content,
      List<TagUser>? tagUsers,
      List<TagGroup>? tagGroups,
      List<CommentReaction>? reactions,
      bool? deleted}) {
    return Comment(
        id: id ?? this.id,
        user: user ?? this.user,
        publication: publication ?? this.publication,
        parentComment: parentComment ?? this.parentComment,
        dateCreated: dateCreated ?? this.dateCreated,
        dateModified: dateModified ?? this.dateModified,
        content: content ?? this.content,
        tagUsers: tagUsers ?? this.tagUsers,
        tagGroups: tagGroups ?? this.tagGroups,
        reactions: reactions ?? this.reactions,
        deleted: deleted ?? this.deleted);
  }

  Comment copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<int?>? user,
      Wrapped<int?>? publication,
      Wrapped<int?>? parentComment,
      Wrapped<DateTime?>? dateCreated,
      Wrapped<DateTime?>? dateModified,
      Wrapped<String?>? content,
      Wrapped<List<TagUser>?>? tagUsers,
      Wrapped<List<TagGroup>?>? tagGroups,
      Wrapped<List<CommentReaction>?>? reactions,
      Wrapped<bool?>? deleted}) {
    return Comment(
        id: (id != null ? id.value : this.id),
        user: (user != null ? user.value : this.user),
        publication:
            (publication != null ? publication.value : this.publication),
        parentComment:
            (parentComment != null ? parentComment.value : this.parentComment),
        dateCreated:
            (dateCreated != null ? dateCreated.value : this.dateCreated),
        dateModified:
            (dateModified != null ? dateModified.value : this.dateModified),
        content: (content != null ? content.value : this.content),
        tagUsers: (tagUsers != null ? tagUsers.value : this.tagUsers),
        tagGroups: (tagGroups != null ? tagGroups.value : this.tagGroups),
        reactions: (reactions != null ? reactions.value : this.reactions),
        deleted: (deleted != null ? deleted.value : this.deleted));
  }
}

@JsonSerializable(explicitToJson: true)
class CommentSerializerUpdate {
  CommentSerializerUpdate({
    this.id,
    this.user,
    this.publication,
    this.parentComment,
    this.dateCreated,
    this.dateModified,
    this.content,
    this.tagUsers,
    this.tagGroups,
    this.reactions,
    this.deleted,
  });

  factory CommentSerializerUpdate.fromJson(Map<String, dynamic> json) =>
      _$CommentSerializerUpdateFromJson(json);

  static const toJsonFactory = _$CommentSerializerUpdateToJson;
  Map<String, dynamic> toJson() => _$CommentSerializerUpdateToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'user', includeIfNull: false)
  final int? user;
  @JsonKey(name: 'publication', includeIfNull: false)
  final int? publication;
  @JsonKey(name: 'parent_comment', includeIfNull: false)
  final int? parentComment;
  @JsonKey(name: 'date_created', includeIfNull: false)
  final DateTime? dateCreated;
  @JsonKey(name: 'date_modified', includeIfNull: false)
  final DateTime? dateModified;
  @JsonKey(name: 'content', includeIfNull: false, defaultValue: '')
  final String? content;
  @JsonKey(name: 'tag_users', includeIfNull: false, defaultValue: <TagUser>[])
  final List<TagUser>? tagUsers;
  @JsonKey(name: 'tag_groups', includeIfNull: false, defaultValue: <TagGroup>[])
  final List<TagGroup>? tagGroups;
  @JsonKey(
      name: 'reactions',
      includeIfNull: false,
      defaultValue: <CommentReaction>[])
  final List<CommentReaction>? reactions;
  @JsonKey(name: 'deleted', includeIfNull: false)
  final bool? deleted;
  static const fromJsonFactory = _$CommentSerializerUpdateFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CommentSerializerUpdate &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.publication, publication) ||
                const DeepCollectionEquality()
                    .equals(other.publication, publication)) &&
            (identical(other.parentComment, parentComment) ||
                const DeepCollectionEquality()
                    .equals(other.parentComment, parentComment)) &&
            (identical(other.dateCreated, dateCreated) ||
                const DeepCollectionEquality()
                    .equals(other.dateCreated, dateCreated)) &&
            (identical(other.dateModified, dateModified) ||
                const DeepCollectionEquality()
                    .equals(other.dateModified, dateModified)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.tagUsers, tagUsers) ||
                const DeepCollectionEquality()
                    .equals(other.tagUsers, tagUsers)) &&
            (identical(other.tagGroups, tagGroups) ||
                const DeepCollectionEquality()
                    .equals(other.tagGroups, tagGroups)) &&
            (identical(other.reactions, reactions) ||
                const DeepCollectionEquality()
                    .equals(other.reactions, reactions)) &&
            (identical(other.deleted, deleted) ||
                const DeepCollectionEquality().equals(other.deleted, deleted)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(publication) ^
      const DeepCollectionEquality().hash(parentComment) ^
      const DeepCollectionEquality().hash(dateCreated) ^
      const DeepCollectionEquality().hash(dateModified) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(tagUsers) ^
      const DeepCollectionEquality().hash(tagGroups) ^
      const DeepCollectionEquality().hash(reactions) ^
      const DeepCollectionEquality().hash(deleted) ^
      runtimeType.hashCode;
}

extension $CommentSerializerUpdateExtension on CommentSerializerUpdate {
  CommentSerializerUpdate copyWith(
      {int? id,
      int? user,
      int? publication,
      int? parentComment,
      DateTime? dateCreated,
      DateTime? dateModified,
      String? content,
      List<TagUser>? tagUsers,
      List<TagGroup>? tagGroups,
      List<CommentReaction>? reactions,
      bool? deleted}) {
    return CommentSerializerUpdate(
        id: id ?? this.id,
        user: user ?? this.user,
        publication: publication ?? this.publication,
        parentComment: parentComment ?? this.parentComment,
        dateCreated: dateCreated ?? this.dateCreated,
        dateModified: dateModified ?? this.dateModified,
        content: content ?? this.content,
        tagUsers: tagUsers ?? this.tagUsers,
        tagGroups: tagGroups ?? this.tagGroups,
        reactions: reactions ?? this.reactions,
        deleted: deleted ?? this.deleted);
  }

  CommentSerializerUpdate copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<int?>? user,
      Wrapped<int?>? publication,
      Wrapped<int?>? parentComment,
      Wrapped<DateTime?>? dateCreated,
      Wrapped<DateTime?>? dateModified,
      Wrapped<String?>? content,
      Wrapped<List<TagUser>?>? tagUsers,
      Wrapped<List<TagGroup>?>? tagGroups,
      Wrapped<List<CommentReaction>?>? reactions,
      Wrapped<bool?>? deleted}) {
    return CommentSerializerUpdate(
        id: (id != null ? id.value : this.id),
        user: (user != null ? user.value : this.user),
        publication:
            (publication != null ? publication.value : this.publication),
        parentComment:
            (parentComment != null ? parentComment.value : this.parentComment),
        dateCreated:
            (dateCreated != null ? dateCreated.value : this.dateCreated),
        dateModified:
            (dateModified != null ? dateModified.value : this.dateModified),
        content: (content != null ? content.value : this.content),
        tagUsers: (tagUsers != null ? tagUsers.value : this.tagUsers),
        tagGroups: (tagGroups != null ? tagGroups.value : this.tagGroups),
        reactions: (reactions != null ? reactions.value : this.reactions),
        deleted: (deleted != null ? deleted.value : this.deleted));
  }
}

@JsonSerializable(explicitToJson: true)
class PostPublicationContent {
  PostPublicationContent({
    this.content,
  });

  factory PostPublicationContent.fromJson(Map<String, dynamic> json) =>
      _$PostPublicationContentFromJson(json);

  static const toJsonFactory = _$PostPublicationContentToJson;
  Map<String, dynamic> toJson() => _$PostPublicationContentToJson(this);

  @JsonKey(name: 'content', includeIfNull: false, defaultValue: '')
  final String? content;
  static const fromJsonFactory = _$PostPublicationContentFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PostPublicationContent &&
            (identical(other.content, content) ||
                const DeepCollectionEquality().equals(other.content, content)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(content) ^ runtimeType.hashCode;
}

extension $PostPublicationContentExtension on PostPublicationContent {
  PostPublicationContent copyWith({String? content}) {
    return PostPublicationContent(content: content ?? this.content);
  }

  PostPublicationContent copyWithWrapped({Wrapped<String?>? content}) {
    return PostPublicationContent(
        content: (content != null ? content.value : this.content));
  }
}

@JsonSerializable(explicitToJson: true)
class IncidentPublicationContent {
  IncidentPublicationContent({
    this.content,
  });

  factory IncidentPublicationContent.fromJson(Map<String, dynamic> json) =>
      _$IncidentPublicationContentFromJson(json);

  static const toJsonFactory = _$IncidentPublicationContentToJson;
  Map<String, dynamic> toJson() => _$IncidentPublicationContentToJson(this);

  @JsonKey(name: 'content', includeIfNull: false, defaultValue: '')
  final String? content;
  static const fromJsonFactory = _$IncidentPublicationContentFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is IncidentPublicationContent &&
            (identical(other.content, content) ||
                const DeepCollectionEquality().equals(other.content, content)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(content) ^ runtimeType.hashCode;
}

extension $IncidentPublicationContentExtension on IncidentPublicationContent {
  IncidentPublicationContent copyWith({String? content}) {
    return IncidentPublicationContent(content: content ?? this.content);
  }

  IncidentPublicationContent copyWithWrapped({Wrapped<String?>? content}) {
    return IncidentPublicationContent(
        content: (content != null ? content.value : this.content));
  }
}

@JsonSerializable(explicitToJson: true)
class PollPublicationContent {
  PollPublicationContent({
    this.content,
  });

  factory PollPublicationContent.fromJson(Map<String, dynamic> json) =>
      _$PollPublicationContentFromJson(json);

  static const toJsonFactory = _$PollPublicationContentToJson;
  Map<String, dynamic> toJson() => _$PollPublicationContentToJson(this);

  @JsonKey(name: 'content', includeIfNull: false, defaultValue: '')
  final String? content;
  static const fromJsonFactory = _$PollPublicationContentFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PollPublicationContent &&
            (identical(other.content, content) ||
                const DeepCollectionEquality().equals(other.content, content)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(content) ^ runtimeType.hashCode;
}

extension $PollPublicationContentExtension on PollPublicationContent {
  PollPublicationContent copyWith({String? content}) {
    return PollPublicationContent(content: content ?? this.content);
  }

  PollPublicationContent copyWithWrapped({Wrapped<String?>? content}) {
    return PollPublicationContent(
        content: (content != null ? content.value : this.content));
  }
}

@JsonSerializable(explicitToJson: true)
class Question {
  Question({
    this.text,
    this.answer,
    this.rating,
    this.notes,
    this.subType,
  });

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  static const toJsonFactory = _$QuestionToJson;
  Map<String, dynamic> toJson() => _$QuestionToJson(this);

  @JsonKey(name: 'text', includeIfNull: false, defaultValue: '')
  final String? text;
  @JsonKey(name: 'answer', includeIfNull: false)
  final int? answer;
  @JsonKey(name: 'rating', includeIfNull: false)
  final int? rating;
  @JsonKey(name: 'notes', includeIfNull: false, defaultValue: '')
  final String? notes;
  @JsonKey(
    name: 'sub_type',
    includeIfNull: false,
    toJson: questionSubTypeToJson,
    fromJson: questionSubTypeFromJson,
  )
  final enums.QuestionSubType? subType;
  static const fromJsonFactory = _$QuestionFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Question &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)) &&
            (identical(other.answer, answer) ||
                const DeepCollectionEquality().equals(other.answer, answer)) &&
            (identical(other.rating, rating) ||
                const DeepCollectionEquality().equals(other.rating, rating)) &&
            (identical(other.notes, notes) ||
                const DeepCollectionEquality().equals(other.notes, notes)) &&
            (identical(other.subType, subType) ||
                const DeepCollectionEquality().equals(other.subType, subType)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(text) ^
      const DeepCollectionEquality().hash(answer) ^
      const DeepCollectionEquality().hash(rating) ^
      const DeepCollectionEquality().hash(notes) ^
      const DeepCollectionEquality().hash(subType) ^
      runtimeType.hashCode;
}

extension $QuestionExtension on Question {
  Question copyWith(
      {String? text,
      int? answer,
      int? rating,
      String? notes,
      enums.QuestionSubType? subType}) {
    return Question(
        text: text ?? this.text,
        answer: answer ?? this.answer,
        rating: rating ?? this.rating,
        notes: notes ?? this.notes,
        subType: subType ?? this.subType);
  }

  Question copyWithWrapped(
      {Wrapped<String?>? text,
      Wrapped<int?>? answer,
      Wrapped<int?>? rating,
      Wrapped<String?>? notes,
      Wrapped<enums.QuestionSubType?>? subType}) {
    return Question(
        text: (text != null ? text.value : this.text),
        answer: (answer != null ? answer.value : this.answer),
        rating: (rating != null ? rating.value : this.rating),
        notes: (notes != null ? notes.value : this.notes),
        subType: (subType != null ? subType.value : this.subType));
  }
}

@JsonSerializable(explicitToJson: true)
class DaySummaryPublicationContent {
  DaySummaryPublicationContent({
    this.content,
    this.questions,
  });

  factory DaySummaryPublicationContent.fromJson(Map<String, dynamic> json) =>
      _$DaySummaryPublicationContentFromJson(json);

  static const toJsonFactory = _$DaySummaryPublicationContentToJson;
  Map<String, dynamic> toJson() => _$DaySummaryPublicationContentToJson(this);

  @JsonKey(name: 'content', includeIfNull: false, defaultValue: '')
  final String? content;
  @JsonKey(name: 'questions', includeIfNull: false, defaultValue: <Question>[])
  final List<Question>? questions;
  static const fromJsonFactory = _$DaySummaryPublicationContentFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DaySummaryPublicationContent &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.questions, questions) ||
                const DeepCollectionEquality()
                    .equals(other.questions, questions)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(questions) ^
      runtimeType.hashCode;
}

extension $DaySummaryPublicationContentExtension
    on DaySummaryPublicationContent {
  DaySummaryPublicationContent copyWith(
      {String? content, List<Question>? questions}) {
    return DaySummaryPublicationContent(
        content: content ?? this.content,
        questions: questions ?? this.questions);
  }

  DaySummaryPublicationContent copyWithWrapped(
      {Wrapped<String?>? content, Wrapped<List<Question>?>? questions}) {
    return DaySummaryPublicationContent(
        content: (content != null ? content.value : this.content),
        questions: (questions != null ? questions.value : this.questions));
  }
}

@JsonSerializable(explicitToJson: true)
class DocOnlyPublicationContent {
  DocOnlyPublicationContent({
    this.postContent,
    this.incidentContent,
    this.pollContent,
    this.daySummaryContent,
  });

  factory DocOnlyPublicationContent.fromJson(Map<String, dynamic> json) =>
      _$DocOnlyPublicationContentFromJson(json);

  static const toJsonFactory = _$DocOnlyPublicationContentToJson;
  Map<String, dynamic> toJson() => _$DocOnlyPublicationContentToJson(this);

  @JsonKey(name: 'post_content', includeIfNull: false)
  final PostPublicationContent? postContent;
  @JsonKey(name: 'incident_content', includeIfNull: false)
  final IncidentPublicationContent? incidentContent;
  @JsonKey(name: 'poll_content', includeIfNull: false)
  final PollPublicationContent? pollContent;
  @JsonKey(name: 'day_summary_content', includeIfNull: false)
  final DaySummaryPublicationContent? daySummaryContent;
  static const fromJsonFactory = _$DocOnlyPublicationContentFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DocOnlyPublicationContent &&
            (identical(other.postContent, postContent) ||
                const DeepCollectionEquality()
                    .equals(other.postContent, postContent)) &&
            (identical(other.incidentContent, incidentContent) ||
                const DeepCollectionEquality()
                    .equals(other.incidentContent, incidentContent)) &&
            (identical(other.pollContent, pollContent) ||
                const DeepCollectionEquality()
                    .equals(other.pollContent, pollContent)) &&
            (identical(other.daySummaryContent, daySummaryContent) ||
                const DeepCollectionEquality()
                    .equals(other.daySummaryContent, daySummaryContent)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(postContent) ^
      const DeepCollectionEquality().hash(incidentContent) ^
      const DeepCollectionEquality().hash(pollContent) ^
      const DeepCollectionEquality().hash(daySummaryContent) ^
      runtimeType.hashCode;
}

extension $DocOnlyPublicationContentExtension on DocOnlyPublicationContent {
  DocOnlyPublicationContent copyWith(
      {PostPublicationContent? postContent,
      IncidentPublicationContent? incidentContent,
      PollPublicationContent? pollContent,
      DaySummaryPublicationContent? daySummaryContent}) {
    return DocOnlyPublicationContent(
        postContent: postContent ?? this.postContent,
        incidentContent: incidentContent ?? this.incidentContent,
        pollContent: pollContent ?? this.pollContent,
        daySummaryContent: daySummaryContent ?? this.daySummaryContent);
  }

  DocOnlyPublicationContent copyWithWrapped(
      {Wrapped<PostPublicationContent?>? postContent,
      Wrapped<IncidentPublicationContent?>? incidentContent,
      Wrapped<PollPublicationContent?>? pollContent,
      Wrapped<DaySummaryPublicationContent?>? daySummaryContent}) {
    return DocOnlyPublicationContent(
        postContent:
            (postContent != null ? postContent.value : this.postContent),
        incidentContent: (incidentContent != null
            ? incidentContent.value
            : this.incidentContent),
        pollContent:
            (pollContent != null ? pollContent.value : this.pollContent),
        daySummaryContent: (daySummaryContent != null
            ? daySummaryContent.value
            : this.daySummaryContent));
  }
}

@JsonSerializable(explicitToJson: true)
class PublicationReaction {
  PublicationReaction({
    this.id,
    this.user,
    this.publication,
    this.reaction,
  });

  factory PublicationReaction.fromJson(Map<String, dynamic> json) =>
      _$PublicationReactionFromJson(json);

  static const toJsonFactory = _$PublicationReactionToJson;
  Map<String, dynamic> toJson() => _$PublicationReactionToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'user', includeIfNull: false)
  final int? user;
  @JsonKey(name: 'publication', includeIfNull: false)
  final int? publication;
  @JsonKey(
    name: 'reaction',
    includeIfNull: false,
    toJson: publicationReactionReactionToJson,
    fromJson: publicationReactionReactionFromJson,
  )
  final enums.PublicationReactionReaction? reaction;
  static const fromJsonFactory = _$PublicationReactionFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PublicationReaction &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.publication, publication) ||
                const DeepCollectionEquality()
                    .equals(other.publication, publication)) &&
            (identical(other.reaction, reaction) ||
                const DeepCollectionEquality()
                    .equals(other.reaction, reaction)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(publication) ^
      const DeepCollectionEquality().hash(reaction) ^
      runtimeType.hashCode;
}

extension $PublicationReactionExtension on PublicationReaction {
  PublicationReaction copyWith(
      {int? id,
      int? user,
      int? publication,
      enums.PublicationReactionReaction? reaction}) {
    return PublicationReaction(
        id: id ?? this.id,
        user: user ?? this.user,
        publication: publication ?? this.publication,
        reaction: reaction ?? this.reaction);
  }

  PublicationReaction copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<int?>? user,
      Wrapped<int?>? publication,
      Wrapped<enums.PublicationReactionReaction?>? reaction}) {
    return PublicationReaction(
        id: (id != null ? id.value : this.id),
        user: (user != null ? user.value : this.user),
        publication:
            (publication != null ? publication.value : this.publication),
        reaction: (reaction != null ? reaction.value : this.reaction));
  }
}

@JsonSerializable(explicitToJson: true)
class QAUserVote {
  QAUserVote({
    this.id,
    this.user,
    this.choice,
  });

  factory QAUserVote.fromJson(Map<String, dynamic> json) =>
      _$QAUserVoteFromJson(json);

  static const toJsonFactory = _$QAUserVoteToJson;
  Map<String, dynamic> toJson() => _$QAUserVoteToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'user', includeIfNull: false)
  final int? user;
  @JsonKey(name: 'choice', includeIfNull: false)
  final int? choice;
  static const fromJsonFactory = _$QAUserVoteFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is QAUserVote &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.choice, choice) ||
                const DeepCollectionEquality().equals(other.choice, choice)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(choice) ^
      runtimeType.hashCode;
}

extension $QAUserVoteExtension on QAUserVote {
  QAUserVote copyWith({int? id, int? user, int? choice}) {
    return QAUserVote(
        id: id ?? this.id,
        user: user ?? this.user,
        choice: choice ?? this.choice);
  }

  QAUserVote copyWithWrapped(
      {Wrapped<int?>? id, Wrapped<int?>? user, Wrapped<int?>? choice}) {
    return QAUserVote(
        id: (id != null ? id.value : this.id),
        user: (user != null ? user.value : this.user),
        choice: (choice != null ? choice.value : this.choice));
  }
}

@JsonSerializable(explicitToJson: true)
class QAChoice {
  QAChoice({
    this.id,
    this.choice,
    this.userVotes,
    this.userVotesCount,
  });

  factory QAChoice.fromJson(Map<String, dynamic> json) =>
      _$QAChoiceFromJson(json);

  static const toJsonFactory = _$QAChoiceToJson;
  Map<String, dynamic> toJson() => _$QAChoiceToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'choice', includeIfNull: false, defaultValue: '')
  final String? choice;
  @JsonKey(
      name: 'user_votes', includeIfNull: false, defaultValue: <QAUserVote>[])
  final List<QAUserVote>? userVotes;
  @JsonKey(name: 'user_votes_count', includeIfNull: false)
  final int? userVotesCount;
  static const fromJsonFactory = _$QAChoiceFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is QAChoice &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.choice, choice) ||
                const DeepCollectionEquality().equals(other.choice, choice)) &&
            (identical(other.userVotes, userVotes) ||
                const DeepCollectionEquality()
                    .equals(other.userVotes, userVotes)) &&
            (identical(other.userVotesCount, userVotesCount) ||
                const DeepCollectionEquality()
                    .equals(other.userVotesCount, userVotesCount)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(choice) ^
      const DeepCollectionEquality().hash(userVotes) ^
      const DeepCollectionEquality().hash(userVotesCount) ^
      runtimeType.hashCode;
}

extension $QAChoiceExtension on QAChoice {
  QAChoice copyWith(
      {int? id,
      String? choice,
      List<QAUserVote>? userVotes,
      int? userVotesCount}) {
    return QAChoice(
        id: id ?? this.id,
        choice: choice ?? this.choice,
        userVotes: userVotes ?? this.userVotes,
        userVotesCount: userVotesCount ?? this.userVotesCount);
  }

  QAChoice copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String?>? choice,
      Wrapped<List<QAUserVote>?>? userVotes,
      Wrapped<int?>? userVotesCount}) {
    return QAChoice(
        id: (id != null ? id.value : this.id),
        choice: (choice != null ? choice.value : this.choice),
        userVotes: (userVotes != null ? userVotes.value : this.userVotes),
        userVotesCount: (userVotesCount != null
            ? userVotesCount.value
            : this.userVotesCount));
  }
}

@JsonSerializable(explicitToJson: true)
class QAVote {
  QAVote({
    this.id,
    this.choices,
    this.mostPopularChoice,
    this.question,
    this.multiChoice,
  });

  factory QAVote.fromJson(Map<String, dynamic> json) => _$QAVoteFromJson(json);

  static const toJsonFactory = _$QAVoteToJson;
  Map<String, dynamic> toJson() => _$QAVoteToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'choices', includeIfNull: false, defaultValue: <QAChoice>[])
  final List<QAChoice>? choices;
  @JsonKey(name: 'most_popular_choice', includeIfNull: false)
  final QAChoice? mostPopularChoice;
  @JsonKey(name: 'question', includeIfNull: false, defaultValue: '')
  final String? question;
  @JsonKey(name: 'multi_choice', includeIfNull: false)
  final bool? multiChoice;
  static const fromJsonFactory = _$QAVoteFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is QAVote &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.choices, choices) ||
                const DeepCollectionEquality()
                    .equals(other.choices, choices)) &&
            (identical(other.mostPopularChoice, mostPopularChoice) ||
                const DeepCollectionEquality()
                    .equals(other.mostPopularChoice, mostPopularChoice)) &&
            (identical(other.question, question) ||
                const DeepCollectionEquality()
                    .equals(other.question, question)) &&
            (identical(other.multiChoice, multiChoice) ||
                const DeepCollectionEquality()
                    .equals(other.multiChoice, multiChoice)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(choices) ^
      const DeepCollectionEquality().hash(mostPopularChoice) ^
      const DeepCollectionEquality().hash(question) ^
      const DeepCollectionEquality().hash(multiChoice) ^
      runtimeType.hashCode;
}

extension $QAVoteExtension on QAVote {
  QAVote copyWith(
      {int? id,
      List<QAChoice>? choices,
      QAChoice? mostPopularChoice,
      String? question,
      bool? multiChoice}) {
    return QAVote(
        id: id ?? this.id,
        choices: choices ?? this.choices,
        mostPopularChoice: mostPopularChoice ?? this.mostPopularChoice,
        question: question ?? this.question,
        multiChoice: multiChoice ?? this.multiChoice);
  }

  QAVote copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<List<QAChoice>?>? choices,
      Wrapped<QAChoice?>? mostPopularChoice,
      Wrapped<String?>? question,
      Wrapped<bool?>? multiChoice}) {
    return QAVote(
        id: (id != null ? id.value : this.id),
        choices: (choices != null ? choices.value : this.choices),
        mostPopularChoice: (mostPopularChoice != null
            ? mostPopularChoice.value
            : this.mostPopularChoice),
        question: (question != null ? question.value : this.question),
        multiChoice:
            (multiChoice != null ? multiChoice.value : this.multiChoice));
  }
}

@JsonSerializable(explicitToJson: true)
class PublicationFile {
  PublicationFile({
    this.id,
    this.file,
  });

  factory PublicationFile.fromJson(Map<String, dynamic> json) =>
      _$PublicationFileFromJson(json);

  static const toJsonFactory = _$PublicationFileToJson;
  Map<String, dynamic> toJson() => _$PublicationFileToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'file', includeIfNull: false, defaultValue: '')
  final String? file;
  static const fromJsonFactory = _$PublicationFileFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PublicationFile &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.file, file) ||
                const DeepCollectionEquality().equals(other.file, file)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(file) ^
      runtimeType.hashCode;
}

extension $PublicationFileExtension on PublicationFile {
  PublicationFile copyWith({int? id, String? file}) {
    return PublicationFile(id: id ?? this.id, file: file ?? this.file);
  }

  PublicationFile copyWithWrapped({Wrapped<int?>? id, Wrapped<String?>? file}) {
    return PublicationFile(
        id: (id != null ? id.value : this.id),
        file: (file != null ? file.value : this.file));
  }
}

@JsonSerializable(explicitToJson: true)
class Publication {
  Publication({
    this.id,
    this.content,
    this.typeVersion,
    this.createdByUser,
    this.dateCreated,
    this.dateModified,
    this.publicized,
    this.comments,
    this.reactions,
    this.tagUsers,
    this.tagGroups,
    this.qaVote,
    this.files,
  });

  factory Publication.fromJson(Map<String, dynamic> json) =>
      _$PublicationFromJson(json);

  static const toJsonFactory = _$PublicationToJson;
  Map<String, dynamic> toJson() => _$PublicationToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'content', includeIfNull: false)
  final Object? content;
  @JsonKey(name: 'type_version', includeIfNull: false, defaultValue: '')
  final String? typeVersion;
  @JsonKey(name: 'created_by_user', includeIfNull: false)
  final int? createdByUser;
  @JsonKey(name: 'date_created', includeIfNull: false)
  final DateTime? dateCreated;
  @JsonKey(name: 'date_modified', includeIfNull: false)
  final DateTime? dateModified;
  @JsonKey(name: 'publicized', includeIfNull: false)
  final bool? publicized;
  @JsonKey(name: 'comments', includeIfNull: false, defaultValue: <Comment>[])
  final List<Comment>? comments;
  @JsonKey(
      name: 'reactions',
      includeIfNull: false,
      defaultValue: <PublicationReaction>[])
  final List<PublicationReaction>? reactions;
  @JsonKey(name: 'tag_users', includeIfNull: false, defaultValue: <TagUser>[])
  final List<TagUser>? tagUsers;
  @JsonKey(name: 'tag_groups', includeIfNull: false, defaultValue: <TagGroup>[])
  final List<TagGroup>? tagGroups;
  @JsonKey(name: 'qa_vote', includeIfNull: false)
  final QAVote? qaVote;
  @JsonKey(
      name: 'files', includeIfNull: false, defaultValue: <PublicationFile>[])
  final List<PublicationFile>? files;
  static const fromJsonFactory = _$PublicationFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Publication &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.typeVersion, typeVersion) ||
                const DeepCollectionEquality()
                    .equals(other.typeVersion, typeVersion)) &&
            (identical(other.createdByUser, createdByUser) ||
                const DeepCollectionEquality()
                    .equals(other.createdByUser, createdByUser)) &&
            (identical(other.dateCreated, dateCreated) ||
                const DeepCollectionEquality()
                    .equals(other.dateCreated, dateCreated)) &&
            (identical(other.dateModified, dateModified) ||
                const DeepCollectionEquality()
                    .equals(other.dateModified, dateModified)) &&
            (identical(other.publicized, publicized) ||
                const DeepCollectionEquality()
                    .equals(other.publicized, publicized)) &&
            (identical(other.comments, comments) ||
                const DeepCollectionEquality()
                    .equals(other.comments, comments)) &&
            (identical(other.reactions, reactions) ||
                const DeepCollectionEquality()
                    .equals(other.reactions, reactions)) &&
            (identical(other.tagUsers, tagUsers) ||
                const DeepCollectionEquality()
                    .equals(other.tagUsers, tagUsers)) &&
            (identical(other.tagGroups, tagGroups) ||
                const DeepCollectionEquality()
                    .equals(other.tagGroups, tagGroups)) &&
            (identical(other.qaVote, qaVote) ||
                const DeepCollectionEquality().equals(other.qaVote, qaVote)) &&
            (identical(other.files, files) ||
                const DeepCollectionEquality().equals(other.files, files)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(typeVersion) ^
      const DeepCollectionEquality().hash(createdByUser) ^
      const DeepCollectionEquality().hash(dateCreated) ^
      const DeepCollectionEquality().hash(dateModified) ^
      const DeepCollectionEquality().hash(publicized) ^
      const DeepCollectionEquality().hash(comments) ^
      const DeepCollectionEquality().hash(reactions) ^
      const DeepCollectionEquality().hash(tagUsers) ^
      const DeepCollectionEquality().hash(tagGroups) ^
      const DeepCollectionEquality().hash(qaVote) ^
      const DeepCollectionEquality().hash(files) ^
      runtimeType.hashCode;
}

extension $PublicationExtension on Publication {
  Publication copyWith(
      {int? id,
      Object? content,
      String? typeVersion,
      int? createdByUser,
      DateTime? dateCreated,
      DateTime? dateModified,
      bool? publicized,
      List<Comment>? comments,
      List<PublicationReaction>? reactions,
      List<TagUser>? tagUsers,
      List<TagGroup>? tagGroups,
      QAVote? qaVote,
      List<PublicationFile>? files}) {
    return Publication(
        id: id ?? this.id,
        content: content ?? this.content,
        typeVersion: typeVersion ?? this.typeVersion,
        createdByUser: createdByUser ?? this.createdByUser,
        dateCreated: dateCreated ?? this.dateCreated,
        dateModified: dateModified ?? this.dateModified,
        publicized: publicized ?? this.publicized,
        comments: comments ?? this.comments,
        reactions: reactions ?? this.reactions,
        tagUsers: tagUsers ?? this.tagUsers,
        tagGroups: tagGroups ?? this.tagGroups,
        qaVote: qaVote ?? this.qaVote,
        files: files ?? this.files);
  }

  Publication copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<Object?>? content,
      Wrapped<String?>? typeVersion,
      Wrapped<int?>? createdByUser,
      Wrapped<DateTime?>? dateCreated,
      Wrapped<DateTime?>? dateModified,
      Wrapped<bool?>? publicized,
      Wrapped<List<Comment>?>? comments,
      Wrapped<List<PublicationReaction>?>? reactions,
      Wrapped<List<TagUser>?>? tagUsers,
      Wrapped<List<TagGroup>?>? tagGroups,
      Wrapped<QAVote?>? qaVote,
      Wrapped<List<PublicationFile>?>? files}) {
    return Publication(
        id: (id != null ? id.value : this.id),
        content: (content != null ? content.value : this.content),
        typeVersion:
            (typeVersion != null ? typeVersion.value : this.typeVersion),
        createdByUser:
            (createdByUser != null ? createdByUser.value : this.createdByUser),
        dateCreated:
            (dateCreated != null ? dateCreated.value : this.dateCreated),
        dateModified:
            (dateModified != null ? dateModified.value : this.dateModified),
        publicized: (publicized != null ? publicized.value : this.publicized),
        comments: (comments != null ? comments.value : this.comments),
        reactions: (reactions != null ? reactions.value : this.reactions),
        tagUsers: (tagUsers != null ? tagUsers.value : this.tagUsers),
        tagGroups: (tagGroups != null ? tagGroups.value : this.tagGroups),
        qaVote: (qaVote != null ? qaVote.value : this.qaVote),
        files: (files != null ? files.value : this.files));
  }
}

@JsonSerializable(explicitToJson: true)
class PublicationUpdate {
  PublicationUpdate({
    this.id,
    this.content,
    this.typeVersion,
    this.createdByUser,
    this.dateCreated,
    this.dateModified,
    this.publicized,
    this.comments,
    this.reactions,
    this.tagUsers,
    this.tagGroups,
    this.qaVote,
    this.files,
  });

  factory PublicationUpdate.fromJson(Map<String, dynamic> json) =>
      _$PublicationUpdateFromJson(json);

  static const toJsonFactory = _$PublicationUpdateToJson;
  Map<String, dynamic> toJson() => _$PublicationUpdateToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'content', includeIfNull: false)
  final Object? content;
  @JsonKey(name: 'type_version', includeIfNull: false, defaultValue: '')
  final String? typeVersion;
  @JsonKey(name: 'created_by_user', includeIfNull: false)
  final int? createdByUser;
  @JsonKey(name: 'date_created', includeIfNull: false)
  final DateTime? dateCreated;
  @JsonKey(name: 'date_modified', includeIfNull: false)
  final DateTime? dateModified;
  @JsonKey(name: 'publicized', includeIfNull: false)
  final bool? publicized;
  @JsonKey(name: 'comments', includeIfNull: false, defaultValue: <Comment>[])
  final List<Comment>? comments;
  @JsonKey(
      name: 'reactions',
      includeIfNull: false,
      defaultValue: <PublicationReaction>[])
  final List<PublicationReaction>? reactions;
  @JsonKey(name: 'tag_users', includeIfNull: false, defaultValue: <TagUser>[])
  final List<TagUser>? tagUsers;
  @JsonKey(name: 'tag_groups', includeIfNull: false, defaultValue: <TagGroup>[])
  final List<TagGroup>? tagGroups;
  @JsonKey(name: 'qa_vote', includeIfNull: false)
  final QAVote? qaVote;
  @JsonKey(
      name: 'files', includeIfNull: false, defaultValue: <PublicationFile>[])
  final List<PublicationFile>? files;
  static const fromJsonFactory = _$PublicationUpdateFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PublicationUpdate &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.typeVersion, typeVersion) ||
                const DeepCollectionEquality()
                    .equals(other.typeVersion, typeVersion)) &&
            (identical(other.createdByUser, createdByUser) ||
                const DeepCollectionEquality()
                    .equals(other.createdByUser, createdByUser)) &&
            (identical(other.dateCreated, dateCreated) ||
                const DeepCollectionEquality()
                    .equals(other.dateCreated, dateCreated)) &&
            (identical(other.dateModified, dateModified) ||
                const DeepCollectionEquality()
                    .equals(other.dateModified, dateModified)) &&
            (identical(other.publicized, publicized) ||
                const DeepCollectionEquality()
                    .equals(other.publicized, publicized)) &&
            (identical(other.comments, comments) ||
                const DeepCollectionEquality()
                    .equals(other.comments, comments)) &&
            (identical(other.reactions, reactions) ||
                const DeepCollectionEquality()
                    .equals(other.reactions, reactions)) &&
            (identical(other.tagUsers, tagUsers) ||
                const DeepCollectionEquality()
                    .equals(other.tagUsers, tagUsers)) &&
            (identical(other.tagGroups, tagGroups) ||
                const DeepCollectionEquality()
                    .equals(other.tagGroups, tagGroups)) &&
            (identical(other.qaVote, qaVote) ||
                const DeepCollectionEquality().equals(other.qaVote, qaVote)) &&
            (identical(other.files, files) ||
                const DeepCollectionEquality().equals(other.files, files)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(typeVersion) ^
      const DeepCollectionEquality().hash(createdByUser) ^
      const DeepCollectionEquality().hash(dateCreated) ^
      const DeepCollectionEquality().hash(dateModified) ^
      const DeepCollectionEquality().hash(publicized) ^
      const DeepCollectionEquality().hash(comments) ^
      const DeepCollectionEquality().hash(reactions) ^
      const DeepCollectionEquality().hash(tagUsers) ^
      const DeepCollectionEquality().hash(tagGroups) ^
      const DeepCollectionEquality().hash(qaVote) ^
      const DeepCollectionEquality().hash(files) ^
      runtimeType.hashCode;
}

extension $PublicationUpdateExtension on PublicationUpdate {
  PublicationUpdate copyWith(
      {int? id,
      Object? content,
      String? typeVersion,
      int? createdByUser,
      DateTime? dateCreated,
      DateTime? dateModified,
      bool? publicized,
      List<Comment>? comments,
      List<PublicationReaction>? reactions,
      List<TagUser>? tagUsers,
      List<TagGroup>? tagGroups,
      QAVote? qaVote,
      List<PublicationFile>? files}) {
    return PublicationUpdate(
        id: id ?? this.id,
        content: content ?? this.content,
        typeVersion: typeVersion ?? this.typeVersion,
        createdByUser: createdByUser ?? this.createdByUser,
        dateCreated: dateCreated ?? this.dateCreated,
        dateModified: dateModified ?? this.dateModified,
        publicized: publicized ?? this.publicized,
        comments: comments ?? this.comments,
        reactions: reactions ?? this.reactions,
        tagUsers: tagUsers ?? this.tagUsers,
        tagGroups: tagGroups ?? this.tagGroups,
        qaVote: qaVote ?? this.qaVote,
        files: files ?? this.files);
  }

  PublicationUpdate copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<Object?>? content,
      Wrapped<String?>? typeVersion,
      Wrapped<int?>? createdByUser,
      Wrapped<DateTime?>? dateCreated,
      Wrapped<DateTime?>? dateModified,
      Wrapped<bool?>? publicized,
      Wrapped<List<Comment>?>? comments,
      Wrapped<List<PublicationReaction>?>? reactions,
      Wrapped<List<TagUser>?>? tagUsers,
      Wrapped<List<TagGroup>?>? tagGroups,
      Wrapped<QAVote?>? qaVote,
      Wrapped<List<PublicationFile>?>? files}) {
    return PublicationUpdate(
        id: (id != null ? id.value : this.id),
        content: (content != null ? content.value : this.content),
        typeVersion:
            (typeVersion != null ? typeVersion.value : this.typeVersion),
        createdByUser:
            (createdByUser != null ? createdByUser.value : this.createdByUser),
        dateCreated:
            (dateCreated != null ? dateCreated.value : this.dateCreated),
        dateModified:
            (dateModified != null ? dateModified.value : this.dateModified),
        publicized: (publicized != null ? publicized.value : this.publicized),
        comments: (comments != null ? comments.value : this.comments),
        reactions: (reactions != null ? reactions.value : this.reactions),
        tagUsers: (tagUsers != null ? tagUsers.value : this.tagUsers),
        tagGroups: (tagGroups != null ? tagGroups.value : this.tagGroups),
        qaVote: (qaVote != null ? qaVote.value : this.qaVote),
        files: (files != null ? files.value : this.files));
  }
}

@JsonSerializable(explicitToJson: true)
class Educator {
  Educator({
    this.id,
    this.email,
    this.isEmailVerified,
    this.password1,
    this.password2,
    this.educatorprofile,
  });

  factory Educator.fromJson(Map<String, dynamic> json) =>
      _$EducatorFromJson(json);

  static const toJsonFactory = _$EducatorToJson;
  Map<String, dynamic> toJson() => _$EducatorToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'email', includeIfNull: false, defaultValue: '')
  final String? email;
  @JsonKey(name: 'is_email_verified', includeIfNull: false, defaultValue: '')
  final String? isEmailVerified;
  @JsonKey(name: 'password1', includeIfNull: false, defaultValue: '')
  final String? password1;
  @JsonKey(name: 'password2', includeIfNull: false, defaultValue: '')
  final String? password2;
  @JsonKey(name: 'educatorprofile', includeIfNull: false)
  final Educator$Educatorprofile? educatorprofile;
  static const fromJsonFactory = _$EducatorFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Educator &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.isEmailVerified, isEmailVerified) ||
                const DeepCollectionEquality()
                    .equals(other.isEmailVerified, isEmailVerified)) &&
            (identical(other.password1, password1) ||
                const DeepCollectionEquality()
                    .equals(other.password1, password1)) &&
            (identical(other.password2, password2) ||
                const DeepCollectionEquality()
                    .equals(other.password2, password2)) &&
            (identical(other.educatorprofile, educatorprofile) ||
                const DeepCollectionEquality()
                    .equals(other.educatorprofile, educatorprofile)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(isEmailVerified) ^
      const DeepCollectionEquality().hash(password1) ^
      const DeepCollectionEquality().hash(password2) ^
      const DeepCollectionEquality().hash(educatorprofile) ^
      runtimeType.hashCode;
}

extension $EducatorExtension on Educator {
  Educator copyWith(
      {int? id,
      String? email,
      String? isEmailVerified,
      String? password1,
      String? password2,
      Educator$Educatorprofile? educatorprofile}) {
    return Educator(
        id: id ?? this.id,
        email: email ?? this.email,
        isEmailVerified: isEmailVerified ?? this.isEmailVerified,
        password1: password1 ?? this.password1,
        password2: password2 ?? this.password2,
        educatorprofile: educatorprofile ?? this.educatorprofile);
  }

  Educator copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String?>? email,
      Wrapped<String?>? isEmailVerified,
      Wrapped<String?>? password1,
      Wrapped<String?>? password2,
      Wrapped<Educator$Educatorprofile?>? educatorprofile}) {
    return Educator(
        id: (id != null ? id.value : this.id),
        email: (email != null ? email.value : this.email),
        isEmailVerified: (isEmailVerified != null
            ? isEmailVerified.value
            : this.isEmailVerified),
        password1: (password1 != null ? password1.value : this.password1),
        password2: (password2 != null ? password2.value : this.password2),
        educatorprofile: (educatorprofile != null
            ? educatorprofile.value
            : this.educatorprofile));
  }
}

@JsonSerializable(explicitToJson: true)
class SearchKindergartenMembers {
  SearchKindergartenMembers({
    this.children,
    this.groups,
    this.parents,
    this.educators,
  });

  factory SearchKindergartenMembers.fromJson(Map<String, dynamic> json) =>
      _$SearchKindergartenMembersFromJson(json);

  static const toJsonFactory = _$SearchKindergartenMembersToJson;
  Map<String, dynamic> toJson() => _$SearchKindergartenMembersToJson(this);

  @JsonKey(name: 'children', includeIfNull: false, defaultValue: <Child>[])
  final List<Child>? children;
  @JsonKey(name: 'groups', includeIfNull: false, defaultValue: <Group>[])
  final List<Group>? groups;
  @JsonKey(name: 'parents', includeIfNull: false, defaultValue: <Parent>[])
  final List<Parent>? parents;
  @JsonKey(name: 'educators', includeIfNull: false, defaultValue: <Educator>[])
  final List<Educator>? educators;
  static const fromJsonFactory = _$SearchKindergartenMembersFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SearchKindergartenMembers &&
            (identical(other.children, children) ||
                const DeepCollectionEquality()
                    .equals(other.children, children)) &&
            (identical(other.groups, groups) ||
                const DeepCollectionEquality().equals(other.groups, groups)) &&
            (identical(other.parents, parents) ||
                const DeepCollectionEquality()
                    .equals(other.parents, parents)) &&
            (identical(other.educators, educators) ||
                const DeepCollectionEquality()
                    .equals(other.educators, educators)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(children) ^
      const DeepCollectionEquality().hash(groups) ^
      const DeepCollectionEquality().hash(parents) ^
      const DeepCollectionEquality().hash(educators) ^
      runtimeType.hashCode;
}

extension $SearchKindergartenMembersExtension on SearchKindergartenMembers {
  SearchKindergartenMembers copyWith(
      {List<Child>? children,
      List<Group>? groups,
      List<Parent>? parents,
      List<Educator>? educators}) {
    return SearchKindergartenMembers(
        children: children ?? this.children,
        groups: groups ?? this.groups,
        parents: parents ?? this.parents,
        educators: educators ?? this.educators);
  }

  SearchKindergartenMembers copyWithWrapped(
      {Wrapped<List<Child>?>? children,
      Wrapped<List<Group>?>? groups,
      Wrapped<List<Parent>?>? parents,
      Wrapped<List<Educator>?>? educators}) {
    return SearchKindergartenMembers(
        children: (children != null ? children.value : this.children),
        groups: (groups != null ? groups.value : this.groups),
        parents: (parents != null ? parents.value : this.parents),
        educators: (educators != null ? educators.value : this.educators));
  }
}

@JsonSerializable(explicitToJson: true)
class ParentSearch {
  ParentSearch({
    this.id,
    this.firstName,
    this.sex,
    this.lastName,
  });

  factory ParentSearch.fromJson(Map<String, dynamic> json) =>
      _$ParentSearchFromJson(json);

  static const toJsonFactory = _$ParentSearchToJson;
  Map<String, dynamic> toJson() => _$ParentSearchToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'first_name', includeIfNull: false, defaultValue: '')
  final String? firstName;
  @JsonKey(name: 'sex', includeIfNull: false, defaultValue: '')
  final String? sex;
  @JsonKey(name: 'last_name', includeIfNull: false, defaultValue: '')
  final String? lastName;
  static const fromJsonFactory = _$ParentSearchFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ParentSearch &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.sex, sex) ||
                const DeepCollectionEquality().equals(other.sex, sex)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(sex) ^
      const DeepCollectionEquality().hash(lastName) ^
      runtimeType.hashCode;
}

extension $ParentSearchExtension on ParentSearch {
  ParentSearch copyWith(
      {int? id, String? firstName, String? sex, String? lastName}) {
    return ParentSearch(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        sex: sex ?? this.sex,
        lastName: lastName ?? this.lastName);
  }

  ParentSearch copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String?>? firstName,
      Wrapped<String?>? sex,
      Wrapped<String?>? lastName}) {
    return ParentSearch(
        id: (id != null ? id.value : this.id),
        firstName: (firstName != null ? firstName.value : this.firstName),
        sex: (sex != null ? sex.value : this.sex),
        lastName: (lastName != null ? lastName.value : this.lastName));
  }
}

@JsonSerializable(explicitToJson: true)
class ChildSearch {
  ChildSearch({
    this.id,
    this.firstName,
    this.lastName,
    this.sex,
    this.birthDate,
    this.parent1,
    this.parent2,
  });

  factory ChildSearch.fromJson(Map<String, dynamic> json) =>
      _$ChildSearchFromJson(json);

  static const toJsonFactory = _$ChildSearchToJson;
  Map<String, dynamic> toJson() => _$ChildSearchToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'first_name', includeIfNull: false, defaultValue: '')
  final String? firstName;
  @JsonKey(name: 'last_name', includeIfNull: false, defaultValue: '')
  final String? lastName;
  @JsonKey(
    name: 'sex',
    includeIfNull: false,
    toJson: childSearchSexToJson,
    fromJson: childSearchSexFromJson,
  )
  final enums.ChildSearchSex? sex;
  @JsonKey(name: 'birth_date', includeIfNull: false)
  final DateTime? birthDate;
  @JsonKey(name: 'parent1', includeIfNull: false)
  final ParentSearch? parent1;
  @JsonKey(name: 'parent2', includeIfNull: false)
  final ParentSearch? parent2;
  static const fromJsonFactory = _$ChildSearchFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChildSearch &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.sex, sex) ||
                const DeepCollectionEquality().equals(other.sex, sex)) &&
            (identical(other.birthDate, birthDate) ||
                const DeepCollectionEquality()
                    .equals(other.birthDate, birthDate)) &&
            (identical(other.parent1, parent1) ||
                const DeepCollectionEquality()
                    .equals(other.parent1, parent1)) &&
            (identical(other.parent2, parent2) ||
                const DeepCollectionEquality().equals(other.parent2, parent2)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(sex) ^
      const DeepCollectionEquality().hash(birthDate) ^
      const DeepCollectionEquality().hash(parent1) ^
      const DeepCollectionEquality().hash(parent2) ^
      runtimeType.hashCode;
}

extension $ChildSearchExtension on ChildSearch {
  ChildSearch copyWith(
      {int? id,
      String? firstName,
      String? lastName,
      enums.ChildSearchSex? sex,
      DateTime? birthDate,
      ParentSearch? parent1,
      ParentSearch? parent2}) {
    return ChildSearch(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        sex: sex ?? this.sex,
        birthDate: birthDate ?? this.birthDate,
        parent1: parent1 ?? this.parent1,
        parent2: parent2 ?? this.parent2);
  }

  ChildSearch copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String?>? firstName,
      Wrapped<String?>? lastName,
      Wrapped<enums.ChildSearchSex?>? sex,
      Wrapped<DateTime?>? birthDate,
      Wrapped<ParentSearch?>? parent1,
      Wrapped<ParentSearch?>? parent2}) {
    return ChildSearch(
        id: (id != null ? id.value : this.id),
        firstName: (firstName != null ? firstName.value : this.firstName),
        lastName: (lastName != null ? lastName.value : this.lastName),
        sex: (sex != null ? sex.value : this.sex),
        birthDate: (birthDate != null ? birthDate.value : this.birthDate),
        parent1: (parent1 != null ? parent1.value : this.parent1),
        parent2: (parent2 != null ? parent2.value : this.parent2));
  }
}

@JsonSerializable(explicitToJson: true)
class ParentProfile {
  ParentProfile({
    this.id,
    this.user,
    this.phone,
    this.address,
    this.avatar,
    this.birthDate,
    this.firstName,
    this.lastName,
    this.sex,
  });

  factory ParentProfile.fromJson(Map<String, dynamic> json) =>
      _$ParentProfileFromJson(json);

  static const toJsonFactory = _$ParentProfileToJson;
  Map<String, dynamic> toJson() => _$ParentProfileToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'user', includeIfNull: false)
  final Parent? user;
  @JsonKey(name: 'phone', includeIfNull: false)
  final ParentProfile$Phone? phone;
  @JsonKey(name: 'address', includeIfNull: false)
  final Address? address;
  @JsonKey(name: 'avatar', includeIfNull: false, defaultValue: '')
  final String? avatar;
  @JsonKey(name: 'birth_date', includeIfNull: false)
  final DateTime? birthDate;
  @JsonKey(name: 'first_name', includeIfNull: false, defaultValue: '')
  final String? firstName;
  @JsonKey(name: 'last_name', includeIfNull: false, defaultValue: '')
  final String? lastName;
  @JsonKey(
    name: 'sex',
    includeIfNull: false,
    toJson: parentProfileSexToJson,
    fromJson: parentProfileSexFromJson,
  )
  final enums.ParentProfileSex? sex;
  static const fromJsonFactory = _$ParentProfileFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ParentProfile &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.avatar, avatar) ||
                const DeepCollectionEquality().equals(other.avatar, avatar)) &&
            (identical(other.birthDate, birthDate) ||
                const DeepCollectionEquality()
                    .equals(other.birthDate, birthDate)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.sex, sex) ||
                const DeepCollectionEquality().equals(other.sex, sex)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(avatar) ^
      const DeepCollectionEquality().hash(birthDate) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(sex) ^
      runtimeType.hashCode;
}

extension $ParentProfileExtension on ParentProfile {
  ParentProfile copyWith(
      {int? id,
      Parent? user,
      ParentProfile$Phone? phone,
      Address? address,
      String? avatar,
      DateTime? birthDate,
      String? firstName,
      String? lastName,
      enums.ParentProfileSex? sex}) {
    return ParentProfile(
        id: id ?? this.id,
        user: user ?? this.user,
        phone: phone ?? this.phone,
        address: address ?? this.address,
        avatar: avatar ?? this.avatar,
        birthDate: birthDate ?? this.birthDate,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        sex: sex ?? this.sex);
  }

  ParentProfile copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<Parent?>? user,
      Wrapped<ParentProfile$Phone?>? phone,
      Wrapped<Address?>? address,
      Wrapped<String?>? avatar,
      Wrapped<DateTime?>? birthDate,
      Wrapped<String?>? firstName,
      Wrapped<String?>? lastName,
      Wrapped<enums.ParentProfileSex?>? sex}) {
    return ParentProfile(
        id: (id != null ? id.value : this.id),
        user: (user != null ? user.value : this.user),
        phone: (phone != null ? phone.value : this.phone),
        address: (address != null ? address.value : this.address),
        avatar: (avatar != null ? avatar.value : this.avatar),
        birthDate: (birthDate != null ? birthDate.value : this.birthDate),
        firstName: (firstName != null ? firstName.value : this.firstName),
        lastName: (lastName != null ? lastName.value : this.lastName),
        sex: (sex != null ? sex.value : this.sex));
  }
}

@JsonSerializable(explicitToJson: true)
class WholeChildFamily {
  WholeChildFamily({
    this.parent1,
    this.parent2,
    this.trustedPerson,
    this.primaryContact,
  });

  factory WholeChildFamily.fromJson(Map<String, dynamic> json) =>
      _$WholeChildFamilyFromJson(json);

  static const toJsonFactory = _$WholeChildFamilyToJson;
  Map<String, dynamic> toJson() => _$WholeChildFamilyToJson(this);

  @JsonKey(name: 'parent1', includeIfNull: false)
  final ParentProfile? parent1;
  @JsonKey(name: 'parent2', includeIfNull: false)
  final ParentProfile? parent2;
  @JsonKey(
      name: 'trusted_person',
      includeIfNull: false,
      defaultValue: <TrustedPerson>[])
  final List<TrustedPerson>? trustedPerson;
  @JsonKey(
    name: 'primary_contact',
    includeIfNull: false,
    toJson: wholeChildFamilyPrimaryContactToJson,
    fromJson: wholeChildFamilyPrimaryContactFromJson,
  )
  final enums.WholeChildFamilyPrimaryContact? primaryContact;
  static const fromJsonFactory = _$WholeChildFamilyFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is WholeChildFamily &&
            (identical(other.parent1, parent1) ||
                const DeepCollectionEquality()
                    .equals(other.parent1, parent1)) &&
            (identical(other.parent2, parent2) ||
                const DeepCollectionEquality()
                    .equals(other.parent2, parent2)) &&
            (identical(other.trustedPerson, trustedPerson) ||
                const DeepCollectionEquality()
                    .equals(other.trustedPerson, trustedPerson)) &&
            (identical(other.primaryContact, primaryContact) ||
                const DeepCollectionEquality()
                    .equals(other.primaryContact, primaryContact)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(parent1) ^
      const DeepCollectionEquality().hash(parent2) ^
      const DeepCollectionEquality().hash(trustedPerson) ^
      const DeepCollectionEquality().hash(primaryContact) ^
      runtimeType.hashCode;
}

extension $WholeChildFamilyExtension on WholeChildFamily {
  WholeChildFamily copyWith(
      {ParentProfile? parent1,
      ParentProfile? parent2,
      List<TrustedPerson>? trustedPerson,
      enums.WholeChildFamilyPrimaryContact? primaryContact}) {
    return WholeChildFamily(
        parent1: parent1 ?? this.parent1,
        parent2: parent2 ?? this.parent2,
        trustedPerson: trustedPerson ?? this.trustedPerson,
        primaryContact: primaryContact ?? this.primaryContact);
  }

  WholeChildFamily copyWithWrapped(
      {Wrapped<ParentProfile?>? parent1,
      Wrapped<ParentProfile?>? parent2,
      Wrapped<List<TrustedPerson>?>? trustedPerson,
      Wrapped<enums.WholeChildFamilyPrimaryContact?>? primaryContact}) {
    return WholeChildFamily(
        parent1: (parent1 != null ? parent1.value : this.parent1),
        parent2: (parent2 != null ? parent2.value : this.parent2),
        trustedPerson:
            (trustedPerson != null ? trustedPerson.value : this.trustedPerson),
        primaryContact: (primaryContact != null
            ? primaryContact.value
            : this.primaryContact));
  }
}

@JsonSerializable(explicitToJson: true)
class WholeChild {
  WholeChild({
    this.schedule,
    this.medicalFile,
    this.notes,
    this.historyLog,
    this.family,
    this.siblings,
    this.firstName,
    this.lastName,
    this.birthDate,
    this.sex,
    this.avatar,
    this.group,
  });

  factory WholeChild.fromJson(Map<String, dynamic> json) =>
      _$WholeChildFromJson(json);

  static const toJsonFactory = _$WholeChildToJson;
  Map<String, dynamic> toJson() => _$WholeChildToJson(this);

  @JsonKey(name: 'schedule', includeIfNull: false, defaultValue: '')
  final String? schedule;
  @JsonKey(name: 'medical_file', includeIfNull: false)
  final ChildMedicalFile? medicalFile;
  @JsonKey(name: 'notes', includeIfNull: false, defaultValue: '')
  final String? notes;
  @JsonKey(name: 'history_log', includeIfNull: false, defaultValue: '')
  final String? historyLog;
  @JsonKey(name: 'family', includeIfNull: false)
  final WholeChildFamily? family;
  @JsonKey(name: 'siblings', includeIfNull: false, defaultValue: '')
  final String? siblings;
  @JsonKey(name: 'first_name', includeIfNull: false, defaultValue: '')
  final String? firstName;
  @JsonKey(name: 'last_name', includeIfNull: false, defaultValue: '')
  final String? lastName;
  @JsonKey(name: 'birth_date', includeIfNull: false)
  final DateTime? birthDate;
  @JsonKey(
    name: 'sex',
    includeIfNull: false,
    toJson: wholeChildSexToJson,
    fromJson: wholeChildSexFromJson,
  )
  final enums.WholeChildSex? sex;
  @JsonKey(name: 'avatar', includeIfNull: false, defaultValue: '')
  final String? avatar;
  @JsonKey(name: 'group', includeIfNull: false, defaultValue: '')
  final String? group;
  static const fromJsonFactory = _$WholeChildFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is WholeChild &&
            (identical(other.schedule, schedule) ||
                const DeepCollectionEquality()
                    .equals(other.schedule, schedule)) &&
            (identical(other.medicalFile, medicalFile) ||
                const DeepCollectionEquality()
                    .equals(other.medicalFile, medicalFile)) &&
            (identical(other.notes, notes) ||
                const DeepCollectionEquality().equals(other.notes, notes)) &&
            (identical(other.historyLog, historyLog) ||
                const DeepCollectionEquality()
                    .equals(other.historyLog, historyLog)) &&
            (identical(other.family, family) ||
                const DeepCollectionEquality().equals(other.family, family)) &&
            (identical(other.siblings, siblings) ||
                const DeepCollectionEquality()
                    .equals(other.siblings, siblings)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.birthDate, birthDate) ||
                const DeepCollectionEquality()
                    .equals(other.birthDate, birthDate)) &&
            (identical(other.sex, sex) ||
                const DeepCollectionEquality().equals(other.sex, sex)) &&
            (identical(other.avatar, avatar) ||
                const DeepCollectionEquality().equals(other.avatar, avatar)) &&
            (identical(other.group, group) ||
                const DeepCollectionEquality().equals(other.group, group)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(schedule) ^
      const DeepCollectionEquality().hash(medicalFile) ^
      const DeepCollectionEquality().hash(notes) ^
      const DeepCollectionEquality().hash(historyLog) ^
      const DeepCollectionEquality().hash(family) ^
      const DeepCollectionEquality().hash(siblings) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(birthDate) ^
      const DeepCollectionEquality().hash(sex) ^
      const DeepCollectionEquality().hash(avatar) ^
      const DeepCollectionEquality().hash(group) ^
      runtimeType.hashCode;
}

extension $WholeChildExtension on WholeChild {
  WholeChild copyWith(
      {String? schedule,
      ChildMedicalFile? medicalFile,
      String? notes,
      String? historyLog,
      WholeChildFamily? family,
      String? siblings,
      String? firstName,
      String? lastName,
      DateTime? birthDate,
      enums.WholeChildSex? sex,
      String? avatar,
      String? group}) {
    return WholeChild(
        schedule: schedule ?? this.schedule,
        medicalFile: medicalFile ?? this.medicalFile,
        notes: notes ?? this.notes,
        historyLog: historyLog ?? this.historyLog,
        family: family ?? this.family,
        siblings: siblings ?? this.siblings,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        birthDate: birthDate ?? this.birthDate,
        sex: sex ?? this.sex,
        avatar: avatar ?? this.avatar,
        group: group ?? this.group);
  }

  WholeChild copyWithWrapped(
      {Wrapped<String?>? schedule,
      Wrapped<ChildMedicalFile?>? medicalFile,
      Wrapped<String?>? notes,
      Wrapped<String?>? historyLog,
      Wrapped<WholeChildFamily?>? family,
      Wrapped<String?>? siblings,
      Wrapped<String?>? firstName,
      Wrapped<String?>? lastName,
      Wrapped<DateTime?>? birthDate,
      Wrapped<enums.WholeChildSex?>? sex,
      Wrapped<String?>? avatar,
      Wrapped<String?>? group}) {
    return WholeChild(
        schedule: (schedule != null ? schedule.value : this.schedule),
        medicalFile:
            (medicalFile != null ? medicalFile.value : this.medicalFile),
        notes: (notes != null ? notes.value : this.notes),
        historyLog: (historyLog != null ? historyLog.value : this.historyLog),
        family: (family != null ? family.value : this.family),
        siblings: (siblings != null ? siblings.value : this.siblings),
        firstName: (firstName != null ? firstName.value : this.firstName),
        lastName: (lastName != null ? lastName.value : this.lastName),
        birthDate: (birthDate != null ? birthDate.value : this.birthDate),
        sex: (sex != null ? sex.value : this.sex),
        avatar: (avatar != null ? avatar.value : this.avatar),
        group: (group != null ? group.value : this.group));
  }
}

@JsonSerializable(explicitToJson: true)
class ChatGroupsGet$Response {
  ChatGroupsGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory ChatGroupsGet$Response.fromJson(Map<String, dynamic> json) =>
      _$ChatGroupsGet$ResponseFromJson(json);

  static const toJsonFactory = _$ChatGroupsGet$ResponseToJson;
  Map<String, dynamic> toJson() => _$ChatGroupsGet$ResponseToJson(this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(name: 'results', includeIfNull: false, defaultValue: <ChatGroup>[])
  final List<ChatGroup>? results;
  static const fromJsonFactory = _$ChatGroupsGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChatGroupsGet$Response &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.next, next) ||
                const DeepCollectionEquality().equals(other.next, next)) &&
            (identical(other.previous, previous) ||
                const DeepCollectionEquality()
                    .equals(other.previous, previous)) &&
            (identical(other.results, results) ||
                const DeepCollectionEquality().equals(other.results, results)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(next) ^
      const DeepCollectionEquality().hash(previous) ^
      const DeepCollectionEquality().hash(results) ^
      runtimeType.hashCode;
}

extension $ChatGroupsGet$ResponseExtension on ChatGroupsGet$Response {
  ChatGroupsGet$Response copyWith(
      {int? count, String? next, String? previous, List<ChatGroup>? results}) {
    return ChatGroupsGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  ChatGroupsGet$Response copyWithWrapped(
      {Wrapped<int?>? count,
      Wrapped<String?>? next,
      Wrapped<String?>? previous,
      Wrapped<List<ChatGroup>?>? results}) {
    return ChatGroupsGet$Response(
        count: (count != null ? count.value : this.count),
        next: (next != null ? next.value : this.next),
        previous: (previous != null ? previous.value : this.previous),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class ChatGroupsGroupIdMessagesGet$Response {
  ChatGroupsGroupIdMessagesGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory ChatGroupsGroupIdMessagesGet$Response.fromJson(
          Map<String, dynamic> json) =>
      _$ChatGroupsGroupIdMessagesGet$ResponseFromJson(json);

  static const toJsonFactory = _$ChatGroupsGroupIdMessagesGet$ResponseToJson;
  Map<String, dynamic> toJson() =>
      _$ChatGroupsGroupIdMessagesGet$ResponseToJson(this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(name: 'results', includeIfNull: false, defaultValue: <ChatMessage>[])
  final List<ChatMessage>? results;
  static const fromJsonFactory =
      _$ChatGroupsGroupIdMessagesGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChatGroupsGroupIdMessagesGet$Response &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.next, next) ||
                const DeepCollectionEquality().equals(other.next, next)) &&
            (identical(other.previous, previous) ||
                const DeepCollectionEquality()
                    .equals(other.previous, previous)) &&
            (identical(other.results, results) ||
                const DeepCollectionEquality().equals(other.results, results)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(next) ^
      const DeepCollectionEquality().hash(previous) ^
      const DeepCollectionEquality().hash(results) ^
      runtimeType.hashCode;
}

extension $ChatGroupsGroupIdMessagesGet$ResponseExtension
    on ChatGroupsGroupIdMessagesGet$Response {
  ChatGroupsGroupIdMessagesGet$Response copyWith(
      {int? count,
      String? next,
      String? previous,
      List<ChatMessage>? results}) {
    return ChatGroupsGroupIdMessagesGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  ChatGroupsGroupIdMessagesGet$Response copyWithWrapped(
      {Wrapped<int?>? count,
      Wrapped<String?>? next,
      Wrapped<String?>? previous,
      Wrapped<List<ChatMessage>?>? results}) {
    return ChatGroupsGroupIdMessagesGet$Response(
        count: (count != null ? count.value : this.count),
        next: (next != null ? next.value : this.next),
        previous: (previous != null ? previous.value : this.previous),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class ChatGroupsGroupIdMessagesUploadGet$Response {
  ChatGroupsGroupIdMessagesUploadGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory ChatGroupsGroupIdMessagesUploadGet$Response.fromJson(
          Map<String, dynamic> json) =>
      _$ChatGroupsGroupIdMessagesUploadGet$ResponseFromJson(json);

  static const toJsonFactory =
      _$ChatGroupsGroupIdMessagesUploadGet$ResponseToJson;
  Map<String, dynamic> toJson() =>
      _$ChatGroupsGroupIdMessagesUploadGet$ResponseToJson(this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(
      name: 'results', includeIfNull: false, defaultValue: <ChatMessageFile>[])
  final List<ChatMessageFile>? results;
  static const fromJsonFactory =
      _$ChatGroupsGroupIdMessagesUploadGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChatGroupsGroupIdMessagesUploadGet$Response &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.next, next) ||
                const DeepCollectionEquality().equals(other.next, next)) &&
            (identical(other.previous, previous) ||
                const DeepCollectionEquality()
                    .equals(other.previous, previous)) &&
            (identical(other.results, results) ||
                const DeepCollectionEquality().equals(other.results, results)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(next) ^
      const DeepCollectionEquality().hash(previous) ^
      const DeepCollectionEquality().hash(results) ^
      runtimeType.hashCode;
}

extension $ChatGroupsGroupIdMessagesUploadGet$ResponseExtension
    on ChatGroupsGroupIdMessagesUploadGet$Response {
  ChatGroupsGroupIdMessagesUploadGet$Response copyWith(
      {int? count,
      String? next,
      String? previous,
      List<ChatMessageFile>? results}) {
    return ChatGroupsGroupIdMessagesUploadGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  ChatGroupsGroupIdMessagesUploadGet$Response copyWithWrapped(
      {Wrapped<int?>? count,
      Wrapped<String?>? next,
      Wrapped<String?>? previous,
      Wrapped<List<ChatMessageFile>?>? results}) {
    return ChatGroupsGroupIdMessagesUploadGet$Response(
        count: (count != null ? count.value : this.count),
        next: (next != null ? next.value : this.next),
        previous: (previous != null ? previous.value : this.previous),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class ChatGroupsGroupIdSharedLinksGet$Response {
  ChatGroupsGroupIdSharedLinksGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory ChatGroupsGroupIdSharedLinksGet$Response.fromJson(
          Map<String, dynamic> json) =>
      _$ChatGroupsGroupIdSharedLinksGet$ResponseFromJson(json);

  static const toJsonFactory = _$ChatGroupsGroupIdSharedLinksGet$ResponseToJson;
  Map<String, dynamic> toJson() =>
      _$ChatGroupsGroupIdSharedLinksGet$ResponseToJson(this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(name: 'results', includeIfNull: false, defaultValue: <SharedLink>[])
  final List<SharedLink>? results;
  static const fromJsonFactory =
      _$ChatGroupsGroupIdSharedLinksGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChatGroupsGroupIdSharedLinksGet$Response &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.next, next) ||
                const DeepCollectionEquality().equals(other.next, next)) &&
            (identical(other.previous, previous) ||
                const DeepCollectionEquality()
                    .equals(other.previous, previous)) &&
            (identical(other.results, results) ||
                const DeepCollectionEquality().equals(other.results, results)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(next) ^
      const DeepCollectionEquality().hash(previous) ^
      const DeepCollectionEquality().hash(results) ^
      runtimeType.hashCode;
}

extension $ChatGroupsGroupIdSharedLinksGet$ResponseExtension
    on ChatGroupsGroupIdSharedLinksGet$Response {
  ChatGroupsGroupIdSharedLinksGet$Response copyWith(
      {int? count, String? next, String? previous, List<SharedLink>? results}) {
    return ChatGroupsGroupIdSharedLinksGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  ChatGroupsGroupIdSharedLinksGet$Response copyWithWrapped(
      {Wrapped<int?>? count,
      Wrapped<String?>? next,
      Wrapped<String?>? previous,
      Wrapped<List<SharedLink>?>? results}) {
    return ChatGroupsGroupIdSharedLinksGet$Response(
        count: (count != null ? count.value : this.count),
        next: (next != null ? next.value : this.next),
        previous: (previous != null ? previous.value : this.previous),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class ChildDailySummaryGet$Response {
  ChildDailySummaryGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory ChildDailySummaryGet$Response.fromJson(Map<String, dynamic> json) =>
      _$ChildDailySummaryGet$ResponseFromJson(json);

  static const toJsonFactory = _$ChildDailySummaryGet$ResponseToJson;
  Map<String, dynamic> toJson() => _$ChildDailySummaryGet$ResponseToJson(this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(name: 'results', includeIfNull: false, defaultValue: <DaySummary>[])
  final List<DaySummary>? results;
  static const fromJsonFactory = _$ChildDailySummaryGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChildDailySummaryGet$Response &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.next, next) ||
                const DeepCollectionEquality().equals(other.next, next)) &&
            (identical(other.previous, previous) ||
                const DeepCollectionEquality()
                    .equals(other.previous, previous)) &&
            (identical(other.results, results) ||
                const DeepCollectionEquality().equals(other.results, results)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(next) ^
      const DeepCollectionEquality().hash(previous) ^
      const DeepCollectionEquality().hash(results) ^
      runtimeType.hashCode;
}

extension $ChildDailySummaryGet$ResponseExtension
    on ChildDailySummaryGet$Response {
  ChildDailySummaryGet$Response copyWith(
      {int? count, String? next, String? previous, List<DaySummary>? results}) {
    return ChildDailySummaryGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  ChildDailySummaryGet$Response copyWithWrapped(
      {Wrapped<int?>? count,
      Wrapped<String?>? next,
      Wrapped<String?>? previous,
      Wrapped<List<DaySummary>?>? results}) {
    return ChildDailySummaryGet$Response(
        count: (count != null ? count.value : this.count),
        next: (next != null ? next.value : this.next),
        previous: (previous != null ? previous.value : this.previous),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class EducatorTimesheetAvailabilityGet$Response {
  EducatorTimesheetAvailabilityGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory EducatorTimesheetAvailabilityGet$Response.fromJson(
          Map<String, dynamic> json) =>
      _$EducatorTimesheetAvailabilityGet$ResponseFromJson(json);

  static const toJsonFactory =
      _$EducatorTimesheetAvailabilityGet$ResponseToJson;
  Map<String, dynamic> toJson() =>
      _$EducatorTimesheetAvailabilityGet$ResponseToJson(this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(
      name: 'results',
      includeIfNull: false,
      defaultValue: <EducatorAvailability>[])
  final List<EducatorAvailability>? results;
  static const fromJsonFactory =
      _$EducatorTimesheetAvailabilityGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EducatorTimesheetAvailabilityGet$Response &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.next, next) ||
                const DeepCollectionEquality().equals(other.next, next)) &&
            (identical(other.previous, previous) ||
                const DeepCollectionEquality()
                    .equals(other.previous, previous)) &&
            (identical(other.results, results) ||
                const DeepCollectionEquality().equals(other.results, results)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(next) ^
      const DeepCollectionEquality().hash(previous) ^
      const DeepCollectionEquality().hash(results) ^
      runtimeType.hashCode;
}

extension $EducatorTimesheetAvailabilityGet$ResponseExtension
    on EducatorTimesheetAvailabilityGet$Response {
  EducatorTimesheetAvailabilityGet$Response copyWith(
      {int? count,
      String? next,
      String? previous,
      List<EducatorAvailability>? results}) {
    return EducatorTimesheetAvailabilityGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  EducatorTimesheetAvailabilityGet$Response copyWithWrapped(
      {Wrapped<int?>? count,
      Wrapped<String?>? next,
      Wrapped<String?>? previous,
      Wrapped<List<EducatorAvailability>?>? results}) {
    return EducatorTimesheetAvailabilityGet$Response(
        count: (count != null ? count.value : this.count),
        next: (next != null ? next.value : this.next),
        previous: (previous != null ? previous.value : this.previous),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class EducatorTimesheetScheduleGet$Response {
  EducatorTimesheetScheduleGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory EducatorTimesheetScheduleGet$Response.fromJson(
          Map<String, dynamic> json) =>
      _$EducatorTimesheetScheduleGet$ResponseFromJson(json);

  static const toJsonFactory = _$EducatorTimesheetScheduleGet$ResponseToJson;
  Map<String, dynamic> toJson() =>
      _$EducatorTimesheetScheduleGet$ResponseToJson(this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(
      name: 'results', includeIfNull: false, defaultValue: <EducatorSchedule>[])
  final List<EducatorSchedule>? results;
  static const fromJsonFactory =
      _$EducatorTimesheetScheduleGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EducatorTimesheetScheduleGet$Response &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.next, next) ||
                const DeepCollectionEquality().equals(other.next, next)) &&
            (identical(other.previous, previous) ||
                const DeepCollectionEquality()
                    .equals(other.previous, previous)) &&
            (identical(other.results, results) ||
                const DeepCollectionEquality().equals(other.results, results)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(next) ^
      const DeepCollectionEquality().hash(previous) ^
      const DeepCollectionEquality().hash(results) ^
      runtimeType.hashCode;
}

extension $EducatorTimesheetScheduleGet$ResponseExtension
    on EducatorTimesheetScheduleGet$Response {
  EducatorTimesheetScheduleGet$Response copyWith(
      {int? count,
      String? next,
      String? previous,
      List<EducatorSchedule>? results}) {
    return EducatorTimesheetScheduleGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  EducatorTimesheetScheduleGet$Response copyWithWrapped(
      {Wrapped<int?>? count,
      Wrapped<String?>? next,
      Wrapped<String?>? previous,
      Wrapped<List<EducatorSchedule>?>? results}) {
    return EducatorTimesheetScheduleGet$Response(
        count: (count != null ? count.value : this.count),
        next: (next != null ? next.value : this.next),
        previous: (previous != null ? previous.value : this.previous),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class EducatorTimesheetSettingsGet$Response {
  EducatorTimesheetSettingsGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory EducatorTimesheetSettingsGet$Response.fromJson(
          Map<String, dynamic> json) =>
      _$EducatorTimesheetSettingsGet$ResponseFromJson(json);

  static const toJsonFactory = _$EducatorTimesheetSettingsGet$ResponseToJson;
  Map<String, dynamic> toJson() =>
      _$EducatorTimesheetSettingsGet$ResponseToJson(this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(
      name: 'results',
      includeIfNull: false,
      defaultValue: <GeneralEducatorTimeSheetSettings>[])
  final List<GeneralEducatorTimeSheetSettings>? results;
  static const fromJsonFactory =
      _$EducatorTimesheetSettingsGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EducatorTimesheetSettingsGet$Response &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.next, next) ||
                const DeepCollectionEquality().equals(other.next, next)) &&
            (identical(other.previous, previous) ||
                const DeepCollectionEquality()
                    .equals(other.previous, previous)) &&
            (identical(other.results, results) ||
                const DeepCollectionEquality().equals(other.results, results)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(next) ^
      const DeepCollectionEquality().hash(previous) ^
      const DeepCollectionEquality().hash(results) ^
      runtimeType.hashCode;
}

extension $EducatorTimesheetSettingsGet$ResponseExtension
    on EducatorTimesheetSettingsGet$Response {
  EducatorTimesheetSettingsGet$Response copyWith(
      {int? count,
      String? next,
      String? previous,
      List<GeneralEducatorTimeSheetSettings>? results}) {
    return EducatorTimesheetSettingsGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  EducatorTimesheetSettingsGet$Response copyWithWrapped(
      {Wrapped<int?>? count,
      Wrapped<String?>? next,
      Wrapped<String?>? previous,
      Wrapped<List<GeneralEducatorTimeSheetSettings>?>? results}) {
    return EducatorTimesheetSettingsGet$Response(
        count: (count != null ? count.value : this.count),
        next: (next != null ? next.value : this.next),
        previous: (previous != null ? previous.value : this.previous),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class EducatorTimesheetSettingsExperienceGet$Response {
  EducatorTimesheetSettingsExperienceGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory EducatorTimesheetSettingsExperienceGet$Response.fromJson(
          Map<String, dynamic> json) =>
      _$EducatorTimesheetSettingsExperienceGet$ResponseFromJson(json);

  static const toJsonFactory =
      _$EducatorTimesheetSettingsExperienceGet$ResponseToJson;
  Map<String, dynamic> toJson() =>
      _$EducatorTimesheetSettingsExperienceGet$ResponseToJson(this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(
      name: 'results',
      includeIfNull: false,
      defaultValue: <EducatorExperienceLevelSettings>[])
  final List<EducatorExperienceLevelSettings>? results;
  static const fromJsonFactory =
      _$EducatorTimesheetSettingsExperienceGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EducatorTimesheetSettingsExperienceGet$Response &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.next, next) ||
                const DeepCollectionEquality().equals(other.next, next)) &&
            (identical(other.previous, previous) ||
                const DeepCollectionEquality()
                    .equals(other.previous, previous)) &&
            (identical(other.results, results) ||
                const DeepCollectionEquality().equals(other.results, results)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(next) ^
      const DeepCollectionEquality().hash(previous) ^
      const DeepCollectionEquality().hash(results) ^
      runtimeType.hashCode;
}

extension $EducatorTimesheetSettingsExperienceGet$ResponseExtension
    on EducatorTimesheetSettingsExperienceGet$Response {
  EducatorTimesheetSettingsExperienceGet$Response copyWith(
      {int? count,
      String? next,
      String? previous,
      List<EducatorExperienceLevelSettings>? results}) {
    return EducatorTimesheetSettingsExperienceGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  EducatorTimesheetSettingsExperienceGet$Response copyWithWrapped(
      {Wrapped<int?>? count,
      Wrapped<String?>? next,
      Wrapped<String?>? previous,
      Wrapped<List<EducatorExperienceLevelSettings>?>? results}) {
    return EducatorTimesheetSettingsExperienceGet$Response(
        count: (count != null ? count.value : this.count),
        next: (next != null ? next.value : this.next),
        previous: (previous != null ? previous.value : this.previous),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class EducatorTimesheetSettingsIndividualGet$Response {
  EducatorTimesheetSettingsIndividualGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory EducatorTimesheetSettingsIndividualGet$Response.fromJson(
          Map<String, dynamic> json) =>
      _$EducatorTimesheetSettingsIndividualGet$ResponseFromJson(json);

  static const toJsonFactory =
      _$EducatorTimesheetSettingsIndividualGet$ResponseToJson;
  Map<String, dynamic> toJson() =>
      _$EducatorTimesheetSettingsIndividualGet$ResponseToJson(this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(
      name: 'results',
      includeIfNull: false,
      defaultValue: <IndividualEmployeeTimeSheetSettings>[])
  final List<IndividualEmployeeTimeSheetSettings>? results;
  static const fromJsonFactory =
      _$EducatorTimesheetSettingsIndividualGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EducatorTimesheetSettingsIndividualGet$Response &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.next, next) ||
                const DeepCollectionEquality().equals(other.next, next)) &&
            (identical(other.previous, previous) ||
                const DeepCollectionEquality()
                    .equals(other.previous, previous)) &&
            (identical(other.results, results) ||
                const DeepCollectionEquality().equals(other.results, results)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(next) ^
      const DeepCollectionEquality().hash(previous) ^
      const DeepCollectionEquality().hash(results) ^
      runtimeType.hashCode;
}

extension $EducatorTimesheetSettingsIndividualGet$ResponseExtension
    on EducatorTimesheetSettingsIndividualGet$Response {
  EducatorTimesheetSettingsIndividualGet$Response copyWith(
      {int? count,
      String? next,
      String? previous,
      List<IndividualEmployeeTimeSheetSettings>? results}) {
    return EducatorTimesheetSettingsIndividualGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  EducatorTimesheetSettingsIndividualGet$Response copyWithWrapped(
      {Wrapped<int?>? count,
      Wrapped<String?>? next,
      Wrapped<String?>? previous,
      Wrapped<List<IndividualEmployeeTimeSheetSettings>?>? results}) {
    return EducatorTimesheetSettingsIndividualGet$Response(
        count: (count != null ? count.value : this.count),
        next: (next != null ? next.value : this.next),
        previous: (previous != null ? previous.value : this.previous),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class EducatorTimesheetTimesheetGet$Response {
  EducatorTimesheetTimesheetGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory EducatorTimesheetTimesheetGet$Response.fromJson(
          Map<String, dynamic> json) =>
      _$EducatorTimesheetTimesheetGet$ResponseFromJson(json);

  static const toJsonFactory = _$EducatorTimesheetTimesheetGet$ResponseToJson;
  Map<String, dynamic> toJson() =>
      _$EducatorTimesheetTimesheetGet$ResponseToJson(this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(
      name: 'results',
      includeIfNull: false,
      defaultValue: <EducatorTimeSheet>[])
  final List<EducatorTimeSheet>? results;
  static const fromJsonFactory =
      _$EducatorTimesheetTimesheetGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EducatorTimesheetTimesheetGet$Response &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.next, next) ||
                const DeepCollectionEquality().equals(other.next, next)) &&
            (identical(other.previous, previous) ||
                const DeepCollectionEquality()
                    .equals(other.previous, previous)) &&
            (identical(other.results, results) ||
                const DeepCollectionEquality().equals(other.results, results)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(next) ^
      const DeepCollectionEquality().hash(previous) ^
      const DeepCollectionEquality().hash(results) ^
      runtimeType.hashCode;
}

extension $EducatorTimesheetTimesheetGet$ResponseExtension
    on EducatorTimesheetTimesheetGet$Response {
  EducatorTimesheetTimesheetGet$Response copyWith(
      {int? count,
      String? next,
      String? previous,
      List<EducatorTimeSheet>? results}) {
    return EducatorTimesheetTimesheetGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  EducatorTimesheetTimesheetGet$Response copyWithWrapped(
      {Wrapped<int?>? count,
      Wrapped<String?>? next,
      Wrapped<String?>? previous,
      Wrapped<List<EducatorTimeSheet>?>? results}) {
    return EducatorTimesheetTimesheetGet$Response(
        count: (count != null ? count.value : this.count),
        next: (next != null ? next.value : this.next),
        previous: (previous != null ? previous.value : this.previous),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class EventsGet$Response {
  EventsGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory EventsGet$Response.fromJson(Map<String, dynamic> json) =>
      _$EventsGet$ResponseFromJson(json);

  static const toJsonFactory = _$EventsGet$ResponseToJson;
  Map<String, dynamic> toJson() => _$EventsGet$ResponseToJson(this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(name: 'results', includeIfNull: false, defaultValue: <Event>[])
  final List<Event>? results;
  static const fromJsonFactory = _$EventsGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EventsGet$Response &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.next, next) ||
                const DeepCollectionEquality().equals(other.next, next)) &&
            (identical(other.previous, previous) ||
                const DeepCollectionEquality()
                    .equals(other.previous, previous)) &&
            (identical(other.results, results) ||
                const DeepCollectionEquality().equals(other.results, results)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(next) ^
      const DeepCollectionEquality().hash(previous) ^
      const DeepCollectionEquality().hash(results) ^
      runtimeType.hashCode;
}

extension $EventsGet$ResponseExtension on EventsGet$Response {
  EventsGet$Response copyWith(
      {int? count, String? next, String? previous, List<Event>? results}) {
    return EventsGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  EventsGet$Response copyWithWrapped(
      {Wrapped<int?>? count,
      Wrapped<String?>? next,
      Wrapped<String?>? previous,
      Wrapped<List<Event>?>? results}) {
    return EventsGet$Response(
        count: (count != null ? count.value : this.count),
        next: (next != null ? next.value : this.next),
        previous: (previous != null ? previous.value : this.previous),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class EventsEventsOccurrenceGet$Response {
  EventsEventsOccurrenceGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory EventsEventsOccurrenceGet$Response.fromJson(
          Map<String, dynamic> json) =>
      _$EventsEventsOccurrenceGet$ResponseFromJson(json);

  static const toJsonFactory = _$EventsEventsOccurrenceGet$ResponseToJson;
  Map<String, dynamic> toJson() =>
      _$EventsEventsOccurrenceGet$ResponseToJson(this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(
      name: 'results', includeIfNull: false, defaultValue: <EventOccurrence>[])
  final List<EventOccurrence>? results;
  static const fromJsonFactory = _$EventsEventsOccurrenceGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EventsEventsOccurrenceGet$Response &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.next, next) ||
                const DeepCollectionEquality().equals(other.next, next)) &&
            (identical(other.previous, previous) ||
                const DeepCollectionEquality()
                    .equals(other.previous, previous)) &&
            (identical(other.results, results) ||
                const DeepCollectionEquality().equals(other.results, results)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(next) ^
      const DeepCollectionEquality().hash(previous) ^
      const DeepCollectionEquality().hash(results) ^
      runtimeType.hashCode;
}

extension $EventsEventsOccurrenceGet$ResponseExtension
    on EventsEventsOccurrenceGet$Response {
  EventsEventsOccurrenceGet$Response copyWith(
      {int? count,
      String? next,
      String? previous,
      List<EventOccurrence>? results}) {
    return EventsEventsOccurrenceGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  EventsEventsOccurrenceGet$Response copyWithWrapped(
      {Wrapped<int?>? count,
      Wrapped<String?>? next,
      Wrapped<String?>? previous,
      Wrapped<List<EventOccurrence>?>? results}) {
    return EventsEventsOccurrenceGet$Response(
        count: (count != null ? count.value : this.count),
        next: (next != null ? next.value : this.next),
        previous: (previous != null ? previous.value : this.previous),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class FormsFormMedicalfileGet$Response {
  FormsFormMedicalfileGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory FormsFormMedicalfileGet$Response.fromJson(
          Map<String, dynamic> json) =>
      _$FormsFormMedicalfileGet$ResponseFromJson(json);

  static const toJsonFactory = _$FormsFormMedicalfileGet$ResponseToJson;
  Map<String, dynamic> toJson() =>
      _$FormsFormMedicalfileGet$ResponseToJson(this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(
      name: 'results', includeIfNull: false, defaultValue: <MedicalFileForm>[])
  final List<MedicalFileForm>? results;
  static const fromJsonFactory = _$FormsFormMedicalfileGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FormsFormMedicalfileGet$Response &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.next, next) ||
                const DeepCollectionEquality().equals(other.next, next)) &&
            (identical(other.previous, previous) ||
                const DeepCollectionEquality()
                    .equals(other.previous, previous)) &&
            (identical(other.results, results) ||
                const DeepCollectionEquality().equals(other.results, results)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(next) ^
      const DeepCollectionEquality().hash(previous) ^
      const DeepCollectionEquality().hash(results) ^
      runtimeType.hashCode;
}

extension $FormsFormMedicalfileGet$ResponseExtension
    on FormsFormMedicalfileGet$Response {
  FormsFormMedicalfileGet$Response copyWith(
      {int? count,
      String? next,
      String? previous,
      List<MedicalFileForm>? results}) {
    return FormsFormMedicalfileGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  FormsFormMedicalfileGet$Response copyWithWrapped(
      {Wrapped<int?>? count,
      Wrapped<String?>? next,
      Wrapped<String?>? previous,
      Wrapped<List<MedicalFileForm>?>? results}) {
    return FormsFormMedicalfileGet$Response(
        count: (count != null ? count.value : this.count),
        next: (next != null ? next.value : this.next),
        previous: (previous != null ? previous.value : this.previous),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class FormsFormMedicalfileTemplateGet$Response {
  FormsFormMedicalfileTemplateGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory FormsFormMedicalfileTemplateGet$Response.fromJson(
          Map<String, dynamic> json) =>
      _$FormsFormMedicalfileTemplateGet$ResponseFromJson(json);

  static const toJsonFactory = _$FormsFormMedicalfileTemplateGet$ResponseToJson;
  Map<String, dynamic> toJson() =>
      _$FormsFormMedicalfileTemplateGet$ResponseToJson(this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(
      name: 'results',
      includeIfNull: false,
      defaultValue: <MedicalFileTemplate>[])
  final List<MedicalFileTemplate>? results;
  static const fromJsonFactory =
      _$FormsFormMedicalfileTemplateGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FormsFormMedicalfileTemplateGet$Response &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.next, next) ||
                const DeepCollectionEquality().equals(other.next, next)) &&
            (identical(other.previous, previous) ||
                const DeepCollectionEquality()
                    .equals(other.previous, previous)) &&
            (identical(other.results, results) ||
                const DeepCollectionEquality().equals(other.results, results)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(next) ^
      const DeepCollectionEquality().hash(previous) ^
      const DeepCollectionEquality().hash(results) ^
      runtimeType.hashCode;
}

extension $FormsFormMedicalfileTemplateGet$ResponseExtension
    on FormsFormMedicalfileTemplateGet$Response {
  FormsFormMedicalfileTemplateGet$Response copyWith(
      {int? count,
      String? next,
      String? previous,
      List<MedicalFileTemplate>? results}) {
    return FormsFormMedicalfileTemplateGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  FormsFormMedicalfileTemplateGet$Response copyWithWrapped(
      {Wrapped<int?>? count,
      Wrapped<String?>? next,
      Wrapped<String?>? previous,
      Wrapped<List<MedicalFileTemplate>?>? results}) {
    return FormsFormMedicalfileTemplateGet$Response(
        count: (count != null ? count.value : this.count),
        next: (next != null ? next.value : this.next),
        previous: (previous != null ? previous.value : this.previous),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class FormsFormTpzGet$Response {
  FormsFormTpzGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory FormsFormTpzGet$Response.fromJson(Map<String, dynamic> json) =>
      _$FormsFormTpzGet$ResponseFromJson(json);

  static const toJsonFactory = _$FormsFormTpzGet$ResponseToJson;
  Map<String, dynamic> toJson() => _$FormsFormTpzGet$ResponseToJson(this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(name: 'results', includeIfNull: false, defaultValue: <TPZForm>[])
  final List<TPZForm>? results;
  static const fromJsonFactory = _$FormsFormTpzGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FormsFormTpzGet$Response &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.next, next) ||
                const DeepCollectionEquality().equals(other.next, next)) &&
            (identical(other.previous, previous) ||
                const DeepCollectionEquality()
                    .equals(other.previous, previous)) &&
            (identical(other.results, results) ||
                const DeepCollectionEquality().equals(other.results, results)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(next) ^
      const DeepCollectionEquality().hash(previous) ^
      const DeepCollectionEquality().hash(results) ^
      runtimeType.hashCode;
}

extension $FormsFormTpzGet$ResponseExtension on FormsFormTpzGet$Response {
  FormsFormTpzGet$Response copyWith(
      {int? count, String? next, String? previous, List<TPZForm>? results}) {
    return FormsFormTpzGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  FormsFormTpzGet$Response copyWithWrapped(
      {Wrapped<int?>? count,
      Wrapped<String?>? next,
      Wrapped<String?>? previous,
      Wrapped<List<TPZForm>?>? results}) {
    return FormsFormTpzGet$Response(
        count: (count != null ? count.value : this.count),
        next: (next != null ? next.value : this.next),
        previous: (previous != null ? previous.value : this.previous),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class FormsFormTpzTemplateGet$Response {
  FormsFormTpzTemplateGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory FormsFormTpzTemplateGet$Response.fromJson(
          Map<String, dynamic> json) =>
      _$FormsFormTpzTemplateGet$ResponseFromJson(json);

  static const toJsonFactory = _$FormsFormTpzTemplateGet$ResponseToJson;
  Map<String, dynamic> toJson() =>
      _$FormsFormTpzTemplateGet$ResponseToJson(this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(name: 'results', includeIfNull: false, defaultValue: <TPZTemplate>[])
  final List<TPZTemplate>? results;
  static const fromJsonFactory = _$FormsFormTpzTemplateGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FormsFormTpzTemplateGet$Response &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.next, next) ||
                const DeepCollectionEquality().equals(other.next, next)) &&
            (identical(other.previous, previous) ||
                const DeepCollectionEquality()
                    .equals(other.previous, previous)) &&
            (identical(other.results, results) ||
                const DeepCollectionEquality().equals(other.results, results)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(next) ^
      const DeepCollectionEquality().hash(previous) ^
      const DeepCollectionEquality().hash(results) ^
      runtimeType.hashCode;
}

extension $FormsFormTpzTemplateGet$ResponseExtension
    on FormsFormTpzTemplateGet$Response {
  FormsFormTpzTemplateGet$Response copyWith(
      {int? count,
      String? next,
      String? previous,
      List<TPZTemplate>? results}) {
    return FormsFormTpzTemplateGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  FormsFormTpzTemplateGet$Response copyWithWrapped(
      {Wrapped<int?>? count,
      Wrapped<String?>? next,
      Wrapped<String?>? previous,
      Wrapped<List<TPZTemplate>?>? results}) {
    return FormsFormTpzTemplateGet$Response(
        count: (count != null ? count.value : this.count),
        next: (next != null ? next.value : this.next),
        previous: (previous != null ? previous.value : this.previous),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class GroupGet$Response {
  GroupGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory GroupGet$Response.fromJson(Map<String, dynamic> json) =>
      _$GroupGet$ResponseFromJson(json);

  static const toJsonFactory = _$GroupGet$ResponseToJson;
  Map<String, dynamic> toJson() => _$GroupGet$ResponseToJson(this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(name: 'results', includeIfNull: false, defaultValue: <Group>[])
  final List<Group>? results;
  static const fromJsonFactory = _$GroupGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GroupGet$Response &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.next, next) ||
                const DeepCollectionEquality().equals(other.next, next)) &&
            (identical(other.previous, previous) ||
                const DeepCollectionEquality()
                    .equals(other.previous, previous)) &&
            (identical(other.results, results) ||
                const DeepCollectionEquality().equals(other.results, results)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(next) ^
      const DeepCollectionEquality().hash(previous) ^
      const DeepCollectionEquality().hash(results) ^
      runtimeType.hashCode;
}

extension $GroupGet$ResponseExtension on GroupGet$Response {
  GroupGet$Response copyWith(
      {int? count, String? next, String? previous, List<Group>? results}) {
    return GroupGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  GroupGet$Response copyWithWrapped(
      {Wrapped<int?>? count,
      Wrapped<String?>? next,
      Wrapped<String?>? previous,
      Wrapped<List<Group>?>? results}) {
    return GroupGet$Response(
        count: (count != null ? count.value : this.count),
        next: (next != null ? next.value : this.next),
        previous: (previous != null ? previous.value : this.previous),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class MenuGet$Response {
  MenuGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory MenuGet$Response.fromJson(Map<String, dynamic> json) =>
      _$MenuGet$ResponseFromJson(json);

  static const toJsonFactory = _$MenuGet$ResponseToJson;
  Map<String, dynamic> toJson() => _$MenuGet$ResponseToJson(this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(name: 'results', includeIfNull: false, defaultValue: <Menu>[])
  final List<Menu>? results;
  static const fromJsonFactory = _$MenuGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MenuGet$Response &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.next, next) ||
                const DeepCollectionEquality().equals(other.next, next)) &&
            (identical(other.previous, previous) ||
                const DeepCollectionEquality()
                    .equals(other.previous, previous)) &&
            (identical(other.results, results) ||
                const DeepCollectionEquality().equals(other.results, results)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(next) ^
      const DeepCollectionEquality().hash(previous) ^
      const DeepCollectionEquality().hash(results) ^
      runtimeType.hashCode;
}

extension $MenuGet$ResponseExtension on MenuGet$Response {
  MenuGet$Response copyWith(
      {int? count, String? next, String? previous, List<Menu>? results}) {
    return MenuGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  MenuGet$Response copyWithWrapped(
      {Wrapped<int?>? count,
      Wrapped<String?>? next,
      Wrapped<String?>? previous,
      Wrapped<List<Menu>?>? results}) {
    return MenuGet$Response(
        count: (count != null ? count.value : this.count),
        next: (next != null ? next.value : this.next),
        previous: (previous != null ? previous.value : this.previous),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class MenuMealOccurrenceGet$Response {
  MenuMealOccurrenceGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory MenuMealOccurrenceGet$Response.fromJson(Map<String, dynamic> json) =>
      _$MenuMealOccurrenceGet$ResponseFromJson(json);

  static const toJsonFactory = _$MenuMealOccurrenceGet$ResponseToJson;
  Map<String, dynamic> toJson() => _$MenuMealOccurrenceGet$ResponseToJson(this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(
      name: 'results', includeIfNull: false, defaultValue: <MealOccurrence>[])
  final List<MealOccurrence>? results;
  static const fromJsonFactory = _$MenuMealOccurrenceGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MenuMealOccurrenceGet$Response &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.next, next) ||
                const DeepCollectionEquality().equals(other.next, next)) &&
            (identical(other.previous, previous) ||
                const DeepCollectionEquality()
                    .equals(other.previous, previous)) &&
            (identical(other.results, results) ||
                const DeepCollectionEquality().equals(other.results, results)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(next) ^
      const DeepCollectionEquality().hash(previous) ^
      const DeepCollectionEquality().hash(results) ^
      runtimeType.hashCode;
}

extension $MenuMealOccurrenceGet$ResponseExtension
    on MenuMealOccurrenceGet$Response {
  MenuMealOccurrenceGet$Response copyWith(
      {int? count,
      String? next,
      String? previous,
      List<MealOccurrence>? results}) {
    return MenuMealOccurrenceGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  MenuMealOccurrenceGet$Response copyWithWrapped(
      {Wrapped<int?>? count,
      Wrapped<String?>? next,
      Wrapped<String?>? previous,
      Wrapped<List<MealOccurrence>?>? results}) {
    return MenuMealOccurrenceGet$Response(
        count: (count != null ? count.value : this.count),
        next: (next != null ? next.value : this.next),
        previous: (previous != null ? previous.value : this.previous),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class NotificationsGet$Response {
  NotificationsGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory NotificationsGet$Response.fromJson(Map<String, dynamic> json) =>
      _$NotificationsGet$ResponseFromJson(json);

  static const toJsonFactory = _$NotificationsGet$ResponseToJson;
  Map<String, dynamic> toJson() => _$NotificationsGet$ResponseToJson(this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(
      name: 'results',
      includeIfNull: false,
      defaultValue: <NotificationSerializerUserReadOnly>[])
  final List<NotificationSerializerUserReadOnly>? results;
  static const fromJsonFactory = _$NotificationsGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NotificationsGet$Response &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.next, next) ||
                const DeepCollectionEquality().equals(other.next, next)) &&
            (identical(other.previous, previous) ||
                const DeepCollectionEquality()
                    .equals(other.previous, previous)) &&
            (identical(other.results, results) ||
                const DeepCollectionEquality().equals(other.results, results)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(next) ^
      const DeepCollectionEquality().hash(previous) ^
      const DeepCollectionEquality().hash(results) ^
      runtimeType.hashCode;
}

extension $NotificationsGet$ResponseExtension on NotificationsGet$Response {
  NotificationsGet$Response copyWith(
      {int? count,
      String? next,
      String? previous,
      List<NotificationSerializerUserReadOnly>? results}) {
    return NotificationsGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  NotificationsGet$Response copyWithWrapped(
      {Wrapped<int?>? count,
      Wrapped<String?>? next,
      Wrapped<String?>? previous,
      Wrapped<List<NotificationSerializerUserReadOnly>?>? results}) {
    return NotificationsGet$Response(
        count: (count != null ? count.value : this.count),
        next: (next != null ? next.value : this.next),
        previous: (previous != null ? previous.value : this.previous),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class PaymentGet$Response {
  PaymentGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory PaymentGet$Response.fromJson(Map<String, dynamic> json) =>
      _$PaymentGet$ResponseFromJson(json);

  static const toJsonFactory = _$PaymentGet$ResponseToJson;
  Map<String, dynamic> toJson() => _$PaymentGet$ResponseToJson(this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(name: 'results', includeIfNull: false, defaultValue: <Payment>[])
  final List<Payment>? results;
  static const fromJsonFactory = _$PaymentGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PaymentGet$Response &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.next, next) ||
                const DeepCollectionEquality().equals(other.next, next)) &&
            (identical(other.previous, previous) ||
                const DeepCollectionEquality()
                    .equals(other.previous, previous)) &&
            (identical(other.results, results) ||
                const DeepCollectionEquality().equals(other.results, results)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(next) ^
      const DeepCollectionEquality().hash(previous) ^
      const DeepCollectionEquality().hash(results) ^
      runtimeType.hashCode;
}

extension $PaymentGet$ResponseExtension on PaymentGet$Response {
  PaymentGet$Response copyWith(
      {int? count, String? next, String? previous, List<Payment>? results}) {
    return PaymentGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  PaymentGet$Response copyWithWrapped(
      {Wrapped<int?>? count,
      Wrapped<String?>? next,
      Wrapped<String?>? previous,
      Wrapped<List<Payment>?>? results}) {
    return PaymentGet$Response(
        count: (count != null ? count.value : this.count),
        next: (next != null ? next.value : this.next),
        previous: (previous != null ? previous.value : this.previous),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class PermissionsEducatorPermissionsGet$Response {
  PermissionsEducatorPermissionsGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory PermissionsEducatorPermissionsGet$Response.fromJson(
          Map<String, dynamic> json) =>
      _$PermissionsEducatorPermissionsGet$ResponseFromJson(json);

  static const toJsonFactory =
      _$PermissionsEducatorPermissionsGet$ResponseToJson;
  Map<String, dynamic> toJson() =>
      _$PermissionsEducatorPermissionsGet$ResponseToJson(this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(
      name: 'results',
      includeIfNull: false,
      defaultValue: <EducatorKindergartenPermission>[])
  final List<EducatorKindergartenPermission>? results;
  static const fromJsonFactory =
      _$PermissionsEducatorPermissionsGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PermissionsEducatorPermissionsGet$Response &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.next, next) ||
                const DeepCollectionEquality().equals(other.next, next)) &&
            (identical(other.previous, previous) ||
                const DeepCollectionEquality()
                    .equals(other.previous, previous)) &&
            (identical(other.results, results) ||
                const DeepCollectionEquality().equals(other.results, results)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(next) ^
      const DeepCollectionEquality().hash(previous) ^
      const DeepCollectionEquality().hash(results) ^
      runtimeType.hashCode;
}

extension $PermissionsEducatorPermissionsGet$ResponseExtension
    on PermissionsEducatorPermissionsGet$Response {
  PermissionsEducatorPermissionsGet$Response copyWith(
      {int? count,
      String? next,
      String? previous,
      List<EducatorKindergartenPermission>? results}) {
    return PermissionsEducatorPermissionsGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  PermissionsEducatorPermissionsGet$Response copyWithWrapped(
      {Wrapped<int?>? count,
      Wrapped<String?>? next,
      Wrapped<String?>? previous,
      Wrapped<List<EducatorKindergartenPermission>?>? results}) {
    return PermissionsEducatorPermissionsGet$Response(
        count: (count != null ? count.value : this.count),
        next: (next != null ? next.value : this.next),
        previous: (previous != null ? previous.value : this.previous),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class PresenceAttendanceGet$Response {
  PresenceAttendanceGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory PresenceAttendanceGet$Response.fromJson(Map<String, dynamic> json) =>
      _$PresenceAttendanceGet$ResponseFromJson(json);

  static const toJsonFactory = _$PresenceAttendanceGet$ResponseToJson;
  Map<String, dynamic> toJson() => _$PresenceAttendanceGet$ResponseToJson(this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(name: 'results', includeIfNull: false, defaultValue: <Presence>[])
  final List<Presence>? results;
  static const fromJsonFactory = _$PresenceAttendanceGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PresenceAttendanceGet$Response &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.next, next) ||
                const DeepCollectionEquality().equals(other.next, next)) &&
            (identical(other.previous, previous) ||
                const DeepCollectionEquality()
                    .equals(other.previous, previous)) &&
            (identical(other.results, results) ||
                const DeepCollectionEquality().equals(other.results, results)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(next) ^
      const DeepCollectionEquality().hash(previous) ^
      const DeepCollectionEquality().hash(results) ^
      runtimeType.hashCode;
}

extension $PresenceAttendanceGet$ResponseExtension
    on PresenceAttendanceGet$Response {
  PresenceAttendanceGet$Response copyWith(
      {int? count, String? next, String? previous, List<Presence>? results}) {
    return PresenceAttendanceGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  PresenceAttendanceGet$Response copyWithWrapped(
      {Wrapped<int?>? count,
      Wrapped<String?>? next,
      Wrapped<String?>? previous,
      Wrapped<List<Presence>?>? results}) {
    return PresenceAttendanceGet$Response(
        count: (count != null ? count.value : this.count),
        next: (next != null ? next.value : this.next),
        previous: (previous != null ? previous.value : this.previous),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class PresenceExpectedPickupGet$Response {
  PresenceExpectedPickupGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory PresenceExpectedPickupGet$Response.fromJson(
          Map<String, dynamic> json) =>
      _$PresenceExpectedPickupGet$ResponseFromJson(json);

  static const toJsonFactory = _$PresenceExpectedPickupGet$ResponseToJson;
  Map<String, dynamic> toJson() =>
      _$PresenceExpectedPickupGet$ResponseToJson(this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(
      name: 'results', includeIfNull: false, defaultValue: <ExpectedPickUp>[])
  final List<ExpectedPickUp>? results;
  static const fromJsonFactory = _$PresenceExpectedPickupGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PresenceExpectedPickupGet$Response &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.next, next) ||
                const DeepCollectionEquality().equals(other.next, next)) &&
            (identical(other.previous, previous) ||
                const DeepCollectionEquality()
                    .equals(other.previous, previous)) &&
            (identical(other.results, results) ||
                const DeepCollectionEquality().equals(other.results, results)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(next) ^
      const DeepCollectionEquality().hash(previous) ^
      const DeepCollectionEquality().hash(results) ^
      runtimeType.hashCode;
}

extension $PresenceExpectedPickupGet$ResponseExtension
    on PresenceExpectedPickupGet$Response {
  PresenceExpectedPickupGet$Response copyWith(
      {int? count,
      String? next,
      String? previous,
      List<ExpectedPickUp>? results}) {
    return PresenceExpectedPickupGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  PresenceExpectedPickupGet$Response copyWithWrapped(
      {Wrapped<int?>? count,
      Wrapped<String?>? next,
      Wrapped<String?>? previous,
      Wrapped<List<ExpectedPickUp>?>? results}) {
    return PresenceExpectedPickupGet$Response(
        count: (count != null ? count.value : this.count),
        next: (next != null ? next.value : this.next),
        previous: (previous != null ? previous.value : this.previous),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class PublicationsCommentsGet$Response {
  PublicationsCommentsGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory PublicationsCommentsGet$Response.fromJson(
          Map<String, dynamic> json) =>
      _$PublicationsCommentsGet$ResponseFromJson(json);

  static const toJsonFactory = _$PublicationsCommentsGet$ResponseToJson;
  Map<String, dynamic> toJson() =>
      _$PublicationsCommentsGet$ResponseToJson(this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(name: 'results', includeIfNull: false, defaultValue: <Comment>[])
  final List<Comment>? results;
  static const fromJsonFactory = _$PublicationsCommentsGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PublicationsCommentsGet$Response &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.next, next) ||
                const DeepCollectionEquality().equals(other.next, next)) &&
            (identical(other.previous, previous) ||
                const DeepCollectionEquality()
                    .equals(other.previous, previous)) &&
            (identical(other.results, results) ||
                const DeepCollectionEquality().equals(other.results, results)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(next) ^
      const DeepCollectionEquality().hash(previous) ^
      const DeepCollectionEquality().hash(results) ^
      runtimeType.hashCode;
}

extension $PublicationsCommentsGet$ResponseExtension
    on PublicationsCommentsGet$Response {
  PublicationsCommentsGet$Response copyWith(
      {int? count, String? next, String? previous, List<Comment>? results}) {
    return PublicationsCommentsGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  PublicationsCommentsGet$Response copyWithWrapped(
      {Wrapped<int?>? count,
      Wrapped<String?>? next,
      Wrapped<String?>? previous,
      Wrapped<List<Comment>?>? results}) {
    return PublicationsCommentsGet$Response(
        count: (count != null ? count.value : this.count),
        next: (next != null ? next.value : this.next),
        previous: (previous != null ? previous.value : this.previous),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class PublicationsDocsContentGet$Response {
  PublicationsDocsContentGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory PublicationsDocsContentGet$Response.fromJson(
          Map<String, dynamic> json) =>
      _$PublicationsDocsContentGet$ResponseFromJson(json);

  static const toJsonFactory = _$PublicationsDocsContentGet$ResponseToJson;
  Map<String, dynamic> toJson() =>
      _$PublicationsDocsContentGet$ResponseToJson(this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(
      name: 'results',
      includeIfNull: false,
      defaultValue: <DocOnlyPublicationContent>[])
  final List<DocOnlyPublicationContent>? results;
  static const fromJsonFactory = _$PublicationsDocsContentGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PublicationsDocsContentGet$Response &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.next, next) ||
                const DeepCollectionEquality().equals(other.next, next)) &&
            (identical(other.previous, previous) ||
                const DeepCollectionEquality()
                    .equals(other.previous, previous)) &&
            (identical(other.results, results) ||
                const DeepCollectionEquality().equals(other.results, results)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(next) ^
      const DeepCollectionEquality().hash(previous) ^
      const DeepCollectionEquality().hash(results) ^
      runtimeType.hashCode;
}

extension $PublicationsDocsContentGet$ResponseExtension
    on PublicationsDocsContentGet$Response {
  PublicationsDocsContentGet$Response copyWith(
      {int? count,
      String? next,
      String? previous,
      List<DocOnlyPublicationContent>? results}) {
    return PublicationsDocsContentGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  PublicationsDocsContentGet$Response copyWithWrapped(
      {Wrapped<int?>? count,
      Wrapped<String?>? next,
      Wrapped<String?>? previous,
      Wrapped<List<DocOnlyPublicationContent>?>? results}) {
    return PublicationsDocsContentGet$Response(
        count: (count != null ? count.value : this.count),
        next: (next != null ? next.value : this.next),
        previous: (previous != null ? previous.value : this.previous),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class PublicationsPublicationsGet$Response {
  PublicationsPublicationsGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory PublicationsPublicationsGet$Response.fromJson(
          Map<String, dynamic> json) =>
      _$PublicationsPublicationsGet$ResponseFromJson(json);

  static const toJsonFactory = _$PublicationsPublicationsGet$ResponseToJson;
  Map<String, dynamic> toJson() =>
      _$PublicationsPublicationsGet$ResponseToJson(this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(name: 'results', includeIfNull: false, defaultValue: <Publication>[])
  final List<Publication>? results;
  static const fromJsonFactory = _$PublicationsPublicationsGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PublicationsPublicationsGet$Response &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.next, next) ||
                const DeepCollectionEquality().equals(other.next, next)) &&
            (identical(other.previous, previous) ||
                const DeepCollectionEquality()
                    .equals(other.previous, previous)) &&
            (identical(other.results, results) ||
                const DeepCollectionEquality().equals(other.results, results)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(next) ^
      const DeepCollectionEquality().hash(previous) ^
      const DeepCollectionEquality().hash(results) ^
      runtimeType.hashCode;
}

extension $PublicationsPublicationsGet$ResponseExtension
    on PublicationsPublicationsGet$Response {
  PublicationsPublicationsGet$Response copyWith(
      {int? count,
      String? next,
      String? previous,
      List<Publication>? results}) {
    return PublicationsPublicationsGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  PublicationsPublicationsGet$Response copyWithWrapped(
      {Wrapped<int?>? count,
      Wrapped<String?>? next,
      Wrapped<String?>? previous,
      Wrapped<List<Publication>?>? results}) {
    return PublicationsPublicationsGet$Response(
        count: (count != null ? count.value : this.count),
        next: (next != null ? next.value : this.next),
        previous: (previous != null ? previous.value : this.previous),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class SearchKindergartenMembersGet$Response {
  SearchKindergartenMembersGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory SearchKindergartenMembersGet$Response.fromJson(
          Map<String, dynamic> json) =>
      _$SearchKindergartenMembersGet$ResponseFromJson(json);

  static const toJsonFactory = _$SearchKindergartenMembersGet$ResponseToJson;
  Map<String, dynamic> toJson() =>
      _$SearchKindergartenMembersGet$ResponseToJson(this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(
      name: 'results',
      includeIfNull: false,
      defaultValue: <SearchKindergartenMembers>[])
  final List<SearchKindergartenMembers>? results;
  static const fromJsonFactory =
      _$SearchKindergartenMembersGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SearchKindergartenMembersGet$Response &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.next, next) ||
                const DeepCollectionEquality().equals(other.next, next)) &&
            (identical(other.previous, previous) ||
                const DeepCollectionEquality()
                    .equals(other.previous, previous)) &&
            (identical(other.results, results) ||
                const DeepCollectionEquality().equals(other.results, results)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(next) ^
      const DeepCollectionEquality().hash(previous) ^
      const DeepCollectionEquality().hash(results) ^
      runtimeType.hashCode;
}

extension $SearchKindergartenMembersGet$ResponseExtension
    on SearchKindergartenMembersGet$Response {
  SearchKindergartenMembersGet$Response copyWith(
      {int? count,
      String? next,
      String? previous,
      List<SearchKindergartenMembers>? results}) {
    return SearchKindergartenMembersGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  SearchKindergartenMembersGet$Response copyWithWrapped(
      {Wrapped<int?>? count,
      Wrapped<String?>? next,
      Wrapped<String?>? previous,
      Wrapped<List<SearchKindergartenMembers>?>? results}) {
    return SearchKindergartenMembersGet$Response(
        count: (count != null ? count.value : this.count),
        next: (next != null ? next.value : this.next),
        previous: (previous != null ? previous.value : this.previous),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class SearchChildGet$Response {
  SearchChildGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory SearchChildGet$Response.fromJson(Map<String, dynamic> json) =>
      _$SearchChildGet$ResponseFromJson(json);

  static const toJsonFactory = _$SearchChildGet$ResponseToJson;
  Map<String, dynamic> toJson() => _$SearchChildGet$ResponseToJson(this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(name: 'results', includeIfNull: false, defaultValue: <ChildSearch>[])
  final List<ChildSearch>? results;
  static const fromJsonFactory = _$SearchChildGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SearchChildGet$Response &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.next, next) ||
                const DeepCollectionEquality().equals(other.next, next)) &&
            (identical(other.previous, previous) ||
                const DeepCollectionEquality()
                    .equals(other.previous, previous)) &&
            (identical(other.results, results) ||
                const DeepCollectionEquality().equals(other.results, results)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(next) ^
      const DeepCollectionEquality().hash(previous) ^
      const DeepCollectionEquality().hash(results) ^
      runtimeType.hashCode;
}

extension $SearchChildGet$ResponseExtension on SearchChildGet$Response {
  SearchChildGet$Response copyWith(
      {int? count,
      String? next,
      String? previous,
      List<ChildSearch>? results}) {
    return SearchChildGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  SearchChildGet$Response copyWithWrapped(
      {Wrapped<int?>? count,
      Wrapped<String?>? next,
      Wrapped<String?>? previous,
      Wrapped<List<ChildSearch>?>? results}) {
    return SearchChildGet$Response(
        count: (count != null ? count.value : this.count),
        next: (next != null ? next.value : this.next),
        previous: (previous != null ? previous.value : this.previous),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class WholeChildGet$Response {
  WholeChildGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory WholeChildGet$Response.fromJson(Map<String, dynamic> json) =>
      _$WholeChildGet$ResponseFromJson(json);

  static const toJsonFactory = _$WholeChildGet$ResponseToJson;
  Map<String, dynamic> toJson() => _$WholeChildGet$ResponseToJson(this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(name: 'results', includeIfNull: false, defaultValue: <WholeChild>[])
  final List<WholeChild>? results;
  static const fromJsonFactory = _$WholeChildGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is WholeChildGet$Response &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.next, next) ||
                const DeepCollectionEquality().equals(other.next, next)) &&
            (identical(other.previous, previous) ||
                const DeepCollectionEquality()
                    .equals(other.previous, previous)) &&
            (identical(other.results, results) ||
                const DeepCollectionEquality().equals(other.results, results)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(next) ^
      const DeepCollectionEquality().hash(previous) ^
      const DeepCollectionEquality().hash(results) ^
      runtimeType.hashCode;
}

extension $WholeChildGet$ResponseExtension on WholeChildGet$Response {
  WholeChildGet$Response copyWith(
      {int? count, String? next, String? previous, List<WholeChild>? results}) {
    return WholeChildGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  WholeChildGet$Response copyWithWrapped(
      {Wrapped<int?>? count,
      Wrapped<String?>? next,
      Wrapped<String?>? previous,
      Wrapped<List<WholeChild>?>? results}) {
    return WholeChildGet$Response(
        count: (count != null ? count.value : this.count),
        next: (next != null ? next.value : this.next),
        previous: (previous != null ? previous.value : this.previous),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class TrustedPerson$Phone {
  TrustedPerson$Phone({
    this.kind,
    this.number,
  });

  factory TrustedPerson$Phone.fromJson(Map<String, dynamic> json) =>
      _$TrustedPerson$PhoneFromJson(json);

  static const toJsonFactory = _$TrustedPerson$PhoneToJson;
  Map<String, dynamic> toJson() => _$TrustedPerson$PhoneToJson(this);

  @JsonKey(
    name: 'kind',
    includeIfNull: false,
    toJson: trustedPerson$PhoneKindToJson,
    fromJson: trustedPerson$PhoneKindFromJson,
  )
  final enums.TrustedPerson$PhoneKind? kind;
  @JsonKey(name: 'number', includeIfNull: false, defaultValue: '')
  final String? number;
  static const fromJsonFactory = _$TrustedPerson$PhoneFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TrustedPerson$Phone &&
            (identical(other.kind, kind) ||
                const DeepCollectionEquality().equals(other.kind, kind)) &&
            (identical(other.number, number) ||
                const DeepCollectionEquality().equals(other.number, number)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(kind) ^
      const DeepCollectionEquality().hash(number) ^
      runtimeType.hashCode;
}

extension $TrustedPerson$PhoneExtension on TrustedPerson$Phone {
  TrustedPerson$Phone copyWith(
      {enums.TrustedPerson$PhoneKind? kind, String? number}) {
    return TrustedPerson$Phone(
        kind: kind ?? this.kind, number: number ?? this.number);
  }

  TrustedPerson$Phone copyWithWrapped(
      {Wrapped<enums.TrustedPerson$PhoneKind?>? kind,
      Wrapped<String?>? number}) {
    return TrustedPerson$Phone(
        kind: (kind != null ? kind.value : this.kind),
        number: (number != null ? number.value : this.number));
  }
}

@JsonSerializable(explicitToJson: true)
class Educator$Educatorprofile {
  Educator$Educatorprofile({
    this.id,
    this.avatar,
    this.phone,
    this.birthDate,
    this.firstName,
    this.lastName,
    this.sex,
    this.dateJoined,
    this.polymorphicCtype,
    this.user,
  });

  factory Educator$Educatorprofile.fromJson(Map<String, dynamic> json) =>
      _$Educator$EducatorprofileFromJson(json);

  static const toJsonFactory = _$Educator$EducatorprofileToJson;
  Map<String, dynamic> toJson() => _$Educator$EducatorprofileToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'avatar', includeIfNull: false, defaultValue: '')
  final String? avatar;
  @JsonKey(name: 'phone', includeIfNull: false)
  final Object? phone;
  @JsonKey(name: 'birth_date', includeIfNull: false)
  final DateTime? birthDate;
  @JsonKey(name: 'first_name', includeIfNull: false, defaultValue: '')
  final String? firstName;
  @JsonKey(name: 'last_name', includeIfNull: false, defaultValue: '')
  final String? lastName;
  @JsonKey(
    name: 'sex',
    includeIfNull: false,
    toJson: educator$EducatorprofileSexToJson,
    fromJson: educator$EducatorprofileSexFromJson,
  )
  final enums.Educator$EducatorprofileSex? sex;
  @JsonKey(name: 'date_joined', includeIfNull: false)
  final DateTime? dateJoined;
  @JsonKey(name: 'polymorphic_ctype', includeIfNull: false)
  final int? polymorphicCtype;
  @JsonKey(name: 'user', includeIfNull: false)
  final int? user;
  static const fromJsonFactory = _$Educator$EducatorprofileFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Educator$Educatorprofile &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.avatar, avatar) ||
                const DeepCollectionEquality().equals(other.avatar, avatar)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.birthDate, birthDate) ||
                const DeepCollectionEquality()
                    .equals(other.birthDate, birthDate)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.sex, sex) ||
                const DeepCollectionEquality().equals(other.sex, sex)) &&
            (identical(other.dateJoined, dateJoined) ||
                const DeepCollectionEquality()
                    .equals(other.dateJoined, dateJoined)) &&
            (identical(other.polymorphicCtype, polymorphicCtype) ||
                const DeepCollectionEquality()
                    .equals(other.polymorphicCtype, polymorphicCtype)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(avatar) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(birthDate) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(sex) ^
      const DeepCollectionEquality().hash(dateJoined) ^
      const DeepCollectionEquality().hash(polymorphicCtype) ^
      const DeepCollectionEquality().hash(user) ^
      runtimeType.hashCode;
}

extension $Educator$EducatorprofileExtension on Educator$Educatorprofile {
  Educator$Educatorprofile copyWith(
      {int? id,
      String? avatar,
      Object? phone,
      DateTime? birthDate,
      String? firstName,
      String? lastName,
      enums.Educator$EducatorprofileSex? sex,
      DateTime? dateJoined,
      int? polymorphicCtype,
      int? user}) {
    return Educator$Educatorprofile(
        id: id ?? this.id,
        avatar: avatar ?? this.avatar,
        phone: phone ?? this.phone,
        birthDate: birthDate ?? this.birthDate,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        sex: sex ?? this.sex,
        dateJoined: dateJoined ?? this.dateJoined,
        polymorphicCtype: polymorphicCtype ?? this.polymorphicCtype,
        user: user ?? this.user);
  }

  Educator$Educatorprofile copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String?>? avatar,
      Wrapped<Object?>? phone,
      Wrapped<DateTime?>? birthDate,
      Wrapped<String?>? firstName,
      Wrapped<String?>? lastName,
      Wrapped<enums.Educator$EducatorprofileSex?>? sex,
      Wrapped<DateTime?>? dateJoined,
      Wrapped<int?>? polymorphicCtype,
      Wrapped<int?>? user}) {
    return Educator$Educatorprofile(
        id: (id != null ? id.value : this.id),
        avatar: (avatar != null ? avatar.value : this.avatar),
        phone: (phone != null ? phone.value : this.phone),
        birthDate: (birthDate != null ? birthDate.value : this.birthDate),
        firstName: (firstName != null ? firstName.value : this.firstName),
        lastName: (lastName != null ? lastName.value : this.lastName),
        sex: (sex != null ? sex.value : this.sex),
        dateJoined: (dateJoined != null ? dateJoined.value : this.dateJoined),
        polymorphicCtype: (polymorphicCtype != null
            ? polymorphicCtype.value
            : this.polymorphicCtype),
        user: (user != null ? user.value : this.user));
  }
}

@JsonSerializable(explicitToJson: true)
class ParentProfile$Phone {
  ParentProfile$Phone({
    this.kind,
    this.number,
  });

  factory ParentProfile$Phone.fromJson(Map<String, dynamic> json) =>
      _$ParentProfile$PhoneFromJson(json);

  static const toJsonFactory = _$ParentProfile$PhoneToJson;
  Map<String, dynamic> toJson() => _$ParentProfile$PhoneToJson(this);

  @JsonKey(
    name: 'kind',
    includeIfNull: false,
    toJson: parentProfile$PhoneKindToJson,
    fromJson: parentProfile$PhoneKindFromJson,
  )
  final enums.ParentProfile$PhoneKind? kind;
  @JsonKey(name: 'number', includeIfNull: false, defaultValue: '')
  final String? number;
  static const fromJsonFactory = _$ParentProfile$PhoneFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ParentProfile$Phone &&
            (identical(other.kind, kind) ||
                const DeepCollectionEquality().equals(other.kind, kind)) &&
            (identical(other.number, number) ||
                const DeepCollectionEquality().equals(other.number, number)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(kind) ^
      const DeepCollectionEquality().hash(number) ^
      runtimeType.hashCode;
}

extension $ParentProfile$PhoneExtension on ParentProfile$Phone {
  ParentProfile$Phone copyWith(
      {enums.ParentProfile$PhoneKind? kind, String? number}) {
    return ParentProfile$Phone(
        kind: kind ?? this.kind, number: number ?? this.number);
  }

  ParentProfile$Phone copyWithWrapped(
      {Wrapped<enums.ParentProfile$PhoneKind?>? kind,
      Wrapped<String?>? number}) {
    return ParentProfile$Phone(
        kind: (kind != null ? kind.value : this.kind),
        number: (number != null ? number.value : this.number));
  }
}

String? daySummaryHumorToJson(enums.DaySummaryHumor? daySummaryHumor) {
  return daySummaryHumor?.value;
}

enums.DaySummaryHumor daySummaryHumorFromJson(
  Object? daySummaryHumor, [
  enums.DaySummaryHumor? defaultValue,
]) {
  return enums.DaySummaryHumor.values
          .firstWhereOrNull((e) => e.value == daySummaryHumor) ??
      defaultValue ??
      enums.DaySummaryHumor.swaggerGeneratedUnknown;
}

List<String> daySummaryHumorListToJson(
    List<enums.DaySummaryHumor>? daySummaryHumor) {
  if (daySummaryHumor == null) {
    return [];
  }

  return daySummaryHumor.map((e) => e.value!).toList();
}

List<enums.DaySummaryHumor> daySummaryHumorListFromJson(
  List? daySummaryHumor, [
  List<enums.DaySummaryHumor>? defaultValue,
]) {
  if (daySummaryHumor == null) {
    return defaultValue ?? [];
  }

  return daySummaryHumor
      .map((e) => daySummaryHumorFromJson(e.toString()))
      .toList();
}

List<enums.DaySummaryHumor>? daySummaryHumorNullableListFromJson(
  List? daySummaryHumor, [
  List<enums.DaySummaryHumor>? defaultValue,
]) {
  if (daySummaryHumor == null) {
    return defaultValue;
  }

  return daySummaryHumor
      .map((e) => daySummaryHumorFromJson(e.toString()))
      .toList();
}

String? daySummaryHungerToJson(enums.DaySummaryHunger? daySummaryHunger) {
  return daySummaryHunger?.value;
}

enums.DaySummaryHunger daySummaryHungerFromJson(
  Object? daySummaryHunger, [
  enums.DaySummaryHunger? defaultValue,
]) {
  return enums.DaySummaryHunger.values
          .firstWhereOrNull((e) => e.value == daySummaryHunger) ??
      defaultValue ??
      enums.DaySummaryHunger.swaggerGeneratedUnknown;
}

List<String> daySummaryHungerListToJson(
    List<enums.DaySummaryHunger>? daySummaryHunger) {
  if (daySummaryHunger == null) {
    return [];
  }

  return daySummaryHunger.map((e) => e.value!).toList();
}

List<enums.DaySummaryHunger> daySummaryHungerListFromJson(
  List? daySummaryHunger, [
  List<enums.DaySummaryHunger>? defaultValue,
]) {
  if (daySummaryHunger == null) {
    return defaultValue ?? [];
  }

  return daySummaryHunger
      .map((e) => daySummaryHungerFromJson(e.toString()))
      .toList();
}

List<enums.DaySummaryHunger>? daySummaryHungerNullableListFromJson(
  List? daySummaryHunger, [
  List<enums.DaySummaryHunger>? defaultValue,
]) {
  if (daySummaryHunger == null) {
    return defaultValue;
  }

  return daySummaryHunger
      .map((e) => daySummaryHungerFromJson(e.toString()))
      .toList();
}

String? daySummaryActivityParticipationToJson(
    enums.DaySummaryActivityParticipation? daySummaryActivityParticipation) {
  return daySummaryActivityParticipation?.value;
}

enums.DaySummaryActivityParticipation daySummaryActivityParticipationFromJson(
  Object? daySummaryActivityParticipation, [
  enums.DaySummaryActivityParticipation? defaultValue,
]) {
  return enums.DaySummaryActivityParticipation.values.firstWhereOrNull(
          (e) => e.value == daySummaryActivityParticipation) ??
      defaultValue ??
      enums.DaySummaryActivityParticipation.swaggerGeneratedUnknown;
}

List<String> daySummaryActivityParticipationListToJson(
    List<enums.DaySummaryActivityParticipation>?
        daySummaryActivityParticipation) {
  if (daySummaryActivityParticipation == null) {
    return [];
  }

  return daySummaryActivityParticipation.map((e) => e.value!).toList();
}

List<enums.DaySummaryActivityParticipation>
    daySummaryActivityParticipationListFromJson(
  List? daySummaryActivityParticipation, [
  List<enums.DaySummaryActivityParticipation>? defaultValue,
]) {
  if (daySummaryActivityParticipation == null) {
    return defaultValue ?? [];
  }

  return daySummaryActivityParticipation
      .map((e) => daySummaryActivityParticipationFromJson(e.toString()))
      .toList();
}

List<enums.DaySummaryActivityParticipation>?
    daySummaryActivityParticipationNullableListFromJson(
  List? daySummaryActivityParticipation, [
  List<enums.DaySummaryActivityParticipation>? defaultValue,
]) {
  if (daySummaryActivityParticipation == null) {
    return defaultValue;
  }

  return daySummaryActivityParticipation
      .map((e) => daySummaryActivityParticipationFromJson(e.toString()))
      .toList();
}

String? daySummaryNapToJson(enums.DaySummaryNap? daySummaryNap) {
  return daySummaryNap?.value;
}

enums.DaySummaryNap daySummaryNapFromJson(
  Object? daySummaryNap, [
  enums.DaySummaryNap? defaultValue,
]) {
  return enums.DaySummaryNap.values
          .firstWhereOrNull((e) => e.value == daySummaryNap) ??
      defaultValue ??
      enums.DaySummaryNap.swaggerGeneratedUnknown;
}

List<String> daySummaryNapListToJson(List<enums.DaySummaryNap>? daySummaryNap) {
  if (daySummaryNap == null) {
    return [];
  }

  return daySummaryNap.map((e) => e.value!).toList();
}

List<enums.DaySummaryNap> daySummaryNapListFromJson(
  List? daySummaryNap, [
  List<enums.DaySummaryNap>? defaultValue,
]) {
  if (daySummaryNap == null) {
    return defaultValue ?? [];
  }

  return daySummaryNap.map((e) => daySummaryNapFromJson(e.toString())).toList();
}

List<enums.DaySummaryNap>? daySummaryNapNullableListFromJson(
  List? daySummaryNap, [
  List<enums.DaySummaryNap>? defaultValue,
]) {
  if (daySummaryNap == null) {
    return defaultValue;
  }

  return daySummaryNap.map((e) => daySummaryNapFromJson(e.toString())).toList();
}

String? daySummaryInteractionsToJson(
    enums.DaySummaryInteractions? daySummaryInteractions) {
  return daySummaryInteractions?.value;
}

enums.DaySummaryInteractions daySummaryInteractionsFromJson(
  Object? daySummaryInteractions, [
  enums.DaySummaryInteractions? defaultValue,
]) {
  return enums.DaySummaryInteractions.values
          .firstWhereOrNull((e) => e.value == daySummaryInteractions) ??
      defaultValue ??
      enums.DaySummaryInteractions.swaggerGeneratedUnknown;
}

List<String> daySummaryInteractionsListToJson(
    List<enums.DaySummaryInteractions>? daySummaryInteractions) {
  if (daySummaryInteractions == null) {
    return [];
  }

  return daySummaryInteractions.map((e) => e.value!).toList();
}

List<enums.DaySummaryInteractions> daySummaryInteractionsListFromJson(
  List? daySummaryInteractions, [
  List<enums.DaySummaryInteractions>? defaultValue,
]) {
  if (daySummaryInteractions == null) {
    return defaultValue ?? [];
  }

  return daySummaryInteractions
      .map((e) => daySummaryInteractionsFromJson(e.toString()))
      .toList();
}

List<enums.DaySummaryInteractions>? daySummaryInteractionsNullableListFromJson(
  List? daySummaryInteractions, [
  List<enums.DaySummaryInteractions>? defaultValue,
]) {
  if (daySummaryInteractions == null) {
    return defaultValue;
  }

  return daySummaryInteractions
      .map((e) => daySummaryInteractionsFromJson(e.toString()))
      .toList();
}

String? daySummaryOutsidePlaytimeToJson(
    enums.DaySummaryOutsidePlaytime? daySummaryOutsidePlaytime) {
  return daySummaryOutsidePlaytime?.value;
}

enums.DaySummaryOutsidePlaytime daySummaryOutsidePlaytimeFromJson(
  Object? daySummaryOutsidePlaytime, [
  enums.DaySummaryOutsidePlaytime? defaultValue,
]) {
  return enums.DaySummaryOutsidePlaytime.values
          .firstWhereOrNull((e) => e.value == daySummaryOutsidePlaytime) ??
      defaultValue ??
      enums.DaySummaryOutsidePlaytime.swaggerGeneratedUnknown;
}

List<String> daySummaryOutsidePlaytimeListToJson(
    List<enums.DaySummaryOutsidePlaytime>? daySummaryOutsidePlaytime) {
  if (daySummaryOutsidePlaytime == null) {
    return [];
  }

  return daySummaryOutsidePlaytime.map((e) => e.value!).toList();
}

List<enums.DaySummaryOutsidePlaytime> daySummaryOutsidePlaytimeListFromJson(
  List? daySummaryOutsidePlaytime, [
  List<enums.DaySummaryOutsidePlaytime>? defaultValue,
]) {
  if (daySummaryOutsidePlaytime == null) {
    return defaultValue ?? [];
  }

  return daySummaryOutsidePlaytime
      .map((e) => daySummaryOutsidePlaytimeFromJson(e.toString()))
      .toList();
}

List<enums.DaySummaryOutsidePlaytime>?
    daySummaryOutsidePlaytimeNullableListFromJson(
  List? daySummaryOutsidePlaytime, [
  List<enums.DaySummaryOutsidePlaytime>? defaultValue,
]) {
  if (daySummaryOutsidePlaytime == null) {
    return defaultValue;
  }

  return daySummaryOutsidePlaytime
      .map((e) => daySummaryOutsidePlaytimeFromJson(e.toString()))
      .toList();
}

String? daySummaryPoopingToJson(enums.DaySummaryPooping? daySummaryPooping) {
  return daySummaryPooping?.value;
}

enums.DaySummaryPooping daySummaryPoopingFromJson(
  Object? daySummaryPooping, [
  enums.DaySummaryPooping? defaultValue,
]) {
  return enums.DaySummaryPooping.values
          .firstWhereOrNull((e) => e.value == daySummaryPooping) ??
      defaultValue ??
      enums.DaySummaryPooping.swaggerGeneratedUnknown;
}

List<String> daySummaryPoopingListToJson(
    List<enums.DaySummaryPooping>? daySummaryPooping) {
  if (daySummaryPooping == null) {
    return [];
  }

  return daySummaryPooping.map((e) => e.value!).toList();
}

List<enums.DaySummaryPooping> daySummaryPoopingListFromJson(
  List? daySummaryPooping, [
  List<enums.DaySummaryPooping>? defaultValue,
]) {
  if (daySummaryPooping == null) {
    return defaultValue ?? [];
  }

  return daySummaryPooping
      .map((e) => daySummaryPoopingFromJson(e.toString()))
      .toList();
}

List<enums.DaySummaryPooping>? daySummaryPoopingNullableListFromJson(
  List? daySummaryPooping, [
  List<enums.DaySummaryPooping>? defaultValue,
]) {
  if (daySummaryPooping == null) {
    return defaultValue;
  }

  return daySummaryPooping
      .map((e) => daySummaryPoopingFromJson(e.toString()))
      .toList();
}

String? eventRecurrenceToJson(enums.EventRecurrence? eventRecurrence) {
  return eventRecurrence?.value;
}

enums.EventRecurrence eventRecurrenceFromJson(
  Object? eventRecurrence, [
  enums.EventRecurrence? defaultValue,
]) {
  return enums.EventRecurrence.values
          .firstWhereOrNull((e) => e.value == eventRecurrence) ??
      defaultValue ??
      enums.EventRecurrence.swaggerGeneratedUnknown;
}

List<String> eventRecurrenceListToJson(
    List<enums.EventRecurrence>? eventRecurrence) {
  if (eventRecurrence == null) {
    return [];
  }

  return eventRecurrence.map((e) => e.value!).toList();
}

List<enums.EventRecurrence> eventRecurrenceListFromJson(
  List? eventRecurrence, [
  List<enums.EventRecurrence>? defaultValue,
]) {
  if (eventRecurrence == null) {
    return defaultValue ?? [];
  }

  return eventRecurrence
      .map((e) => eventRecurrenceFromJson(e.toString()))
      .toList();
}

List<enums.EventRecurrence>? eventRecurrenceNullableListFromJson(
  List? eventRecurrence, [
  List<enums.EventRecurrence>? defaultValue,
]) {
  if (eventRecurrence == null) {
    return defaultValue;
  }

  return eventRecurrence
      .map((e) => eventRecurrenceFromJson(e.toString()))
      .toList();
}

String? notificationSerializerUserReadOnlyNTypeToJson(
    enums.NotificationSerializerUserReadOnlyNType?
        notificationSerializerUserReadOnlyNType) {
  return notificationSerializerUserReadOnlyNType?.value;
}

enums.NotificationSerializerUserReadOnlyNType
    notificationSerializerUserReadOnlyNTypeFromJson(
  Object? notificationSerializerUserReadOnlyNType, [
  enums.NotificationSerializerUserReadOnlyNType? defaultValue,
]) {
  return enums.NotificationSerializerUserReadOnlyNType.values.firstWhereOrNull(
          (e) => e.value == notificationSerializerUserReadOnlyNType) ??
      defaultValue ??
      enums.NotificationSerializerUserReadOnlyNType.swaggerGeneratedUnknown;
}

List<String> notificationSerializerUserReadOnlyNTypeListToJson(
    List<enums.NotificationSerializerUserReadOnlyNType>?
        notificationSerializerUserReadOnlyNType) {
  if (notificationSerializerUserReadOnlyNType == null) {
    return [];
  }

  return notificationSerializerUserReadOnlyNType.map((e) => e.value!).toList();
}

List<enums.NotificationSerializerUserReadOnlyNType>
    notificationSerializerUserReadOnlyNTypeListFromJson(
  List? notificationSerializerUserReadOnlyNType, [
  List<enums.NotificationSerializerUserReadOnlyNType>? defaultValue,
]) {
  if (notificationSerializerUserReadOnlyNType == null) {
    return defaultValue ?? [];
  }

  return notificationSerializerUserReadOnlyNType
      .map((e) => notificationSerializerUserReadOnlyNTypeFromJson(e.toString()))
      .toList();
}

List<enums.NotificationSerializerUserReadOnlyNType>?
    notificationSerializerUserReadOnlyNTypeNullableListFromJson(
  List? notificationSerializerUserReadOnlyNType, [
  List<enums.NotificationSerializerUserReadOnlyNType>? defaultValue,
]) {
  if (notificationSerializerUserReadOnlyNType == null) {
    return defaultValue;
  }

  return notificationSerializerUserReadOnlyNType
      .map((e) => notificationSerializerUserReadOnlyNTypeFromJson(e.toString()))
      .toList();
}

String? paymentStatusToJson(enums.PaymentStatus? paymentStatus) {
  return paymentStatus?.value;
}

enums.PaymentStatus paymentStatusFromJson(
  Object? paymentStatus, [
  enums.PaymentStatus? defaultValue,
]) {
  return enums.PaymentStatus.values
          .firstWhereOrNull((e) => e.value == paymentStatus) ??
      defaultValue ??
      enums.PaymentStatus.swaggerGeneratedUnknown;
}

List<String> paymentStatusListToJson(List<enums.PaymentStatus>? paymentStatus) {
  if (paymentStatus == null) {
    return [];
  }

  return paymentStatus.map((e) => e.value!).toList();
}

List<enums.PaymentStatus> paymentStatusListFromJson(
  List? paymentStatus, [
  List<enums.PaymentStatus>? defaultValue,
]) {
  if (paymentStatus == null) {
    return defaultValue ?? [];
  }

  return paymentStatus.map((e) => paymentStatusFromJson(e.toString())).toList();
}

List<enums.PaymentStatus>? paymentStatusNullableListFromJson(
  List? paymentStatus, [
  List<enums.PaymentStatus>? defaultValue,
]) {
  if (paymentStatus == null) {
    return defaultValue;
  }

  return paymentStatus.map((e) => paymentStatusFromJson(e.toString())).toList();
}

String? paymentDeclinedReasonToJson(
    enums.PaymentDeclinedReason? paymentDeclinedReason) {
  return paymentDeclinedReason?.value;
}

enums.PaymentDeclinedReason paymentDeclinedReasonFromJson(
  Object? paymentDeclinedReason, [
  enums.PaymentDeclinedReason? defaultValue,
]) {
  return enums.PaymentDeclinedReason.values
          .firstWhereOrNull((e) => e.value == paymentDeclinedReason) ??
      defaultValue ??
      enums.PaymentDeclinedReason.swaggerGeneratedUnknown;
}

List<String> paymentDeclinedReasonListToJson(
    List<enums.PaymentDeclinedReason>? paymentDeclinedReason) {
  if (paymentDeclinedReason == null) {
    return [];
  }

  return paymentDeclinedReason.map((e) => e.value!).toList();
}

List<enums.PaymentDeclinedReason> paymentDeclinedReasonListFromJson(
  List? paymentDeclinedReason, [
  List<enums.PaymentDeclinedReason>? defaultValue,
]) {
  if (paymentDeclinedReason == null) {
    return defaultValue ?? [];
  }

  return paymentDeclinedReason
      .map((e) => paymentDeclinedReasonFromJson(e.toString()))
      .toList();
}

List<enums.PaymentDeclinedReason>? paymentDeclinedReasonNullableListFromJson(
  List? paymentDeclinedReason, [
  List<enums.PaymentDeclinedReason>? defaultValue,
]) {
  if (paymentDeclinedReason == null) {
    return defaultValue;
  }

  return paymentDeclinedReason
      .map((e) => paymentDeclinedReasonFromJson(e.toString()))
      .toList();
}

int? educatorKindergartenPermissionMenuToJson(
    enums.EducatorKindergartenPermissionMenu?
        educatorKindergartenPermissionMenu) {
  return educatorKindergartenPermissionMenu?.value;
}

enums.EducatorKindergartenPermissionMenu
    educatorKindergartenPermissionMenuFromJson(
  Object? educatorKindergartenPermissionMenu, [
  enums.EducatorKindergartenPermissionMenu? defaultValue,
]) {
  return enums.EducatorKindergartenPermissionMenu.values.firstWhereOrNull(
          (e) => e.value == educatorKindergartenPermissionMenu) ??
      defaultValue ??
      enums.EducatorKindergartenPermissionMenu.swaggerGeneratedUnknown;
}

List<int> educatorKindergartenPermissionMenuListToJson(
    List<enums.EducatorKindergartenPermissionMenu>?
        educatorKindergartenPermissionMenu) {
  if (educatorKindergartenPermissionMenu == null) {
    return [];
  }

  return educatorKindergartenPermissionMenu.map((e) => e.value!).toList();
}

List<enums.EducatorKindergartenPermissionMenu>
    educatorKindergartenPermissionMenuListFromJson(
  List? educatorKindergartenPermissionMenu, [
  List<enums.EducatorKindergartenPermissionMenu>? defaultValue,
]) {
  if (educatorKindergartenPermissionMenu == null) {
    return defaultValue ?? [];
  }

  return educatorKindergartenPermissionMenu
      .map((e) => educatorKindergartenPermissionMenuFromJson(e.toString()))
      .toList();
}

List<enums.EducatorKindergartenPermissionMenu>?
    educatorKindergartenPermissionMenuNullableListFromJson(
  List? educatorKindergartenPermissionMenu, [
  List<enums.EducatorKindergartenPermissionMenu>? defaultValue,
]) {
  if (educatorKindergartenPermissionMenu == null) {
    return defaultValue;
  }

  return educatorKindergartenPermissionMenu
      .map((e) => educatorKindergartenPermissionMenuFromJson(e.toString()))
      .toList();
}

int? educatorKindergartenPermissionCalendarToJson(
    enums.EducatorKindergartenPermissionCalendar?
        educatorKindergartenPermissionCalendar) {
  return educatorKindergartenPermissionCalendar?.value;
}

enums.EducatorKindergartenPermissionCalendar
    educatorKindergartenPermissionCalendarFromJson(
  Object? educatorKindergartenPermissionCalendar, [
  enums.EducatorKindergartenPermissionCalendar? defaultValue,
]) {
  return enums.EducatorKindergartenPermissionCalendar.values.firstWhereOrNull(
          (e) => e.value == educatorKindergartenPermissionCalendar) ??
      defaultValue ??
      enums.EducatorKindergartenPermissionCalendar.swaggerGeneratedUnknown;
}

List<int> educatorKindergartenPermissionCalendarListToJson(
    List<enums.EducatorKindergartenPermissionCalendar>?
        educatorKindergartenPermissionCalendar) {
  if (educatorKindergartenPermissionCalendar == null) {
    return [];
  }

  return educatorKindergartenPermissionCalendar.map((e) => e.value!).toList();
}

List<enums.EducatorKindergartenPermissionCalendar>
    educatorKindergartenPermissionCalendarListFromJson(
  List? educatorKindergartenPermissionCalendar, [
  List<enums.EducatorKindergartenPermissionCalendar>? defaultValue,
]) {
  if (educatorKindergartenPermissionCalendar == null) {
    return defaultValue ?? [];
  }

  return educatorKindergartenPermissionCalendar
      .map((e) => educatorKindergartenPermissionCalendarFromJson(e.toString()))
      .toList();
}

List<enums.EducatorKindergartenPermissionCalendar>?
    educatorKindergartenPermissionCalendarNullableListFromJson(
  List? educatorKindergartenPermissionCalendar, [
  List<enums.EducatorKindergartenPermissionCalendar>? defaultValue,
]) {
  if (educatorKindergartenPermissionCalendar == null) {
    return defaultValue;
  }

  return educatorKindergartenPermissionCalendar
      .map((e) => educatorKindergartenPermissionCalendarFromJson(e.toString()))
      .toList();
}

int? educatorKindergartenPermissionEducatorContractsToJson(
    enums.EducatorKindergartenPermissionEducatorContracts?
        educatorKindergartenPermissionEducatorContracts) {
  return educatorKindergartenPermissionEducatorContracts?.value;
}

enums.EducatorKindergartenPermissionEducatorContracts
    educatorKindergartenPermissionEducatorContractsFromJson(
  Object? educatorKindergartenPermissionEducatorContracts, [
  enums.EducatorKindergartenPermissionEducatorContracts? defaultValue,
]) {
  return enums.EducatorKindergartenPermissionEducatorContracts.values
          .firstWhereOrNull((e) =>
              e.value == educatorKindergartenPermissionEducatorContracts) ??
      defaultValue ??
      enums.EducatorKindergartenPermissionEducatorContracts
          .swaggerGeneratedUnknown;
}

List<int> educatorKindergartenPermissionEducatorContractsListToJson(
    List<enums.EducatorKindergartenPermissionEducatorContracts>?
        educatorKindergartenPermissionEducatorContracts) {
  if (educatorKindergartenPermissionEducatorContracts == null) {
    return [];
  }

  return educatorKindergartenPermissionEducatorContracts
      .map((e) => e.value!)
      .toList();
}

List<enums.EducatorKindergartenPermissionEducatorContracts>
    educatorKindergartenPermissionEducatorContractsListFromJson(
  List? educatorKindergartenPermissionEducatorContracts, [
  List<enums.EducatorKindergartenPermissionEducatorContracts>? defaultValue,
]) {
  if (educatorKindergartenPermissionEducatorContracts == null) {
    return defaultValue ?? [];
  }

  return educatorKindergartenPermissionEducatorContracts
      .map((e) =>
          educatorKindergartenPermissionEducatorContractsFromJson(e.toString()))
      .toList();
}

List<enums.EducatorKindergartenPermissionEducatorContracts>?
    educatorKindergartenPermissionEducatorContractsNullableListFromJson(
  List? educatorKindergartenPermissionEducatorContracts, [
  List<enums.EducatorKindergartenPermissionEducatorContracts>? defaultValue,
]) {
  if (educatorKindergartenPermissionEducatorContracts == null) {
    return defaultValue;
  }

  return educatorKindergartenPermissionEducatorContracts
      .map((e) =>
          educatorKindergartenPermissionEducatorContractsFromJson(e.toString()))
      .toList();
}

int? educatorKindergartenPermissionPaymentsToJson(
    enums.EducatorKindergartenPermissionPayments?
        educatorKindergartenPermissionPayments) {
  return educatorKindergartenPermissionPayments?.value;
}

enums.EducatorKindergartenPermissionPayments
    educatorKindergartenPermissionPaymentsFromJson(
  Object? educatorKindergartenPermissionPayments, [
  enums.EducatorKindergartenPermissionPayments? defaultValue,
]) {
  return enums.EducatorKindergartenPermissionPayments.values.firstWhereOrNull(
          (e) => e.value == educatorKindergartenPermissionPayments) ??
      defaultValue ??
      enums.EducatorKindergartenPermissionPayments.swaggerGeneratedUnknown;
}

List<int> educatorKindergartenPermissionPaymentsListToJson(
    List<enums.EducatorKindergartenPermissionPayments>?
        educatorKindergartenPermissionPayments) {
  if (educatorKindergartenPermissionPayments == null) {
    return [];
  }

  return educatorKindergartenPermissionPayments.map((e) => e.value!).toList();
}

List<enums.EducatorKindergartenPermissionPayments>
    educatorKindergartenPermissionPaymentsListFromJson(
  List? educatorKindergartenPermissionPayments, [
  List<enums.EducatorKindergartenPermissionPayments>? defaultValue,
]) {
  if (educatorKindergartenPermissionPayments == null) {
    return defaultValue ?? [];
  }

  return educatorKindergartenPermissionPayments
      .map((e) => educatorKindergartenPermissionPaymentsFromJson(e.toString()))
      .toList();
}

List<enums.EducatorKindergartenPermissionPayments>?
    educatorKindergartenPermissionPaymentsNullableListFromJson(
  List? educatorKindergartenPermissionPayments, [
  List<enums.EducatorKindergartenPermissionPayments>? defaultValue,
]) {
  if (educatorKindergartenPermissionPayments == null) {
    return defaultValue;
  }

  return educatorKindergartenPermissionPayments
      .map((e) => educatorKindergartenPermissionPaymentsFromJson(e.toString()))
      .toList();
}

int? educatorKindergartenPermissionPresenceToJson(
    enums.EducatorKindergartenPermissionPresence?
        educatorKindergartenPermissionPresence) {
  return educatorKindergartenPermissionPresence?.value;
}

enums.EducatorKindergartenPermissionPresence
    educatorKindergartenPermissionPresenceFromJson(
  Object? educatorKindergartenPermissionPresence, [
  enums.EducatorKindergartenPermissionPresence? defaultValue,
]) {
  return enums.EducatorKindergartenPermissionPresence.values.firstWhereOrNull(
          (e) => e.value == educatorKindergartenPermissionPresence) ??
      defaultValue ??
      enums.EducatorKindergartenPermissionPresence.swaggerGeneratedUnknown;
}

List<int> educatorKindergartenPermissionPresenceListToJson(
    List<enums.EducatorKindergartenPermissionPresence>?
        educatorKindergartenPermissionPresence) {
  if (educatorKindergartenPermissionPresence == null) {
    return [];
  }

  return educatorKindergartenPermissionPresence.map((e) => e.value!).toList();
}

List<enums.EducatorKindergartenPermissionPresence>
    educatorKindergartenPermissionPresenceListFromJson(
  List? educatorKindergartenPermissionPresence, [
  List<enums.EducatorKindergartenPermissionPresence>? defaultValue,
]) {
  if (educatorKindergartenPermissionPresence == null) {
    return defaultValue ?? [];
  }

  return educatorKindergartenPermissionPresence
      .map((e) => educatorKindergartenPermissionPresenceFromJson(e.toString()))
      .toList();
}

List<enums.EducatorKindergartenPermissionPresence>?
    educatorKindergartenPermissionPresenceNullableListFromJson(
  List? educatorKindergartenPermissionPresence, [
  List<enums.EducatorKindergartenPermissionPresence>? defaultValue,
]) {
  if (educatorKindergartenPermissionPresence == null) {
    return defaultValue;
  }

  return educatorKindergartenPermissionPresence
      .map((e) => educatorKindergartenPermissionPresenceFromJson(e.toString()))
      .toList();
}

int? educatorKindergartenPermissionDayEvaluationToJson(
    enums.EducatorKindergartenPermissionDayEvaluation?
        educatorKindergartenPermissionDayEvaluation) {
  return educatorKindergartenPermissionDayEvaluation?.value;
}

enums.EducatorKindergartenPermissionDayEvaluation
    educatorKindergartenPermissionDayEvaluationFromJson(
  Object? educatorKindergartenPermissionDayEvaluation, [
  enums.EducatorKindergartenPermissionDayEvaluation? defaultValue,
]) {
  return enums.EducatorKindergartenPermissionDayEvaluation.values
          .firstWhereOrNull(
              (e) => e.value == educatorKindergartenPermissionDayEvaluation) ??
      defaultValue ??
      enums.EducatorKindergartenPermissionDayEvaluation.swaggerGeneratedUnknown;
}

List<int> educatorKindergartenPermissionDayEvaluationListToJson(
    List<enums.EducatorKindergartenPermissionDayEvaluation>?
        educatorKindergartenPermissionDayEvaluation) {
  if (educatorKindergartenPermissionDayEvaluation == null) {
    return [];
  }

  return educatorKindergartenPermissionDayEvaluation
      .map((e) => e.value!)
      .toList();
}

List<enums.EducatorKindergartenPermissionDayEvaluation>
    educatorKindergartenPermissionDayEvaluationListFromJson(
  List? educatorKindergartenPermissionDayEvaluation, [
  List<enums.EducatorKindergartenPermissionDayEvaluation>? defaultValue,
]) {
  if (educatorKindergartenPermissionDayEvaluation == null) {
    return defaultValue ?? [];
  }

  return educatorKindergartenPermissionDayEvaluation
      .map((e) =>
          educatorKindergartenPermissionDayEvaluationFromJson(e.toString()))
      .toList();
}

List<enums.EducatorKindergartenPermissionDayEvaluation>?
    educatorKindergartenPermissionDayEvaluationNullableListFromJson(
  List? educatorKindergartenPermissionDayEvaluation, [
  List<enums.EducatorKindergartenPermissionDayEvaluation>? defaultValue,
]) {
  if (educatorKindergartenPermissionDayEvaluation == null) {
    return defaultValue;
  }

  return educatorKindergartenPermissionDayEvaluation
      .map((e) =>
          educatorKindergartenPermissionDayEvaluationFromJson(e.toString()))
      .toList();
}

int? educatorKindergartenPermissionGroupsToJson(
    enums.EducatorKindergartenPermissionGroups?
        educatorKindergartenPermissionGroups) {
  return educatorKindergartenPermissionGroups?.value;
}

enums.EducatorKindergartenPermissionGroups
    educatorKindergartenPermissionGroupsFromJson(
  Object? educatorKindergartenPermissionGroups, [
  enums.EducatorKindergartenPermissionGroups? defaultValue,
]) {
  return enums.EducatorKindergartenPermissionGroups.values.firstWhereOrNull(
          (e) => e.value == educatorKindergartenPermissionGroups) ??
      defaultValue ??
      enums.EducatorKindergartenPermissionGroups.swaggerGeneratedUnknown;
}

List<int> educatorKindergartenPermissionGroupsListToJson(
    List<enums.EducatorKindergartenPermissionGroups>?
        educatorKindergartenPermissionGroups) {
  if (educatorKindergartenPermissionGroups == null) {
    return [];
  }

  return educatorKindergartenPermissionGroups.map((e) => e.value!).toList();
}

List<enums.EducatorKindergartenPermissionGroups>
    educatorKindergartenPermissionGroupsListFromJson(
  List? educatorKindergartenPermissionGroups, [
  List<enums.EducatorKindergartenPermissionGroups>? defaultValue,
]) {
  if (educatorKindergartenPermissionGroups == null) {
    return defaultValue ?? [];
  }

  return educatorKindergartenPermissionGroups
      .map((e) => educatorKindergartenPermissionGroupsFromJson(e.toString()))
      .toList();
}

List<enums.EducatorKindergartenPermissionGroups>?
    educatorKindergartenPermissionGroupsNullableListFromJson(
  List? educatorKindergartenPermissionGroups, [
  List<enums.EducatorKindergartenPermissionGroups>? defaultValue,
]) {
  if (educatorKindergartenPermissionGroups == null) {
    return defaultValue;
  }

  return educatorKindergartenPermissionGroups
      .map((e) => educatorKindergartenPermissionGroupsFromJson(e.toString()))
      .toList();
}

int? educatorKindergartenPermissionFastPickupToJson(
    enums.EducatorKindergartenPermissionFastPickup?
        educatorKindergartenPermissionFastPickup) {
  return educatorKindergartenPermissionFastPickup?.value;
}

enums.EducatorKindergartenPermissionFastPickup
    educatorKindergartenPermissionFastPickupFromJson(
  Object? educatorKindergartenPermissionFastPickup, [
  enums.EducatorKindergartenPermissionFastPickup? defaultValue,
]) {
  return enums.EducatorKindergartenPermissionFastPickup.values.firstWhereOrNull(
          (e) => e.value == educatorKindergartenPermissionFastPickup) ??
      defaultValue ??
      enums.EducatorKindergartenPermissionFastPickup.swaggerGeneratedUnknown;
}

List<int> educatorKindergartenPermissionFastPickupListToJson(
    List<enums.EducatorKindergartenPermissionFastPickup>?
        educatorKindergartenPermissionFastPickup) {
  if (educatorKindergartenPermissionFastPickup == null) {
    return [];
  }

  return educatorKindergartenPermissionFastPickup.map((e) => e.value!).toList();
}

List<enums.EducatorKindergartenPermissionFastPickup>
    educatorKindergartenPermissionFastPickupListFromJson(
  List? educatorKindergartenPermissionFastPickup, [
  List<enums.EducatorKindergartenPermissionFastPickup>? defaultValue,
]) {
  if (educatorKindergartenPermissionFastPickup == null) {
    return defaultValue ?? [];
  }

  return educatorKindergartenPermissionFastPickup
      .map(
          (e) => educatorKindergartenPermissionFastPickupFromJson(e.toString()))
      .toList();
}

List<enums.EducatorKindergartenPermissionFastPickup>?
    educatorKindergartenPermissionFastPickupNullableListFromJson(
  List? educatorKindergartenPermissionFastPickup, [
  List<enums.EducatorKindergartenPermissionFastPickup>? defaultValue,
]) {
  if (educatorKindergartenPermissionFastPickup == null) {
    return defaultValue;
  }

  return educatorKindergartenPermissionFastPickup
      .map(
          (e) => educatorKindergartenPermissionFastPickupFromJson(e.toString()))
      .toList();
}

int? educatorKindergartenPermissionChildDevelopmentProfileToJson(
    enums.EducatorKindergartenPermissionChildDevelopmentProfile?
        educatorKindergartenPermissionChildDevelopmentProfile) {
  return educatorKindergartenPermissionChildDevelopmentProfile?.value;
}

enums.EducatorKindergartenPermissionChildDevelopmentProfile
    educatorKindergartenPermissionChildDevelopmentProfileFromJson(
  Object? educatorKindergartenPermissionChildDevelopmentProfile, [
  enums.EducatorKindergartenPermissionChildDevelopmentProfile? defaultValue,
]) {
  return enums.EducatorKindergartenPermissionChildDevelopmentProfile.values
          .firstWhereOrNull((e) =>
              e.value ==
              educatorKindergartenPermissionChildDevelopmentProfile) ??
      defaultValue ??
      enums.EducatorKindergartenPermissionChildDevelopmentProfile
          .swaggerGeneratedUnknown;
}

List<int> educatorKindergartenPermissionChildDevelopmentProfileListToJson(
    List<enums.EducatorKindergartenPermissionChildDevelopmentProfile>?
        educatorKindergartenPermissionChildDevelopmentProfile) {
  if (educatorKindergartenPermissionChildDevelopmentProfile == null) {
    return [];
  }

  return educatorKindergartenPermissionChildDevelopmentProfile
      .map((e) => e.value!)
      .toList();
}

List<enums.EducatorKindergartenPermissionChildDevelopmentProfile>
    educatorKindergartenPermissionChildDevelopmentProfileListFromJson(
  List? educatorKindergartenPermissionChildDevelopmentProfile, [
  List<enums.EducatorKindergartenPermissionChildDevelopmentProfile>?
      defaultValue,
]) {
  if (educatorKindergartenPermissionChildDevelopmentProfile == null) {
    return defaultValue ?? [];
  }

  return educatorKindergartenPermissionChildDevelopmentProfile
      .map((e) => educatorKindergartenPermissionChildDevelopmentProfileFromJson(
          e.toString()))
      .toList();
}

List<enums.EducatorKindergartenPermissionChildDevelopmentProfile>?
    educatorKindergartenPermissionChildDevelopmentProfileNullableListFromJson(
  List? educatorKindergartenPermissionChildDevelopmentProfile, [
  List<enums.EducatorKindergartenPermissionChildDevelopmentProfile>?
      defaultValue,
]) {
  if (educatorKindergartenPermissionChildDevelopmentProfile == null) {
    return defaultValue;
  }

  return educatorKindergartenPermissionChildDevelopmentProfile
      .map((e) => educatorKindergartenPermissionChildDevelopmentProfileFromJson(
          e.toString()))
      .toList();
}

int? educatorKindergartenPermissionPostingToJson(
    enums.EducatorKindergartenPermissionPosting?
        educatorKindergartenPermissionPosting) {
  return educatorKindergartenPermissionPosting?.value;
}

enums.EducatorKindergartenPermissionPosting
    educatorKindergartenPermissionPostingFromJson(
  Object? educatorKindergartenPermissionPosting, [
  enums.EducatorKindergartenPermissionPosting? defaultValue,
]) {
  return enums.EducatorKindergartenPermissionPosting.values.firstWhereOrNull(
          (e) => e.value == educatorKindergartenPermissionPosting) ??
      defaultValue ??
      enums.EducatorKindergartenPermissionPosting.swaggerGeneratedUnknown;
}

List<int> educatorKindergartenPermissionPostingListToJson(
    List<enums.EducatorKindergartenPermissionPosting>?
        educatorKindergartenPermissionPosting) {
  if (educatorKindergartenPermissionPosting == null) {
    return [];
  }

  return educatorKindergartenPermissionPosting.map((e) => e.value!).toList();
}

List<enums.EducatorKindergartenPermissionPosting>
    educatorKindergartenPermissionPostingListFromJson(
  List? educatorKindergartenPermissionPosting, [
  List<enums.EducatorKindergartenPermissionPosting>? defaultValue,
]) {
  if (educatorKindergartenPermissionPosting == null) {
    return defaultValue ?? [];
  }

  return educatorKindergartenPermissionPosting
      .map((e) => educatorKindergartenPermissionPostingFromJson(e.toString()))
      .toList();
}

List<enums.EducatorKindergartenPermissionPosting>?
    educatorKindergartenPermissionPostingNullableListFromJson(
  List? educatorKindergartenPermissionPosting, [
  List<enums.EducatorKindergartenPermissionPosting>? defaultValue,
]) {
  if (educatorKindergartenPermissionPosting == null) {
    return defaultValue;
  }

  return educatorKindergartenPermissionPosting
      .map((e) => educatorKindergartenPermissionPostingFromJson(e.toString()))
      .toList();
}

int? educatorKindergartenPermissionChatToJson(
    enums.EducatorKindergartenPermissionChat?
        educatorKindergartenPermissionChat) {
  return educatorKindergartenPermissionChat?.value;
}

enums.EducatorKindergartenPermissionChat
    educatorKindergartenPermissionChatFromJson(
  Object? educatorKindergartenPermissionChat, [
  enums.EducatorKindergartenPermissionChat? defaultValue,
]) {
  return enums.EducatorKindergartenPermissionChat.values.firstWhereOrNull(
          (e) => e.value == educatorKindergartenPermissionChat) ??
      defaultValue ??
      enums.EducatorKindergartenPermissionChat.swaggerGeneratedUnknown;
}

List<int> educatorKindergartenPermissionChatListToJson(
    List<enums.EducatorKindergartenPermissionChat>?
        educatorKindergartenPermissionChat) {
  if (educatorKindergartenPermissionChat == null) {
    return [];
  }

  return educatorKindergartenPermissionChat.map((e) => e.value!).toList();
}

List<enums.EducatorKindergartenPermissionChat>
    educatorKindergartenPermissionChatListFromJson(
  List? educatorKindergartenPermissionChat, [
  List<enums.EducatorKindergartenPermissionChat>? defaultValue,
]) {
  if (educatorKindergartenPermissionChat == null) {
    return defaultValue ?? [];
  }

  return educatorKindergartenPermissionChat
      .map((e) => educatorKindergartenPermissionChatFromJson(e.toString()))
      .toList();
}

List<enums.EducatorKindergartenPermissionChat>?
    educatorKindergartenPermissionChatNullableListFromJson(
  List? educatorKindergartenPermissionChat, [
  List<enums.EducatorKindergartenPermissionChat>? defaultValue,
]) {
  if (educatorKindergartenPermissionChat == null) {
    return defaultValue;
  }

  return educatorKindergartenPermissionChat
      .map((e) => educatorKindergartenPermissionChatFromJson(e.toString()))
      .toList();
}

int? educatorKindergartenPermissionInscriptionsToJson(
    enums.EducatorKindergartenPermissionInscriptions?
        educatorKindergartenPermissionInscriptions) {
  return educatorKindergartenPermissionInscriptions?.value;
}

enums.EducatorKindergartenPermissionInscriptions
    educatorKindergartenPermissionInscriptionsFromJson(
  Object? educatorKindergartenPermissionInscriptions, [
  enums.EducatorKindergartenPermissionInscriptions? defaultValue,
]) {
  return enums.EducatorKindergartenPermissionInscriptions.values
          .firstWhereOrNull(
              (e) => e.value == educatorKindergartenPermissionInscriptions) ??
      defaultValue ??
      enums.EducatorKindergartenPermissionInscriptions.swaggerGeneratedUnknown;
}

List<int> educatorKindergartenPermissionInscriptionsListToJson(
    List<enums.EducatorKindergartenPermissionInscriptions>?
        educatorKindergartenPermissionInscriptions) {
  if (educatorKindergartenPermissionInscriptions == null) {
    return [];
  }

  return educatorKindergartenPermissionInscriptions
      .map((e) => e.value!)
      .toList();
}

List<enums.EducatorKindergartenPermissionInscriptions>
    educatorKindergartenPermissionInscriptionsListFromJson(
  List? educatorKindergartenPermissionInscriptions, [
  List<enums.EducatorKindergartenPermissionInscriptions>? defaultValue,
]) {
  if (educatorKindergartenPermissionInscriptions == null) {
    return defaultValue ?? [];
  }

  return educatorKindergartenPermissionInscriptions
      .map((e) =>
          educatorKindergartenPermissionInscriptionsFromJson(e.toString()))
      .toList();
}

List<enums.EducatorKindergartenPermissionInscriptions>?
    educatorKindergartenPermissionInscriptionsNullableListFromJson(
  List? educatorKindergartenPermissionInscriptions, [
  List<enums.EducatorKindergartenPermissionInscriptions>? defaultValue,
]) {
  if (educatorKindergartenPermissionInscriptions == null) {
    return defaultValue;
  }

  return educatorKindergartenPermissionInscriptions
      .map((e) =>
          educatorKindergartenPermissionInscriptionsFromJson(e.toString()))
      .toList();
}

int? educatorKindergartenPermissionParentsFamilyProfileToJson(
    enums.EducatorKindergartenPermissionParentsFamilyProfile?
        educatorKindergartenPermissionParentsFamilyProfile) {
  return educatorKindergartenPermissionParentsFamilyProfile?.value;
}

enums.EducatorKindergartenPermissionParentsFamilyProfile
    educatorKindergartenPermissionParentsFamilyProfileFromJson(
  Object? educatorKindergartenPermissionParentsFamilyProfile, [
  enums.EducatorKindergartenPermissionParentsFamilyProfile? defaultValue,
]) {
  return enums.EducatorKindergartenPermissionParentsFamilyProfile.values
          .firstWhereOrNull((e) =>
              e.value == educatorKindergartenPermissionParentsFamilyProfile) ??
      defaultValue ??
      enums.EducatorKindergartenPermissionParentsFamilyProfile
          .swaggerGeneratedUnknown;
}

List<int> educatorKindergartenPermissionParentsFamilyProfileListToJson(
    List<enums.EducatorKindergartenPermissionParentsFamilyProfile>?
        educatorKindergartenPermissionParentsFamilyProfile) {
  if (educatorKindergartenPermissionParentsFamilyProfile == null) {
    return [];
  }

  return educatorKindergartenPermissionParentsFamilyProfile
      .map((e) => e.value!)
      .toList();
}

List<enums.EducatorKindergartenPermissionParentsFamilyProfile>
    educatorKindergartenPermissionParentsFamilyProfileListFromJson(
  List? educatorKindergartenPermissionParentsFamilyProfile, [
  List<enums.EducatorKindergartenPermissionParentsFamilyProfile>? defaultValue,
]) {
  if (educatorKindergartenPermissionParentsFamilyProfile == null) {
    return defaultValue ?? [];
  }

  return educatorKindergartenPermissionParentsFamilyProfile
      .map((e) => educatorKindergartenPermissionParentsFamilyProfileFromJson(
          e.toString()))
      .toList();
}

List<enums.EducatorKindergartenPermissionParentsFamilyProfile>?
    educatorKindergartenPermissionParentsFamilyProfileNullableListFromJson(
  List? educatorKindergartenPermissionParentsFamilyProfile, [
  List<enums.EducatorKindergartenPermissionParentsFamilyProfile>? defaultValue,
]) {
  if (educatorKindergartenPermissionParentsFamilyProfile == null) {
    return defaultValue;
  }

  return educatorKindergartenPermissionParentsFamilyProfile
      .map((e) => educatorKindergartenPermissionParentsFamilyProfileFromJson(
          e.toString()))
      .toList();
}

int? educatorKindergartenPermissionEducatorProfileToJson(
    enums.EducatorKindergartenPermissionEducatorProfile?
        educatorKindergartenPermissionEducatorProfile) {
  return educatorKindergartenPermissionEducatorProfile?.value;
}

enums.EducatorKindergartenPermissionEducatorProfile
    educatorKindergartenPermissionEducatorProfileFromJson(
  Object? educatorKindergartenPermissionEducatorProfile, [
  enums.EducatorKindergartenPermissionEducatorProfile? defaultValue,
]) {
  return enums.EducatorKindergartenPermissionEducatorProfile.values
          .firstWhereOrNull((e) =>
              e.value == educatorKindergartenPermissionEducatorProfile) ??
      defaultValue ??
      enums.EducatorKindergartenPermissionEducatorProfile
          .swaggerGeneratedUnknown;
}

List<int> educatorKindergartenPermissionEducatorProfileListToJson(
    List<enums.EducatorKindergartenPermissionEducatorProfile>?
        educatorKindergartenPermissionEducatorProfile) {
  if (educatorKindergartenPermissionEducatorProfile == null) {
    return [];
  }

  return educatorKindergartenPermissionEducatorProfile
      .map((e) => e.value!)
      .toList();
}

List<enums.EducatorKindergartenPermissionEducatorProfile>
    educatorKindergartenPermissionEducatorProfileListFromJson(
  List? educatorKindergartenPermissionEducatorProfile, [
  List<enums.EducatorKindergartenPermissionEducatorProfile>? defaultValue,
]) {
  if (educatorKindergartenPermissionEducatorProfile == null) {
    return defaultValue ?? [];
  }

  return educatorKindergartenPermissionEducatorProfile
      .map((e) =>
          educatorKindergartenPermissionEducatorProfileFromJson(e.toString()))
      .toList();
}

List<enums.EducatorKindergartenPermissionEducatorProfile>?
    educatorKindergartenPermissionEducatorProfileNullableListFromJson(
  List? educatorKindergartenPermissionEducatorProfile, [
  List<enums.EducatorKindergartenPermissionEducatorProfile>? defaultValue,
]) {
  if (educatorKindergartenPermissionEducatorProfile == null) {
    return defaultValue;
  }

  return educatorKindergartenPermissionEducatorProfile
      .map((e) =>
          educatorKindergartenPermissionEducatorProfileFromJson(e.toString()))
      .toList();
}

int? educatorKindergartenPermissionMedicalFileFormToJson(
    enums.EducatorKindergartenPermissionMedicalFileForm?
        educatorKindergartenPermissionMedicalFileForm) {
  return educatorKindergartenPermissionMedicalFileForm?.value;
}

enums.EducatorKindergartenPermissionMedicalFileForm
    educatorKindergartenPermissionMedicalFileFormFromJson(
  Object? educatorKindergartenPermissionMedicalFileForm, [
  enums.EducatorKindergartenPermissionMedicalFileForm? defaultValue,
]) {
  return enums.EducatorKindergartenPermissionMedicalFileForm.values
          .firstWhereOrNull((e) =>
              e.value == educatorKindergartenPermissionMedicalFileForm) ??
      defaultValue ??
      enums.EducatorKindergartenPermissionMedicalFileForm
          .swaggerGeneratedUnknown;
}

List<int> educatorKindergartenPermissionMedicalFileFormListToJson(
    List<enums.EducatorKindergartenPermissionMedicalFileForm>?
        educatorKindergartenPermissionMedicalFileForm) {
  if (educatorKindergartenPermissionMedicalFileForm == null) {
    return [];
  }

  return educatorKindergartenPermissionMedicalFileForm
      .map((e) => e.value!)
      .toList();
}

List<enums.EducatorKindergartenPermissionMedicalFileForm>
    educatorKindergartenPermissionMedicalFileFormListFromJson(
  List? educatorKindergartenPermissionMedicalFileForm, [
  List<enums.EducatorKindergartenPermissionMedicalFileForm>? defaultValue,
]) {
  if (educatorKindergartenPermissionMedicalFileForm == null) {
    return defaultValue ?? [];
  }

  return educatorKindergartenPermissionMedicalFileForm
      .map((e) =>
          educatorKindergartenPermissionMedicalFileFormFromJson(e.toString()))
      .toList();
}

List<enums.EducatorKindergartenPermissionMedicalFileForm>?
    educatorKindergartenPermissionMedicalFileFormNullableListFromJson(
  List? educatorKindergartenPermissionMedicalFileForm, [
  List<enums.EducatorKindergartenPermissionMedicalFileForm>? defaultValue,
]) {
  if (educatorKindergartenPermissionMedicalFileForm == null) {
    return defaultValue;
  }

  return educatorKindergartenPermissionMedicalFileForm
      .map((e) =>
          educatorKindergartenPermissionMedicalFileFormFromJson(e.toString()))
      .toList();
}

String? childMedicalFileAllergySeverityToJson(
    enums.ChildMedicalFileAllergySeverity? childMedicalFileAllergySeverity) {
  return childMedicalFileAllergySeverity?.value;
}

enums.ChildMedicalFileAllergySeverity childMedicalFileAllergySeverityFromJson(
  Object? childMedicalFileAllergySeverity, [
  enums.ChildMedicalFileAllergySeverity? defaultValue,
]) {
  return enums.ChildMedicalFileAllergySeverity.values.firstWhereOrNull(
          (e) => e.value == childMedicalFileAllergySeverity) ??
      defaultValue ??
      enums.ChildMedicalFileAllergySeverity.swaggerGeneratedUnknown;
}

List<String> childMedicalFileAllergySeverityListToJson(
    List<enums.ChildMedicalFileAllergySeverity>?
        childMedicalFileAllergySeverity) {
  if (childMedicalFileAllergySeverity == null) {
    return [];
  }

  return childMedicalFileAllergySeverity.map((e) => e.value!).toList();
}

List<enums.ChildMedicalFileAllergySeverity>
    childMedicalFileAllergySeverityListFromJson(
  List? childMedicalFileAllergySeverity, [
  List<enums.ChildMedicalFileAllergySeverity>? defaultValue,
]) {
  if (childMedicalFileAllergySeverity == null) {
    return defaultValue ?? [];
  }

  return childMedicalFileAllergySeverity
      .map((e) => childMedicalFileAllergySeverityFromJson(e.toString()))
      .toList();
}

List<enums.ChildMedicalFileAllergySeverity>?
    childMedicalFileAllergySeverityNullableListFromJson(
  List? childMedicalFileAllergySeverity, [
  List<enums.ChildMedicalFileAllergySeverity>? defaultValue,
]) {
  if (childMedicalFileAllergySeverity == null) {
    return defaultValue;
  }

  return childMedicalFileAllergySeverity
      .map((e) => childMedicalFileAllergySeverityFromJson(e.toString()))
      .toList();
}

String? childMedicalFileMedicalConditionSeverityToJson(
    enums.ChildMedicalFileMedicalConditionSeverity?
        childMedicalFileMedicalConditionSeverity) {
  return childMedicalFileMedicalConditionSeverity?.value;
}

enums.ChildMedicalFileMedicalConditionSeverity
    childMedicalFileMedicalConditionSeverityFromJson(
  Object? childMedicalFileMedicalConditionSeverity, [
  enums.ChildMedicalFileMedicalConditionSeverity? defaultValue,
]) {
  return enums.ChildMedicalFileMedicalConditionSeverity.values.firstWhereOrNull(
          (e) => e.value == childMedicalFileMedicalConditionSeverity) ??
      defaultValue ??
      enums.ChildMedicalFileMedicalConditionSeverity.swaggerGeneratedUnknown;
}

List<String> childMedicalFileMedicalConditionSeverityListToJson(
    List<enums.ChildMedicalFileMedicalConditionSeverity>?
        childMedicalFileMedicalConditionSeverity) {
  if (childMedicalFileMedicalConditionSeverity == null) {
    return [];
  }

  return childMedicalFileMedicalConditionSeverity.map((e) => e.value!).toList();
}

List<enums.ChildMedicalFileMedicalConditionSeverity>
    childMedicalFileMedicalConditionSeverityListFromJson(
  List? childMedicalFileMedicalConditionSeverity, [
  List<enums.ChildMedicalFileMedicalConditionSeverity>? defaultValue,
]) {
  if (childMedicalFileMedicalConditionSeverity == null) {
    return defaultValue ?? [];
  }

  return childMedicalFileMedicalConditionSeverity
      .map(
          (e) => childMedicalFileMedicalConditionSeverityFromJson(e.toString()))
      .toList();
}

List<enums.ChildMedicalFileMedicalConditionSeverity>?
    childMedicalFileMedicalConditionSeverityNullableListFromJson(
  List? childMedicalFileMedicalConditionSeverity, [
  List<enums.ChildMedicalFileMedicalConditionSeverity>? defaultValue,
]) {
  if (childMedicalFileMedicalConditionSeverity == null) {
    return defaultValue;
  }

  return childMedicalFileMedicalConditionSeverity
      .map(
          (e) => childMedicalFileMedicalConditionSeverityFromJson(e.toString()))
      .toList();
}

String? childSexToJson(enums.ChildSex? childSex) {
  return childSex?.value;
}

enums.ChildSex childSexFromJson(
  Object? childSex, [
  enums.ChildSex? defaultValue,
]) {
  return enums.ChildSex.values.firstWhereOrNull((e) => e.value == childSex) ??
      defaultValue ??
      enums.ChildSex.swaggerGeneratedUnknown;
}

List<String> childSexListToJson(List<enums.ChildSex>? childSex) {
  if (childSex == null) {
    return [];
  }

  return childSex.map((e) => e.value!).toList();
}

List<enums.ChildSex> childSexListFromJson(
  List? childSex, [
  List<enums.ChildSex>? defaultValue,
]) {
  if (childSex == null) {
    return defaultValue ?? [];
  }

  return childSex.map((e) => childSexFromJson(e.toString())).toList();
}

List<enums.ChildSex>? childSexNullableListFromJson(
  List? childSex, [
  List<enums.ChildSex>? defaultValue,
]) {
  if (childSex == null) {
    return defaultValue;
  }

  return childSex.map((e) => childSexFromJson(e.toString())).toList();
}

String? trustedPerson$PhoneKindToJson(
    enums.TrustedPerson$PhoneKind? trustedPerson$PhoneKind) {
  return trustedPerson$PhoneKind?.value;
}

enums.TrustedPerson$PhoneKind trustedPerson$PhoneKindFromJson(
  Object? trustedPerson$PhoneKind, [
  enums.TrustedPerson$PhoneKind? defaultValue,
]) {
  return enums.TrustedPerson$PhoneKind.values
          .firstWhereOrNull((e) => e.value == trustedPerson$PhoneKind) ??
      defaultValue ??
      enums.TrustedPerson$PhoneKind.swaggerGeneratedUnknown;
}

List<String> trustedPerson$PhoneKindListToJson(
    List<enums.TrustedPerson$PhoneKind>? trustedPerson$PhoneKind) {
  if (trustedPerson$PhoneKind == null) {
    return [];
  }

  return trustedPerson$PhoneKind.map((e) => e.value!).toList();
}

List<enums.TrustedPerson$PhoneKind> trustedPerson$PhoneKindListFromJson(
  List? trustedPerson$PhoneKind, [
  List<enums.TrustedPerson$PhoneKind>? defaultValue,
]) {
  if (trustedPerson$PhoneKind == null) {
    return defaultValue ?? [];
  }

  return trustedPerson$PhoneKind
      .map((e) => trustedPerson$PhoneKindFromJson(e.toString()))
      .toList();
}

List<enums.TrustedPerson$PhoneKind>?
    trustedPerson$PhoneKindNullableListFromJson(
  List? trustedPerson$PhoneKind, [
  List<enums.TrustedPerson$PhoneKind>? defaultValue,
]) {
  if (trustedPerson$PhoneKind == null) {
    return defaultValue;
  }

  return trustedPerson$PhoneKind
      .map((e) => trustedPerson$PhoneKindFromJson(e.toString()))
      .toList();
}

String? trustedPersonSexToJson(enums.TrustedPersonSex? trustedPersonSex) {
  return trustedPersonSex?.value;
}

enums.TrustedPersonSex trustedPersonSexFromJson(
  Object? trustedPersonSex, [
  enums.TrustedPersonSex? defaultValue,
]) {
  return enums.TrustedPersonSex.values
          .firstWhereOrNull((e) => e.value == trustedPersonSex) ??
      defaultValue ??
      enums.TrustedPersonSex.swaggerGeneratedUnknown;
}

List<String> trustedPersonSexListToJson(
    List<enums.TrustedPersonSex>? trustedPersonSex) {
  if (trustedPersonSex == null) {
    return [];
  }

  return trustedPersonSex.map((e) => e.value!).toList();
}

List<enums.TrustedPersonSex> trustedPersonSexListFromJson(
  List? trustedPersonSex, [
  List<enums.TrustedPersonSex>? defaultValue,
]) {
  if (trustedPersonSex == null) {
    return defaultValue ?? [];
  }

  return trustedPersonSex
      .map((e) => trustedPersonSexFromJson(e.toString()))
      .toList();
}

List<enums.TrustedPersonSex>? trustedPersonSexNullableListFromJson(
  List? trustedPersonSex, [
  List<enums.TrustedPersonSex>? defaultValue,
]) {
  if (trustedPersonSex == null) {
    return defaultValue;
  }

  return trustedPersonSex
      .map((e) => trustedPersonSexFromJson(e.toString()))
      .toList();
}

String? trustedPersonLinkToJson(enums.TrustedPersonLink? trustedPersonLink) {
  return trustedPersonLink?.value;
}

enums.TrustedPersonLink trustedPersonLinkFromJson(
  Object? trustedPersonLink, [
  enums.TrustedPersonLink? defaultValue,
]) {
  return enums.TrustedPersonLink.values
          .firstWhereOrNull((e) => e.value == trustedPersonLink) ??
      defaultValue ??
      enums.TrustedPersonLink.swaggerGeneratedUnknown;
}

List<String> trustedPersonLinkListToJson(
    List<enums.TrustedPersonLink>? trustedPersonLink) {
  if (trustedPersonLink == null) {
    return [];
  }

  return trustedPersonLink.map((e) => e.value!).toList();
}

List<enums.TrustedPersonLink> trustedPersonLinkListFromJson(
  List? trustedPersonLink, [
  List<enums.TrustedPersonLink>? defaultValue,
]) {
  if (trustedPersonLink == null) {
    return defaultValue ?? [];
  }

  return trustedPersonLink
      .map((e) => trustedPersonLinkFromJson(e.toString()))
      .toList();
}

List<enums.TrustedPersonLink>? trustedPersonLinkNullableListFromJson(
  List? trustedPersonLink, [
  List<enums.TrustedPersonLink>? defaultValue,
]) {
  if (trustedPersonLink == null) {
    return defaultValue;
  }

  return trustedPersonLink
      .map((e) => trustedPersonLinkFromJson(e.toString()))
      .toList();
}

String? commentReactionReactionToJson(
    enums.CommentReactionReaction? commentReactionReaction) {
  return commentReactionReaction?.value;
}

enums.CommentReactionReaction commentReactionReactionFromJson(
  Object? commentReactionReaction, [
  enums.CommentReactionReaction? defaultValue,
]) {
  return enums.CommentReactionReaction.values
          .firstWhereOrNull((e) => e.value == commentReactionReaction) ??
      defaultValue ??
      enums.CommentReactionReaction.swaggerGeneratedUnknown;
}

List<String> commentReactionReactionListToJson(
    List<enums.CommentReactionReaction>? commentReactionReaction) {
  if (commentReactionReaction == null) {
    return [];
  }

  return commentReactionReaction.map((e) => e.value!).toList();
}

List<enums.CommentReactionReaction> commentReactionReactionListFromJson(
  List? commentReactionReaction, [
  List<enums.CommentReactionReaction>? defaultValue,
]) {
  if (commentReactionReaction == null) {
    return defaultValue ?? [];
  }

  return commentReactionReaction
      .map((e) => commentReactionReactionFromJson(e.toString()))
      .toList();
}

List<enums.CommentReactionReaction>?
    commentReactionReactionNullableListFromJson(
  List? commentReactionReaction, [
  List<enums.CommentReactionReaction>? defaultValue,
]) {
  if (commentReactionReaction == null) {
    return defaultValue;
  }

  return commentReactionReaction
      .map((e) => commentReactionReactionFromJson(e.toString()))
      .toList();
}

String? questionSubTypeToJson(enums.QuestionSubType? questionSubType) {
  return questionSubType?.value;
}

enums.QuestionSubType questionSubTypeFromJson(
  Object? questionSubType, [
  enums.QuestionSubType? defaultValue,
]) {
  return enums.QuestionSubType.values
          .firstWhereOrNull((e) => e.value == questionSubType) ??
      defaultValue ??
      enums.QuestionSubType.swaggerGeneratedUnknown;
}

List<String> questionSubTypeListToJson(
    List<enums.QuestionSubType>? questionSubType) {
  if (questionSubType == null) {
    return [];
  }

  return questionSubType.map((e) => e.value!).toList();
}

List<enums.QuestionSubType> questionSubTypeListFromJson(
  List? questionSubType, [
  List<enums.QuestionSubType>? defaultValue,
]) {
  if (questionSubType == null) {
    return defaultValue ?? [];
  }

  return questionSubType
      .map((e) => questionSubTypeFromJson(e.toString()))
      .toList();
}

List<enums.QuestionSubType>? questionSubTypeNullableListFromJson(
  List? questionSubType, [
  List<enums.QuestionSubType>? defaultValue,
]) {
  if (questionSubType == null) {
    return defaultValue;
  }

  return questionSubType
      .map((e) => questionSubTypeFromJson(e.toString()))
      .toList();
}

String? publicationReactionReactionToJson(
    enums.PublicationReactionReaction? publicationReactionReaction) {
  return publicationReactionReaction?.value;
}

enums.PublicationReactionReaction publicationReactionReactionFromJson(
  Object? publicationReactionReaction, [
  enums.PublicationReactionReaction? defaultValue,
]) {
  return enums.PublicationReactionReaction.values
          .firstWhereOrNull((e) => e.value == publicationReactionReaction) ??
      defaultValue ??
      enums.PublicationReactionReaction.swaggerGeneratedUnknown;
}

List<String> publicationReactionReactionListToJson(
    List<enums.PublicationReactionReaction>? publicationReactionReaction) {
  if (publicationReactionReaction == null) {
    return [];
  }

  return publicationReactionReaction.map((e) => e.value!).toList();
}

List<enums.PublicationReactionReaction> publicationReactionReactionListFromJson(
  List? publicationReactionReaction, [
  List<enums.PublicationReactionReaction>? defaultValue,
]) {
  if (publicationReactionReaction == null) {
    return defaultValue ?? [];
  }

  return publicationReactionReaction
      .map((e) => publicationReactionReactionFromJson(e.toString()))
      .toList();
}

List<enums.PublicationReactionReaction>?
    publicationReactionReactionNullableListFromJson(
  List? publicationReactionReaction, [
  List<enums.PublicationReactionReaction>? defaultValue,
]) {
  if (publicationReactionReaction == null) {
    return defaultValue;
  }

  return publicationReactionReaction
      .map((e) => publicationReactionReactionFromJson(e.toString()))
      .toList();
}

String? educator$EducatorprofileSexToJson(
    enums.Educator$EducatorprofileSex? educator$EducatorprofileSex) {
  return educator$EducatorprofileSex?.value;
}

enums.Educator$EducatorprofileSex educator$EducatorprofileSexFromJson(
  Object? educator$EducatorprofileSex, [
  enums.Educator$EducatorprofileSex? defaultValue,
]) {
  return enums.Educator$EducatorprofileSex.values
          .firstWhereOrNull((e) => e.value == educator$EducatorprofileSex) ??
      defaultValue ??
      enums.Educator$EducatorprofileSex.swaggerGeneratedUnknown;
}

List<String> educator$EducatorprofileSexListToJson(
    List<enums.Educator$EducatorprofileSex>? educator$EducatorprofileSex) {
  if (educator$EducatorprofileSex == null) {
    return [];
  }

  return educator$EducatorprofileSex.map((e) => e.value!).toList();
}

List<enums.Educator$EducatorprofileSex> educator$EducatorprofileSexListFromJson(
  List? educator$EducatorprofileSex, [
  List<enums.Educator$EducatorprofileSex>? defaultValue,
]) {
  if (educator$EducatorprofileSex == null) {
    return defaultValue ?? [];
  }

  return educator$EducatorprofileSex
      .map((e) => educator$EducatorprofileSexFromJson(e.toString()))
      .toList();
}

List<enums.Educator$EducatorprofileSex>?
    educator$EducatorprofileSexNullableListFromJson(
  List? educator$EducatorprofileSex, [
  List<enums.Educator$EducatorprofileSex>? defaultValue,
]) {
  if (educator$EducatorprofileSex == null) {
    return defaultValue;
  }

  return educator$EducatorprofileSex
      .map((e) => educator$EducatorprofileSexFromJson(e.toString()))
      .toList();
}

String? childSearchSexToJson(enums.ChildSearchSex? childSearchSex) {
  return childSearchSex?.value;
}

enums.ChildSearchSex childSearchSexFromJson(
  Object? childSearchSex, [
  enums.ChildSearchSex? defaultValue,
]) {
  return enums.ChildSearchSex.values
          .firstWhereOrNull((e) => e.value == childSearchSex) ??
      defaultValue ??
      enums.ChildSearchSex.swaggerGeneratedUnknown;
}

List<String> childSearchSexListToJson(
    List<enums.ChildSearchSex>? childSearchSex) {
  if (childSearchSex == null) {
    return [];
  }

  return childSearchSex.map((e) => e.value!).toList();
}

List<enums.ChildSearchSex> childSearchSexListFromJson(
  List? childSearchSex, [
  List<enums.ChildSearchSex>? defaultValue,
]) {
  if (childSearchSex == null) {
    return defaultValue ?? [];
  }

  return childSearchSex
      .map((e) => childSearchSexFromJson(e.toString()))
      .toList();
}

List<enums.ChildSearchSex>? childSearchSexNullableListFromJson(
  List? childSearchSex, [
  List<enums.ChildSearchSex>? defaultValue,
]) {
  if (childSearchSex == null) {
    return defaultValue;
  }

  return childSearchSex
      .map((e) => childSearchSexFromJson(e.toString()))
      .toList();
}

String? parentProfile$PhoneKindToJson(
    enums.ParentProfile$PhoneKind? parentProfile$PhoneKind) {
  return parentProfile$PhoneKind?.value;
}

enums.ParentProfile$PhoneKind parentProfile$PhoneKindFromJson(
  Object? parentProfile$PhoneKind, [
  enums.ParentProfile$PhoneKind? defaultValue,
]) {
  return enums.ParentProfile$PhoneKind.values
          .firstWhereOrNull((e) => e.value == parentProfile$PhoneKind) ??
      defaultValue ??
      enums.ParentProfile$PhoneKind.swaggerGeneratedUnknown;
}

List<String> parentProfile$PhoneKindListToJson(
    List<enums.ParentProfile$PhoneKind>? parentProfile$PhoneKind) {
  if (parentProfile$PhoneKind == null) {
    return [];
  }

  return parentProfile$PhoneKind.map((e) => e.value!).toList();
}

List<enums.ParentProfile$PhoneKind> parentProfile$PhoneKindListFromJson(
  List? parentProfile$PhoneKind, [
  List<enums.ParentProfile$PhoneKind>? defaultValue,
]) {
  if (parentProfile$PhoneKind == null) {
    return defaultValue ?? [];
  }

  return parentProfile$PhoneKind
      .map((e) => parentProfile$PhoneKindFromJson(e.toString()))
      .toList();
}

List<enums.ParentProfile$PhoneKind>?
    parentProfile$PhoneKindNullableListFromJson(
  List? parentProfile$PhoneKind, [
  List<enums.ParentProfile$PhoneKind>? defaultValue,
]) {
  if (parentProfile$PhoneKind == null) {
    return defaultValue;
  }

  return parentProfile$PhoneKind
      .map((e) => parentProfile$PhoneKindFromJson(e.toString()))
      .toList();
}

String? parentProfileSexToJson(enums.ParentProfileSex? parentProfileSex) {
  return parentProfileSex?.value;
}

enums.ParentProfileSex parentProfileSexFromJson(
  Object? parentProfileSex, [
  enums.ParentProfileSex? defaultValue,
]) {
  return enums.ParentProfileSex.values
          .firstWhereOrNull((e) => e.value == parentProfileSex) ??
      defaultValue ??
      enums.ParentProfileSex.swaggerGeneratedUnknown;
}

List<String> parentProfileSexListToJson(
    List<enums.ParentProfileSex>? parentProfileSex) {
  if (parentProfileSex == null) {
    return [];
  }

  return parentProfileSex.map((e) => e.value!).toList();
}

List<enums.ParentProfileSex> parentProfileSexListFromJson(
  List? parentProfileSex, [
  List<enums.ParentProfileSex>? defaultValue,
]) {
  if (parentProfileSex == null) {
    return defaultValue ?? [];
  }

  return parentProfileSex
      .map((e) => parentProfileSexFromJson(e.toString()))
      .toList();
}

List<enums.ParentProfileSex>? parentProfileSexNullableListFromJson(
  List? parentProfileSex, [
  List<enums.ParentProfileSex>? defaultValue,
]) {
  if (parentProfileSex == null) {
    return defaultValue;
  }

  return parentProfileSex
      .map((e) => parentProfileSexFromJson(e.toString()))
      .toList();
}

String? wholeChildFamilyPrimaryContactToJson(
    enums.WholeChildFamilyPrimaryContact? wholeChildFamilyPrimaryContact) {
  return wholeChildFamilyPrimaryContact?.value;
}

enums.WholeChildFamilyPrimaryContact wholeChildFamilyPrimaryContactFromJson(
  Object? wholeChildFamilyPrimaryContact, [
  enums.WholeChildFamilyPrimaryContact? defaultValue,
]) {
  return enums.WholeChildFamilyPrimaryContact.values
          .firstWhereOrNull((e) => e.value == wholeChildFamilyPrimaryContact) ??
      defaultValue ??
      enums.WholeChildFamilyPrimaryContact.swaggerGeneratedUnknown;
}

List<String> wholeChildFamilyPrimaryContactListToJson(
    List<enums.WholeChildFamilyPrimaryContact>?
        wholeChildFamilyPrimaryContact) {
  if (wholeChildFamilyPrimaryContact == null) {
    return [];
  }

  return wholeChildFamilyPrimaryContact.map((e) => e.value!).toList();
}

List<enums.WholeChildFamilyPrimaryContact>
    wholeChildFamilyPrimaryContactListFromJson(
  List? wholeChildFamilyPrimaryContact, [
  List<enums.WholeChildFamilyPrimaryContact>? defaultValue,
]) {
  if (wholeChildFamilyPrimaryContact == null) {
    return defaultValue ?? [];
  }

  return wholeChildFamilyPrimaryContact
      .map((e) => wholeChildFamilyPrimaryContactFromJson(e.toString()))
      .toList();
}

List<enums.WholeChildFamilyPrimaryContact>?
    wholeChildFamilyPrimaryContactNullableListFromJson(
  List? wholeChildFamilyPrimaryContact, [
  List<enums.WholeChildFamilyPrimaryContact>? defaultValue,
]) {
  if (wholeChildFamilyPrimaryContact == null) {
    return defaultValue;
  }

  return wholeChildFamilyPrimaryContact
      .map((e) => wholeChildFamilyPrimaryContactFromJson(e.toString()))
      .toList();
}

String? wholeChildSexToJson(enums.WholeChildSex? wholeChildSex) {
  return wholeChildSex?.value;
}

enums.WholeChildSex wholeChildSexFromJson(
  Object? wholeChildSex, [
  enums.WholeChildSex? defaultValue,
]) {
  return enums.WholeChildSex.values
          .firstWhereOrNull((e) => e.value == wholeChildSex) ??
      defaultValue ??
      enums.WholeChildSex.swaggerGeneratedUnknown;
}

List<String> wholeChildSexListToJson(List<enums.WholeChildSex>? wholeChildSex) {
  if (wholeChildSex == null) {
    return [];
  }

  return wholeChildSex.map((e) => e.value!).toList();
}

List<enums.WholeChildSex> wholeChildSexListFromJson(
  List? wholeChildSex, [
  List<enums.WholeChildSex>? defaultValue,
]) {
  if (wholeChildSex == null) {
    return defaultValue ?? [];
  }

  return wholeChildSex.map((e) => wholeChildSexFromJson(e.toString())).toList();
}

List<enums.WholeChildSex>? wholeChildSexNullableListFromJson(
  List? wholeChildSex, [
  List<enums.WholeChildSex>? defaultValue,
]) {
  if (wholeChildSex == null) {
    return defaultValue;
  }

  return wholeChildSex.map((e) => wholeChildSexFromJson(e.toString())).toList();
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (isTypeOf<T, Map>()) {
      return entity;
    }

    if (isTypeOf<T, Iterable>()) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  FutureOr<chopper.Response<ResultType>> convertResponse<ResultType, Item>(
      chopper.Response response) async {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    final jsonRes = await super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}

class Wrapped<T> {
  final T value;
  const Wrapped.value(this.value);
}
