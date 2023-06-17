// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'devlesgenies.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomVerifyEmail _$CustomVerifyEmailFromJson(Map<String, dynamic> json) =>
    CustomVerifyEmail();

Map<String, dynamic> _$CustomVerifyEmailToJson(CustomVerifyEmail instance) =>
    <String, dynamic>{};

Login _$LoginFromJson(Map<String, dynamic> json) => Login(
      email: json['email'] as String? ?? '',
      password: json['password'] as String? ?? '',
    );

Map<String, dynamic> _$LoginToJson(Login instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', instance.email);
  writeNotNull('password', instance.password);
  return val;
}

PasswordChange _$PasswordChangeFromJson(Map<String, dynamic> json) =>
    PasswordChange(
      newPassword1: json['new_password1'] as String? ?? '',
      newPassword2: json['new_password2'] as String? ?? '',
    );

Map<String, dynamic> _$PasswordChangeToJson(PasswordChange instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('new_password1', instance.newPassword1);
  writeNotNull('new_password2', instance.newPassword2);
  return val;
}

CustomPasswordResetConfirm _$CustomPasswordResetConfirmFromJson(
        Map<String, dynamic> json) =>
    CustomPasswordResetConfirm(
      newPassword1: json['new_password1'] as String? ?? '',
      newPassword2: json['new_password2'] as String? ?? '',
    );

Map<String, dynamic> _$CustomPasswordResetConfirmToJson(
    CustomPasswordResetConfirm instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('new_password1', instance.newPassword1);
  writeNotNull('new_password2', instance.newPassword2);
  return val;
}

PasswordReset _$PasswordResetFromJson(Map<String, dynamic> json) =>
    PasswordReset(
      email: json['email'] as String? ?? '',
    );

