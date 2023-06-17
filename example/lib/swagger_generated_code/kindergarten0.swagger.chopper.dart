//Generated code

part of 'kindergarten0.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$Kindergarten0 extends Kindergarten0 {
  _$Kindergarten0([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = Kindergarten0;

  @override
  Future<Response<ChatGroupsGet$Response>> _chatGroupsGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/chat/groups/');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page_size': pageSize,
    };
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client
        .send<ChatGroupsGet$Response, ChatGroupsGet$Response>($request);
  }

  @override
  Future<Response<ChatGroupCreate>> _chatGroupsPost({
    required ChatGroupCreate? data,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/chat/groups/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<ChatGroupCreate, ChatGroupCreate>($request);
  }

  @override
  Future<Response<CurrentChatMember>> _chatGroupsGroupIdCurrentChatMemberGet({
    required String? groupId,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/chat/groups/${groupId}/current_chat_member');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<CurrentChatMember, CurrentChatMember>($request);
  }

  @override
  Future<Response<CurrentChatMember>> _chatGroupsGroupIdCurrentChatMemberPut({
    required CurrentChatMember? data,
    required String? groupId,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/chat/groups/${groupId}/current_chat_member');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<CurrentChatMember, CurrentChatMember>($request);
  }

  @override
  Future<Response<CurrentChatMember>> _chatGroupsGroupIdCurrentChatMemberPatch({
    required CurrentChatMember? data,
    required String? groupId,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/chat/groups/${groupId}/current_chat_member');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<CurrentChatMember, CurrentChatMember>($request);
  }

  @override
  Future<Response<ChatGroupsGroupIdMessagesGet$Response>>
      _chatGroupsGroupIdMessagesGet({
    String? search,
    int? page,
    int? pageSize,
    required String? groupId,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/chat/groups/${groupId}/messages');
    final Map<String, dynamic> $params = <String, dynamic>{
      'search': search,
      'page': page,
      'page_size': pageSize,
    };
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<ChatGroupsGroupIdMessagesGet$Response,
        ChatGroupsGroupIdMessagesGet$Response>($request);
  }

  @override
  Future<Response<ChatGroupsGroupIdMessagesUploadGet$Response>>
      _chatGroupsGroupIdMessagesUploadGet({
    int? page,
    int? pageSize,
    String? fileType,
    required String? groupId,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/chat/groups/${groupId}/messages/upload');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page_size': pageSize,
      'file_type': fileType,
    };
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<ChatGroupsGroupIdMessagesUploadGet$Response,
        ChatGroupsGroupIdMessagesUploadGet$Response>($request);
  }

  @override
  Future<Response<ChatMessageFile>> _chatGroupsGroupIdMessagesUploadPost({
    required ChatMessageFile? data,
    required String? groupId,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/chat/groups/${groupId}/messages/upload');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<ChatMessageFile, ChatMessageFile>($request);
  }

  @override
  Future<Response<ChatGroupsGroupIdSharedLinksGet$Response>>
      _chatGroupsGroupIdSharedLinksGet({
    int? page,
    int? pageSize,
    required String? groupId,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/chat/groups/${groupId}/shared_links');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page_size': pageSize,
    };
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<ChatGroupsGroupIdSharedLinksGet$Response,
        ChatGroupsGroupIdSharedLinksGet$Response>($request);
  }

  @override
  Future<Response<ChatGroup>> _chatGroupsIdGet({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/chat/groups/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<ChatGroup, ChatGroup>($request);
  }

  @override
  Future<Response<ChatGroup>> _chatGroupsIdPut({
    required ChatGroup? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/chat/groups/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<ChatGroup, ChatGroup>($request);
  }

  @override
  Future<Response<ChatGroup>> _chatGroupsIdPatch({
    required ChatGroup? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/chat/groups/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<ChatGroup, ChatGroup>($request);
  }

  @override
  Future<Response<dynamic>> _chatGroupsIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/chat/groups/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<ChildDailySummaryGet$Response>> _childDailySummaryGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/child/daily_summary/');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page_size': pageSize,
    };
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<ChildDailySummaryGet$Response,
        ChildDailySummaryGet$Response>($request);
  }

  @override
  Future<Response<DaySummary>> _childDailySummaryPost({
    required DaySummary? data,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/child/daily_summary/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<DaySummary, DaySummary>($request);
  }

  @override
  Future<Response<DaySummary>> _childDailySummaryIdGet({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/child/daily_summary/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<DaySummary, DaySummary>($request);
  }

  @override
  Future<Response<DaySummary>> _childDailySummaryIdPut({
    required DaySummary? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/child/daily_summary/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<DaySummary, DaySummary>($request);
  }

  @override
  Future<Response<DaySummary>> _childDailySummaryIdPatch({
    required DaySummary? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/child/daily_summary/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<DaySummary, DaySummary>($request);
  }

  @override
  Future<Response<dynamic>> _childDailySummaryIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/child/daily_summary/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<EducatorTimesheetAvailabilityGet$Response>>
      _educatorTimesheetAvailabilityGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/educator_timesheet/availability/');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page_size': pageSize,
    };
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<EducatorTimesheetAvailabilityGet$Response,
        EducatorTimesheetAvailabilityGet$Response>($request);
  }

  @override
  Future<Response<EducatorAvailability>> _educatorTimesheetAvailabilityPost({
    required EducatorAvailability? data,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/educator_timesheet/availability/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<EducatorAvailability, EducatorAvailability>($request);
  }

  @override
  Future<Response<EducatorAvailability>> _educatorTimesheetAvailabilityPut({
    required EducatorAvailability? data,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/educator_timesheet/availability/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<EducatorAvailability, EducatorAvailability>($request);
  }

  @override
  Future<Response<EducatorAvailability>> _educatorTimesheetAvailabilityPatch({
    required EducatorAvailability? data,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/educator_timesheet/availability/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<EducatorAvailability, EducatorAvailability>($request);
  }

  @override
  Future<Response<dynamic>> _educatorTimesheetAvailabilityDelete(
      {String? cacheControl}) {
    final Uri $url = Uri.parse('/educator_timesheet/availability/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<EducatorAvailability>> _educatorTimesheetAvailabilityIdGet({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/educator_timesheet/availability/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<EducatorAvailability, EducatorAvailability>($request);
  }

  @override
  Future<Response<EducatorAvailability>> _educatorTimesheetAvailabilityIdPut({
    required EducatorAvailability? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/educator_timesheet/availability/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<EducatorAvailability, EducatorAvailability>($request);
  }

  @override
  Future<Response<EducatorAvailability>> _educatorTimesheetAvailabilityIdPatch({
    required EducatorAvailability? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/educator_timesheet/availability/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<EducatorAvailability, EducatorAvailability>($request);
  }

  @override
  Future<Response<dynamic>> _educatorTimesheetAvailabilityIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/educator_timesheet/availability/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<EducatorTimesheetScheduleGet$Response>>
      _educatorTimesheetScheduleGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/educator_timesheet/schedule/');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page_size': pageSize,
    };
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<EducatorTimesheetScheduleGet$Response,
        EducatorTimesheetScheduleGet$Response>($request);
  }

  @override
  Future<Response<EducatorSchedule>> _educatorTimesheetSchedulePost({
    required EducatorSchedule? data,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/educator_timesheet/schedule/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<EducatorSchedule, EducatorSchedule>($request);
  }

  @override
  Future<Response<EducatorSchedule>> _educatorTimesheetSchedulePut({
    required EducatorSchedule? data,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/educator_timesheet/schedule/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<EducatorSchedule, EducatorSchedule>($request);
  }

  @override
  Future<Response<EducatorSchedule>> _educatorTimesheetSchedulePatch({
    required EducatorSchedule? data,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/educator_timesheet/schedule/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<EducatorSchedule, EducatorSchedule>($request);
  }

  @override
  Future<Response<dynamic>> _educatorTimesheetScheduleDelete(
      {String? cacheControl}) {
    final Uri $url = Uri.parse('/educator_timesheet/schedule/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<EducatorSchedule>> _educatorTimesheetScheduleIdGet({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/educator_timesheet/schedule/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<EducatorSchedule, EducatorSchedule>($request);
  }

  @override
  Future<Response<EducatorSchedule>> _educatorTimesheetScheduleIdPut({
    required EducatorSchedule? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/educator_timesheet/schedule/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<EducatorSchedule, EducatorSchedule>($request);
  }

  @override
  Future<Response<EducatorSchedule>> _educatorTimesheetScheduleIdPatch({
    required EducatorSchedule? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/educator_timesheet/schedule/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<EducatorSchedule, EducatorSchedule>($request);
  }

  @override
  Future<Response<dynamic>> _educatorTimesheetScheduleIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/educator_timesheet/schedule/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<EducatorSchedule>>> _educatorTimesheetScheduleClonePost({
    required Object? data,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/educator_timesheet/schedule_clone/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<List<EducatorSchedule>, EducatorSchedule>($request);
  }

  @override
  Future<Response<EducatorTimesheetSettingsGet$Response>>
      _educatorTimesheetSettingsGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/educator_timesheet/settings/');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page_size': pageSize,
    };
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<EducatorTimesheetSettingsGet$Response,
        EducatorTimesheetSettingsGet$Response>($request);
  }

  @override
  Future<Response<GeneralEducatorTimeSheetSettings>>
      _educatorTimesheetSettingsPost({
    required GeneralEducatorTimeSheetSettings? data,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/educator_timesheet/settings/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<GeneralEducatorTimeSheetSettings,
        GeneralEducatorTimeSheetSettings>($request);
  }

  @override
  Future<Response<EducatorTimesheetSettingsExperienceGet$Response>>
      _educatorTimesheetSettingsExperienceGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/educator_timesheet/settings/experience/');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page_size': pageSize,
    };
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<EducatorTimesheetSettingsExperienceGet$Response,
        EducatorTimesheetSettingsExperienceGet$Response>($request);
  }

  @override
  Future<Response<EducatorExperienceLevelSettings>>
      _educatorTimesheetSettingsExperiencePost({
    required EducatorExperienceLevelSettings? data,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/educator_timesheet/settings/experience/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<EducatorExperienceLevelSettings,
        EducatorExperienceLevelSettings>($request);
  }

  @override
  Future<Response<EducatorExperienceLevelSettings>>
      _educatorTimesheetSettingsExperienceIdGet({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url =
        Uri.parse('/educator_timesheet/settings/experience/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<EducatorExperienceLevelSettings,
        EducatorExperienceLevelSettings>($request);
  }

  @override
  Future<Response<EducatorExperienceLevelSettings>>
      _educatorTimesheetSettingsExperienceIdPut({
    required EducatorExperienceLevelSettings? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url =
        Uri.parse('/educator_timesheet/settings/experience/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<EducatorExperienceLevelSettings,
        EducatorExperienceLevelSettings>($request);
  }

  @override
  Future<Response<EducatorExperienceLevelSettings>>
      _educatorTimesheetSettingsExperienceIdPatch({
    required EducatorExperienceLevelSettings? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url =
        Uri.parse('/educator_timesheet/settings/experience/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<EducatorExperienceLevelSettings,
        EducatorExperienceLevelSettings>($request);
  }

  @override
  Future<Response<dynamic>> _educatorTimesheetSettingsExperienceIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url =
        Uri.parse('/educator_timesheet/settings/experience/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<EducatorTimesheetSettingsIndividualGet$Response>>
      _educatorTimesheetSettingsIndividualGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/educator_timesheet/settings/individual/');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page_size': pageSize,
    };
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<EducatorTimesheetSettingsIndividualGet$Response,
        EducatorTimesheetSettingsIndividualGet$Response>($request);
  }

  @override
  Future<Response<IndividualEmployeeTimeSheetSettings>>
      _educatorTimesheetSettingsIndividualPost({
    required IndividualEmployeeTimeSheetSettings? data,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/educator_timesheet/settings/individual/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<IndividualEmployeeTimeSheetSettings,
        IndividualEmployeeTimeSheetSettings>($request);
  }

  @override
  Future<Response<IndividualEmployeeTimeSheetSettings>>
      _educatorTimesheetSettingsIndividualIdGet({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url =
        Uri.parse('/educator_timesheet/settings/individual/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<IndividualEmployeeTimeSheetSettings,
        IndividualEmployeeTimeSheetSettings>($request);
  }

  @override
  Future<Response<IndividualEmployeeTimeSheetSettings>>
      _educatorTimesheetSettingsIndividualIdPut({
    required IndividualEmployeeTimeSheetSettings? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url =
        Uri.parse('/educator_timesheet/settings/individual/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<IndividualEmployeeTimeSheetSettings,
        IndividualEmployeeTimeSheetSettings>($request);
  }

  @override
  Future<Response<IndividualEmployeeTimeSheetSettings>>
      _educatorTimesheetSettingsIndividualIdPatch({
    required IndividualEmployeeTimeSheetSettings? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url =
        Uri.parse('/educator_timesheet/settings/individual/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<IndividualEmployeeTimeSheetSettings,
        IndividualEmployeeTimeSheetSettings>($request);
  }

  @override
  Future<Response<dynamic>> _educatorTimesheetSettingsIndividualIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url =
        Uri.parse('/educator_timesheet/settings/individual/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<GeneralEducatorTimeSheetSettings>>
      _educatorTimesheetSettingsIdGet({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/educator_timesheet/settings/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<GeneralEducatorTimeSheetSettings,
        GeneralEducatorTimeSheetSettings>($request);
  }

  @override
  Future<Response<GeneralEducatorTimeSheetSettings>>
      _educatorTimesheetSettingsIdPut({
    required GeneralEducatorTimeSheetSettings? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/educator_timesheet/settings/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<GeneralEducatorTimeSheetSettings,
        GeneralEducatorTimeSheetSettings>($request);
  }

  @override
  Future<Response<GeneralEducatorTimeSheetSettings>>
      _educatorTimesheetSettingsIdPatch({
    required GeneralEducatorTimeSheetSettings? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/educator_timesheet/settings/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<GeneralEducatorTimeSheetSettings,
        GeneralEducatorTimeSheetSettings>($request);
  }

  @override
  Future<Response<dynamic>> _educatorTimesheetSettingsIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/educator_timesheet/settings/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<EducatorTimesheetTimesheetGet$Response>>
      _educatorTimesheetTimesheetGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/educator_timesheet/timesheet/');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page_size': pageSize,
    };
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<EducatorTimesheetTimesheetGet$Response,
        EducatorTimesheetTimesheetGet$Response>($request);
  }

  @override
  Future<Response<EducatorTimeSheet>> _educatorTimesheetTimesheetPost({
    required EducatorTimeSheet? data,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/educator_timesheet/timesheet/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<EducatorTimeSheet, EducatorTimeSheet>($request);
  }

  @override
  Future<Response<EducatorTimeSheet>> _educatorTimesheetTimesheetPut({
    required EducatorTimeSheet? data,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/educator_timesheet/timesheet/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<EducatorTimeSheet, EducatorTimeSheet>($request);
  }

  @override
  Future<Response<EducatorTimeSheet>> _educatorTimesheetTimesheetPatch({
    required EducatorTimeSheet? data,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/educator_timesheet/timesheet/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<EducatorTimeSheet, EducatorTimeSheet>($request);
  }

  @override
  Future<Response<dynamic>> _educatorTimesheetTimesheetDelete(
      {String? cacheControl}) {
    final Uri $url = Uri.parse('/educator_timesheet/timesheet/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<EducatorTimeSheet>> _educatorTimesheetTimesheetIdGet({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/educator_timesheet/timesheet/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<EducatorTimeSheet, EducatorTimeSheet>($request);
  }

  @override
  Future<Response<EducatorTimeSheet>> _educatorTimesheetTimesheetIdPut({
    required EducatorTimeSheet? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/educator_timesheet/timesheet/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<EducatorTimeSheet, EducatorTimeSheet>($request);
  }

  @override
  Future<Response<EducatorTimeSheet>> _educatorTimesheetTimesheetIdPatch({
    required EducatorTimeSheet? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/educator_timesheet/timesheet/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<EducatorTimeSheet, EducatorTimeSheet>($request);
  }

  @override
  Future<Response<dynamic>> _educatorTimesheetTimesheetIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/educator_timesheet/timesheet/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<EventsGet$Response>> _eventsGet({
    String? search,
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/events/');
    final Map<String, dynamic> $params = <String, dynamic>{
      'search': search,
      'page': page,
      'page_size': pageSize,
    };
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<EventsGet$Response, EventsGet$Response>($request);
  }

  @override
  Future<Response<Event>> _eventsPost({
    required Event? data,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/events/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<Event, Event>($request);
  }

  @override
  Future<Response<EventsEventsOccurrenceGet$Response>>
      _eventsEventsOccurrenceGet({
    String? ordering,
    String? search,
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/events/events_occurrence/');
    final Map<String, dynamic> $params = <String, dynamic>{
      'ordering': ordering,
      'search': search,
      'page': page,
      'page_size': pageSize,
    };
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<EventsEventsOccurrenceGet$Response,
        EventsEventsOccurrenceGet$Response>($request);
  }

  @override
  Future<Response<Event>> _eventsIdGet({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/events/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<Event, Event>($request);
  }

  @override
  Future<Response<Event>> _eventsIdPut({
    required Event? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/events/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<Event, Event>($request);
  }

  @override
  Future<Response<Event>> _eventsIdPatch({
    required Event? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/events/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<Event, Event>($request);
  }

  @override
  Future<Response<dynamic>> _eventsIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/events/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<FormsFormMedicalfileGet$Response>> _formsFormMedicalfileGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/forms/form/medicalfile/');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page_size': pageSize,
    };
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<FormsFormMedicalfileGet$Response,
        FormsFormMedicalfileGet$Response>($request);
  }

  @override
  Future<Response<MedicalFileForm>> _formsFormMedicalfilePost({
    required MedicalFileForm? data,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/forms/form/medicalfile/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<MedicalFileForm, MedicalFileForm>($request);
  }

  @override
  Future<Response<FormsFormMedicalfileTemplateGet$Response>>
      _formsFormMedicalfileTemplateGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/forms/form/medicalfile/template/');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page_size': pageSize,
    };
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<FormsFormMedicalfileTemplateGet$Response,
        FormsFormMedicalfileTemplateGet$Response>($request);
  }

  @override
  Future<Response<MedicalFileTemplate>> _formsFormMedicalfileTemplateIdGet({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/forms/form/medicalfile/template/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<MedicalFileTemplate, MedicalFileTemplate>($request);
  }

  @override
  Future<Response<MedicalFileForm>> _formsFormMedicalfileIdGet({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/forms/form/medicalfile/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<MedicalFileForm, MedicalFileForm>($request);
  }

  @override
  Future<Response<MedicalFileForm>> _formsFormMedicalfileIdPut({
    required MedicalFileForm? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/forms/form/medicalfile/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<MedicalFileForm, MedicalFileForm>($request);
  }

  @override
  Future<Response<MedicalFileForm>> _formsFormMedicalfileIdPatch({
    required MedicalFileForm? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/forms/form/medicalfile/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<MedicalFileForm, MedicalFileForm>($request);
  }

  @override
  Future<Response<dynamic>> _formsFormMedicalfileIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/forms/form/medicalfile/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<MedicalFileForm>> _formsFormMedicalfileIdPdfGet({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/forms/form/medicalfile/${id}/pdf/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<MedicalFileForm, MedicalFileForm>($request);
  }

  @override
  Future<Response<FormsFormTpzGet$Response>> _formsFormTpzGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/forms/form/tpz/');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page_size': pageSize,
    };
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client
        .send<FormsFormTpzGet$Response, FormsFormTpzGet$Response>($request);
  }

  @override
  Future<Response<TPZForm>> _formsFormTpzPost({
    required TPZForm? data,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/forms/form/tpz/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<TPZForm, TPZForm>($request);
  }

  @override
  Future<Response<FormsFormTpzTemplateGet$Response>> _formsFormTpzTemplateGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/forms/form/tpz/template/');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page_size': pageSize,
    };
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<FormsFormTpzTemplateGet$Response,
        FormsFormTpzTemplateGet$Response>($request);
  }

  @override
  Future<Response<TPZTemplate>> _formsFormTpzTemplateIdGet({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/forms/form/tpz/template/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<TPZTemplate, TPZTemplate>($request);
  }

  @override
  Future<Response<TPZForm>> _formsFormTpzIdGet({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/forms/form/tpz/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<TPZForm, TPZForm>($request);
  }

  @override
  Future<Response<TPZForm>> _formsFormTpzIdPut({
    required TPZForm? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/forms/form/tpz/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<TPZForm, TPZForm>($request);
  }

  @override
  Future<Response<TPZForm>> _formsFormTpzIdPatch({
    required TPZForm? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/forms/form/tpz/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<TPZForm, TPZForm>($request);
  }

  @override
  Future<Response<dynamic>> _formsFormTpzIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/forms/form/tpz/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<TPZForm>> _formsFormTpzIdPdfGet({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/forms/form/tpz/${id}/pdf/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<TPZForm, TPZForm>($request);
  }

  @override
  Future<Response<DocumentsFicheContacts>>
      _governanceDocsDocumentsFicheContactPost({
    required DocumentsFicheContacts? data,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/governance_docs/documents/fiche_contact/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client
        .send<DocumentsFicheContacts, DocumentsFicheContacts>($request);
  }

  @override
  Future<Response<RequestReport>> _governanceDocsReportsPersonalizedReportPost({
    required RequestReport? data,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/governance_docs/reports/personalized_report/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<RequestReport, RequestReport>($request);
  }

  @override
  Future<Response<GroupGet$Response>> _groupGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/group/');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page_size': pageSize,
    };
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<GroupGet$Response, GroupGet$Response>($request);
  }

  @override
  Future<Response<Group>> _groupPost({
    required Group? data,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/group/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<Group, Group>($request);
  }

  @override
  Future<Response<Group>> _groupIdGet({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/group/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<Group, Group>($request);
  }

  @override
  Future<Response<Group>> _groupIdPut({
    required Group? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/group/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<Group, Group>($request);
  }

  @override
  Future<Response<Group>> _groupIdPatch({
    required Group? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/group/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<Group, Group>($request);
  }

  @override
  Future<Response<dynamic>> _groupIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/group/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<MenuGet$Response>> _menuGet({
    String? search,
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/menu/');
    final Map<String, dynamic> $params = <String, dynamic>{
      'search': search,
      'page': page,
      'page_size': pageSize,
    };
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<MenuGet$Response, MenuGet$Response>($request);
  }

  @override
  Future<Response<Menu>> _menuPost({
    required Menu? data,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/menu/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<Menu, Menu>($request);
  }

  @override
  Future<Response<MenuMealOccurrenceGet$Response>> _menuMealOccurrenceGet({
    String? ordering,
    String? search,
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/menu/meal_occurrence/');
    final Map<String, dynamic> $params = <String, dynamic>{
      'ordering': ordering,
      'search': search,
      'page': page,
      'page_size': pageSize,
    };
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<MenuMealOccurrenceGet$Response,
        MenuMealOccurrenceGet$Response>($request);
  }

  @override
  Future<Response<Menu>> _menuIdGet({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/menu/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<Menu, Menu>($request);
  }

  @override
  Future<Response<Menu>> _menuIdPut({
    required Menu? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/menu/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<Menu, Menu>($request);
  }

  @override
  Future<Response<Menu>> _menuIdPatch({
    required Menu? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/menu/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<Menu, Menu>($request);
  }

  @override
  Future<Response<dynamic>> _menuIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/menu/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<NotificationsGet$Response>> _notificationsGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/notifications/');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page_size': pageSize,
    };
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client
        .send<NotificationsGet$Response, NotificationsGet$Response>($request);
  }

  @override
  Future<Response<NotificationSerializerCreate>> _notificationsPost({
    required NotificationSerializerCreate? data,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/notifications/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<NotificationSerializerCreate,
        NotificationSerializerCreate>($request);
  }

  @override
  Future<Response<PaymentGet$Response>> _paymentGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/payment/');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page_size': pageSize,
    };
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<PaymentGet$Response, PaymentGet$Response>($request);
  }

  @override
  Future<Response<Payment>> _paymentPost({
    required Payment? data,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/payment/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<Payment, Payment>($request);
  }

  @override
  Future<Response<Payment>> _paymentIdGet({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/payment/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<Payment, Payment>($request);
  }

  @override
  Future<Response<Payment>> _paymentIdPut({
    required Payment? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/payment/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<Payment, Payment>($request);
  }

  @override
  Future<Response<Payment>> _paymentIdPatch({
    required Payment? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/payment/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<Payment, Payment>($request);
  }

  @override
  Future<Response<dynamic>> _paymentIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/payment/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<PermissionsEducatorPermissionsGet$Response>>
      _permissionsEducatorPermissionsGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/permissions/educator_permissions/');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page_size': pageSize,
    };
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<PermissionsEducatorPermissionsGet$Response,
        PermissionsEducatorPermissionsGet$Response>($request);
  }

  @override
  Future<Response<EducatorKindergartenPermission>>
      _permissionsEducatorPermissionsIdGet({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/permissions/educator_permissions/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<EducatorKindergartenPermission,
        EducatorKindergartenPermission>($request);
  }

  @override
  Future<Response<EducatorKindergartenPermission>>
      _permissionsEducatorPermissionsIdPut({
    required EducatorKindergartenPermission? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/permissions/educator_permissions/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<EducatorKindergartenPermission,
        EducatorKindergartenPermission>($request);
  }

  @override
  Future<Response<EducatorKindergartenPermission>>
      _permissionsEducatorPermissionsIdPatch({
    required EducatorKindergartenPermission? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/permissions/educator_permissions/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<EducatorKindergartenPermission,
        EducatorKindergartenPermission>($request);
  }

  @override
  Future<Response<PresenceAttendanceGet$Response>> _presenceAttendanceGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/presence/attendance/');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page_size': pageSize,
    };
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<PresenceAttendanceGet$Response,
        PresenceAttendanceGet$Response>($request);
  }

  @override
  Future<Response<Presence>> _presenceAttendancePost({
    required Presence? data,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/presence/attendance/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<Presence, Presence>($request);
  }

  @override
  Future<Response<Presence>> _presenceAttendanceIdGet({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/presence/attendance/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<Presence, Presence>($request);
  }

  @override
  Future<Response<Presence>> _presenceAttendanceIdPut({
    required Presence? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/presence/attendance/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<Presence, Presence>($request);
  }

  @override
  Future<Response<Presence>> _presenceAttendanceIdPatch({
    required Presence? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/presence/attendance/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<Presence, Presence>($request);
  }

  @override
  Future<Response<dynamic>> _presenceAttendanceIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/presence/attendance/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<PresenceExpectedPickupGet$Response>>
      _presenceExpectedPickupGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/presence/expected_pickup/');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page_size': pageSize,
    };
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<PresenceExpectedPickupGet$Response,
        PresenceExpectedPickupGet$Response>($request);
  }

  @override
  Future<Response<ExpectedPickUp>> _presenceExpectedPickupPost({
    required ExpectedPickUp? data,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/presence/expected_pickup/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<ExpectedPickUp, ExpectedPickUp>($request);
  }

  @override
  Future<Response<ExpectedPickUp>> _presenceExpectedPickupIdGet({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/presence/expected_pickup/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<ExpectedPickUp, ExpectedPickUp>($request);
  }

  @override
  Future<Response<ExpectedPickUp>> _presenceExpectedPickupIdPut({
    required ExpectedPickUp? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/presence/expected_pickup/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<ExpectedPickUp, ExpectedPickUp>($request);
  }

  @override
  Future<Response<ExpectedPickUp>> _presenceExpectedPickupIdPatch({
    required ExpectedPickUp? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/presence/expected_pickup/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<ExpectedPickUp, ExpectedPickUp>($request);
  }

  @override
  Future<Response<dynamic>> _presenceExpectedPickupIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/presence/expected_pickup/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<PublicationsCommentsGet$Response>> _publicationsCommentsGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/publications/comments/');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page_size': pageSize,
    };
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<PublicationsCommentsGet$Response,
        PublicationsCommentsGet$Response>($request);
  }

  @override
  Future<Response<Comment>> _publicationsCommentsPost({
    required Comment? data,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/publications/comments/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<Comment, Comment>($request);
  }

  @override
  Future<Response<Comment>> _publicationsCommentsIdGet({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/publications/comments/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<Comment, Comment>($request);
  }

  @override
  Future<Response<CommentSerializerUpdate>> _publicationsCommentsIdPut({
    required CommentSerializerUpdate? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/publications/comments/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client
        .send<CommentSerializerUpdate, CommentSerializerUpdate>($request);
  }

  @override
  Future<Response<CommentSerializerUpdate>> _publicationsCommentsIdPatch({
    required CommentSerializerUpdate? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/publications/comments/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client
        .send<CommentSerializerUpdate, CommentSerializerUpdate>($request);
  }

  @override
  Future<Response<dynamic>> _publicationsCommentsIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/publications/comments/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<PublicationsDocsContentGet$Response>>
      _publicationsDocsContentGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/publications/docs/content/');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page_size': pageSize,
    };
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<PublicationsDocsContentGet$Response,
        PublicationsDocsContentGet$Response>($request);
  }

  @override
  Future<Response<PublicationsPublicationsGet$Response>>
      _publicationsPublicationsGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/publications/publications/');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page_size': pageSize,
    };
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<PublicationsPublicationsGet$Response,
        PublicationsPublicationsGet$Response>($request);
  }

  @override
  Future<Response<Publication>> _publicationsPublicationsPost({
    required Publication? data,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/publications/publications/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<Publication, Publication>($request);
  }

  @override
  Future<Response<Publication>> _publicationsPublicationsIdGet({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/publications/publications/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<Publication, Publication>($request);
  }

  @override
  Future<Response<PublicationUpdate>> _publicationsPublicationsIdPut({
    required PublicationUpdate? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/publications/publications/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<PublicationUpdate, PublicationUpdate>($request);
  }

  @override
  Future<Response<PublicationUpdate>> _publicationsPublicationsIdPatch({
    required PublicationUpdate? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/publications/publications/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<PublicationUpdate, PublicationUpdate>($request);
  }

  @override
  Future<Response<dynamic>> _publicationsPublicationsIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/publications/publications/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<QAUserVote>> _publicationsQaUserVotesPost({
    required QAUserVote? data,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/publications/qa_user_votes/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<QAUserVote, QAUserVote>($request);
  }

  @override
  Future<Response<dynamic>> _publicationsQaUserVotesIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/publications/qa_user_votes/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<CommentReaction>> _publicationsReactionsCommentReactionsPost({
    required CommentReaction? data,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/publications/reactions/comment_reactions/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<CommentReaction, CommentReaction>($request);
  }

  @override
  Future<Response<dynamic>> _publicationsReactionsCommentReactionsIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url =
        Uri.parse('/publications/reactions/comment_reactions/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<PublicationReaction>>
      _publicationsReactionsPublicationReactionsPost({
    required PublicationReaction? data,
    String? cacheControl,
  }) {
    final Uri $url =
        Uri.parse('/publications/reactions/publication_reactions/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<PublicationReaction, PublicationReaction>($request);
  }

  @override
  Future<Response<dynamic>> _publicationsReactionsPublicationReactionsIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url =
        Uri.parse('/publications/reactions/publication_reactions/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<SearchKindergartenMembersGet$Response>>
      _searchKindergartenMembersGet({
    int? page,
    int? pageSize,
    required String? query,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/search/kindergarten_members/');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page_size': pageSize,
      'query': query,
    };
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<SearchKindergartenMembersGet$Response,
        SearchKindergartenMembersGet$Response>($request);
  }

  @override
  Future<Response<SearchChildGet$Response>> _searchChildGet({
    String? search,
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/search_child/');
    final Map<String, dynamic> $params = <String, dynamic>{
      'search': search,
      'page': page,
      'page_size': pageSize,
    };
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client
        .send<SearchChildGet$Response, SearchChildGet$Response>($request);
  }

  @override
  Future<Response<WholeChildGet$Response>> _wholeChildGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/whole_child/');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page_size': pageSize,
    };
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client
        .send<WholeChildGet$Response, WholeChildGet$Response>($request);
  }

  @override
  Future<Response<dynamic>> _wholeChildHistoryIdGet({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/whole_child/history/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<WholeChild>> _wholeChildIdGet({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/whole_child/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<WholeChild, WholeChild>($request);
  }
}
