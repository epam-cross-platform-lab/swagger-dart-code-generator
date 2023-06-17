// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kindergarten0.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMember _$ChatMemberFromJson(Map<String, dynamic> json) => ChatMember(
      id: json['id'] as int?,
      user: json['user'] as int?,
      removed: json['removed'] as bool?,
      notificationsEnabled: json['notifications_enabled'] as bool?,
      username: json['username'] as String? ?? '',
    );

Map<String, dynamic> _$ChatMemberToJson(ChatMember instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('user', instance.user);
  writeNotNull('removed', instance.removed);
  writeNotNull('notifications_enabled', instance.notificationsEnabled);
  writeNotNull('username', instance.username);
  return val;
}

ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) => ChatMessage(
      id: json['id'] as int?,
      member: json['member'] as int?,
      content: json['content'] as String? ?? '',
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      group: json['group'] as int?,
      seenBy:
          (json['seen_by'] as List<dynamic>?)?.map((e) => e as int).toList() ??
              [],
      files: (json['files'] as List<dynamic>?)?.map((e) => e as int).toList() ??
          [],
    );

Map<String, dynamic> _$ChatMessageToJson(ChatMessage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('member', instance.member);
  writeNotNull('content', instance.content);
  writeNotNull('created_at', instance.createdAt?.toIso8601String());
  writeNotNull('group', instance.group);
  writeNotNull('seen_by', instance.seenBy);
  writeNotNull('files', instance.files);
  return val;
}