Map<String, dynamic> _$PasswordResetToJson(PasswordReset instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', instance.email);
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

EducatorProfile _$EducatorProfileFromJson(Map<String, dynamic> json) =>
    EducatorProfile(
      id: json['id'] as int?,
      user: json['user'] == null
          ? null
          : Educator.fromJson(json['user'] as Map<String, dynamic>),
      phone: json['phone'] == null
          ? null
          : EducatorProfile$Phone.fromJson(
              json['phone'] as Map<String, dynamic>),
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      avatar: json['avatar'] as String? ?? '',
      birthDate: json['birth_date'] == null
          ? null
          : DateTime.parse(json['birth_date'] as String),
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      sex: educatorProfileSexFromJson(json['sex']),
      dateJoined: json['date_joined'] == null
          ? null
          : DateTime.parse(json['date_joined'] as String),
    );

Map<String, dynamic> _$EducatorProfileToJson(EducatorProfile instance) {
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
  writeNotNull('sex', educatorProfileSexToJson(instance.sex));
  writeNotNull('date_joined', instance.dateJoined?.toIso8601String());
  return val;
}

KindergartenProfileServiceSchedule _$KindergartenProfileServiceScheduleFromJson(
        Map<String, dynamic> json) =>
    KindergartenProfileServiceSchedule(
      id: json['id'] as int?,
      type: kindergartenProfileServiceScheduleTypeFromJson(json['type']),
      mondayStart: json['monday_start'] as String? ?? '',
      mondayEnd: json['monday_end'] as String? ?? '',
      tuesdayStart: json['tuesday_start'] as String? ?? '',
      tuesdayEnd: json['tuesday_end'] as String? ?? '',
      wednesdayStart: json['wednesday_start'] as String? ?? '',
      wednesdayEnd: json['wednesday_end'] as String? ?? '',
      thursdayStart: json['thursday_start'] as String? ?? '',
      thursdayEnd: json['thursday_end'] as String? ?? '',
      fridayStart: json['friday_start'] as String? ?? '',
      fridayEnd: json['friday_end'] as String? ?? '',
      saturdayStart: json['saturday_start'] as String? ?? '',
      saturdayEnd: json['saturday_end'] as String? ?? '',
      sundayStart: json['sunday_start'] as String? ?? '',
      sundayEnd: json['sunday_end'] as String? ?? '',
    );

Map<String, dynamic> _$KindergartenProfileServiceScheduleToJson(
    KindergartenProfileServiceSchedule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull(
      'type', kindergartenProfileServiceScheduleTypeToJson(instance.type));
  writeNotNull('monday_start', instance.mondayStart);
  writeNotNull('monday_end', instance.mondayEnd);
  writeNotNull('tuesday_start', instance.tuesdayStart);
  writeNotNull('tuesday_end', instance.tuesdayEnd);
  writeNotNull('wednesday_start', instance.wednesdayStart);
  writeNotNull('wednesday_end', instance.wednesdayEnd);
  writeNotNull('thursday_start', instance.thursdayStart);
  writeNotNull('thursday_end', instance.thursdayEnd);
  writeNotNull('friday_start', instance.fridayStart);
  writeNotNull('friday_end', instance.fridayEnd);
  writeNotNull('saturday_start', instance.saturdayStart);
  writeNotNull('saturday_end', instance.saturdayEnd);
  writeNotNull('sunday_start', instance.sundayStart);
  writeNotNull('sunday_end', instance.sundayEnd);
  return val;
}

KindergartenProfilePaymentAgeConfiguration
    _$KindergartenProfilePaymentAgeConfigurationFromJson(
            Map<String, dynamic> json) =>
        KindergartenProfilePaymentAgeConfiguration(
          id: json['id'] as int?,
          startAge: json['start_age'] as int?,
          endAge: json['end_age'] as int?,
          price: json['price'] as int?,
        );

Map<String, dynamic> _$KindergartenProfilePaymentAgeConfigurationToJson(
    KindergartenProfilePaymentAgeConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('start_age', instance.startAge);
  writeNotNull('end_age', instance.endAge);
  writeNotNull('price', instance.price);
  return val;
}

KindergartenProfilePaymentSpecialConditionConfiguration
    _$KindergartenProfilePaymentSpecialConditionConfigurationFromJson(
            Map<String, dynamic> json) =>
        KindergartenProfilePaymentSpecialConditionConfiguration(
          id: json['id'] as int?,
          price: json['price'] as int?,
          condition: json['condition'] as int?,
        );

Map<String, dynamic>
    _$KindergartenProfilePaymentSpecialConditionConfigurationToJson(
        KindergartenProfilePaymentSpecialConditionConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('price', instance.price);
  writeNotNull('condition', instance.condition);
  return val;
}

KindergartenProfilePaymentOtherConfiguration
    _$KindergartenProfilePaymentOtherConfigurationFromJson(
            Map<String, dynamic> json) =>
        KindergartenProfilePaymentOtherConfiguration(
          id: json['id'] as int?,
          price: json['price'] as int?,
        );

Map<String, dynamic> _$KindergartenProfilePaymentOtherConfigurationToJson(
    KindergartenProfilePaymentOtherConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('price', instance.price);
  return val;
}

KindergartenProfileTariffs _$KindergartenProfileTariffsFromJson(
        Map<String, dynamic> json) =>
    KindergartenProfileTariffs(
      paymentAgeConfigurations: (json['payment_age_configurations']
                  as List<dynamic>?)
              ?.map((e) => KindergartenProfilePaymentAgeConfiguration.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
      paymentSpecialConditionConfigurations:
          (json['payment_special_condition_configurations'] as List<dynamic>?)
                  ?.map((e) =>
                      KindergartenProfilePaymentSpecialConditionConfiguration
                          .fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
      paymentOtherConfigurations:
          (json['payment_other_configurations'] as List<dynamic>?)
                  ?.map((e) =>
                      KindergartenProfilePaymentOtherConfiguration.fromJson(
                          e as Map<String, dynamic>))
                  .toList() ??
              [],
    );

Map<String, dynamic> _$KindergartenProfileTariffsToJson(
    KindergartenProfileTariffs instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('payment_age_configurations',
      instance.paymentAgeConfigurations?.map((e) => e.toJson()).toList());
  writeNotNull(
      'payment_special_condition_configurations',
      instance.paymentSpecialConditionConfigurations
          ?.map((e) => e.toJson())
          .toList());
  writeNotNull('payment_other_configurations',
      instance.paymentOtherConfigurations?.map((e) => e.toJson()).toList());
  return val;
}

KindergartenProfileTypicalDayEvent _$KindergartenProfileTypicalDayEventFromJson(
        Map<String, dynamic> json) =>
    KindergartenProfileTypicalDayEvent(
      id: json['id'] as int?,
      startHour: json['start_hour'] as String? ?? '',
      endHour: json['end_hour'] as String? ?? '',
      description: json['description'] as String? ?? '',
      title: json['title'] as String? ?? '',
    );

Map<String, dynamic> _$KindergartenProfileTypicalDayEventToJson(
    KindergartenProfileTypicalDayEvent instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('start_hour', instance.startHour);
  writeNotNull('end_hour', instance.endHour);
  writeNotNull('description', instance.description);
  writeNotNull('title', instance.title);
  return val;
}

KindergartenProfileTypicalDay _$KindergartenProfileTypicalDayFromJson(
        Map<String, dynamic> json) =>
    KindergartenProfileTypicalDay(
      events: (json['events'] as List<dynamic>?)
              ?.map((e) => KindergartenProfileTypicalDayEvent.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$KindergartenProfileTypicalDayToJson(
    KindergartenProfileTypicalDay instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('events', instance.events?.map((e) => e.toJson()).toList());
  return val;
}

KindergartenProfileClassGalleryImage
    _$KindergartenProfileClassGalleryImageFromJson(Map<String, dynamic> json) =>
        KindergartenProfileClassGalleryImage(
          id: json['id'] as int?,
          image: json['image'] as String? ?? '',
        );

Map<String, dynamic> _$KindergartenProfileClassGalleryImageToJson(
    KindergartenProfileClassGalleryImage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('image', instance.image);
  return val;
}

KindergartenProfileClass _$KindergartenProfileClassFromJson(
        Map<String, dynamic> json) =>
    KindergartenProfileClass(
      id: json['id'] as int?,
      gallery: (json['gallery'] as List<dynamic>?)
              ?.map((e) => KindergartenProfileClassGalleryImage.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
      ageMin: json['age_min'] as int?,
      ageMax: json['age_max'] as int?,
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      educatorName: json['educator_name'] as String? ?? '',
      mainImage: json['main_image'] as String? ?? '',
    );

Map<String, dynamic> _$KindergartenProfileClassToJson(
    KindergartenProfileClass instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('gallery', instance.gallery?.map((e) => e.toJson()).toList());
  writeNotNull('age_min', instance.ageMin);
  writeNotNull('age_max', instance.ageMax);
  writeNotNull('name', instance.name);
  writeNotNull('description', instance.description);
  writeNotNull('educator_name', instance.educatorName);
  writeNotNull('main_image', instance.mainImage);
  return val;
}

KindergartenProfilePlacesAvailability
    _$KindergartenProfilePlacesAvailabilityFromJson(
            Map<String, dynamic> json) =>
        KindergartenProfilePlacesAvailability(
          id: json['id'] as int?,
          ageMin: json['age_min'] as int?,
          ageMax: json['age_max'] as int?,
          title: json['title'] as String? ?? '',
          freePlaces: json['free_places'] as int?,
        );

Map<String, dynamic> _$KindergartenProfilePlacesAvailabilityToJson(
    KindergartenProfilePlacesAvailability instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('age_min', instance.ageMin);
  writeNotNull('age_max', instance.ageMax);
  writeNotNull('title', instance.title);
  writeNotNull('free_places', instance.freePlaces);
  return val;
}

KindergartenProfileSpecialKidsAccomodation
    _$KindergartenProfileSpecialKidsAccomodationFromJson(
            Map<String, dynamic> json) =>
        KindergartenProfileSpecialKidsAccomodation(
          description: json['description'] as String? ?? '',
          acceptedAllergies: (json['accepted_allergies'] as List<dynamic>?)
                  ?.map((e) => e as int)
                  .toList() ??
              [],
          acceptedDiseases: (json['accepted_diseases'] as List<dynamic>?)
                  ?.map((e) => e as int)
                  .toList() ??
              [],
        );

Map<String, dynamic> _$KindergartenProfileSpecialKidsAccomodationToJson(
    KindergartenProfileSpecialKidsAccomodation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  writeNotNull('accepted_allergies', instance.acceptedAllergies);
  writeNotNull('accepted_diseases', instance.acceptedDiseases);
  return val;
}

KindergartenProfileRead _$KindergartenProfileReadFromJson(
        Map<String, dynamic> json) =>
    KindergartenProfileRead(
      userId: json['user_id'] as String? ?? '',
      phone: json['phone'] == null
          ? null
          : KindergartenProfileRead$Phone.fromJson(
              json['phone'] as Map<String, dynamic>),
      name: json['name'] as String? ?? '',
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      phone1: json['phone_1'] == null
          ? null
          : KindergartenProfileRead$Phone1.fromJson(
              json['phone_1'] as Map<String, dynamic>),
      phone2: json['phone_2'] == null
          ? null
          : KindergartenProfileRead$Phone2.fromJson(
              json['phone_2'] as Map<String, dynamic>),
      avatar: json['avatar'] as String? ?? '',
      email1: json['email_1'] as String? ?? '',
      email2: json['email_2'] as String? ?? '',
      childCareType:
          kindergartenProfileReadChildCareTypeFromJson(json['child_care_type']),
      website: json['website'] as String? ?? '',
      presentationOfKindergarten:
          json['presentation_of_kindergarten'] as String? ?? '',
      descriptionOfServices: json['description_of_services'] as String? ?? '',
      educationalProgram: json['educational_program'] as String? ?? '',
      groups: json['groups'] as String? ?? '',
      serviceSchedule: json['service_schedule'] == null
          ? null
          : KindergartenProfileServiceSchedule.fromJson(
              json['service_schedule'] as Map<String, dynamic>),
      tariffs: json['tariffs'] == null
          ? null
          : KindergartenProfileTariffs.fromJson(
              json['tariffs'] as Map<String, dynamic>),
      typicalDay: json['typical_day'] == null
          ? null
          : KindergartenProfileTypicalDay.fromJson(
              json['typical_day'] as Map<String, dynamic>),
      menu: json['menu'] as String? ?? '',
      classes: (json['classes'] as List<dynamic>?)
              ?.map((e) =>
                  KindergartenProfileClass.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      placesAvailability: (json['places_availability'] as List<dynamic>?)
              ?.map((e) => KindergartenProfilePlacesAvailability.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
      accomodationForSpecialKids: json['accomodation_for_special_kids'] == null
          ? null
          : KindergartenProfileSpecialKidsAccomodation.fromJson(
              json['accomodation_for_special_kids'] as Map<String, dynamic>),
      admissionPolicy: json['admission_policy'] as String? ?? '',
    );

Map<String, dynamic> _$KindergartenProfileReadToJson(
    KindergartenProfileRead instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user_id', instance.userId);
  writeNotNull('phone', instance.phone?.toJson());
  writeNotNull('name', instance.name);
  writeNotNull('address', instance.address?.toJson());
  writeNotNull('phone_1', instance.phone1?.toJson());
  writeNotNull('phone_2', instance.phone2?.toJson());
  writeNotNull('avatar', instance.avatar);
  writeNotNull('email_1', instance.email1);
  writeNotNull('email_2', instance.email2);
  writeNotNull('child_care_type',
      kindergartenProfileReadChildCareTypeToJson(instance.childCareType));
  writeNotNull('website', instance.website);
  writeNotNull(
      'presentation_of_kindergarten', instance.presentationOfKindergarten);
  writeNotNull('description_of_services', instance.descriptionOfServices);
  writeNotNull('educational_program', instance.educationalProgram);
  writeNotNull('groups', instance.groups);
  writeNotNull('service_schedule', instance.serviceSchedule?.toJson());
  writeNotNull('tariffs', instance.tariffs?.toJson());
  writeNotNull('typical_day', instance.typicalDay?.toJson());
  writeNotNull('menu', instance.menu);
  writeNotNull('classes', instance.classes?.map((e) => e.toJson()).toList());
  writeNotNull('places_availability',
      instance.placesAvailability?.map((e) => e.toJson()).toList());
  writeNotNull('accomodation_for_special_kids',
      instance.accomodationForSpecialKids?.toJson());
  writeNotNull('admission_policy', instance.admissionPolicy);
  return val;
}

KindergartenProfileSettings _$KindergartenProfileSettingsFromJson(
        Map<String, dynamic> json) =>
    KindergartenProfileSettings(
      email1: json['email_1'] as bool?,
      email2: json['email_2'] as bool?,
      name: json['name'] as bool?,
      address: json['address'] as bool?,
      phone1: json['phone_1'] as bool?,
      phone2: json['phone_2'] as bool?,
      website: json['website'] as bool?,
      presentationOfKindergarten: json['presentation_of_kindergarten'] as bool?,
      descriptionOfServices: json['description_of_services'] as bool?,
      educationalProgram: json['educational_program'] as bool?,
      typicalDay: json['typical_day'] as bool?,
      menu: json['menu'] as bool?,
      classes: json['classes'] as bool?,
      placesAvailability: json['places_availability'] as bool?,
      accomodationForSpecialKids:
          json['accomodation_for_special_kids'] as bool?,
      admissionPolicy: json['admission_policy'] as bool?,
      serviceSchedule: json['service_schedule'] as bool?,
      tariffs: json['tariffs'] as bool?,
    );

Map<String, dynamic> _$KindergartenProfileSettingsToJson(
    KindergartenProfileSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email_1', instance.email1);
  writeNotNull('email_2', instance.email2);
  writeNotNull('name', instance.name);
  writeNotNull('address', instance.address);
  writeNotNull('phone_1', instance.phone1);
  writeNotNull('phone_2', instance.phone2);
  writeNotNull('website', instance.website);
  writeNotNull(
      'presentation_of_kindergarten', instance.presentationOfKindergarten);
  writeNotNull('description_of_services', instance.descriptionOfServices);
  writeNotNull('educational_program', instance.educationalProgram);
  writeNotNull('typical_day', instance.typicalDay);
  writeNotNull('menu', instance.menu);
  writeNotNull('classes', instance.classes);
  writeNotNull('places_availability', instance.placesAvailability);
  writeNotNull(
      'accomodation_for_special_kids', instance.accomodationForSpecialKids);
  writeNotNull('admission_policy', instance.admissionPolicy);
  writeNotNull('service_schedule', instance.serviceSchedule);
  writeNotNull('tariffs', instance.tariffs);
  return val;
}

BaseProfileSignature _$BaseProfileSignatureFromJson(
        Map<String, dynamic> json) =>
    BaseProfileSignature(
      image: json['image'] as String? ?? '',
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$BaseProfileSignatureToJson(
    BaseProfileSignature instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('image', instance.image);
  writeNotNull('date', instance.date?.toIso8601String());
  return val;
}

BaseProfileUser _$BaseProfileUserFromJson(Map<String, dynamic> json) =>
    BaseProfileUser(
      email: json['email'] as String? ?? '',
      id: json['id'] as int?,
      signature: json['signature'] == null
          ? null
          : BaseProfileSignature.fromJson(
              json['signature'] as Map<String, dynamic>),
      isEmailVerified: json['is_email_verified'] as String? ?? '',
    );

Map<String, dynamic> _$BaseProfileUserToJson(BaseProfileUser instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', instance.email);
  writeNotNull('id', instance.id);
  writeNotNull('signature', instance.signature?.toJson());
  writeNotNull('is_email_verified', instance.isEmailVerified);
  return val;
}

KindergartenProfile _$KindergartenProfileFromJson(Map<String, dynamic> json) =>
    KindergartenProfile(
      phone: json['phone'] == null
          ? null
          : KindergartenProfile$Phone.fromJson(
              json['phone'] as Map<String, dynamic>),
      name: json['name'] as String? ?? '',
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      phone1: json['phone_1'] == null
          ? null
          : KindergartenProfile$Phone1.fromJson(
              json['phone_1'] as Map<String, dynamic>),
      phone2: json['phone_2'] == null
          ? null
          : KindergartenProfile$Phone2.fromJson(
              json['phone_2'] as Map<String, dynamic>),
      avatar: json['avatar'] as String? ?? '',
      email1: json['email_1'] as String? ?? '',
      email2: json['email_2'] as String? ?? '',
      childCareType:
          kindergartenProfileChildCareTypeFromJson(json['child_care_type']),
      website: json['website'] as String? ?? '',
      presentationOfKindergarten:
          json['presentation_of_kindergarten'] as String? ?? '',
      descriptionOfServices: json['description_of_services'] as String? ?? '',
      educationalProgram: json['educational_program'] as String? ?? '',
      serviceSchedule: json['service_schedule'] == null
          ? null
          : KindergartenProfileServiceSchedule.fromJson(
              json['service_schedule'] as Map<String, dynamic>),
      tariffs: json['tariffs'] == null
          ? null
          : KindergartenProfileTariffs.fromJson(
              json['tariffs'] as Map<String, dynamic>),
      typicalDay: json['typical_day'] == null
          ? null
          : KindergartenProfileTypicalDay.fromJson(
              json['typical_day'] as Map<String, dynamic>),
      menu: json['menu'] as String? ?? '',
      classes: (json['classes'] as List<dynamic>?)
              ?.map((e) =>
                  KindergartenProfileClass.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      placesAvailability: (json['places_availability'] as List<dynamic>?)
              ?.map((e) => KindergartenProfilePlacesAvailability.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
      accomodationForSpecialKids: json['accomodation_for_special_kids'] == null
          ? null
          : KindergartenProfileSpecialKidsAccomodation.fromJson(
              json['accomodation_for_special_kids'] as Map<String, dynamic>),
      admissionPolicy: json['admission_policy'] as String? ?? '',
      user: json['user'] == null
          ? null
          : BaseProfileUser.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KindergartenProfileToJson(KindergartenProfile instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('phone', instance.phone?.toJson());
  writeNotNull('name', instance.name);
  writeNotNull('address', instance.address?.toJson());
  writeNotNull('phone_1', instance.phone1?.toJson());
  writeNotNull('phone_2', instance.phone2?.toJson());
  writeNotNull('avatar', instance.avatar);
  writeNotNull('email_1', instance.email1);
  writeNotNull('email_2', instance.email2);
  writeNotNull('child_care_type',
      kindergartenProfileChildCareTypeToJson(instance.childCareType));
  writeNotNull('website', instance.website);
  writeNotNull(
      'presentation_of_kindergarten', instance.presentationOfKindergarten);
  writeNotNull('description_of_services', instance.descriptionOfServices);
  writeNotNull('educational_program', instance.educationalProgram);
  writeNotNull('service_schedule', instance.serviceSchedule?.toJson());
  writeNotNull('tariffs', instance.tariffs?.toJson());
  writeNotNull('typical_day', instance.typicalDay?.toJson());
  writeNotNull('menu', instance.menu);
  writeNotNull('classes', instance.classes?.map((e) => e.toJson()).toList());
  writeNotNull('places_availability',
      instance.placesAvailability?.map((e) => e.toJson()).toList());
  writeNotNull('accomodation_for_special_kids',
      instance.accomodationForSpecialKids?.toJson());
  writeNotNull('admission_policy', instance.admissionPolicy);
  writeNotNull('user', instance.user?.toJson());
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
      familyId: json['family_id'] as String? ?? '',
      avatar: json['avatar'] as String? ?? '',
      birthDate: json['birth_date'] == null
          ? null
          : DateTime.parse(json['birth_date'] as String),
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      sex: parentProfileSexFromJson(json['sex']),
      dateJoined: json['date_joined'] == null
          ? null
          : DateTime.parse(json['date_joined'] as String),
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
  writeNotNull('family_id', instance.familyId);
  writeNotNull('avatar', instance.avatar);
  writeNotNull('birth_date', instance.birthDate?.toIso8601String());
  writeNotNull('first_name', instance.firstName);
  writeNotNull('last_name', instance.lastName);
  writeNotNull('sex', parentProfileSexToJson(instance.sex));
  writeNotNull('date_joined', instance.dateJoined?.toIso8601String());
  return val;
}

EducatorUserRegistration _$EducatorUserRegistrationFromJson(
        Map<String, dynamic> json) =>
    EducatorUserRegistration(
      email: json['email'] as String? ?? '',
      password1: json['password1'] as String? ?? '',
      password2: json['password2'] as String? ?? '',
    );

Map<String, dynamic> _$EducatorUserRegistrationToJson(
    EducatorUserRegistration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', instance.email);
  writeNotNull('password1', instance.password1);
  writeNotNull('password2', instance.password2);
  return val;
}

EducatorRegistration _$EducatorRegistrationFromJson(
        Map<String, dynamic> json) =>
    EducatorRegistration(
      user: json['user'] == null
          ? null
          : EducatorUserRegistration.fromJson(
              json['user'] as Map<String, dynamic>),
      phone: json['phone'] == null
          ? null
          : EducatorRegistration$Phone.fromJson(
              json['phone'] as Map<String, dynamic>),
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      birthDate: json['birth_date'] == null
          ? null
          : DateTime.parse(json['birth_date'] as String),
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      sex: educatorRegistrationSexFromJson(json['sex']),
      avatar: json['avatar'] as String? ?? '',
    );

Map<String, dynamic> _$EducatorRegistrationToJson(
    EducatorRegistration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user', instance.user?.toJson());
  writeNotNull('phone', instance.phone?.toJson());
  writeNotNull('address', instance.address?.toJson());
  writeNotNull('birth_date', instance.birthDate?.toIso8601String());
  writeNotNull('first_name', instance.firstName);
  writeNotNull('last_name', instance.lastName);
  writeNotNull('sex', educatorRegistrationSexToJson(instance.sex));
  writeNotNull('avatar', instance.avatar);
  return val;
}

ParentRegistrationUser _$ParentRegistrationUserFromJson(
        Map<String, dynamic> json) =>
    ParentRegistrationUser(
      email: json['email'] as String? ?? '',
      password1: json['password1'] as String? ?? '',
      password2: json['password2'] as String? ?? '',
    );

Map<String, dynamic> _$ParentRegistrationUserToJson(
    ParentRegistrationUser instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', instance.email);
  writeNotNull('password1', instance.password1);
  writeNotNull('password2', instance.password2);
  return val;
}

ParentRegistration _$ParentRegistrationFromJson(Map<String, dynamic> json) =>
    ParentRegistration(
      user: json['user'] == null
          ? null
          : ParentRegistrationUser.fromJson(
              json['user'] as Map<String, dynamic>),
      phone: json['phone'] == null
          ? null
          : ParentRegistration$Phone.fromJson(
              json['phone'] as Map<String, dynamic>),
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      birthDate: json['birth_date'] == null
          ? null
          : DateTime.parse(json['birth_date'] as String),
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      sex: parentRegistrationSexFromJson(json['sex']),
      avatar: json['avatar'] as String? ?? '',
    );

Map<String, dynamic> _$ParentRegistrationToJson(ParentRegistration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user', instance.user?.toJson());
  writeNotNull('phone', instance.phone?.toJson());
  writeNotNull('address', instance.address?.toJson());
  writeNotNull('birth_date', instance.birthDate?.toIso8601String());
  writeNotNull('first_name', instance.firstName);
  writeNotNull('last_name', instance.lastName);
  writeNotNull('sex', parentRegistrationSexToJson(instance.sex));
  writeNotNull('avatar', instance.avatar);
  return val;
}

FamilyRegistration _$FamilyRegistrationFromJson(Map<String, dynamic> json) =>
    FamilyRegistration(
      id: json['id'] as int?,
      parent1: json['parent1'] == null
          ? null
          : ParentRegistration.fromJson(
              json['parent1'] as Map<String, dynamic>),
      parent2: json['parent2'] == null
          ? null
          : ParentRegistration.fromJson(
              json['parent2'] as Map<String, dynamic>),
      primaryContact:
          familyRegistrationPrimaryContactFromJson(json['primary_contact']),
    );

Map<String, dynamic> _$FamilyRegistrationToJson(FamilyRegistration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('parent1', instance.parent1?.toJson());
  writeNotNull('parent2', instance.parent2?.toJson());
  writeNotNull('primary_contact',
      familyRegistrationPrimaryContactToJson(instance.primaryContact));
  return val;
}

FamilyRegistrationInviteSecondParent
    _$FamilyRegistrationInviteSecondParentFromJson(Map<String, dynamic> json) =>
        FamilyRegistrationInviteSecondParent(
          parent1: json['parent1'] == null
              ? null
              : ParentRegistration.fromJson(
                  json['parent1'] as Map<String, dynamic>),
          parent2Email: json['parent2_email'] as String? ?? '',
        );

Map<String, dynamic> _$FamilyRegistrationInviteSecondParentToJson(
    FamilyRegistrationInviteSecondParent instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('parent1', instance.parent1?.toJson());
  writeNotNull('parent2_email', instance.parent2Email);
  return val;
}

ParentInvitationInitiate _$ParentInvitationInitiateFromJson(
        Map<String, dynamic> json) =>
    ParentInvitationInitiate(
      email: json['email'] as String? ?? '',
      family: json['family'] as int?,
    );

Map<String, dynamic> _$ParentInvitationInitiateToJson(
    ParentInvitationInitiate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', instance.email);
  writeNotNull('family', instance.family);
  return val;
}

ParentInvitationInfo _$ParentInvitationInfoFromJson(
        Map<String, dynamic> json) =>
    ParentInvitationInfo(
      id: json['id'] as int?,
      email: json['email'] as String? ?? '',
      family: json['family'] as int?,
    );

Map<String, dynamic> _$ParentInvitationInfoToJson(
    ParentInvitationInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('email', instance.email);
  writeNotNull('family', instance.family);
  return val;
}

ResendParentInvitation _$ResendParentInvitationFromJson(
        Map<String, dynamic> json) =>
    ResendParentInvitation();

Map<String, dynamic> _$ResendParentInvitationToJson(
        ResendParentInvitation instance) =>
    <String, dynamic>{};

ConfirmParentInvitation _$ConfirmParentInvitationFromJson(
        Map<String, dynamic> json) =>
    ConfirmParentInvitation(
      email: json['email'] as String? ?? '',
      inviter: json['inviter'] as int?,
      family: json['family'] as int?,
      key: json['key'] as String? ?? '',
    );

Map<String, dynamic> _$ConfirmParentInvitationToJson(
    ConfirmParentInvitation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', instance.email);
  writeNotNull('inviter', instance.inviter);
  writeNotNull('family', instance.family);
  writeNotNull('key', instance.key);
  return val;
}

KindergartenUserRegistration _$KindergartenUserRegistrationFromJson(
        Map<String, dynamic> json) =>
    KindergartenUserRegistration(
      email: json['email'] as String? ?? '',
      password1: json['password1'] as String? ?? '',
      password2: json['password2'] as String? ?? '',
    );

Map<String, dynamic> _$KindergartenUserRegistrationToJson(
    KindergartenUserRegistration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', instance.email);
  writeNotNull('password1', instance.password1);
  writeNotNull('password2', instance.password2);
  return val;
}

KindergartenRegistration _$KindergartenRegistrationFromJson(
        Map<String, dynamic> json) =>
    KindergartenRegistration(
      user: json['user'] == null
          ? null
          : KindergartenUserRegistration.fromJson(
              json['user'] as Map<String, dynamic>),
      phone: json['phone'] == null
          ? null
          : KindergartenRegistration$Phone.fromJson(
              json['phone'] as Map<String, dynamic>),
      name: json['name'] as String? ?? '',
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      phone1: json['phone_1'] == null
          ? null
          : KindergartenRegistration$Phone1.fromJson(
              json['phone_1'] as Map<String, dynamic>),
      phone2: json['phone_2'] == null
          ? null
          : KindergartenRegistration$Phone2.fromJson(
              json['phone_2'] as Map<String, dynamic>),
      avatar: json['avatar'] as String? ?? '',
      email1: json['email_1'] as String? ?? '',
      email2: json['email_2'] as String? ?? '',
      childCareType: kindergartenRegistrationChildCareTypeFromJson(
          json['child_care_type']),
      website: json['website'] as String? ?? '',
      presentationOfKindergarten:
          json['presentation_of_kindergarten'] as String? ?? '',
      descriptionOfServices: json['description_of_services'] as String? ?? '',
      educationalProgram: json['educational_program'] as String? ?? '',
      serviceSchedule: json['service_schedule'] == null
          ? null
          : KindergartenProfileServiceSchedule.fromJson(
              json['service_schedule'] as Map<String, dynamic>),
      tariffs: json['tariffs'] == null
          ? null
          : KindergartenProfileTariffs.fromJson(
              json['tariffs'] as Map<String, dynamic>),
      typicalDay: json['typical_day'] == null
          ? null
          : KindergartenProfileTypicalDay.fromJson(
              json['typical_day'] as Map<String, dynamic>),
      menu: json['menu'] as String? ?? '',
      settings: json['settings'] == null
          ? null
          : KindergartenProfileSettings.fromJson(
              json['settings'] as Map<String, dynamic>),
      classes: (json['classes'] as List<dynamic>?)
              ?.map((e) =>
                  KindergartenProfileClass.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      placesAvailability: (json['places_availability'] as List<dynamic>?)
              ?.map((e) => KindergartenProfilePlacesAvailability.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
      accomodationForSpecialKids: json['accomodation_for_special_kids'] == null
          ? null
          : KindergartenProfileSpecialKidsAccomodation.fromJson(
              json['accomodation_for_special_kids'] as Map<String, dynamic>),
      admissionPolicy: json['admission_policy'] as String? ?? '',
    );

Map<String, dynamic> _$KindergartenRegistrationToJson(
    KindergartenRegistration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user', instance.user?.toJson());
  writeNotNull('phone', instance.phone?.toJson());
  writeNotNull('name', instance.name);
  writeNotNull('address', instance.address?.toJson());
  writeNotNull('phone_1', instance.phone1?.toJson());
  writeNotNull('phone_2', instance.phone2?.toJson());
  writeNotNull('avatar', instance.avatar);
  writeNotNull('email_1', instance.email1);
  writeNotNull('email_2', instance.email2);
  writeNotNull('child_care_type',
      kindergartenRegistrationChildCareTypeToJson(instance.childCareType));
  writeNotNull('website', instance.website);
  writeNotNull(
      'presentation_of_kindergarten', instance.presentationOfKindergarten);
  writeNotNull('description_of_services', instance.descriptionOfServices);
  writeNotNull('educational_program', instance.educationalProgram);
  writeNotNull('service_schedule', instance.serviceSchedule?.toJson());
  writeNotNull('tariffs', instance.tariffs?.toJson());
  writeNotNull('typical_day', instance.typicalDay?.toJson());
  writeNotNull('menu', instance.menu);
  writeNotNull('settings', instance.settings?.toJson());
  writeNotNull('classes', instance.classes?.map((e) => e.toJson()).toList());
  writeNotNull('places_availability',
      instance.placesAvailability?.map((e) => e.toJson()).toList());
  writeNotNull('accomodation_for_special_kids',
      instance.accomodationForSpecialKids?.toJson());
  writeNotNull('admission_policy', instance.admissionPolicy);
  return val;
}

EducatorContractRegistrationEducatorUser
    _$EducatorContractRegistrationEducatorUserFromJson(
            Map<String, dynamic> json) =>
        EducatorContractRegistrationEducatorUser(
          email: json['email'] as String? ?? '',
        );

Map<String, dynamic> _$EducatorContractRegistrationEducatorUserToJson(
    EducatorContractRegistrationEducatorUser instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', instance.email);
  return val;
}

EducatorContractRegistrationEducator
    _$EducatorContractRegistrationEducatorFromJson(Map<String, dynamic> json) =>
        EducatorContractRegistrationEducator(
          user: json['user'] == null
              ? null
              : EducatorContractRegistrationEducatorUser.fromJson(
                  json['user'] as Map<String, dynamic>),
          phone: json['phone'] == null
              ? null
              : EducatorContractRegistrationEducator$Phone.fromJson(
                  json['phone'] as Map<String, dynamic>),
          address: json['address'] == null
              ? null
              : Address.fromJson(json['address'] as Map<String, dynamic>),
          birthDate: json['birth_date'] == null
              ? null
              : DateTime.parse(json['birth_date'] as String),
          firstName: json['first_name'] as String? ?? '',
          lastName: json['last_name'] as String? ?? '',
          sex: educatorContractRegistrationEducatorSexFromJson(json['sex']),
          avatar: json['avatar'] as String? ?? '',
        );

Map<String, dynamic> _$EducatorContractRegistrationEducatorToJson(
    EducatorContractRegistrationEducator instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user', instance.user?.toJson());
  writeNotNull('phone', instance.phone?.toJson());
  writeNotNull('address', instance.address?.toJson());
  writeNotNull('birth_date', instance.birthDate?.toIso8601String());
  writeNotNull('first_name', instance.firstName);
  writeNotNull('last_name', instance.lastName);
  writeNotNull(
      'sex', educatorContractRegistrationEducatorSexToJson(instance.sex));
  writeNotNull('avatar', instance.avatar);
  return val;
}

EducatorContractRegistration _$EducatorContractRegistrationFromJson(
        Map<String, dynamic> json) =>
    EducatorContractRegistration(
      id: json['id'] as int?,
      kindergarten: json['kindergarten'] as String? ?? '',
      educator: json['educator'] == null
          ? null
          : EducatorContractRegistrationEducator.fromJson(
              json['educator'] as Map<String, dynamic>),
      acceptedKindergarten: json['accepted_kindergarten'] == null
          ? null
          : DateTime.parse(json['accepted_kindergarten'] as String),
      acceptedEducator: json['accepted_educator'] == null
          ? null
          : DateTime.parse(json['accepted_educator'] as String),
      terminatedKindergarten: json['terminated_kindergarten'] == null
          ? null
          : DateTime.parse(json['terminated_kindergarten'] as String),
      terminatedEducator: json['terminated_educator'] == null
          ? null
          : DateTime.parse(json['terminated_educator'] as String),
      startDate: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      status: json['status'] as String? ?? '',
      statusAction: educatorContractRegistrationStatusActionFromJson(
          json['status_action']),
      statusDate: json['status_date'] == null
          ? null
          : DateTime.parse(json['status_date'] as String),
      possibleNextActions: json['possible_next_actions'] as String? ?? '',
      educatorProfile: json['educator_profile'] == null
          ? null
          : EducatorContractRegistrationEducator.fromJson(
              json['educator_profile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EducatorContractRegistrationToJson(
    EducatorContractRegistration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('kindergarten', instance.kindergarten);
  writeNotNull('educator', instance.educator?.toJson());
  writeNotNull('accepted_kindergarten',
      instance.acceptedKindergarten?.toIso8601String());
  writeNotNull(
      'accepted_educator', instance.acceptedEducator?.toIso8601String());
  writeNotNull('terminated_kindergarten',
      instance.terminatedKindergarten?.toIso8601String());
  writeNotNull(
      'terminated_educator', instance.terminatedEducator?.toIso8601String());
  writeNotNull('start_date', instance.startDate?.toIso8601String());
  writeNotNull('end_date', instance.endDate?.toIso8601String());
  writeNotNull('status', instance.status);
  writeNotNull('status_action',
      educatorContractRegistrationStatusActionToJson(instance.statusAction));
  writeNotNull('status_date', instance.statusDate?.toIso8601String());
  writeNotNull('possible_next_actions', instance.possibleNextActions);
  writeNotNull('educator_profile', instance.educatorProfile?.toJson());
  return val;
}

EducatorSignupByKindergartenList _$EducatorSignupByKindergartenListFromJson(
        Map<String, dynamic> json) =>
    EducatorSignupByKindergartenList(
      id: json['id'] as int?,
      educator: json['educator'] as String? ?? '',
      accepted: json['accepted'] as bool?,
      sent:
          json['sent'] == null ? null : DateTime.parse(json['sent'] as String),
    );

Map<String, dynamic> _$EducatorSignupByKindergartenListToJson(
    EducatorSignupByKindergartenList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('educator', instance.educator);
  writeNotNull('accepted', instance.accepted);
  writeNotNull('sent', instance.sent?.toIso8601String());
  return val;
}

ResendEducatorSignupByKindergartenEmailConfirmation
    _$ResendEducatorSignupByKindergartenEmailConfirmationFromJson(
            Map<String, dynamic> json) =>
        ResendEducatorSignupByKindergartenEmailConfirmation();

Map<String, dynamic>
    _$ResendEducatorSignupByKindergartenEmailConfirmationToJson(
            ResendEducatorSignupByKindergartenEmailConfirmation instance) =>
        <String, dynamic>{};

ConfirmEducatorSignup _$ConfirmEducatorSignupFromJson(
        Map<String, dynamic> json) =>
    ConfirmEducatorSignup(
      educator: json['educator'] as String? ?? '',
      key: json['key'] as String? ?? '',
    );

Map<String, dynamic> _$ConfirmEducatorSignupToJson(
    ConfirmEducatorSignup instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('educator', instance.educator);
  writeNotNull('key', instance.key);
  return val;
}

FinalizeEducatorSignup _$FinalizeEducatorSignupFromJson(
        Map<String, dynamic> json) =>
    FinalizeEducatorSignup(
      password1: json['password1'] as String? ?? '',
      password2: json['password2'] as String? ?? '',
    );

Map<String, dynamic> _$FinalizeEducatorSignupToJson(
    FinalizeEducatorSignup instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('password1', instance.password1);
  writeNotNull('password2', instance.password2);
  return val;
}

InscriptionRegistrationParentUser _$InscriptionRegistrationParentUserFromJson(
        Map<String, dynamic> json) =>
    InscriptionRegistrationParentUser(
      email: json['email'] as String? ?? '',
    );

Map<String, dynamic> _$InscriptionRegistrationParentUserToJson(
    InscriptionRegistrationParentUser instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', instance.email);
  return val;
}

InscriptionRegistrationParent _$InscriptionRegistrationParentFromJson(
        Map<String, dynamic> json) =>
    InscriptionRegistrationParent(
      user: json['user'] == null
          ? null
          : InscriptionRegistrationParentUser.fromJson(
              json['user'] as Map<String, dynamic>),
      phone: json['phone'] == null
          ? null
          : InscriptionRegistrationParent$Phone.fromJson(
              json['phone'] as Map<String, dynamic>),
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      birthDate: json['birth_date'] == null
          ? null
          : DateTime.parse(json['birth_date'] as String),
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      sex: inscriptionRegistrationParentSexFromJson(json['sex']),
      avatar: json['avatar'] as String? ?? '',
    );

Map<String, dynamic> _$InscriptionRegistrationParentToJson(
    InscriptionRegistrationParent instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user', instance.user?.toJson());
  writeNotNull('phone', instance.phone?.toJson());
  writeNotNull('address', instance.address?.toJson());
  writeNotNull('birth_date', instance.birthDate?.toIso8601String());
  writeNotNull('first_name', instance.firstName);
  writeNotNull('last_name', instance.lastName);
  writeNotNull('sex', inscriptionRegistrationParentSexToJson(instance.sex));
  writeNotNull('avatar', instance.avatar);
  return val;
}

InscriptionRegistrationFamily _$InscriptionRegistrationFamilyFromJson(
        Map<String, dynamic> json) =>
    InscriptionRegistrationFamily(
      parent1: json['parent1'] == null
          ? null
          : InscriptionRegistrationParent.fromJson(
              json['parent1'] as Map<String, dynamic>),
      parent2: json['parent2'] == null
          ? null
          : InscriptionRegistrationParent.fromJson(
              json['parent2'] as Map<String, dynamic>),
      parent1Profile: json['parent1_profile'] == null
          ? null
          : InscriptionRegistrationParent.fromJson(
              json['parent1_profile'] as Map<String, dynamic>),
      parent2Profile: json['parent2_profile'] == null
          ? null
          : InscriptionRegistrationParent.fromJson(
              json['parent2_profile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InscriptionRegistrationFamilyToJson(
    InscriptionRegistrationFamily instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('parent1', instance.parent1?.toJson());
  writeNotNull('parent2', instance.parent2?.toJson());
  writeNotNull('parent1_profile', instance.parent1Profile?.toJson());
  writeNotNull('parent2_profile', instance.parent2Profile?.toJson());
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

InscriptionChild _$InscriptionChildFromJson(Map<String, dynamic> json) =>
    InscriptionChild(
      id: json['id'] as int?,
      deleted: json['deleted'] as bool?,
      family: json['family'] as int?,
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      birthDate: json['birth_date'] == null
          ? null
          : DateTime.parse(json['birth_date'] as String),
      sex: inscriptionChildSexFromJson(json['sex']),
      avatar: json['avatar'] as String? ?? '',
      medicalFile: json['medical_file'] == null
          ? null
          : ChildMedicalFile.fromJson(
              json['medical_file'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InscriptionChildToJson(InscriptionChild instance) {
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
  writeNotNull('sex', inscriptionChildSexToJson(instance.sex));
  writeNotNull('avatar', instance.avatar);
  writeNotNull('medical_file', instance.medicalFile?.toJson());
  return val;
}

InscriptionWeeklyChildSchedule _$InscriptionWeeklyChildScheduleFromJson(
        Map<String, dynamic> json) =>
    InscriptionWeeklyChildSchedule(
      id: json['id'] as int?,
      mondayStart: json['monday_start'] as String? ?? '',
      mondayEnd: json['monday_end'] as String? ?? '',
      tuesdayStart: json['tuesday_start'] as String? ?? '',
      tuesdayEnd: json['tuesday_end'] as String? ?? '',
      wednesdayStart: json['wednesday_start'] as String? ?? '',
      wednesdayEnd: json['wednesday_end'] as String? ?? '',
      thursdayStart: json['thursday_start'] as String? ?? '',
      thursdayEnd: json['thursday_end'] as String? ?? '',
      fridayStart: json['friday_start'] as String? ?? '',
      fridayEnd: json['friday_end'] as String? ?? '',
      saturdayStart: json['saturday_start'] as String? ?? '',
      saturdayEnd: json['saturday_end'] as String? ?? '',
      sundayStart: json['sunday_start'] as String? ?? '',
      sundayEnd: json['sunday_end'] as String? ?? '',
    );

Map<String, dynamic> _$InscriptionWeeklyChildScheduleToJson(
    InscriptionWeeklyChildSchedule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('monday_start', instance.mondayStart);
  writeNotNull('monday_end', instance.mondayEnd);
  writeNotNull('tuesday_start', instance.tuesdayStart);
  writeNotNull('tuesday_end', instance.tuesdayEnd);
  writeNotNull('wednesday_start', instance.wednesdayStart);
  writeNotNull('wednesday_end', instance.wednesdayEnd);
  writeNotNull('thursday_start', instance.thursdayStart);
  writeNotNull('thursday_end', instance.thursdayEnd);
  writeNotNull('friday_start', instance.fridayStart);
  writeNotNull('friday_end', instance.fridayEnd);
  writeNotNull('saturday_start', instance.saturdayStart);
  writeNotNull('saturday_end', instance.saturdayEnd);
  writeNotNull('sunday_start', instance.sundayStart);
  writeNotNull('sunday_end', instance.sundayEnd);
  return val;
}

InscriptionRegistration _$InscriptionRegistrationFromJson(
        Map<String, dynamic> json) =>
    InscriptionRegistration(
      id: json['id'] as int?,
      family: json['family'] == null
          ? null
          : InscriptionRegistrationFamily.fromJson(
              json['family'] as Map<String, dynamic>),
      parent1: json['parent1'] == null
          ? null
          : ParentProfile.fromJson(json['parent1'] as Map<String, dynamic>),
      parent2: json['parent2'] == null
          ? null
          : ParentProfile.fromJson(json['parent2'] as Map<String, dynamic>),
      kindergarten: json['kindergarten'] as String? ?? '',
      child: json['child'] == null
          ? null
          : InscriptionChild.fromJson(json['child'] as Map<String, dynamic>),
      schedule: json['schedule'] == null
          ? null
          : InscriptionWeeklyChildSchedule.fromJson(
              json['schedule'] as Map<String, dynamic>),
      acceptedKindergarten: json['accepted_kindergarten'] == null
          ? null
          : DateTime.parse(json['accepted_kindergarten'] as String),
      acceptedParent: json['accepted_parent'] == null
          ? null
          : DateTime.parse(json['accepted_parent'] as String),
      terminatedKindergarten: json['terminated_kindergarten'] == null
          ? null
          : DateTime.parse(json['terminated_kindergarten'] as String),
      terminatedParent: json['terminated_parent'] == null
          ? null
          : DateTime.parse(json['terminated_parent'] as String),
      startDate: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      status: json['status'] as String? ?? '',
      statusAction:
          inscriptionRegistrationStatusActionFromJson(json['status_action']),
      statusDate: json['status_date'] == null
          ? null
          : DateTime.parse(json['status_date'] as String),
      possibleNextActions: json['possible_next_actions'] as String? ?? '',
    );

Map<String, dynamic> _$InscriptionRegistrationToJson(
    InscriptionRegistration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('family', instance.family?.toJson());
  writeNotNull('parent1', instance.parent1?.toJson());
  writeNotNull('parent2', instance.parent2?.toJson());
  writeNotNull('kindergarten', instance.kindergarten);
  writeNotNull('child', instance.child?.toJson());
  writeNotNull('schedule', instance.schedule?.toJson());
  writeNotNull('accepted_kindergarten',
      instance.acceptedKindergarten?.toIso8601String());
  writeNotNull('accepted_parent', instance.acceptedParent?.toIso8601String());
  writeNotNull('terminated_kindergarten',
      instance.terminatedKindergarten?.toIso8601String());
  writeNotNull(
      'terminated_parent', instance.terminatedParent?.toIso8601String());
  writeNotNull('start_date', instance.startDate?.toIso8601String());
  writeNotNull('end_date', instance.endDate?.toIso8601String());
  writeNotNull('status', instance.status);
  writeNotNull('status_action',
      inscriptionRegistrationStatusActionToJson(instance.statusAction));
  writeNotNull('status_date', instance.statusDate?.toIso8601String());
  writeNotNull('possible_next_actions', instance.possibleNextActions);
  return val;
}

ParentSignupByKindergartenList _$ParentSignupByKindergartenListFromJson(
        Map<String, dynamic> json) =>
    ParentSignupByKindergartenList(
      id: json['id'] as int?,
      parent: json['parent'] as String? ?? '',
      accepted: json['accepted'] as bool?,
      sent:
          json['sent'] == null ? null : DateTime.parse(json['sent'] as String),
    );

Map<String, dynamic> _$ParentSignupByKindergartenListToJson(
    ParentSignupByKindergartenList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('parent', instance.parent);
  writeNotNull('accepted', instance.accepted);
  writeNotNull('sent', instance.sent?.toIso8601String());
  return val;
}

FamilySignupByKindergartenList _$FamilySignupByKindergartenListFromJson(
        Map<String, dynamic> json) =>
    FamilySignupByKindergartenList(
      id: json['id'] as int?,
      parent1Signup: json['parent1_signup'] == null
          ? null
          : ParentSignupByKindergartenList.fromJson(
              json['parent1_signup'] as Map<String, dynamic>),
      parent2Signup: json['parent2_signup'] == null
          ? null
          : ParentSignupByKindergartenList.fromJson(
              json['parent2_signup'] as Map<String, dynamic>),
      kindergarten: json['kindergarten'] as String? ?? '',
      inscription: json['inscription'] as int?,
    );

Map<String, dynamic> _$FamilySignupByKindergartenListToJson(
    FamilySignupByKindergartenList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('parent1_signup', instance.parent1Signup?.toJson());
  writeNotNull('parent2_signup', instance.parent2Signup?.toJson());
  writeNotNull('kindergarten', instance.kindergarten);
  writeNotNull('inscription', instance.inscription);
  return val;
}

ResendFamilySignupByKindergartenEmailConfirmation
    _$ResendFamilySignupByKindergartenEmailConfirmationFromJson(
            Map<String, dynamic> json) =>
        ResendFamilySignupByKindergartenEmailConfirmation();

Map<String, dynamic> _$ResendFamilySignupByKindergartenEmailConfirmationToJson(
        ResendFamilySignupByKindergartenEmailConfirmation instance) =>
    <String, dynamic>{};

ResendParentSignupByKindergartenEmailConfirmation
    _$ResendParentSignupByKindergartenEmailConfirmationFromJson(
            Map<String, dynamic> json) =>
        ResendParentSignupByKindergartenEmailConfirmation();

Map<String, dynamic> _$ResendParentSignupByKindergartenEmailConfirmationToJson(
        ResendParentSignupByKindergartenEmailConfirmation instance) =>
    <String, dynamic>{};

ConfirmParentSignup _$ConfirmParentSignupFromJson(Map<String, dynamic> json) =>
    ConfirmParentSignup(
      parent: json['parent'] as String? ?? '',
      key: json['key'] as String? ?? '',
    );

Map<String, dynamic> _$ConfirmParentSignupToJson(ConfirmParentSignup instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('parent', instance.parent);
  writeNotNull('key', instance.key);
  return val;
}

FinalizeParentSignup _$FinalizeParentSignupFromJson(
        Map<String, dynamic> json) =>
    FinalizeParentSignup(
      password1: json['password1'] as String? ?? '',
      password2: json['password2'] as String? ?? '',
    );

Map<String, dynamic> _$FinalizeParentSignupToJson(
    FinalizeParentSignup instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('password1', instance.password1);
  writeNotNull('password2', instance.password2);
  return val;
}

ParentInvitation _$ParentInvitationFromJson(Map<String, dynamic> json) =>
    ParentInvitation(
      password1: json['password1'] as String? ?? '',
      password2: json['password2'] as String? ?? '',
    );

Map<String, dynamic> _$ParentInvitationToJson(ParentInvitation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('password1', instance.password1);
  writeNotNull('password2', instance.password2);
  return val;
}

ParentInvitationRegistration _$ParentInvitationRegistrationFromJson(
        Map<String, dynamic> json) =>
    ParentInvitationRegistration(
      user: json['user'] == null
          ? null
          : ParentInvitation.fromJson(json['user'] as Map<String, dynamic>),
      phone: json['phone'] == null
          ? null
          : ParentInvitationRegistration$Phone.fromJson(
              json['phone'] as Map<String, dynamic>),
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      birthDate: json['birth_date'] == null
          ? null
          : DateTime.parse(json['birth_date'] as String),
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      sex: parentInvitationRegistrationSexFromJson(json['sex']),
    );

Map<String, dynamic> _$ParentInvitationRegistrationToJson(
    ParentInvitationRegistration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user', instance.user?.toJson());
  writeNotNull('phone', instance.phone?.toJson());
  writeNotNull('address', instance.address?.toJson());
  writeNotNull('birth_date', instance.birthDate?.toIso8601String());
  writeNotNull('first_name', instance.firstName);
  writeNotNull('last_name', instance.lastName);
  writeNotNull('sex', parentInvitationRegistrationSexToJson(instance.sex));
  return val;
}

CustomResendEmailVerification _$CustomResendEmailVerificationFromJson(
        Map<String, dynamic> json) =>
    CustomResendEmailVerification(
      email: json['email'] as String? ?? '',
    );

Map<String, dynamic> _$CustomResendEmailVerificationToJson(
    CustomResendEmailVerification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', instance.email);
  return val;
}

CookieTokenRefresh _$CookieTokenRefreshFromJson(Map<String, dynamic> json) =>
    CookieTokenRefresh(
      refresh: json['refresh'] as String? ?? '',
      access: json['access'] as String? ?? '',
    );

Map<String, dynamic> _$CookieTokenRefreshToJson(CookieTokenRefresh instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('refresh', instance.refresh);
  writeNotNull('access', instance.access);
  return val;
}

TokenVerify _$TokenVerifyFromJson(Map<String, dynamic> json) => TokenVerify(
      token: json['token'] as String? ?? '',
    );

Map<String, dynamic> _$TokenVerifyToJson(TokenVerify instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('token', instance.token);
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

Actor _$ActorFromJson(Map<String, dynamic> json) => Actor(
      id: json['id'] as int?,
      name: json['name'] as String? ?? '',
      userType: json['user_type'] as String? ?? '',
    );

Map<String, dynamic> _$ActorToJson(Actor instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('user_type', instance.userType);
  return val;
}

ChildNotes _$ChildNotesFromJson(Map<String, dynamic> json) => ChildNotes(
      id: json['id'] as int?,
      child: json['child'] as int?,
      description: json['description'] as String? ?? '',
      actor: json['actor'] == null
          ? null
          : Actor.fromJson(json['actor'] as Map<String, dynamic>),
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$ChildNotesToJson(ChildNotes instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('child', instance.child);
  writeNotNull('description', instance.description);
  writeNotNull('actor', instance.actor?.toJson());
  writeNotNull('timestamp', instance.timestamp?.toIso8601String());
  return val;
}

ChildMedicalFileDefaultAllergy _$ChildMedicalFileDefaultAllergyFromJson(
        Map<String, dynamic> json) =>
    ChildMedicalFileDefaultAllergy(
      id: json['id'] as int?,
      name: json['name'] as String? ?? '',
      type: json['type'] as String? ?? '',
      severity:
          childMedicalFileDefaultAllergySeverityFromJson(json['severity']),
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$ChildMedicalFileDefaultAllergyToJson(
    ChildMedicalFileDefaultAllergy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('type', instance.type);
  writeNotNull('severity',
      childMedicalFileDefaultAllergySeverityToJson(instance.severity));
  writeNotNull('description', instance.description);
  return val;
}

ChildMedicalFileDefaultMedicalCondition
    _$ChildMedicalFileDefaultMedicalConditionFromJson(
            Map<String, dynamic> json) =>
        ChildMedicalFileDefaultMedicalCondition(
          id: json['id'] as int?,
          name: json['name'] as String? ?? '',
          severity: childMedicalFileDefaultMedicalConditionSeverityFromJson(
              json['severity']),
          description: json['description'] as String? ?? '',
        );

Map<String, dynamic> _$ChildMedicalFileDefaultMedicalConditionToJson(
    ChildMedicalFileDefaultMedicalCondition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('severity',
      childMedicalFileDefaultMedicalConditionSeverityToJson(instance.severity));
  writeNotNull('description', instance.description);
  return val;
}

ChildMedicalFileDefaultMedication _$ChildMedicalFileDefaultMedicationFromJson(
        Map<String, dynamic> json) =>
    ChildMedicalFileDefaultMedication(
      id: json['id'] as int?,
      name: json['name'] as String? ?? '',
      type: json['type'] as String? ?? '',
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$ChildMedicalFileDefaultMedicationToJson(
    ChildMedicalFileDefaultMedication instance) {
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
  return val;
}

InscriptionNewChild _$InscriptionNewChildFromJson(Map<String, dynamic> json) =>
    InscriptionNewChild(
      id: json['id'] as int?,
      family: json['family'] as int?,
      parent1: json['parent1'] == null
          ? null
          : ParentProfile.fromJson(json['parent1'] as Map<String, dynamic>),
      parent2: json['parent2'] == null
          ? null
          : ParentProfile.fromJson(json['parent2'] as Map<String, dynamic>),
      kindergarten: json['kindergarten'] as String? ?? '',
      child: json['child'] == null
          ? null
          : InscriptionChild.fromJson(json['child'] as Map<String, dynamic>),
      schedule: json['schedule'] == null
          ? null
          : InscriptionWeeklyChildSchedule.fromJson(
              json['schedule'] as Map<String, dynamic>),
      acceptedKindergarten: json['accepted_kindergarten'] == null
          ? null
          : DateTime.parse(json['accepted_kindergarten'] as String),
      acceptedParent: json['accepted_parent'] == null
          ? null
          : DateTime.parse(json['accepted_parent'] as String),
      terminatedKindergarten: json['terminated_kindergarten'] == null
          ? null
          : DateTime.parse(json['terminated_kindergarten'] as String),
      terminatedParent: json['terminated_parent'] == null
          ? null
          : DateTime.parse(json['terminated_parent'] as String),
      startDate: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      status: json['status'] as String? ?? '',
      statusAction:
          inscriptionNewChildStatusActionFromJson(json['status_action']),
      statusDate: json['status_date'] == null
          ? null
          : DateTime.parse(json['status_date'] as String),
      possibleNextActions: json['possible_next_actions'] as String? ?? '',
    );

Map<String, dynamic> _$InscriptionNewChildToJson(InscriptionNewChild instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('family', instance.family);
  writeNotNull('parent1', instance.parent1?.toJson());
  writeNotNull('parent2', instance.parent2?.toJson());
  writeNotNull('kindergarten', instance.kindergarten);
  writeNotNull('child', instance.child?.toJson());
  writeNotNull('schedule', instance.schedule?.toJson());
  writeNotNull('accepted_kindergarten',
      instance.acceptedKindergarten?.toIso8601String());
  writeNotNull('accepted_parent', instance.acceptedParent?.toIso8601String());
  writeNotNull('terminated_kindergarten',
      instance.terminatedKindergarten?.toIso8601String());
  writeNotNull(
      'terminated_parent', instance.terminatedParent?.toIso8601String());
  writeNotNull('start_date', instance.startDate?.toIso8601String());
  writeNotNull('end_date', instance.endDate?.toIso8601String());
  writeNotNull('status', instance.status);
  writeNotNull('status_action',
      inscriptionNewChildStatusActionToJson(instance.statusAction));
  writeNotNull('status_date', instance.statusDate?.toIso8601String());
  writeNotNull('possible_next_actions', instance.possibleNextActions);
  return val;
}

EducatorContract _$EducatorContractFromJson(Map<String, dynamic> json) =>
    EducatorContract(
      id: json['id'] as int?,
      kindergarten: json['kindergarten'] as String? ?? '',
      educator: json['educator'] as String? ?? '',
      acceptedKindergarten: json['accepted_kindergarten'] == null
          ? null
          : DateTime.parse(json['accepted_kindergarten'] as String),
      acceptedEducator: json['accepted_educator'] == null
          ? null
          : DateTime.parse(json['accepted_educator'] as String),
      terminatedKindergarten: json['terminated_kindergarten'] == null
          ? null
          : DateTime.parse(json['terminated_kindergarten'] as String),
      terminatedEducator: json['terminated_educator'] == null
          ? null
          : DateTime.parse(json['terminated_educator'] as String),
      startDate: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      status: json['status'] as String? ?? '',
      statusAction: educatorContractStatusActionFromJson(json['status_action']),
      statusDate: json['status_date'] == null
          ? null
          : DateTime.parse(json['status_date'] as String),
      possibleNextActions: json['possible_next_actions'] as String? ?? '',
    );

Map<String, dynamic> _$EducatorContractToJson(EducatorContract instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('kindergarten', instance.kindergarten);
  writeNotNull('educator', instance.educator);
  writeNotNull('accepted_kindergarten',
      instance.acceptedKindergarten?.toIso8601String());
  writeNotNull(
      'accepted_educator', instance.acceptedEducator?.toIso8601String());
  writeNotNull('terminated_kindergarten',
      instance.terminatedKindergarten?.toIso8601String());
  writeNotNull(
      'terminated_educator', instance.terminatedEducator?.toIso8601String());
  writeNotNull('start_date', instance.startDate?.toIso8601String());
  writeNotNull('end_date', instance.endDate?.toIso8601String());
  writeNotNull('status', instance.status);
  writeNotNull('status_action',
      educatorContractStatusActionToJson(instance.statusAction));
  writeNotNull('status_date', instance.statusDate?.toIso8601String());
  writeNotNull('possible_next_actions', instance.possibleNextActions);
  return val;
}

EducatorContractUpdate _$EducatorContractUpdateFromJson(
        Map<String, dynamic> json) =>
    EducatorContractUpdate(
      id: json['id'] as int?,
      kindergarten: json['kindergarten'] as String? ?? '',
      educator: json['educator'] as String? ?? '',
      acceptedKindergarten: json['accepted_kindergarten'] == null
          ? null
          : DateTime.parse(json['accepted_kindergarten'] as String),
      acceptedEducator: json['accepted_educator'] == null
          ? null
          : DateTime.parse(json['accepted_educator'] as String),
      terminatedKindergarten: json['terminated_kindergarten'] == null
          ? null
          : DateTime.parse(json['terminated_kindergarten'] as String),
      terminatedEducator: json['terminated_educator'] == null
          ? null
          : DateTime.parse(json['terminated_educator'] as String),
      startDate: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      status: json['status'] as String? ?? '',
      statusAction:
          educatorContractUpdateStatusActionFromJson(json['status_action']),
      statusDate: json['status_date'] == null
          ? null
          : DateTime.parse(json['status_date'] as String),
      possibleNextActions: json['possible_next_actions'] as String? ?? '',
    );

Map<String, dynamic> _$EducatorContractUpdateToJson(
    EducatorContractUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('kindergarten', instance.kindergarten);
  writeNotNull('educator', instance.educator);
  writeNotNull('accepted_kindergarten',
      instance.acceptedKindergarten?.toIso8601String());
  writeNotNull(
      'accepted_educator', instance.acceptedEducator?.toIso8601String());
  writeNotNull('terminated_kindergarten',
      instance.terminatedKindergarten?.toIso8601String());
  writeNotNull(
      'terminated_educator', instance.terminatedEducator?.toIso8601String());
  writeNotNull('start_date', instance.startDate?.toIso8601String());
  writeNotNull('end_date', instance.endDate?.toIso8601String());
  writeNotNull('status', instance.status);
  writeNotNull('status_action',
      educatorContractUpdateStatusActionToJson(instance.statusAction));
  writeNotNull('status_date', instance.statusDate?.toIso8601String());
  writeNotNull('possible_next_actions', instance.possibleNextActions);
  return val;
}

Inscription _$InscriptionFromJson(Map<String, dynamic> json) => Inscription(
      id: json['id'] as int?,
      family: json['family'] as int?,
      parent1: json['parent1'] == null
          ? null
          : ParentProfile.fromJson(json['parent1'] as Map<String, dynamic>),
      parent2: json['parent2'] == null
          ? null
          : ParentProfile.fromJson(json['parent2'] as Map<String, dynamic>),
      kindergarten: json['kindergarten'] as String? ?? '',
      child: json['child'] as int?,
      schedule: json['schedule'] == null
          ? null
          : InscriptionWeeklyChildSchedule.fromJson(
              json['schedule'] as Map<String, dynamic>),
      acceptedKindergarten: json['accepted_kindergarten'] == null
          ? null
          : DateTime.parse(json['accepted_kindergarten'] as String),
      acceptedParent: json['accepted_parent'] == null
          ? null
          : DateTime.parse(json['accepted_parent'] as String),
      terminatedKindergarten: json['terminated_kindergarten'] == null
          ? null
          : DateTime.parse(json['terminated_kindergarten'] as String),
      terminatedParent: json['terminated_parent'] == null
          ? null
          : DateTime.parse(json['terminated_parent'] as String),
      startDate: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      status: json['status'] as String? ?? '',
      statusAction: inscriptionStatusActionFromJson(json['status_action']),
      statusDate: json['status_date'] == null
          ? null
          : DateTime.parse(json['status_date'] as String),
      possibleNextActions: json['possible_next_actions'] as String? ?? '',
    );

Map<String, dynamic> _$InscriptionToJson(Inscription instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('family', instance.family);
  writeNotNull('parent1', instance.parent1?.toJson());
  writeNotNull('parent2', instance.parent2?.toJson());
  writeNotNull('kindergarten', instance.kindergarten);
  writeNotNull('child', instance.child);
  writeNotNull('schedule', instance.schedule?.toJson());
  writeNotNull('accepted_kindergarten',
      instance.acceptedKindergarten?.toIso8601String());
  writeNotNull('accepted_parent', instance.acceptedParent?.toIso8601String());
  writeNotNull('terminated_kindergarten',
      instance.terminatedKindergarten?.toIso8601String());
  writeNotNull(
      'terminated_parent', instance.terminatedParent?.toIso8601String());
  writeNotNull('start_date', instance.startDate?.toIso8601String());
  writeNotNull('end_date', instance.endDate?.toIso8601String());
  writeNotNull('status', instance.status);
  writeNotNull(
      'status_action', inscriptionStatusActionToJson(instance.statusAction));
  writeNotNull('status_date', instance.statusDate?.toIso8601String());
  writeNotNull('possible_next_actions', instance.possibleNextActions);
  return val;
}

InscriptionUpdate _$InscriptionUpdateFromJson(Map<String, dynamic> json) =>
    InscriptionUpdate(
      id: json['id'] as int?,
      family: json['family'] as int?,
      parent1: json['parent1'] == null
          ? null
          : ParentProfile.fromJson(json['parent1'] as Map<String, dynamic>),
      parent2: json['parent2'] == null
          ? null
          : ParentProfile.fromJson(json['parent2'] as Map<String, dynamic>),
      kindergarten: json['kindergarten'] as String? ?? '',
      child: json['child'] as int?,
      schedule: json['schedule'] == null
          ? null
          : InscriptionWeeklyChildSchedule.fromJson(
              json['schedule'] as Map<String, dynamic>),
      acceptedKindergarten: json['accepted_kindergarten'] == null
          ? null
          : DateTime.parse(json['accepted_kindergarten'] as String),
      acceptedParent: json['accepted_parent'] == null
          ? null
          : DateTime.parse(json['accepted_parent'] as String),
      terminatedKindergarten: json['terminated_kindergarten'] == null
          ? null
          : DateTime.parse(json['terminated_kindergarten'] as String),
      terminatedParent: json['terminated_parent'] == null
          ? null
          : DateTime.parse(json['terminated_parent'] as String),
      startDate: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      status: json['status'] as String? ?? '',
      statusAction:
          inscriptionUpdateStatusActionFromJson(json['status_action']),
      statusDate: json['status_date'] == null
          ? null
          : DateTime.parse(json['status_date'] as String),
      possibleNextActions: json['possible_next_actions'] as String? ?? '',
    );

Map<String, dynamic> _$InscriptionUpdateToJson(InscriptionUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('family', instance.family);
  writeNotNull('parent1', instance.parent1?.toJson());
  writeNotNull('parent2', instance.parent2?.toJson());
  writeNotNull('kindergarten', instance.kindergarten);
  writeNotNull('child', instance.child);
  writeNotNull('schedule', instance.schedule?.toJson());
  writeNotNull('accepted_kindergarten',
      instance.acceptedKindergarten?.toIso8601String());
  writeNotNull('accepted_parent', instance.acceptedParent?.toIso8601String());
  writeNotNull('terminated_kindergarten',
      instance.terminatedKindergarten?.toIso8601String());
  writeNotNull(
      'terminated_parent', instance.terminatedParent?.toIso8601String());
  writeNotNull('start_date', instance.startDate?.toIso8601String());
  writeNotNull('end_date', instance.endDate?.toIso8601String());
  writeNotNull('status', instance.status);
  writeNotNull('status_action',
      inscriptionUpdateStatusActionToJson(instance.statusAction));
  writeNotNull('status_date', instance.statusDate?.toIso8601String());
  writeNotNull('possible_next_actions', instance.possibleNextActions);
  return val;
}

Family _$FamilyFromJson(Map<String, dynamic> json) => Family(
      id: json['id'] as int?,
      children:
          (json['children'] as List<dynamic>?)?.map((e) => e as int).toList() ??
              [],
      trustedPerson: (json['trusted_person'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      parent1: json['parent1'] == null
          ? null
          : Parent.fromJson(json['parent1'] as Map<String, dynamic>),
      parent2: json['parent2'] == null
          ? null
          : Parent.fromJson(json['parent2'] as Map<String, dynamic>),
      familyInscriptions: (json['family_inscriptions'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          [],
    );

Map<String, dynamic> _$FamilyToJson(Family instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('children', instance.children);
  writeNotNull('trusted_person', instance.trustedPerson);
  writeNotNull('parent1', instance.parent1?.toJson());
  writeNotNull('parent2', instance.parent2?.toJson());
  writeNotNull('family_inscriptions', instance.familyInscriptions);
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

GeneralUserSettings _$GeneralUserSettingsFromJson(Map<String, dynamic> json) =>
    GeneralUserSettings(
      id: json['id'] as int?,
      chatNotificationsStatus:
          generalUserSettingsChatNotificationsStatusFromJson(
              json['chat_notifications_status']),
      socialNotificationsStatus:
          generalUserSettingsSocialNotificationsStatusFromJson(
              json['social_notifications_status']),
      generalNotificationsStatus:
          generalUserSettingsGeneralNotificationsStatusFromJson(
              json['general_notifications_status']),
    );

Map<String, dynamic> _$GeneralUserSettingsToJson(GeneralUserSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull(
      'chat_notifications_status',
      generalUserSettingsChatNotificationsStatusToJson(
          instance.chatNotificationsStatus));
  writeNotNull(
      'social_notifications_status',
      generalUserSettingsSocialNotificationsStatusToJson(
          instance.socialNotificationsStatus));
  writeNotNull(
      'general_notifications_status',
      generalUserSettingsGeneralNotificationsStatusToJson(
          instance.generalNotificationsStatus));
  return val;
}

AuthenticationProfileEducatorGet$Response
    _$AuthenticationProfileEducatorGet$ResponseFromJson(
            Map<String, dynamic> json) =>
        AuthenticationProfileEducatorGet$Response(
          count: json['count'] as int?,
          next: json['next'] as String? ?? '',
          previous: json['previous'] as String? ?? '',
          results: (json['results'] as List<dynamic>?)
                  ?.map((e) =>
                      EducatorProfile.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$AuthenticationProfileEducatorGet$ResponseToJson(
    AuthenticationProfileEducatorGet$Response instance) {
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

AuthenticationProfileKindergartenGet$Response
    _$AuthenticationProfileKindergartenGet$ResponseFromJson(
            Map<String, dynamic> json) =>
        AuthenticationProfileKindergartenGet$Response(
          count: json['count'] as int?,
          next: json['next'] as String? ?? '',
          previous: json['previous'] as String? ?? '',
          results: (json['results'] as List<dynamic>?)
                  ?.map((e) => KindergartenProfileRead.fromJson(
                      e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$AuthenticationProfileKindergartenGet$ResponseToJson(
    AuthenticationProfileKindergartenGet$Response instance) {
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

AuthenticationProfileParentGet$Response
    _$AuthenticationProfileParentGet$ResponseFromJson(
            Map<String, dynamic> json) =>
        AuthenticationProfileParentGet$Response(
          count: json['count'] as int?,
          next: json['next'] as String? ?? '',
          previous: json['previous'] as String? ?? '',
          results: (json['results'] as List<dynamic>?)
                  ?.map(
                      (e) => ParentProfile.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$AuthenticationProfileParentGet$ResponseToJson(
    AuthenticationProfileParentGet$Response instance) {
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

AuthenticationRegisterInviteParent2InvitationsGet$Response
    _$AuthenticationRegisterInviteParent2InvitationsGet$ResponseFromJson(
            Map<String, dynamic> json) =>
        AuthenticationRegisterInviteParent2InvitationsGet$Response(
          count: json['count'] as int?,
          next: json['next'] as String? ?? '',
          previous: json['previous'] as String? ?? '',
          results: (json['results'] as List<dynamic>?)
                  ?.map((e) =>
                      ParentInvitationInfo.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic>
    _$AuthenticationRegisterInviteParent2InvitationsGet$ResponseToJson(
        AuthenticationRegisterInviteParent2InvitationsGet$Response instance) {
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

AuthenticationRegisterKindergartenInitiatedEducatorInvitationsGet$Response
    _$AuthenticationRegisterKindergartenInitiatedEducatorInvitationsGet$ResponseFromJson(
            Map<String, dynamic> json) =>
        AuthenticationRegisterKindergartenInitiatedEducatorInvitationsGet$Response(
          count: json['count'] as int?,
          next: json['next'] as String? ?? '',
          previous: json['previous'] as String? ?? '',
          results: (json['results'] as List<dynamic>?)
                  ?.map((e) => EducatorSignupByKindergartenList.fromJson(
                      e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic>
    _$AuthenticationRegisterKindergartenInitiatedEducatorInvitationsGet$ResponseToJson(
        AuthenticationRegisterKindergartenInitiatedEducatorInvitationsGet$Response
            instance) {
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

AuthenticationRegisterKindergartenInitiatedFamilyInvitationsGet$Response
    _$AuthenticationRegisterKindergartenInitiatedFamilyInvitationsGet$ResponseFromJson(
            Map<String, dynamic> json) =>
        AuthenticationRegisterKindergartenInitiatedFamilyInvitationsGet$Response(
          count: json['count'] as int?,
          next: json['next'] as String? ?? '',
          previous: json['previous'] as String? ?? '',
          results: (json['results'] as List<dynamic>?)
                  ?.map((e) => FamilySignupByKindergartenList.fromJson(
                      e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic>
    _$AuthenticationRegisterKindergartenInitiatedFamilyInvitationsGet$ResponseToJson(
        AuthenticationRegisterKindergartenInitiatedFamilyInvitationsGet$Response
            instance) {
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

ChildChildGet$Response _$ChildChildGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ChildChildGet$Response(
      count: json['count'] as int?,
      next: json['next'] as String? ?? '',
      previous: json['previous'] as String? ?? '',
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => Child.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ChildChildGet$ResponseToJson(
    ChildChildGet$Response instance) {
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

ChildChildNotesGet$Response _$ChildChildNotesGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ChildChildNotesGet$Response(
      count: json['count'] as int?,
      next: json['next'] as String? ?? '',
      previous: json['previous'] as String? ?? '',
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => ChildNotes.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ChildChildNotesGet$ResponseToJson(
    ChildChildNotesGet$Response instance) {
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

ChildMedicalFileGet$Response _$ChildMedicalFileGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ChildMedicalFileGet$Response(
      count: json['count'] as int?,
      next: json['next'] as String? ?? '',
      previous: json['previous'] as String? ?? '',
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => ChildMedicalFile.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ChildMedicalFileGet$ResponseToJson(
    ChildMedicalFileGet$Response instance) {
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

ChildMedicalFileAllergyGet$Response
    _$ChildMedicalFileAllergyGet$ResponseFromJson(Map<String, dynamic> json) =>
        ChildMedicalFileAllergyGet$Response(
          count: json['count'] as int?,
          next: json['next'] as String? ?? '',
          previous: json['previous'] as String? ?? '',
          results: (json['results'] as List<dynamic>?)
                  ?.map((e) => ChildMedicalFileAllergy.fromJson(
                      e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$ChildMedicalFileAllergyGet$ResponseToJson(
    ChildMedicalFileAllergyGet$Response instance) {
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

ChildMedicalFileDefaultAllergyGet$Response
    _$ChildMedicalFileDefaultAllergyGet$ResponseFromJson(
            Map<String, dynamic> json) =>
        ChildMedicalFileDefaultAllergyGet$Response(
          count: json['count'] as int?,
          next: json['next'] as String? ?? '',
          previous: json['previous'] as String? ?? '',
          results: (json['results'] as List<dynamic>?)
                  ?.map((e) => ChildMedicalFileDefaultAllergy.fromJson(
                      e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$ChildMedicalFileDefaultAllergyGet$ResponseToJson(
    ChildMedicalFileDefaultAllergyGet$Response instance) {
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

ChildMedicalFileDefaultMedicalConditionGet$Response
    _$ChildMedicalFileDefaultMedicalConditionGet$ResponseFromJson(
            Map<String, dynamic> json) =>
        ChildMedicalFileDefaultMedicalConditionGet$Response(
          count: json['count'] as int?,
          next: json['next'] as String? ?? '',
          previous: json['previous'] as String? ?? '',
          results: (json['results'] as List<dynamic>?)
                  ?.map((e) => ChildMedicalFileDefaultMedicalCondition.fromJson(
                      e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic>
    _$ChildMedicalFileDefaultMedicalConditionGet$ResponseToJson(
        ChildMedicalFileDefaultMedicalConditionGet$Response instance) {
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

ChildMedicalFileDefaultMedicationGet$Response
    _$ChildMedicalFileDefaultMedicationGet$ResponseFromJson(
            Map<String, dynamic> json) =>
        ChildMedicalFileDefaultMedicationGet$Response(
          count: json['count'] as int?,
          next: json['next'] as String? ?? '',
          previous: json['previous'] as String? ?? '',
          results: (json['results'] as List<dynamic>?)
                  ?.map((e) => ChildMedicalFileDefaultMedication.fromJson(
                      e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$ChildMedicalFileDefaultMedicationGet$ResponseToJson(
    ChildMedicalFileDefaultMedicationGet$Response instance) {
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

ChildMedicalFileMedicalConditionGet$Response
    _$ChildMedicalFileMedicalConditionGet$ResponseFromJson(
            Map<String, dynamic> json) =>
        ChildMedicalFileMedicalConditionGet$Response(
          count: json['count'] as int?,
          next: json['next'] as String? ?? '',
          previous: json['previous'] as String? ?? '',
          results: (json['results'] as List<dynamic>?)
                  ?.map((e) => ChildMedicalFileMedicalCondition.fromJson(
                      e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$ChildMedicalFileMedicalConditionGet$ResponseToJson(
    ChildMedicalFileMedicalConditionGet$Response instance) {
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

ChildMedicalFileMedicationGet$Response
    _$ChildMedicalFileMedicationGet$ResponseFromJson(
            Map<String, dynamic> json) =>
        ChildMedicalFileMedicationGet$Response(
          count: json['count'] as int?,
          next: json['next'] as String? ?? '',
          previous: json['previous'] as String? ?? '',
          results: (json['results'] as List<dynamic>?)
                  ?.map((e) => ChildMedicalFileMedication.fromJson(
                      e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$ChildMedicalFileMedicationGet$ResponseToJson(
    ChildMedicalFileMedicationGet$Response instance) {
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

ContractsEducatorContractGet$Response
    _$ContractsEducatorContractGet$ResponseFromJson(
            Map<String, dynamic> json) =>
        ContractsEducatorContractGet$Response(
          count: json['count'] as int?,
          next: json['next'] as String? ?? '',
          previous: json['previous'] as String? ?? '',
          results: (json['results'] as List<dynamic>?)
                  ?.map((e) =>
                      EducatorContract.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$ContractsEducatorContractGet$ResponseToJson(
    ContractsEducatorContractGet$Response instance) {
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

ContractsInscriptionGet$Response _$ContractsInscriptionGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ContractsInscriptionGet$Response(
      count: json['count'] as int?,
      next: json['next'] as String? ?? '',
      previous: json['previous'] as String? ?? '',
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => Inscription.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ContractsInscriptionGet$ResponseToJson(
    ContractsInscriptionGet$Response instance) {
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

FamilyFamilyGet$Response _$FamilyFamilyGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    FamilyFamilyGet$Response(
      count: json['count'] as int?,
      next: json['next'] as String? ?? '',
      previous: json['previous'] as String? ?? '',
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => Family.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$FamilyFamilyGet$ResponseToJson(
    FamilyFamilyGet$Response instance) {
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

FamilyTrustedPersonGet$Response _$FamilyTrustedPersonGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    FamilyTrustedPersonGet$Response(
      count: json['count'] as int?,
      next: json['next'] as String? ?? '',
      previous: json['previous'] as String? ?? '',
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => TrustedPerson.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$FamilyTrustedPersonGet$ResponseToJson(
    FamilyTrustedPersonGet$Response instance) {
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

EducatorProfile$Phone _$EducatorProfile$PhoneFromJson(
        Map<String, dynamic> json) =>
    EducatorProfile$Phone(
      kind: educatorProfile$PhoneKindFromJson(json['kind']),
      number: json['number'] as String? ?? '',
    );

Map<String, dynamic> _$EducatorProfile$PhoneToJson(
    EducatorProfile$Phone instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('kind', educatorProfile$PhoneKindToJson(instance.kind));
  writeNotNull('number', instance.number);
  return val;
}

KindergartenProfileRead$Phone _$KindergartenProfileRead$PhoneFromJson(
        Map<String, dynamic> json) =>
    KindergartenProfileRead$Phone(
      kind: kindergartenProfileRead$PhoneKindFromJson(json['kind']),
      number: json['number'] as String? ?? '',
    );

Map<String, dynamic> _$KindergartenProfileRead$PhoneToJson(
    KindergartenProfileRead$Phone instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('kind', kindergartenProfileRead$PhoneKindToJson(instance.kind));
  writeNotNull('number', instance.number);
  return val;
}

KindergartenProfileRead$Phone1 _$KindergartenProfileRead$Phone1FromJson(
        Map<String, dynamic> json) =>
    KindergartenProfileRead$Phone1(
      kind: kindergartenProfileRead$Phone1KindFromJson(json['kind']),
      number: json['number'] as String? ?? '',
    );

Map<String, dynamic> _$KindergartenProfileRead$Phone1ToJson(
    KindergartenProfileRead$Phone1 instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('kind', kindergartenProfileRead$Phone1KindToJson(instance.kind));
  writeNotNull('number', instance.number);
  return val;
}

KindergartenProfileRead$Phone2 _$KindergartenProfileRead$Phone2FromJson(
        Map<String, dynamic> json) =>
    KindergartenProfileRead$Phone2(
      kind: kindergartenProfileRead$Phone2KindFromJson(json['kind']),
      number: json['number'] as String? ?? '',
    );

Map<String, dynamic> _$KindergartenProfileRead$Phone2ToJson(
    KindergartenProfileRead$Phone2 instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('kind', kindergartenProfileRead$Phone2KindToJson(instance.kind));
  writeNotNull('number', instance.number);
  return val;
}

KindergartenProfile$Phone _$KindergartenProfile$PhoneFromJson(
        Map<String, dynamic> json) =>
    KindergartenProfile$Phone(
      kind: kindergartenProfile$PhoneKindFromJson(json['kind']),
      number: json['number'] as String? ?? '',
    );

Map<String, dynamic> _$KindergartenProfile$PhoneToJson(
    KindergartenProfile$Phone instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('kind', kindergartenProfile$PhoneKindToJson(instance.kind));
  writeNotNull('number', instance.number);
  return val;
}

KindergartenProfile$Phone1 _$KindergartenProfile$Phone1FromJson(
        Map<String, dynamic> json) =>
    KindergartenProfile$Phone1(
      kind: kindergartenProfile$Phone1KindFromJson(json['kind']),
      number: json['number'] as String? ?? '',
    );

Map<String, dynamic> _$KindergartenProfile$Phone1ToJson(
    KindergartenProfile$Phone1 instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('kind', kindergartenProfile$Phone1KindToJson(instance.kind));
  writeNotNull('number', instance.number);
  return val;
}

KindergartenProfile$Phone2 _$KindergartenProfile$Phone2FromJson(
        Map<String, dynamic> json) =>
    KindergartenProfile$Phone2(
      kind: kindergartenProfile$Phone2KindFromJson(json['kind']),
      number: json['number'] as String? ?? '',
    );

Map<String, dynamic> _$KindergartenProfile$Phone2ToJson(
    KindergartenProfile$Phone2 instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('kind', kindergartenProfile$Phone2KindToJson(instance.kind));
  writeNotNull('number', instance.number);
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

EducatorRegistration$Phone _$EducatorRegistration$PhoneFromJson(
        Map<String, dynamic> json) =>
    EducatorRegistration$Phone(
      kind: educatorRegistration$PhoneKindFromJson(json['kind']),
      number: json['number'] as String? ?? '',
    );

Map<String, dynamic> _$EducatorRegistration$PhoneToJson(
    EducatorRegistration$Phone instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('kind', educatorRegistration$PhoneKindToJson(instance.kind));
  writeNotNull('number', instance.number);
  return val;
}

ParentRegistration$Phone _$ParentRegistration$PhoneFromJson(
        Map<String, dynamic> json) =>
    ParentRegistration$Phone(
      kind: parentRegistration$PhoneKindFromJson(json['kind']),
      number: json['number'] as String? ?? '',
    );

Map<String, dynamic> _$ParentRegistration$PhoneToJson(
    ParentRegistration$Phone instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('kind', parentRegistration$PhoneKindToJson(instance.kind));
  writeNotNull('number', instance.number);
  return val;
}

KindergartenRegistration$Phone _$KindergartenRegistration$PhoneFromJson(
        Map<String, dynamic> json) =>
    KindergartenRegistration$Phone(
      kind: kindergartenRegistration$PhoneKindFromJson(json['kind']),
      number: json['number'] as String? ?? '',
    );

Map<String, dynamic> _$KindergartenRegistration$PhoneToJson(
    KindergartenRegistration$Phone instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('kind', kindergartenRegistration$PhoneKindToJson(instance.kind));
  writeNotNull('number', instance.number);
  return val;
}

KindergartenRegistration$Phone1 _$KindergartenRegistration$Phone1FromJson(
        Map<String, dynamic> json) =>
    KindergartenRegistration$Phone1(
      kind: kindergartenRegistration$Phone1KindFromJson(json['kind']),
      number: json['number'] as String? ?? '',
    );

Map<String, dynamic> _$KindergartenRegistration$Phone1ToJson(
    KindergartenRegistration$Phone1 instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'kind', kindergartenRegistration$Phone1KindToJson(instance.kind));
  writeNotNull('number', instance.number);
  return val;
}

KindergartenRegistration$Phone2 _$KindergartenRegistration$Phone2FromJson(
        Map<String, dynamic> json) =>
    KindergartenRegistration$Phone2(
      kind: kindergartenRegistration$Phone2KindFromJson(json['kind']),
      number: json['number'] as String? ?? '',
    );

Map<String, dynamic> _$KindergartenRegistration$Phone2ToJson(
    KindergartenRegistration$Phone2 instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'kind', kindergartenRegistration$Phone2KindToJson(instance.kind));
  writeNotNull('number', instance.number);
  return val;
}

EducatorContractRegistrationEducator$Phone
    _$EducatorContractRegistrationEducator$PhoneFromJson(
            Map<String, dynamic> json) =>
        EducatorContractRegistrationEducator$Phone(
          kind: educatorContractRegistrationEducator$PhoneKindFromJson(
              json['kind']),
          number: json['number'] as String? ?? '',
        );

Map<String, dynamic> _$EducatorContractRegistrationEducator$PhoneToJson(
    EducatorContractRegistrationEducator$Phone instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('kind',
      educatorContractRegistrationEducator$PhoneKindToJson(instance.kind));
  writeNotNull('number', instance.number);
  return val;
}

InscriptionRegistrationParent$Phone
    _$InscriptionRegistrationParent$PhoneFromJson(Map<String, dynamic> json) =>
        InscriptionRegistrationParent$Phone(
          kind: inscriptionRegistrationParent$PhoneKindFromJson(json['kind']),
          number: json['number'] as String? ?? '',
        );

Map<String, dynamic> _$InscriptionRegistrationParent$PhoneToJson(
    InscriptionRegistrationParent$Phone instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'kind', inscriptionRegistrationParent$PhoneKindToJson(instance.kind));
  writeNotNull('number', instance.number);
  return val;
}

ParentInvitationRegistration$Phone _$ParentInvitationRegistration$PhoneFromJson(
        Map<String, dynamic> json) =>
    ParentInvitationRegistration$Phone(
      kind: parentInvitationRegistration$PhoneKindFromJson(json['kind']),
      number: json['number'] as String? ?? '',
    );

Map<String, dynamic> _$ParentInvitationRegistration$PhoneToJson(
    ParentInvitationRegistration$Phone instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'kind', parentInvitationRegistration$PhoneKindToJson(instance.kind));
  writeNotNull('number', instance.number);
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