ChatGroup _$ChatGroupFromJson(Map<String, dynamic> json) => ChatGroup(
      id: json['id'] as int?,
      members: (json['members'] as List<dynamic>?)
              ?.map((e) => ChatMember.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      name: json['name'] as String? ?? '',
      displayName: json['display_name'] as String? ?? '',
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      lastMessage: json['last_message'] == null
          ? null
          : ChatMessage.fromJson(json['last_message'] as Map<String, dynamic>),
      avatar: json['avatar'] as String? ?? '',
    );

Map<String, dynamic> _$ChatGroupToJson(ChatGroup instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('members', instance.members?.map((e) => e.toJson()).toList());
  writeNotNull('name', instance.name);
  writeNotNull('display_name', instance.displayName);
  writeNotNull('created_at', instance.createdAt?.toIso8601String());
  writeNotNull('last_message', instance.lastMessage?.toJson());
  writeNotNull('avatar', instance.avatar);
  return val;
}

ChatMemberCreate _$ChatMemberCreateFromJson(Map<String, dynamic> json) =>
    ChatMemberCreate(
      id: json['id'] as int?,
      user: json['user'] as int?,
      removed: json['removed'] as bool?,
      notificationsEnabled: json['notifications_enabled'] as bool?,
      username: json['username'] as String? ?? '',
    );

Map<String, dynamic> _$ChatMemberCreateToJson(ChatMemberCreate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('user', instance.user);
  writeNotNull('removed', instance.removed);
  writeNotNull('notifications_enabled', instance.notificationsEnabled);
  writeNotNull('username', instance.username);
  return val;
}

ChatGroupCreate _$ChatGroupCreateFromJson(Map<String, dynamic> json) =>
    ChatGroupCreate(
      id: json['id'] as int?,
      members: (json['members'] as List<dynamic>?)
              ?.map((e) => ChatMemberCreate.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      name: json['name'] as String? ?? '',
      displayName: json['display_name'] as String? ?? '',
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      avatar: json['avatar'] as String? ?? '',
    );

Map<String, dynamic> _$ChatGroupCreateToJson(ChatGroupCreate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('members', instance.members?.map((e) => e.toJson()).toList());
  writeNotNull('name', instance.name);
  writeNotNull('display_name', instance.displayName);
  writeNotNull('created_at', instance.createdAt?.toIso8601String());
  writeNotNull('avatar', instance.avatar);
  return val;
}

CurrentChatMember _$CurrentChatMemberFromJson(Map<String, dynamic> json) =>
    CurrentChatMember(
      id: json['id'] as int?,
      notificationsEnabled: json['notifications_enabled'] as bool?,
      removed: json['removed'] as bool?,
    );

Map<String, dynamic> _$CurrentChatMemberToJson(CurrentChatMember instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('notifications_enabled', instance.notificationsEnabled);
  writeNotNull('removed', instance.removed);
  return val;
}

ChatMessageFile _$ChatMessageFileFromJson(Map<String, dynamic> json) =>
    ChatMessageFile(
      id: json['id'] as int?,
      file: json['file'] as String? ?? '',
      message: json['message'] as int?,
    );

Map<String, dynamic> _$ChatMessageFileToJson(ChatMessageFile instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('file', instance.file);
  writeNotNull('message', instance.message);
  return val;
}

SharedLink _$SharedLinkFromJson(Map<String, dynamic> json) => SharedLink(
      id: json['id'] as int?,
      links: json['links'] as String? ?? '',
    );

Map<String, dynamic> _$SharedLinkToJson(SharedLink instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('links', instance.links);
  return val;
}

Activity _$ActivityFromJson(Map<String, dynamic> json) => Activity(
      id: json['id'] as int?,
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      avatar: json['avatar'] as String? ?? '',
    );

Map<String, dynamic> _$ActivityToJson(Activity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('description', instance.description);
  writeNotNull('avatar', instance.avatar);
  return val;
}

DaySummary _$DaySummaryFromJson(Map<String, dynamic> json) => DaySummary(
      id: json['id'] as int?,
      activities: (json['activities'] as List<dynamic>?)
              ?.map((e) => Activity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      humor: daySummaryHumorFromJson(json['humor']),
      humorNote: json['humor_note'] as String? ?? '',
      hunger: daySummaryHungerFromJson(json['hunger']),
      hungerNote: json['hunger_note'] as String? ?? '',
      activityParticipation: daySummaryActivityParticipationFromJson(
          json['activity_participation']),
      activityParticipationNote:
          json['activity_participation_note'] as String? ?? '',
      nap: daySummaryNapFromJson(json['nap']),
      napNote: json['nap_note'] as String? ?? '',
      interactions: daySummaryInteractionsFromJson(json['interactions']),
      interactionsNote: json['interactions_note'] as String? ?? '',
      outsidePlaytime:
          daySummaryOutsidePlaytimeFromJson(json['outside_playtime']),
      outsidePlaytimeNote: json['outside_playtime_note'] as String? ?? '',
      pooping: daySummaryPoopingFromJson(json['pooping']),
      poopingNote: json['pooping_note'] as String? ?? '',
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      note: json['note'] as String? ?? '',
      child: json['child'] as int?,
    );

Map<String, dynamic> _$DaySummaryToJson(DaySummary instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull(
      'activities', instance.activities?.map((e) => e.toJson()).toList());
  writeNotNull('humor', daySummaryHumorToJson(instance.humor));
  writeNotNull('humor_note', instance.humorNote);
  writeNotNull('hunger', daySummaryHungerToJson(instance.hunger));
  writeNotNull('hunger_note', instance.hungerNote);
  writeNotNull('activity_participation',
      daySummaryActivityParticipationToJson(instance.activityParticipation));
  writeNotNull(
      'activity_participation_note', instance.activityParticipationNote);
  writeNotNull('nap', daySummaryNapToJson(instance.nap));
  writeNotNull('nap_note', instance.napNote);
  writeNotNull(
      'interactions', daySummaryInteractionsToJson(instance.interactions));
  writeNotNull('interactions_note', instance.interactionsNote);
  writeNotNull('outside_playtime',
      daySummaryOutsidePlaytimeToJson(instance.outsidePlaytime));
  writeNotNull('outside_playtime_note', instance.outsidePlaytimeNote);
  writeNotNull('pooping', daySummaryPoopingToJson(instance.pooping));
  writeNotNull('pooping_note', instance.poopingNote);
  writeNotNull('date', instance.date?.toIso8601String());
  writeNotNull('note', instance.note);
  writeNotNull('child', instance.child);
  return val;
}

EducatorProfile _$EducatorProfileFromJson(Map<String, dynamic> json) =>
    EducatorProfile(
      avatar: json['avatar'] as String? ?? '',
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
    );

Map<String, dynamic> _$EducatorProfileToJson(EducatorProfile instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('avatar', instance.avatar);
  writeNotNull('first_name', instance.firstName);
  writeNotNull('last_name', instance.lastName);
  return val;
}

EducatorAvailability _$EducatorAvailabilityFromJson(
        Map<String, dynamic> json) =>
    EducatorAvailability(
      id: json['id'] as int?,
      educatorId: json['educator_id'] as String? ?? '',
      educatorInfos: json['educator_infos'] == null
          ? null
          : EducatorProfile.fromJson(
              json['educator_infos'] as Map<String, dynamic>),
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      startTime: json['start_time'] as String? ?? '',
      endTime: json['end_time'] as String? ?? '',
    );

Map<String, dynamic> _$EducatorAvailabilityToJson(
    EducatorAvailability instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('educator_id', instance.educatorId);
  writeNotNull('educator_infos', instance.educatorInfos?.toJson());
  writeNotNull('date', _dateToJson(instance.date));
  writeNotNull('start_time', instance.startTime);
  writeNotNull('end_time', instance.endTime);
  return val;
}

EducatorSchedule _$EducatorScheduleFromJson(Map<String, dynamic> json) =>
    EducatorSchedule(
      id: json['id'] as int?,
      educatorId: json['educator_id'] as String? ?? '',
      educatorInfos: json['educator_infos'] == null
          ? null
          : EducatorProfile.fromJson(
              json['educator_infos'] as Map<String, dynamic>),
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      startTime: json['start_time'] as String? ?? '',
      endTime: json['end_time'] as String? ?? '',
    );

Map<String, dynamic> _$EducatorScheduleToJson(EducatorSchedule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('educator_id', instance.educatorId);
  writeNotNull('educator_infos', instance.educatorInfos?.toJson());
  writeNotNull('date', _dateToJson(instance.date));
  writeNotNull('start_time', instance.startTime);
  writeNotNull('end_time', instance.endTime);
  return val;
}

EducatorBreakSettings _$EducatorBreakSettingsFromJson(
        Map<String, dynamic> json) =>
    EducatorBreakSettings(
      id: json['id'] as int?,
      name: json['name'] as String? ?? '',
      startTime: json['start_time'] as String? ?? '',
      endTime: json['end_time'] as String? ?? '',
      generalSettings: json['general_settings'] as int?,
    );

Map<String, dynamic> _$EducatorBreakSettingsToJson(
    EducatorBreakSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('start_time', instance.startTime);
  writeNotNull('end_time', instance.endTime);
  writeNotNull('general_settings', instance.generalSettings);
  return val;
}

GeneralEducatorTimeSheetSettings _$GeneralEducatorTimeSheetSettingsFromJson(
        Map<String, dynamic> json) =>
    GeneralEducatorTimeSheetSettings(
      id: json['id'] as int?,
      breaks: (json['breaks'] as List<dynamic>?)
              ?.map((e) =>
                  EducatorBreakSettings.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      workingHoursStart: json['working_hours_start'] as String? ?? '',
      workingHoursEnd: json['working_hours_end'] as String? ?? '',
      workingDayMonday: json['working_day_monday'] as bool?,
      workingDayTuesday: json['working_day_tuesday'] as bool?,
      workingDayWednesday: json['working_day_wednesday'] as bool?,
      workingDayThursday: json['working_day_thursday'] as bool?,
      workingDayFriday: json['working_day_friday'] as bool?,
      workingDaySaturday: json['working_day_saturday'] as bool?,
      workingDaySunday: json['working_day_sunday'] as bool?,
      maximumHoursAwarded: json['maximum_hours_awarded'] as int?,
      minShiftLength: json['min_shift_length'] as int?,
      maxShiftLength: json['max_shift_length'] as int?,
    );

Map<String, dynamic> _$GeneralEducatorTimeSheetSettingsToJson(
    GeneralEducatorTimeSheetSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('breaks', instance.breaks?.map((e) => e.toJson()).toList());
  writeNotNull('working_hours_start', instance.workingHoursStart);
  writeNotNull('working_hours_end', instance.workingHoursEnd);
  writeNotNull('working_day_monday', instance.workingDayMonday);
  writeNotNull('working_day_tuesday', instance.workingDayTuesday);
  writeNotNull('working_day_wednesday', instance.workingDayWednesday);
  writeNotNull('working_day_thursday', instance.workingDayThursday);
  writeNotNull('working_day_friday', instance.workingDayFriday);
  writeNotNull('working_day_saturday', instance.workingDaySaturday);
  writeNotNull('working_day_sunday', instance.workingDaySunday);
  writeNotNull('maximum_hours_awarded', instance.maximumHoursAwarded);
  writeNotNull('min_shift_length', instance.minShiftLength);
  writeNotNull('max_shift_length', instance.maxShiftLength);
  return val;
}

EducatorExperienceLevelSettings _$EducatorExperienceLevelSettingsFromJson(
        Map<String, dynamic> json) =>
    EducatorExperienceLevelSettings(
      id: json['id'] as int?,
      title: json['title'] as String? ?? '',
      minNumber: json['min_number'] as int?,
    );

Map<String, dynamic> _$EducatorExperienceLevelSettingsToJson(
    EducatorExperienceLevelSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('title', instance.title);
  writeNotNull('min_number', instance.minNumber);
  return val;
}

IndividualEmployeeTimeSheetSettings
    _$IndividualEmployeeTimeSheetSettingsFromJson(Map<String, dynamic> json) =>
        IndividualEmployeeTimeSheetSettings(
          id: json['id'] as int?,
          experienceLevel: json['experience_level'] == null
              ? null
              : EducatorExperienceLevelSettings.fromJson(
                  json['experience_level'] as Map<String, dynamic>),
          minNbHoursPerWeek: json['min_nb_hours_per_week'] as int?,
          maxNbHoursPerWeek: json['max_nb_hours_per_week'] as int?,
          code: json['code'] as String? ?? '',
          educator: json['educator'] as String? ?? '',
        );

Map<String, dynamic> _$IndividualEmployeeTimeSheetSettingsToJson(
    IndividualEmployeeTimeSheetSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('experience_level', instance.experienceLevel?.toJson());
  writeNotNull('min_nb_hours_per_week', instance.minNbHoursPerWeek);
  writeNotNull('max_nb_hours_per_week', instance.maxNbHoursPerWeek);
  writeNotNull('code', instance.code);
  writeNotNull('educator', instance.educator);
  return val;
}

EducatorTimeSheet _$EducatorTimeSheetFromJson(Map<String, dynamic> json) =>
    EducatorTimeSheet(
      id: json['id'] as int?,
      educatorId: json['educator_id'] as String? ?? '',
      educatorInfos: json['educator_infos'] == null
          ? null
          : EducatorProfile.fromJson(
              json['educator_infos'] as Map<String, dynamic>),
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      startTime: json['start_time'] as String? ?? '',
      endTime: json['end_time'] as String? ?? '',
      photo: json['photo'] as String? ?? '',
    );

Map<String, dynamic> _$EducatorTimeSheetToJson(EducatorTimeSheet instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('educator_id', instance.educatorId);
  writeNotNull('educator_infos', instance.educatorInfos?.toJson());
  writeNotNull('date', _dateToJson(instance.date));
  writeNotNull('start_time', instance.startTime);
  writeNotNull('end_time', instance.endTime);
  writeNotNull('photo', instance.photo);
  return val;
}

EventFile _$EventFileFromJson(Map<String, dynamic> json) => EventFile(
      file: json['file'] as String? ?? '',
      id: json['id'] as int?,
    );

Map<String, dynamic> _$EventFileToJson(EventFile instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('file', instance.file);
  writeNotNull('id', instance.id);
  return val;
}

EventUserTag _$EventUserTagFromJson(Map<String, dynamic> json) => EventUserTag(
      user: json['user'] as int?,
    );

Map<String, dynamic> _$EventUserTagToJson(EventUserTag instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user', instance.user);
  return val;
}

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      id: json['id'] as int?,
      start: json['start'] == null
          ? null
          : DateTime.parse(json['start'] as String),
      end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
      repeatUntil: json['repeat_until'] == null
          ? null
          : DateTime.parse(json['repeat_until'] as String),
      recurrence: eventRecurrenceFromJson(json['recurrence']),
      visibleByParents: json['visible_by_parents'] as bool?,
      files: (json['files'] as List<dynamic>?)
              ?.map((e) => EventFile.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      invitedUsers: (json['invited_users'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          [],
      title: json['title'] as String? ?? '',
      content: json['content'] as String? ?? '',
      userTags: (json['user_tags'] as List<dynamic>?)
              ?.map((e) => EventUserTag.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$EventToJson(Event instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('start', instance.start?.toIso8601String());
  writeNotNull('end', instance.end?.toIso8601String());
  writeNotNull('repeat_until', instance.repeatUntil?.toIso8601String());
  writeNotNull('recurrence', eventRecurrenceToJson(instance.recurrence));
  writeNotNull('visible_by_parents', instance.visibleByParents);
  writeNotNull('files', instance.files?.map((e) => e.toJson()).toList());
  writeNotNull('invited_users', instance.invitedUsers);
  writeNotNull('title', instance.title);
  writeNotNull('content', instance.content);
  writeNotNull('user_tags', instance.userTags?.map((e) => e.toJson()).toList());
  return val;
}

EventOccurrence _$EventOccurrenceFromJson(Map<String, dynamic> json) =>
    EventOccurrence(
      occurrenceStart: json['occurrence_start'] == null
          ? null
          : DateTime.parse(json['occurrence_start'] as String),
      occurrenceEnd: json['occurrence_end'] == null
          ? null
          : DateTime.parse(json['occurrence_end'] as String),
      event: json['event'] == null
          ? null
          : Event.fromJson(json['event'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EventOccurrenceToJson(EventOccurrence instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('occurrence_start', instance.occurrenceStart?.toIso8601String());
  writeNotNull('occurrence_end', instance.occurrenceEnd?.toIso8601String());
  writeNotNull('event', instance.event?.toJson());
  return val;
}

MedicalFileForm _$MedicalFileFormFromJson(Map<String, dynamic> json) =>
    MedicalFileForm(
      id: json['id'] as int?,
      schema: json['schema'],
      version: json['version'] as int?,
    );

Map<String, dynamic> _$MedicalFileFormToJson(MedicalFileForm instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('schema', instance.schema);
  writeNotNull('version', instance.version);
  return val;
}

MedicalFileTemplate _$MedicalFileTemplateFromJson(Map<String, dynamic> json) =>
    MedicalFileTemplate(
      id: json['id'] as int?,
      schema: json['schema'],
      version: json['version'] as int?,
    );

Map<String, dynamic> _$MedicalFileTemplateToJson(MedicalFileTemplate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('schema', instance.schema);
  writeNotNull('version', instance.version);
  return val;
}

TPZForm _$TPZFormFromJson(Map<String, dynamic> json) => TPZForm(
      id: json['id'] as int?,
      schema: json['schema'],
      version: json['version'] as int?,
    );

Map<String, dynamic> _$TPZFormToJson(TPZForm instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('schema', instance.schema);
  writeNotNull('version', instance.version);
  return val;
}

TPZTemplate _$TPZTemplateFromJson(Map<String, dynamic> json) => TPZTemplate(
      id: json['id'] as int?,
      schema: json['schema'],
      version: json['version'] as int?,
    );

Map<String, dynamic> _$TPZTemplateToJson(TPZTemplate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('schema', instance.schema);
  writeNotNull('version', instance.version);
  return val;
}

DocumentsFicheContacts _$DocumentsFicheContactsFromJson(
        Map<String, dynamic> json) =>
    DocumentsFicheContacts(
      allChildren: json['all_children'] as bool? ?? false,
      allTime: json['all_time'] as bool? ?? false,
      children:
          (json['children'] as List<dynamic>?)?.map((e) => e as int).toList() ??
              [],
      groups:
          (json['groups'] as List<dynamic>?)?.map((e) => e as int).toList() ??
              [],
      startDate: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
    );

Map<String, dynamic> _$DocumentsFicheContactsToJson(
    DocumentsFicheContacts instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('all_children', instance.allChildren);
  writeNotNull('all_time', instance.allTime);
  writeNotNull('children', instance.children);
  writeNotNull('groups', instance.groups);
  writeNotNull('start_date', _dateToJson(instance.startDate));
  writeNotNull('end_date', _dateToJson(instance.endDate));
  return val;
}

ChildInfoField _$ChildInfoFieldFromJson(Map<String, dynamic> json) =>
    ChildInfoField(
      name: json['name'] as String? ?? '',
      subFields: (json['sub_fields'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$ChildInfoFieldToJson(ChildInfoField instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('sub_fields', instance.subFields);
  return val;
}

RequestReport _$RequestReportFromJson(Map<String, dynamic> json) =>
    RequestReport(
      allChildren: json['all_children'] as bool? ?? false,
      allTime: json['all_time'] as bool? ?? false,
      children:
          (json['children'] as List<dynamic>?)?.map((e) => e as int).toList() ??
              [],
      groups:
          (json['groups'] as List<dynamic>?)?.map((e) => e as int).toList() ??
              [],
      startDate: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      lookupFields: (json['lookup_fields'] as List<dynamic>?)
              ?.map((e) => ChildInfoField.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$RequestReportToJson(RequestReport instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('all_children', instance.allChildren);
  writeNotNull('all_time', instance.allTime);
  writeNotNull('children', instance.children);
  writeNotNull('groups', instance.groups);
  writeNotNull('start_date', _dateToJson(instance.startDate));
  writeNotNull('end_date', _dateToJson(instance.endDate));
  writeNotNull(
      'lookup_fields', instance.lookupFields?.map((e) => e.toJson()).toList());
  return val;
}

Group _$GroupFromJson(Map<String, dynamic> json) => Group(
      id: json['id'] as int?,
      name: json['name'] as String? ?? '',
      avatar: json['avatar'] as String? ?? '',
      educators: (json['educators'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      children:
          (json['children'] as List<dynamic>?)?.map((e) => e as int).toList() ??
              [],
      capacity: json['capacity'] as int?,
      description: json['description'] as String? ?? '',
      color: json['color'] as String? ?? '',
    );

Map<String, dynamic> _$GroupToJson(Group instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('avatar', instance.avatar);
  writeNotNull('educators', instance.educators);
  writeNotNull('children', instance.children);
  writeNotNull('capacity', instance.capacity);
  writeNotNull('description', instance.description);
  writeNotNull('color', instance.color);
  return val;
}

MenuGroup _$MenuGroupFromJson(Map<String, dynamic> json) => MenuGroup(
      id: json['id'] as int?,
      name: json['name'] as String? ?? '',
      color: json['color'] as String? ?? '',
    );

Map<String, dynamic> _$MenuGroupToJson(MenuGroup instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('color', instance.color);
  return val;
}

MealItemPhoto _$MealItemPhotoFromJson(Map<String, dynamic> json) =>
    MealItemPhoto(
      id: json['id'] as int?,
      photo: json['photo'] as String? ?? '',
    );

Map<String, dynamic> _$MealItemPhotoToJson(MealItemPhoto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('photo', instance.photo);
  return val;
}

MealItem _$MealItemFromJson(Map<String, dynamic> json) => MealItem(
      id: json['id'] as int?,
      name: json['name'] as String? ?? '',
      ingredients: json['ingredients'] as String? ?? '',
      description: json['description'] as String? ?? '',
      allergens: json['allergens'],
      photos: (json['photos'] as List<dynamic>?)
              ?.map((e) => MealItemPhoto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$MealItemToJson(MealItem instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('ingredients', instance.ingredients);
  writeNotNull('description', instance.description);
  writeNotNull('allergens', instance.allergens);
  writeNotNull('photos', instance.photos?.map((e) => e.toJson()).toList());
  return val;
}

Meal _$MealFromJson(Map<String, dynamic> json) => Meal(
      id: json['id'] as int?,
      name: json['name'] as String? ?? '',
      startTime: json['start_time'] as String? ?? '',
      endTime: json['end_time'] as String? ?? '',
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => MealItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$MealToJson(Meal instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('start_time', instance.startTime);
  writeNotNull('end_time', instance.endTime);
  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  return val;
}

Menu _$MenuFromJson(Map<String, dynamic> json) => Menu(
      id: json['id'] as int?,
      name: json['name'] as String? ?? '',
      groups: (json['groups'] as List<dynamic>?)
              ?.map((e) => MenuGroup.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      description: json['description'] as String? ?? '',
      cycle: json['cycle'] as String? ?? '',
      startDate: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      repeatUntil: json['repeat_until'] == null
          ? null
          : DateTime.parse(json['repeat_until'] as String),
      meals: (json['meals'] as List<dynamic>?)
              ?.map((e) => Meal.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$MenuToJson(Menu instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('groups', instance.groups?.map((e) => e.toJson()).toList());
  writeNotNull('description', instance.description);
  writeNotNull('cycle', instance.cycle);
  writeNotNull('start_date', _dateToJson(instance.startDate));
  writeNotNull('end_date', _dateToJson(instance.endDate));
  writeNotNull('repeat_until', _dateToJson(instance.repeatUntil));
  writeNotNull('meals', instance.meals?.map((e) => e.toJson()).toList());
  return val;
}

MealOccurrence _$MealOccurrenceFromJson(Map<String, dynamic> json) =>
    MealOccurrence(
      occurrenceDate: json['occurrence_date'] == null
          ? null
          : DateTime.parse(json['occurrence_date'] as String),
      startTime: json['start_time'] as String? ?? '',
      endTime: json['end_time'] as String? ?? '',
      mealName: json['meal_name'] as String? ?? '',
      menuId: json['menu_id'] as int?,
      mealId: json['meal_id'] as int?,
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => MealItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$MealOccurrenceToJson(MealOccurrence instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('occurrence_date', _dateToJson(instance.occurrenceDate));
  writeNotNull('start_time', instance.startTime);
  writeNotNull('end_time', instance.endTime);
  writeNotNull('meal_name', instance.mealName);
  writeNotNull('menu_id', instance.menuId);
  writeNotNull('meal_id', instance.mealId);
  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  return val;
}

NotificationSerializerUserReadOnly _$NotificationSerializerUserReadOnlyFromJson(
        Map<String, dynamic> json) =>
    NotificationSerializerUserReadOnly(
      id: json['id'] as int?,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      subject: json['subject'] as String? ?? '',
      message: json['message'] as String? ?? '',
      nType: notificationSerializerUserReadOnlyNTypeFromJson(json['n_type']),
      optionalData: json['optional_data'],
      user: json['user'] as int?,
      createdBy: json['created_by'] as int?,
    );

Map<String, dynamic> _$NotificationSerializerUserReadOnlyToJson(
    NotificationSerializerUserReadOnly instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('created', instance.created?.toIso8601String());
  writeNotNull('subject', instance.subject);
  writeNotNull('message', instance.message);
  writeNotNull(
      'n_type', notificationSerializerUserReadOnlyNTypeToJson(instance.nType));
  writeNotNull('optional_data', instance.optionalData);
  writeNotNull('user', instance.user);
  writeNotNull('created_by', instance.createdBy);
  return val;
}

NotificationSerializerCreate _$NotificationSerializerCreateFromJson(
        Map<String, dynamic> json) =>
    NotificationSerializerCreate(
      users: (json['users'] as List<dynamic>?)?.map((e) => e as int).toList() ??
          [],
      message: json['message'] as String? ?? '',
      subject: json['subject'] as String? ?? '',
    );

Map<String, dynamic> _$NotificationSerializerCreateToJson(
    NotificationSerializerCreate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('users', instance.users);
  writeNotNull('message', instance.message);
  writeNotNull('subject', instance.subject);
  return val;
}

Payment _$PaymentFromJson(Map<String, dynamic> json) => Payment(
      id: json['id'] as int?,
      status: paymentStatusFromJson(json['status']),
      declinedReason: paymentDeclinedReasonFromJson(json['declined_reason']),
      issueDate: json['issue_date'] == null
          ? null
          : DateTime.parse(json['issue_date'] as String),
      settlementDate: json['settlement_date'] == null
          ? null
          : DateTime.parse(json['settlement_date'] as String),
      amount: json['amount'] as int?,
      comment: json['comment'] as String? ?? '',
      payer: json['payer'] as String? ?? '',
      child: json['child'] as int?,
    );

Map<String, dynamic> _$PaymentToJson(Payment instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('status', paymentStatusToJson(instance.status));
  writeNotNull(
      'declined_reason', paymentDeclinedReasonToJson(instance.declinedReason));
  writeNotNull('issue_date', instance.issueDate?.toIso8601String());
  writeNotNull('settlement_date', _dateToJson(instance.settlementDate));
  writeNotNull('amount', instance.amount);
  writeNotNull('comment', instance.comment);
  writeNotNull('payer', instance.payer);
  writeNotNull('child', instance.child);
  return val;
}

EducatorKindergartenPermission _$EducatorKindergartenPermissionFromJson(
        Map<String, dynamic> json) =>
    EducatorKindergartenPermission(
      id: json['id'] as int?,
      menu: json['menu'] as int?,
      calendar: json['calendar'] as int?,
      educatorContracts: json['educator_contracts'] as int?,
      payments: json['payments'] as int?,
      presence: json['presence'] as int?,
      dayEvaluation: json['day_evaluation'] as int?,
      groups: json['groups'] as int?,
      fastPickup: json['fast_pickup'] as int?,
      childDevelopmentProfile: json['child_development_profile'] as int?,
      posting: json['posting'] as int?,
      chat: json['chat'] as int?,
      inscriptions: json['inscriptions'] as int?,
      parentsFamilyProfile: json['parents_family_profile'] as int?,
      educatorProfile: json['educator_profile'] as int?,
      medicalFileForm: json['medical_file_form'] as int?,
      kindergarten: json['kindergarten'] as String? ?? '',
      educator: json['educator'] as String? ?? '',
    );

Map<String, dynamic> _$EducatorKindergartenPermissionToJson(
    EducatorKindergartenPermission instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('menu', instance.menu);
  writeNotNull('calendar', instance.calendar);
  writeNotNull('educator_contracts', instance.educatorContracts);
  writeNotNull('payments', instance.payments);
  writeNotNull('presence', instance.presence);
  writeNotNull('day_evaluation', instance.dayEvaluation);
  writeNotNull('groups', instance.groups);
  writeNotNull('fast_pickup', instance.fastPickup);
  writeNotNull('child_development_profile', instance.childDevelopmentProfile);
  writeNotNull('posting', instance.posting);
  writeNotNull('chat', instance.chat);
  writeNotNull('inscriptions', instance.inscriptions);
  writeNotNull('parents_family_profile', instance.parentsFamilyProfile);
  writeNotNull('educator_profile', instance.educatorProfile);
  writeNotNull('medical_file_form', instance.medicalFileForm);
  writeNotNull('kindergarten', instance.kindergarten);
  writeNotNull('educator', instance.educator);
  return val;
}

ChildMedicalFileMedication _$ChildMedicalFileMedicationFromJson(
        Map<String, dynamic> json) =>
    ChildMedicalFileMedication(
      id: json['id'] as int?,
      name: json['name'] as String? ?? '',
      type: json['type'] as String? ?? '',
      description: json['description'] as String? ?? '',
      comments: json['comments'] as String? ?? '',
    );

Map<String, dynamic> _$ChildMedicalFileMedicationToJson(
    ChildMedicalFileMedication instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('type', instance.type);
  writeNotNull('description', instance.description);
  writeNotNull('comments', instance.comments);
  return val;
}

ChildMedicalFileAllergy _$ChildMedicalFileAllergyFromJson(
        Map<String, dynamic> json) =>
    ChildMedicalFileAllergy(
      id: json['id'] as int?,
      name: json['name'] as String? ?? '',
      type: json['type'] as String? ?? '',
      severity: childMedicalFileAllergySeverityFromJson(json['severity']),
      description: json['description'] as String? ?? '',
      comments: json['comments'] as String? ?? '',
    );

Map<String, dynamic> _$ChildMedicalFileAllergyToJson(
    ChildMedicalFileAllergy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('type', instance.type);
  writeNotNull(
      'severity', childMedicalFileAllergySeverityToJson(instance.severity));
  writeNotNull('description', instance.description);
  writeNotNull('comments', instance.comments);
  return val;
}

ChildMedicalFileMedicalCondition _$ChildMedicalFileMedicalConditionFromJson(
        Map<String, dynamic> json) =>
    ChildMedicalFileMedicalCondition(
      id: json['id'] as int?,
      name: json['name'] as String? ?? '',
      severity:
          childMedicalFileMedicalConditionSeverityFromJson(json['severity']),
      description: json['description'] as String? ?? '',
      comments: json['comments'] as String? ?? '',
    );

Map<String, dynamic> _$ChildMedicalFileMedicalConditionToJson(
    ChildMedicalFileMedicalCondition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('severity',
      childMedicalFileMedicalConditionSeverityToJson(instance.severity));
  writeNotNull('description', instance.description);
  writeNotNull('comments', instance.comments);
  return val;
}

ChildMedicalFile _$ChildMedicalFileFromJson(Map<String, dynamic> json) =>
    ChildMedicalFile(
      medications: (json['medications'] as List<dynamic>?)
              ?.map((e) => ChildMedicalFileMedication.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
      allergies: (json['allergies'] as List<dynamic>?)
              ?.map((e) =>
                  ChildMedicalFileAllergy.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      medicalConditions: (json['medical_conditions'] as List<dynamic>?)
              ?.map((e) => ChildMedicalFileMedicalCondition.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ChildMedicalFileToJson(ChildMedicalFile instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'medications', instance.medications?.map((e) => e.toJson()).toList());
  writeNotNull(
      'allergies', instance.allergies?.map((e) => e.toJson()).toList());
  writeNotNull('medical_conditions',
      instance.medicalConditions?.map((e) => e.toJson()).toList());
  return val;
}

Child _$ChildFromJson(Map<String, dynamic> json) => Child(
      id: json['id'] as int?,
      deleted: json['deleted'] as bool?,
      family: json['family'] as int?,
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      birthDate: json['birth_date'] == null
          ? null
          : DateTime.parse(json['birth_date'] as String),
      sex: childSexFromJson(json['sex']),
      avatar: json['avatar'] as String? ?? '',
      medicalFile: json['medical_file'] == null
          ? null
          : ChildMedicalFile.fromJson(
              json['medical_file'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChildToJson(Child instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('deleted', instance.deleted);
  writeNotNull('family', instance.family);
  writeNotNull('first_name', instance.firstName);
  writeNotNull('last_name', instance.lastName);
  writeNotNull('birth_date', instance.birthDate?.toIso8601String());
  writeNotNull('sex', childSexToJson(instance.sex));
  writeNotNull('avatar', instance.avatar);
  writeNotNull('medical_file', instance.medicalFile?.toJson());
  return val;
}

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      street: json['street'] as String? ?? '',
      number: json['number'] as String? ?? '',
      zipCode: json['zip_code'] as String? ?? '',
      city: json['city'] as String? ?? '',
      province: json['province'] as String? ?? '',
      country: json['country'] as String? ?? '',
    );

Map<String, dynamic> _$AddressToJson(Address instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('street', instance.street);
  writeNotNull('number', instance.number);
  writeNotNull('zip_code', instance.zipCode);
  writeNotNull('city', instance.city);
  writeNotNull('province', instance.province);
  writeNotNull('country', instance.country);
  return val;
}

TrustedPerson _$TrustedPersonFromJson(Map<String, dynamic> json) =>
    TrustedPerson(
      id: json['id'] as int?,
      phone: json['phone'] == null
          ? null
          : TrustedPerson$Phone.fromJson(json['phone'] as Map<String, dynamic>),
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      avatar: json['avatar'] as String? ?? '',
      birthDate: json['birth_date'] == null
          ? null
          : DateTime.parse(json['birth_date'] as String),
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      sex: trustedPersonSexFromJson(json['sex']),
      dateJoined: json['date_joined'] == null
          ? null
          : DateTime.parse(json['date_joined'] as String),
      email: json['email'] as String? ?? '',
      link: trustedPersonLinkFromJson(json['link']),
      pickupCode: json['pickup_code'] as String? ?? '',
      family: json['family'] as int?,
    );

Map<String, dynamic> _$TrustedPersonToJson(TrustedPerson instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('phone', instance.phone?.toJson());
  writeNotNull('address', instance.address?.toJson());
  writeNotNull('avatar', instance.avatar);
  writeNotNull('birth_date', instance.birthDate?.toIso8601String());
  writeNotNull('first_name', instance.firstName);
  writeNotNull('last_name', instance.lastName);
  writeNotNull('sex', trustedPersonSexToJson(instance.sex));
  writeNotNull('date_joined', instance.dateJoined?.toIso8601String());
  writeNotNull('email', instance.email);
  writeNotNull('link', trustedPersonLinkToJson(instance.link));
  writeNotNull('pickup_code', instance.pickupCode);
  writeNotNull('family', instance.family);
  return val;
}

TemporaryTrustedPerson _$TemporaryTrustedPersonFromJson(
        Map<String, dynamic> json) =>
    TemporaryTrustedPerson(
      id: json['id'] as int?,
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      email: json['email'] as String? ?? '',
      pickupCode: json['pickup_code'] as String? ?? '',
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      familyId: json['family_id'] as int?,
    );

Map<String, dynamic> _$TemporaryTrustedPersonToJson(
    TemporaryTrustedPerson instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('first_name', instance.firstName);
  writeNotNull('last_name', instance.lastName);
  writeNotNull('phone', instance.phone);
  writeNotNull('email', instance.email);
  writeNotNull('pickup_code', instance.pickupCode);
  writeNotNull('created_at', instance.createdAt?.toIso8601String());
  writeNotNull('family_id', instance.familyId);
  return val;
}

Parent _$ParentFromJson(Map<String, dynamic> json) => Parent(
      id: json['id'] as int?,
      email: json['email'] as String? ?? '',
      password1: json['password1'] as String? ?? '',
      password2: json['password2'] as String? ?? '',
      isEmailVerified: json['is_email_verified'] as String? ?? '',
      parentprofile: json['parentprofile'] as String? ?? '',
      signature: json['signature'] as int?,
    );

Map<String, dynamic> _$ParentToJson(Parent instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('email', instance.email);
  writeNotNull('password1', instance.password1);
  writeNotNull('password2', instance.password2);
  writeNotNull('is_email_verified', instance.isEmailVerified);
  writeNotNull('parentprofile', instance.parentprofile);
  writeNotNull('signature', instance.signature);
  return val;
}

Presence _$PresenceFromJson(Map<String, dynamic> json) => Presence(
      id: json['id'] as int?,
      child: json['child'] == null
          ? null
          : Child.fromJson(json['child'] as Map<String, dynamic>),
      clockInTrustedPerson: json['clock_in_trusted_person'] == null
          ? null
          : TrustedPerson.fromJson(
              json['clock_in_trusted_person'] as Map<String, dynamic>),
      clockInTemporaryTrustedPerson:
          json['clock_in_temporary_trusted_person'] == null
              ? null
              : TemporaryTrustedPerson.fromJson(
                  json['clock_in_temporary_trusted_person']
                      as Map<String, dynamic>),
      clockInParent: json['clock_in_parent'] == null
          ? null
          : Parent.fromJson(json['clock_in_parent'] as Map<String, dynamic>),
      clockOutTrustedPerson: json['clock_out_trusted_person'] == null
          ? null
          : TrustedPerson.fromJson(
              json['clock_out_trusted_person'] as Map<String, dynamic>),
      clockOutTemporaryTrustedPerson:
          json['clock_out_temporary_trusted_person'] == null
              ? null
              : TemporaryTrustedPerson.fromJson(
                  json['clock_out_temporary_trusted_person']
                      as Map<String, dynamic>),
      clockOutParent: json['clock_out_parent'] == null
          ? null
          : Parent.fromJson(json['clock_out_parent'] as Map<String, dynamic>),
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      clockInTime: json['clock_in_time'] as String? ?? '',
      clockOutTime: json['clock_out_time'] as String? ?? '',
      absent: json['absent'] as bool?,
    );

Map<String, dynamic> _$PresenceToJson(Presence instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('child', instance.child?.toJson());
  writeNotNull(
      'clock_in_trusted_person', instance.clockInTrustedPerson?.toJson());
  writeNotNull('clock_in_temporary_trusted_person',
      instance.clockInTemporaryTrustedPerson?.toJson());
  writeNotNull('clock_in_parent', instance.clockInParent?.toJson());
  writeNotNull(
      'clock_out_trusted_person', instance.clockOutTrustedPerson?.toJson());
  writeNotNull('clock_out_temporary_trusted_person',
      instance.clockOutTemporaryTrustedPerson?.toJson());
  writeNotNull('clock_out_parent', instance.clockOutParent?.toJson());
  writeNotNull('date', _dateToJson(instance.date));
  writeNotNull('clock_in_time', instance.clockInTime);
  writeNotNull('clock_out_time', instance.clockOutTime);
  writeNotNull('absent', instance.absent);
  return val;
}

ExpectedPickUp _$ExpectedPickUpFromJson(Map<String, dynamic> json) =>
    ExpectedPickUp(
      id: json['id'] as int?,
      startDate: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      clockIn: json['clock_in'] as bool?,
      clockOut: json['clock_out'] as bool?,
      children: (json['children'] as List<dynamic>?)
              ?.map((e) => Child.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      parents: (json['parents'] as List<dynamic>?)
              ?.map((e) => Parent.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      trustedPersons: (json['trusted_persons'] as List<dynamic>?)
              ?.map((e) => TrustedPerson.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      temporaryTrustedPersons: json['temporary_trusted_persons'] == null
          ? null
          : TemporaryTrustedPerson.fromJson(
              json['temporary_trusted_persons'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExpectedPickUpToJson(ExpectedPickUp instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('start_date', _dateToJson(instance.startDate));
  writeNotNull('end_date', _dateToJson(instance.endDate));
  writeNotNull('clock_in', instance.clockIn);
  writeNotNull('clock_out', instance.clockOut);
  writeNotNull('children', instance.children?.map((e) => e.toJson()).toList());
  writeNotNull('parents', instance.parents?.map((e) => e.toJson()).toList());
  writeNotNull('trusted_persons',
      instance.trustedPersons?.map((e) => e.toJson()).toList());
  writeNotNull(
      'temporary_trusted_persons', instance.temporaryTrustedPersons?.toJson());
  return val;
}

TagUser _$TagUserFromJson(Map<String, dynamic> json) => TagUser(
      taggedUser: json['tagged_user'] as int?,
    );

Map<String, dynamic> _$TagUserToJson(TagUser instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('tagged_user', instance.taggedUser);
  return val;
}

TagGroup _$TagGroupFromJson(Map<String, dynamic> json) => TagGroup(
      taggedGroup: json['tagged_group'] as int?,
    );

Map<String, dynamic> _$TagGroupToJson(TagGroup instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('tagged_group', instance.taggedGroup);
  return val;
}

CommentReaction _$CommentReactionFromJson(Map<String, dynamic> json) =>
    CommentReaction(
      id: json['id'] as int?,
      user: json['user'] as int?,
      comment: json['comment'] as int?,
      reaction: commentReactionReactionFromJson(json['reaction']),
    );

Map<String, dynamic> _$CommentReactionToJson(CommentReaction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('user', instance.user);
  writeNotNull('comment', instance.comment);
  writeNotNull('reaction', commentReactionReactionToJson(instance.reaction));
  return val;
}

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      id: json['id'] as int?,
      user: json['user'] as int?,
      publication: json['publication'] as int?,
      parentComment: json['parent_comment'] as int?,
      dateCreated: json['date_created'] == null
          ? null
          : DateTime.parse(json['date_created'] as String),
      dateModified: json['date_modified'] == null
          ? null
          : DateTime.parse(json['date_modified'] as String),
      content: json['content'] as String? ?? '',
      tagUsers: (json['tag_users'] as List<dynamic>?)
              ?.map((e) => TagUser.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      tagGroups: (json['tag_groups'] as List<dynamic>?)
              ?.map((e) => TagGroup.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      reactions: (json['reactions'] as List<dynamic>?)
              ?.map((e) => CommentReaction.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      deleted: json['deleted'] as bool?,
    );

Map<String, dynamic> _$CommentToJson(Comment instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('user', instance.user);
  writeNotNull('publication', instance.publication);
  writeNotNull('parent_comment', instance.parentComment);
  writeNotNull('date_created', instance.dateCreated?.toIso8601String());
  writeNotNull('date_modified', instance.dateModified?.toIso8601String());
  writeNotNull('content', instance.content);
  writeNotNull('tag_users', instance.tagUsers?.map((e) => e.toJson()).toList());
  writeNotNull(
      'tag_groups', instance.tagGroups?.map((e) => e.toJson()).toList());
  writeNotNull(
      'reactions', instance.reactions?.map((e) => e.toJson()).toList());
  writeNotNull('deleted', instance.deleted);
  return val;
}

CommentSerializerUpdate _$CommentSerializerUpdateFromJson(
        Map<String, dynamic> json) =>
    CommentSerializerUpdate(
      id: json['id'] as int?,
      user: json['user'] as int?,
      publication: json['publication'] as int?,
      parentComment: json['parent_comment'] as int?,
      dateCreated: json['date_created'] == null
          ? null
          : DateTime.parse(json['date_created'] as String),
      dateModified: json['date_modified'] == null
          ? null
          : DateTime.parse(json['date_modified'] as String),
      content: json['content'] as String? ?? '',
      tagUsers: (json['tag_users'] as List<dynamic>?)
              ?.map((e) => TagUser.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      tagGroups: (json['tag_groups'] as List<dynamic>?)
              ?.map((e) => TagGroup.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      reactions: (json['reactions'] as List<dynamic>?)
              ?.map((e) => CommentReaction.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      deleted: json['deleted'] as bool?,
    );

Map<String, dynamic> _$CommentSerializerUpdateToJson(
    CommentSerializerUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('user', instance.user);
  writeNotNull('publication', instance.publication);
  writeNotNull('parent_comment', instance.parentComment);
  writeNotNull('date_created', instance.dateCreated?.toIso8601String());
  writeNotNull('date_modified', instance.dateModified?.toIso8601String());
  writeNotNull('content', instance.content);
  writeNotNull('tag_users', instance.tagUsers?.map((e) => e.toJson()).toList());
  writeNotNull(
      'tag_groups', instance.tagGroups?.map((e) => e.toJson()).toList());
  writeNotNull(
      'reactions', instance.reactions?.map((e) => e.toJson()).toList());
  writeNotNull('deleted', instance.deleted);
  return val;
}

PostPublicationContent _$PostPublicationContentFromJson(
        Map<String, dynamic> json) =>
    PostPublicationContent(
      content: json['content'] as String? ?? '',
    );

Map<String, dynamic> _$PostPublicationContentToJson(
    PostPublicationContent instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('content', instance.content);
  return val;
}

IncidentPublicationContent _$IncidentPublicationContentFromJson(
        Map<String, dynamic> json) =>
    IncidentPublicationContent(
      content: json['content'] as String? ?? '',
    );

Map<String, dynamic> _$IncidentPublicationContentToJson(
    IncidentPublicationContent instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('content', instance.content);
  return val;
}

PollPublicationContent _$PollPublicationContentFromJson(
        Map<String, dynamic> json) =>
    PollPublicationContent(
      content: json['content'] as String? ?? '',
    );

Map<String, dynamic> _$PollPublicationContentToJson(
    PollPublicationContent instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('content', instance.content);
  return val;
}

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      text: json['text'] as String? ?? '',
      answer: json['answer'] as int?,
      rating: json['rating'] as int?,
      notes: json['notes'] as String? ?? '',
      subType: questionSubTypeFromJson(json['sub_type']),
    );

Map<String, dynamic> _$QuestionToJson(Question instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('text', instance.text);
  writeNotNull('answer', instance.answer);
  writeNotNull('rating', instance.rating);
  writeNotNull('notes', instance.notes);
  writeNotNull('sub_type', questionSubTypeToJson(instance.subType));
  return val;
}

DaySummaryPublicationContent _$DaySummaryPublicationContentFromJson(
        Map<String, dynamic> json) =>
    DaySummaryPublicationContent(
      content: json['content'] as String? ?? '',
      questions: (json['questions'] as List<dynamic>?)
              ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$DaySummaryPublicationContentToJson(
    DaySummaryPublicationContent instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('content', instance.content);
  writeNotNull(
      'questions', instance.questions?.map((e) => e.toJson()).toList());
  return val;
}

DocOnlyPublicationContent _$DocOnlyPublicationContentFromJson(
        Map<String, dynamic> json) =>
    DocOnlyPublicationContent(
      postContent: json['post_content'] == null
          ? null
          : PostPublicationContent.fromJson(
              json['post_content'] as Map<String, dynamic>),
      incidentContent: json['incident_content'] == null
          ? null
          : IncidentPublicationContent.fromJson(
              json['incident_content'] as Map<String, dynamic>),
      pollContent: json['poll_content'] == null
          ? null
          : PollPublicationContent.fromJson(
              json['poll_content'] as Map<String, dynamic>),
      daySummaryContent: json['day_summary_content'] == null
          ? null
          : DaySummaryPublicationContent.fromJson(
              json['day_summary_content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DocOnlyPublicationContentToJson(
    DocOnlyPublicationContent instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('post_content', instance.postContent?.toJson());
  writeNotNull('incident_content', instance.incidentContent?.toJson());
  writeNotNull('poll_content', instance.pollContent?.toJson());
  writeNotNull('day_summary_content', instance.daySummaryContent?.toJson());
  return val;
}

PublicationReaction _$PublicationReactionFromJson(Map<String, dynamic> json) =>
    PublicationReaction(
      id: json['id'] as int?,
      user: json['user'] as int?,
      publication: json['publication'] as int?,
      reaction: publicationReactionReactionFromJson(json['reaction']),
    );

Map<String, dynamic> _$PublicationReactionToJson(PublicationReaction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('user', instance.user);
  writeNotNull('publication', instance.publication);
  writeNotNull(
      'reaction', publicationReactionReactionToJson(instance.reaction));
  return val;
}

QAUserVote _$QAUserVoteFromJson(Map<String, dynamic> json) => QAUserVote(
      id: json['id'] as int?,
      user: json['user'] as int?,
      choice: json['choice'] as int?,
    );

Map<String, dynamic> _$QAUserVoteToJson(QAUserVote instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('user', instance.user);
  writeNotNull('choice', instance.choice);
  return val;
}

QAChoice _$QAChoiceFromJson(Map<String, dynamic> json) => QAChoice(
      id: json['id'] as int?,
      choice: json['choice'] as String? ?? '',
      userVotes: (json['user_votes'] as List<dynamic>?)
              ?.map((e) => QAUserVote.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      userVotesCount: json['user_votes_count'] as int?,
    );

Map<String, dynamic> _$QAChoiceToJson(QAChoice instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('choice', instance.choice);
  writeNotNull(
      'user_votes', instance.userVotes?.map((e) => e.toJson()).toList());
  writeNotNull('user_votes_count', instance.userVotesCount);
  return val;
}

QAVote _$QAVoteFromJson(Map<String, dynamic> json) => QAVote(
      id: json['id'] as int?,
      choices: (json['choices'] as List<dynamic>?)
              ?.map((e) => QAChoice.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      mostPopularChoice: json['most_popular_choice'] == null
          ? null
          : QAChoice.fromJson(
              json['most_popular_choice'] as Map<String, dynamic>),
      question: json['question'] as String? ?? '',
      multiChoice: json['multi_choice'] as bool?,
    );

Map<String, dynamic> _$QAVoteToJson(QAVote instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('choices', instance.choices?.map((e) => e.toJson()).toList());
  writeNotNull('most_popular_choice', instance.mostPopularChoice?.toJson());
  writeNotNull('question', instance.question);
  writeNotNull('multi_choice', instance.multiChoice);
  return val;
}

PublicationFile _$PublicationFileFromJson(Map<String, dynamic> json) =>
    PublicationFile(
      id: json['id'] as int?,
      file: json['file'] as String? ?? '',
    );

Map<String, dynamic> _$PublicationFileToJson(PublicationFile instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('file', instance.file);
  return val;
}

Publication _$PublicationFromJson(Map<String, dynamic> json) => Publication(
      id: json['id'] as int?,
      content: json['content'],
      typeVersion: json['type_version'] as String? ?? '',
      createdByUser: json['created_by_user'] as int?,
      dateCreated: json['date_created'] == null
          ? null
          : DateTime.parse(json['date_created'] as String),
      dateModified: json['date_modified'] == null
          ? null
          : DateTime.parse(json['date_modified'] as String),
      publicized: json['publicized'] as bool?,
      comments: (json['comments'] as List<dynamic>?)
              ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      reactions: (json['reactions'] as List<dynamic>?)
              ?.map((e) =>
                  PublicationReaction.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      tagUsers: (json['tag_users'] as List<dynamic>?)
              ?.map((e) => TagUser.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      tagGroups: (json['tag_groups'] as List<dynamic>?)
              ?.map((e) => TagGroup.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      qaVote: json['qa_vote'] == null
          ? null
          : QAVote.fromJson(json['qa_vote'] as Map<String, dynamic>),
      files: (json['files'] as List<dynamic>?)
              ?.map((e) => PublicationFile.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$PublicationToJson(Publication instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('content', instance.content);
  writeNotNull('type_version', instance.typeVersion);
  writeNotNull('created_by_user', instance.createdByUser);
  writeNotNull('date_created', instance.dateCreated?.toIso8601String());
  writeNotNull('date_modified', instance.dateModified?.toIso8601String());
  writeNotNull('publicized', instance.publicized);
  writeNotNull('comments', instance.comments?.map((e) => e.toJson()).toList());
  writeNotNull(
      'reactions', instance.reactions?.map((e) => e.toJson()).toList());
  writeNotNull('tag_users', instance.tagUsers?.map((e) => e.toJson()).toList());
  writeNotNull(
      'tag_groups', instance.tagGroups?.map((e) => e.toJson()).toList());
  writeNotNull('qa_vote', instance.qaVote?.toJson());
  writeNotNull('files', instance.files?.map((e) => e.toJson()).toList());
  return val;
}

PublicationUpdate _$PublicationUpdateFromJson(Map<String, dynamic> json) =>
    PublicationUpdate(
      id: json['id'] as int?,
      content: json['content'],
      typeVersion: json['type_version'] as String? ?? '',
      createdByUser: json['created_by_user'] as int?,
      dateCreated: json['date_created'] == null
          ? null
          : DateTime.parse(json['date_created'] as String),
      dateModified: json['date_modified'] == null
          ? null
          : DateTime.parse(json['date_modified'] as String),
      publicized: json['publicized'] as bool?,
      comments: (json['comments'] as List<dynamic>?)
              ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      reactions: (json['reactions'] as List<dynamic>?)
              ?.map((e) =>
                  PublicationReaction.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      tagUsers: (json['tag_users'] as List<dynamic>?)
              ?.map((e) => TagUser.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      tagGroups: (json['tag_groups'] as List<dynamic>?)
              ?.map((e) => TagGroup.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      qaVote: json['qa_vote'] == null
          ? null
          : QAVote.fromJson(json['qa_vote'] as Map<String, dynamic>),
      files: (json['files'] as List<dynamic>?)
              ?.map((e) => PublicationFile.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$PublicationUpdateToJson(PublicationUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('content', instance.content);
  writeNotNull('type_version', instance.typeVersion);
  writeNotNull('created_by_user', instance.createdByUser);
  writeNotNull('date_created', instance.dateCreated?.toIso8601String());
  writeNotNull('date_modified', instance.dateModified?.toIso8601String());
  writeNotNull('publicized', instance.publicized);
  writeNotNull('comments', instance.comments?.map((e) => e.toJson()).toList());
  writeNotNull(
      'reactions', instance.reactions?.map((e) => e.toJson()).toList());
  writeNotNull('tag_users', instance.tagUsers?.map((e) => e.toJson()).toList());
  writeNotNull(
      'tag_groups', instance.tagGroups?.map((e) => e.toJson()).toList());
  writeNotNull('qa_vote', instance.qaVote?.toJson());
  writeNotNull('files', instance.files?.map((e) => e.toJson()).toList());
  return val;
}

Educator _$EducatorFromJson(Map<String, dynamic> json) => Educator(
      id: json['id'] as int?,
      email: json['email'] as String? ?? '',
      isEmailVerified: json['is_email_verified'] as String? ?? '',
      password1: json['password1'] as String? ?? '',
      password2: json['password2'] as String? ?? '',
      educatorprofile: json['educatorprofile'] == null
          ? null
          : Educator$Educatorprofile.fromJson(
              json['educatorprofile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EducatorToJson(Educator instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('email', instance.email);
  writeNotNull('is_email_verified', instance.isEmailVerified);
  writeNotNull('password1', instance.password1);
  writeNotNull('password2', instance.password2);
  writeNotNull('educatorprofile', instance.educatorprofile?.toJson());
  return val;
}

SearchKindergartenMembers _$SearchKindergartenMembersFromJson(
        Map<String, dynamic> json) =>
    SearchKindergartenMembers(
      children: (json['children'] as List<dynamic>?)
              ?.map((e) => Child.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      groups: (json['groups'] as List<dynamic>?)
              ?.map((e) => Group.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      parents: (json['parents'] as List<dynamic>?)
              ?.map((e) => Parent.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      educators: (json['educators'] as List<dynamic>?)
              ?.map((e) => Educator.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$SearchKindergartenMembersToJson(
    SearchKindergartenMembers instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('children', instance.children?.map((e) => e.toJson()).toList());
  writeNotNull('groups', instance.groups?.map((e) => e.toJson()).toList());
  writeNotNull('parents', instance.parents?.map((e) => e.toJson()).toList());
  writeNotNull(
      'educators', instance.educators?.map((e) => e.toJson()).toList());
  return val;
}

ParentSearch _$ParentSearchFromJson(Map<String, dynamic> json) => ParentSearch(
      id: json['id'] as int?,
      firstName: json['first_name'] as String? ?? '',
      sex: json['sex'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
    );

Map<String, dynamic> _$ParentSearchToJson(ParentSearch instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('first_name', instance.firstName);
  writeNotNull('sex', instance.sex);
  writeNotNull('last_name', instance.lastName);
  return val;
}

ChildSearch _$ChildSearchFromJson(Map<String, dynamic> json) => ChildSearch(
      id: json['id'] as int?,
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      sex: childSearchSexFromJson(json['sex']),
      birthDate: json['birth_date'] == null
          ? null
          : DateTime.parse(json['birth_date'] as String),
      parent1: json['parent1'] == null
          ? null
          : ParentSearch.fromJson(json['parent1'] as Map<String, dynamic>),
      parent2: json['parent2'] == null
          ? null
          : ParentSearch.fromJson(json['parent2'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChildSearchToJson(ChildSearch instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('first_name', instance.firstName);
  writeNotNull('last_name', instance.lastName);
  writeNotNull('sex', childSearchSexToJson(instance.sex));
  writeNotNull('birth_date', instance.birthDate?.toIso8601String());
  writeNotNull('parent1', instance.parent1?.toJson());
  writeNotNull('parent2', instance.parent2?.toJson());
  return val;
}

ParentProfile _$ParentProfileFromJson(Map<String, dynamic> json) =>
    ParentProfile(
      id: json['id'] as int?,
      user: json['user'] == null
          ? null
          : Parent.fromJson(json['user'] as Map<String, dynamic>),
      phone: json['phone'] == null
          ? null
          : ParentProfile$Phone.fromJson(json['phone'] as Map<String, dynamic>),
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      avatar: json['avatar'] as String? ?? '',
      birthDate: json['birth_date'] == null
          ? null
          : DateTime.parse(json['birth_date'] as String),
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      sex: parentProfileSexFromJson(json['sex']),
    );

Map<String, dynamic> _$ParentProfileToJson(ParentProfile instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('user', instance.user?.toJson());
  writeNotNull('phone', instance.phone?.toJson());
  writeNotNull('address', instance.address?.toJson());
  writeNotNull('avatar', instance.avatar);
  writeNotNull('birth_date', instance.birthDate?.toIso8601String());
  writeNotNull('first_name', instance.firstName);
  writeNotNull('last_name', instance.lastName);
  writeNotNull('sex', parentProfileSexToJson(instance.sex));
  return val;
}

WholeChildFamily _$WholeChildFamilyFromJson(Map<String, dynamic> json) =>
    WholeChildFamily(
      parent1: json['parent1'] == null
          ? null
          : ParentProfile.fromJson(json['parent1'] as Map<String, dynamic>),
      parent2: json['parent2'] == null
          ? null
          : ParentProfile.fromJson(json['parent2'] as Map<String, dynamic>),
      trustedPerson: (json['trusted_person'] as List<dynamic>?)
              ?.map((e) => TrustedPerson.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      primaryContact:
          wholeChildFamilyPrimaryContactFromJson(json['primary_contact']),
    );

Map<String, dynamic> _$WholeChildFamilyToJson(WholeChildFamily instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('parent1', instance.parent1?.toJson());
  writeNotNull('parent2', instance.parent2?.toJson());
  writeNotNull('trusted_person',
      instance.trustedPerson?.map((e) => e.toJson()).toList());
  writeNotNull('primary_contact',
      wholeChildFamilyPrimaryContactToJson(instance.primaryContact));
  return val;
}

WholeChild _$WholeChildFromJson(Map<String, dynamic> json) => WholeChild(
      schedule: json['schedule'] as String? ?? '',
      medicalFile: json['medical_file'] == null
          ? null
          : ChildMedicalFile.fromJson(
              json['medical_file'] as Map<String, dynamic>),
      notes: json['notes'] as String? ?? '',
      historyLog: json['history_log'] as String? ?? '',
      family: json['family'] == null
          ? null
          : WholeChildFamily.fromJson(json['family'] as Map<String, dynamic>),
      siblings: json['siblings'] as String? ?? '',
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      birthDate: json['birth_date'] == null
          ? null
          : DateTime.parse(json['birth_date'] as String),
      sex: wholeChildSexFromJson(json['sex']),
      avatar: json['avatar'] as String? ?? '',
      group: json['group'] as String? ?? '',
    );

Map<String, dynamic> _$WholeChildToJson(WholeChild instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('schedule', instance.schedule);
  writeNotNull('medical_file', instance.medicalFile?.toJson());
  writeNotNull('notes', instance.notes);
  writeNotNull('history_log', instance.historyLog);
  writeNotNull('family', instance.family?.toJson());
  writeNotNull('siblings', instance.siblings);
  writeNotNull('first_name', instance.firstName);
  writeNotNull('last_name', instance.lastName);
  writeNotNull('birth_date', instance.birthDate?.toIso8601String());
  writeNotNull('sex', wholeChildSexToJson(instance.sex));
  writeNotNull('avatar', instance.avatar);
  writeNotNull('group', instance.group);
  return val;
}

ChatGroupsGet$Response _$ChatGroupsGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ChatGroupsGet$Response(
      count: json['count'] as int?,
      next: json['next'] as String? ?? '',
      previous: json['previous'] as String? ?? '',
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => ChatGroup.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ChatGroupsGet$ResponseToJson(
    ChatGroupsGet$Response instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count);
  writeNotNull('next', instance.next);
  writeNotNull('previous', instance.previous);
  writeNotNull('results', instance.results?.map((e) => e.toJson()).toList());
  return val;
}

ChatGroupsGroupIdMessagesGet$Response
    _$ChatGroupsGroupIdMessagesGet$ResponseFromJson(
            Map<String, dynamic> json) =>
        ChatGroupsGroupIdMessagesGet$Response(
          count: json['count'] as int?,
          next: json['next'] as String? ?? '',
          previous: json['previous'] as String? ?? '',
          results: (json['results'] as List<dynamic>?)
                  ?.map((e) => ChatMessage.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$ChatGroupsGroupIdMessagesGet$ResponseToJson(
    ChatGroupsGroupIdMessagesGet$Response instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count);
  writeNotNull('next', instance.next);
  writeNotNull('previous', instance.previous);
  writeNotNull('results', instance.results?.map((e) => e.toJson()).toList());
  return val;
}

ChatGroupsGroupIdMessagesUploadGet$Response
    _$ChatGroupsGroupIdMessagesUploadGet$ResponseFromJson(
            Map<String, dynamic> json) =>
        ChatGroupsGroupIdMessagesUploadGet$Response(
          count: json['count'] as int?,
          next: json['next'] as String? ?? '',
          previous: json['previous'] as String? ?? '',
          results: (json['results'] as List<dynamic>?)
                  ?.map((e) =>
                      ChatMessageFile.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$ChatGroupsGroupIdMessagesUploadGet$ResponseToJson(
    ChatGroupsGroupIdMessagesUploadGet$Response instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count);
  writeNotNull('next', instance.next);
  writeNotNull('previous', instance.previous);
  writeNotNull('results', instance.results?.map((e) => e.toJson()).toList());
  return val;
}

ChatGroupsGroupIdSharedLinksGet$Response
    _$ChatGroupsGroupIdSharedLinksGet$ResponseFromJson(
            Map<String, dynamic> json) =>
        ChatGroupsGroupIdSharedLinksGet$Response(
          count: json['count'] as int?,
          next: json['next'] as String? ?? '',
          previous: json['previous'] as String? ?? '',
          results: (json['results'] as List<dynamic>?)
                  ?.map((e) => SharedLink.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$ChatGroupsGroupIdSharedLinksGet$ResponseToJson(
    ChatGroupsGroupIdSharedLinksGet$Response instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count);
  writeNotNull('next', instance.next);
  writeNotNull('previous', instance.previous);
  writeNotNull('results', instance.results?.map((e) => e.toJson()).toList());
  return val;
}

ChildDailySummaryGet$Response _$ChildDailySummaryGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ChildDailySummaryGet$Response(
      count: json['count'] as int?,
      next: json['next'] as String? ?? '',
      previous: json['previous'] as String? ?? '',
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => DaySummary.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ChildDailySummaryGet$ResponseToJson(
    ChildDailySummaryGet$Response instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count);
  writeNotNull('next', instance.next);
  writeNotNull('previous', instance.previous);
  writeNotNull('results', instance.results?.map((e) => e.toJson()).toList());
  return val;
}

EducatorTimesheetAvailabilityGet$Response
    _$EducatorTimesheetAvailabilityGet$ResponseFromJson(
            Map<String, dynamic> json) =>
        EducatorTimesheetAvailabilityGet$Response(
          count: json['count'] as int?,
          next: json['next'] as String? ?? '',
          previous: json['previous'] as String? ?? '',
          results: (json['results'] as List<dynamic>?)
                  ?.map((e) =>
                      EducatorAvailability.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$EducatorTimesheetAvailabilityGet$ResponseToJson(
    EducatorTimesheetAvailabilityGet$Response instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count);
  writeNotNull('next', instance.next);
  writeNotNull('previous', instance.previous);
  writeNotNull('results', instance.results?.map((e) => e.toJson()).toList());
  return val;
}

EducatorTimesheetScheduleGet$Response
    _$EducatorTimesheetScheduleGet$ResponseFromJson(
            Map<String, dynamic> json) =>
        EducatorTimesheetScheduleGet$Response(
          count: json['count'] as int?,
          next: json['next'] as String? ?? '',
          previous: json['previous'] as String? ?? '',
          results: (json['results'] as List<dynamic>?)
                  ?.map((e) =>
                      EducatorSchedule.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$EducatorTimesheetScheduleGet$ResponseToJson(
    EducatorTimesheetScheduleGet$Response instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count);
  writeNotNull('next', instance.next);
  writeNotNull('previous', instance.previous);
  writeNotNull('results', instance.results?.map((e) => e.toJson()).toList());
  return val;
}

EducatorTimesheetSettingsGet$Response
    _$EducatorTimesheetSettingsGet$ResponseFromJson(
            Map<String, dynamic> json) =>
        EducatorTimesheetSettingsGet$Response(
          count: json['count'] as int?,
          next: json['next'] as String? ?? '',
          previous: json['previous'] as String? ?? '',
          results: (json['results'] as List<dynamic>?)
                  ?.map((e) => GeneralEducatorTimeSheetSettings.fromJson(
                      e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$EducatorTimesheetSettingsGet$ResponseToJson(
    EducatorTimesheetSettingsGet$Response instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count);
  writeNotNull('next', instance.next);
  writeNotNull('previous', instance.previous);
  writeNotNull('results', instance.results?.map((e) => e.toJson()).toList());
  return val;
}

EducatorTimesheetSettingsExperienceGet$Response
    _$EducatorTimesheetSettingsExperienceGet$ResponseFromJson(
            Map<String, dynamic> json) =>
        EducatorTimesheetSettingsExperienceGet$Response(
          count: json['count'] as int?,
          next: json['next'] as String? ?? '',
          previous: json['previous'] as String? ?? '',
          results: (json['results'] as List<dynamic>?)
                  ?.map((e) => EducatorExperienceLevelSettings.fromJson(
                      e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$EducatorTimesheetSettingsExperienceGet$ResponseToJson(
    EducatorTimesheetSettingsExperienceGet$Response instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count);
  writeNotNull('next', instance.next);
  writeNotNull('previous', instance.previous);
  writeNotNull('results', instance.results?.map((e) => e.toJson()).toList());
  return val;
}

EducatorTimesheetSettingsIndividualGet$Response
    _$EducatorTimesheetSettingsIndividualGet$ResponseFromJson(
            Map<String, dynamic> json) =>
        EducatorTimesheetSettingsIndividualGet$Response(
          count: json['count'] as int?,
          next: json['next'] as String? ?? '',
          previous: json['previous'] as String? ?? '',
          results: (json['results'] as List<dynamic>?)
                  ?.map((e) => IndividualEmployeeTimeSheetSettings.fromJson(
                      e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$EducatorTimesheetSettingsIndividualGet$ResponseToJson(
    EducatorTimesheetSettingsIndividualGet$Response instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count);
  writeNotNull('next', instance.next);
  writeNotNull('previous', instance.previous);
  writeNotNull('results', instance.results?.map((e) => e.toJson()).toList());
  return val;
}

EducatorTimesheetTimesheetGet$Response
    _$EducatorTimesheetTimesheetGet$ResponseFromJson(
            Map<String, dynamic> json) =>
        EducatorTimesheetTimesheetGet$Response(
          count: json['count'] as int?,
          next: json['next'] as String? ?? '',
          previous: json['previous'] as String? ?? '',
          results: (json['results'] as List<dynamic>?)
                  ?.map((e) =>
                      EducatorTimeSheet.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$EducatorTimesheetTimesheetGet$ResponseToJson(
    EducatorTimesheetTimesheetGet$Response instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count);
  writeNotNull('next', instance.next);
  writeNotNull('previous', instance.previous);
  writeNotNull('results', instance.results?.map((e) => e.toJson()).toList());
  return val;
}

EventsGet$Response _$EventsGet$ResponseFromJson(Map<String, dynamic> json) =>
    EventsGet$Response(
      count: json['count'] as int?,
      next: json['next'] as String? ?? '',
      previous: json['previous'] as String? ?? '',
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => Event.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$EventsGet$ResponseToJson(EventsGet$Response instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count);
  writeNotNull('next', instance.next);
  writeNotNull('previous', instance.previous);
  writeNotNull('results', instance.results?.map((e) => e.toJson()).toList());
  return val;
}

EventsEventsOccurrenceGet$Response _$EventsEventsOccurrenceGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    EventsEventsOccurrenceGet$Response(
      count: json['count'] as int?,
      next: json['next'] as String? ?? '',
      previous: json['previous'] as String? ?? '',
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => EventOccurrence.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$EventsEventsOccurrenceGet$ResponseToJson(
    EventsEventsOccurrenceGet$Response instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count);
  writeNotNull('next', instance.next);
  writeNotNull('previous', instance.previous);
  writeNotNull('results', instance.results?.map((e) => e.toJson()).toList());
  return val;
}

FormsFormMedicalfileGet$Response _$FormsFormMedicalfileGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    FormsFormMedicalfileGet$Response(
      count: json['count'] as int?,
      next: json['next'] as String? ?? '',
      previous: json['previous'] as String? ?? '',
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => MedicalFileForm.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$FormsFormMedicalfileGet$ResponseToJson(
    FormsFormMedicalfileGet$Response instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count);
  writeNotNull('next', instance.next);
  writeNotNull('previous', instance.previous);
  writeNotNull('results', instance.results?.map((e) => e.toJson()).toList());
  return val;
}

FormsFormMedicalfileTemplateGet$Response
    _$FormsFormMedicalfileTemplateGet$ResponseFromJson(
            Map<String, dynamic> json) =>
        FormsFormMedicalfileTemplateGet$Response(
          count: json['count'] as int?,
          next: json['next'] as String? ?? '',
          previous: json['previous'] as String? ?? '',
          results: (json['results'] as List<dynamic>?)
                  ?.map((e) =>
                      MedicalFileTemplate.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$FormsFormMedicalfileTemplateGet$ResponseToJson(
    FormsFormMedicalfileTemplateGet$Response instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count);
  writeNotNull('next', instance.next);
  writeNotNull('previous', instance.previous);
  writeNotNull('results', instance.results?.map((e) => e.toJson()).toList());
  return val;
}

FormsFormTpzGet$Response _$FormsFormTpzGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    FormsFormTpzGet$Response(
      count: json['count'] as int?,
      next: json['next'] as String? ?? '',
      previous: json['previous'] as String? ?? '',
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => TPZForm.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$FormsFormTpzGet$ResponseToJson(
    FormsFormTpzGet$Response instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count);
  writeNotNull('next', instance.next);
  writeNotNull('previous', instance.previous);
  writeNotNull('results', instance.results?.map((e) => e.toJson()).toList());
  return val;
}

FormsFormTpzTemplateGet$Response _$FormsFormTpzTemplateGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    FormsFormTpzTemplateGet$Response(
      count: json['count'] as int?,
      next: json['next'] as String? ?? '',
      previous: json['previous'] as String? ?? '',
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => TPZTemplate.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$FormsFormTpzTemplateGet$ResponseToJson(
    FormsFormTpzTemplateGet$Response instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count);
  writeNotNull('next', instance.next);
  writeNotNull('previous', instance.previous);
  writeNotNull('results', instance.results?.map((e) => e.toJson()).toList());
  return val;
}

GroupGet$Response _$GroupGet$ResponseFromJson(Map<String, dynamic> json) =>
    GroupGet$Response(
      count: json['count'] as int?,
      next: json['next'] as String? ?? '',
      previous: json['previous'] as String? ?? '',
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => Group.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$GroupGet$ResponseToJson(GroupGet$Response instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count);
  writeNotNull('next', instance.next);
  writeNotNull('previous', instance.previous);
  writeNotNull('results', instance.results?.map((e) => e.toJson()).toList());
  return val;
}

MenuGet$Response _$MenuGet$ResponseFromJson(Map<String, dynamic> json) =>
    MenuGet$Response(
      count: json['count'] as int?,
      next: json['next'] as String? ?? '',
      previous: json['previous'] as String? ?? '',
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => Menu.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$MenuGet$ResponseToJson(MenuGet$Response instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count);
  writeNotNull('next', instance.next);
  writeNotNull('previous', instance.previous);
  writeNotNull('results', instance.results?.map((e) => e.toJson()).toList());
  return val;
}

MenuMealOccurrenceGet$Response _$MenuMealOccurrenceGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    MenuMealOccurrenceGet$Response(
      count: json['count'] as int?,
      next: json['next'] as String? ?? '',
      previous: json['previous'] as String? ?? '',
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => MealOccurrence.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$MenuMealOccurrenceGet$ResponseToJson(
    MenuMealOccurrenceGet$Response instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count);
  writeNotNull('next', instance.next);
  writeNotNull('previous', instance.previous);
  writeNotNull('results', instance.results?.map((e) => e.toJson()).toList());
  return val;
}

NotificationsGet$Response _$NotificationsGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    NotificationsGet$Response(
      count: json['count'] as int?,
      next: json['next'] as String? ?? '',
      previous: json['previous'] as String? ?? '',
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => NotificationSerializerUserReadOnly.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$NotificationsGet$ResponseToJson(
    NotificationsGet$Response instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count);
  writeNotNull('next', instance.next);
  writeNotNull('previous', instance.previous);
  writeNotNull('results', instance.results?.map((e) => e.toJson()).toList());
  return val;
}

PaymentGet$Response _$PaymentGet$ResponseFromJson(Map<String, dynamic> json) =>
    PaymentGet$Response(
      count: json['count'] as int?,
      next: json['next'] as String? ?? '',
      previous: json['previous'] as String? ?? '',
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => Payment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$PaymentGet$ResponseToJson(PaymentGet$Response instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count);
  writeNotNull('next', instance.next);
  writeNotNull('previous', instance.previous);
  writeNotNull('results', instance.results?.map((e) => e.toJson()).toList());
  return val;
}

PermissionsEducatorPermissionsGet$Response
    _$PermissionsEducatorPermissionsGet$ResponseFromJson(
            Map<String, dynamic> json) =>
        PermissionsEducatorPermissionsGet$Response(
          count: json['count'] as int?,
          next: json['next'] as String? ?? '',
          previous: json['previous'] as String? ?? '',
          results: (json['results'] as List<dynamic>?)
                  ?.map((e) => EducatorKindergartenPermission.fromJson(
                      e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$PermissionsEducatorPermissionsGet$ResponseToJson(
    PermissionsEducatorPermissionsGet$Response instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count);
  writeNotNull('next', instance.next);
  writeNotNull('previous', instance.previous);
  writeNotNull('results', instance.results?.map((e) => e.toJson()).toList());
  return val;
}

PresenceAttendanceGet$Response _$PresenceAttendanceGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    PresenceAttendanceGet$Response(
      count: json['count'] as int?,
      next: json['next'] as String? ?? '',
      previous: json['previous'] as String? ?? '',
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => Presence.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$PresenceAttendanceGet$ResponseToJson(
    PresenceAttendanceGet$Response instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count);
  writeNotNull('next', instance.next);
  writeNotNull('previous', instance.previous);
  writeNotNull('results', instance.results?.map((e) => e.toJson()).toList());
  return val;
}

PresenceExpectedPickupGet$Response _$PresenceExpectedPickupGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    PresenceExpectedPickupGet$Response(
      count: json['count'] as int?,
      next: json['next'] as String? ?? '',
      previous: json['previous'] as String? ?? '',
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => ExpectedPickUp.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$PresenceExpectedPickupGet$ResponseToJson(
    PresenceExpectedPickupGet$Response instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count);
  writeNotNull('next', instance.next);
  writeNotNull('previous', instance.previous);
  writeNotNull('results', instance.results?.map((e) => e.toJson()).toList());
  return val;
}

PublicationsCommentsGet$Response _$PublicationsCommentsGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    PublicationsCommentsGet$Response(
      count: json['count'] as int?,
      next: json['next'] as String? ?? '',
      previous: json['previous'] as String? ?? '',
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$PublicationsCommentsGet$ResponseToJson(
    PublicationsCommentsGet$Response instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count);
  writeNotNull('next', instance.next);
  writeNotNull('previous', instance.previous);
  writeNotNull('results', instance.results?.map((e) => e.toJson()).toList());
  return val;
}

PublicationsDocsContentGet$Response
    _$PublicationsDocsContentGet$ResponseFromJson(Map<String, dynamic> json) =>
        PublicationsDocsContentGet$Response(
          count: json['count'] as int?,
          next: json['next'] as String? ?? '',
          previous: json['previous'] as String? ?? '',
          results: (json['results'] as List<dynamic>?)
                  ?.map((e) => DocOnlyPublicationContent.fromJson(
                      e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$PublicationsDocsContentGet$ResponseToJson(
    PublicationsDocsContentGet$Response instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count);
  writeNotNull('next', instance.next);
  writeNotNull('previous', instance.previous);
  writeNotNull('results', instance.results?.map((e) => e.toJson()).toList());
  return val;
}

PublicationsPublicationsGet$Response
    _$PublicationsPublicationsGet$ResponseFromJson(Map<String, dynamic> json) =>
        PublicationsPublicationsGet$Response(
          count: json['count'] as int?,
          next: json['next'] as String? ?? '',
          previous: json['previous'] as String? ?? '',
          results: (json['results'] as List<dynamic>?)
                  ?.map((e) => Publication.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$PublicationsPublicationsGet$ResponseToJson(
    PublicationsPublicationsGet$Response instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count);
  writeNotNull('next', instance.next);
  writeNotNull('previous', instance.previous);
  writeNotNull('results', instance.results?.map((e) => e.toJson()).toList());
  return val;
}

SearchKindergartenMembersGet$Response
    _$SearchKindergartenMembersGet$ResponseFromJson(
            Map<String, dynamic> json) =>
        SearchKindergartenMembersGet$Response(
          count: json['count'] as int?,
          next: json['next'] as String? ?? '',
          previous: json['previous'] as String? ?? '',
          results: (json['results'] as List<dynamic>?)
                  ?.map((e) => SearchKindergartenMembers.fromJson(
                      e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$SearchKindergartenMembersGet$ResponseToJson(
    SearchKindergartenMembersGet$Response instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count);
  writeNotNull('next', instance.next);
  writeNotNull('previous', instance.previous);
  writeNotNull('results', instance.results?.map((e) => e.toJson()).toList());
  return val;
}

SearchChildGet$Response _$SearchChildGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    SearchChildGet$Response(
      count: json['count'] as int?,
      next: json['next'] as String? ?? '',
      previous: json['previous'] as String? ?? '',
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => ChildSearch.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$SearchChildGet$ResponseToJson(
    SearchChildGet$Response instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count);
  writeNotNull('next', instance.next);
  writeNotNull('previous', instance.previous);
  writeNotNull('results', instance.results?.map((e) => e.toJson()).toList());
  return val;
}

WholeChildGet$Response _$WholeChildGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    WholeChildGet$Response(
      count: json['count'] as int?,
      next: json['next'] as String? ?? '',
      previous: json['previous'] as String? ?? '',
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => WholeChild.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$WholeChildGet$ResponseToJson(
    WholeChildGet$Response instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count);
  writeNotNull('next', instance.next);
  writeNotNull('previous', instance.previous);
  writeNotNull('results', instance.results?.map((e) => e.toJson()).toList());
  return val;
}

TrustedPerson$Phone _$TrustedPerson$PhoneFromJson(Map<String, dynamic> json) =>
    TrustedPerson$Phone(
      kind: trustedPerson$PhoneKindFromJson(json['kind']),
      number: json['number'] as String? ?? '',
    );

Map<String, dynamic> _$TrustedPerson$PhoneToJson(TrustedPerson$Phone instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('kind', trustedPerson$PhoneKindToJson(instance.kind));
  writeNotNull('number', instance.number);
  return val;
}

Educator$Educatorprofile _$Educator$EducatorprofileFromJson(
        Map<String, dynamic> json) =>
    Educator$Educatorprofile(
      id: json['id'] as int?,
      avatar: json['avatar'] as String? ?? '',
      phone: json['phone'],
      birthDate: json['birth_date'] == null
          ? null
          : DateTime.parse(json['birth_date'] as String),
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      sex: educator$EducatorprofileSexFromJson(json['sex']),
      dateJoined: json['date_joined'] == null
          ? null
          : DateTime.parse(json['date_joined'] as String),
      polymorphicCtype: json['polymorphic_ctype'] as int?,
      user: json['user'] as int?,
    );

Map<String, dynamic> _$Educator$EducatorprofileToJson(
    Educator$Educatorprofile instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('avatar', instance.avatar);
  writeNotNull('phone', instance.phone);
  writeNotNull('birth_date', instance.birthDate?.toIso8601String());
  writeNotNull('first_name', instance.firstName);
  writeNotNull('last_name', instance.lastName);
  writeNotNull('sex', educator$EducatorprofileSexToJson(instance.sex));
  writeNotNull('date_joined', instance.dateJoined?.toIso8601String());
  writeNotNull('polymorphic_ctype', instance.polymorphicCtype);
  writeNotNull('user', instance.user);
  return val;
}

ParentProfile$Phone _$ParentProfile$PhoneFromJson(Map<String, dynamic> json) =>
    ParentProfile$Phone(
      kind: parentProfile$PhoneKindFromJson(json['kind']),
      number: json['number'] as String? ?? '',
    );

Map<String, dynamic> _$ParentProfile$PhoneToJson(ParentProfile$Phone instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('kind', parentProfile$PhoneKindToJson(instance.kind));
  writeNotNull('number', instance.number);
  return val;
}
