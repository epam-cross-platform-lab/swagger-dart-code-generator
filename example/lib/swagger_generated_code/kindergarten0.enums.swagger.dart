import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';

enum DaySummaryHumor {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('BAD')
  bad('BAD'),
  @JsonValue('MEDIUM')
  medium('MEDIUM'),
  @JsonValue('GOOD')
  good('GOOD'),
  @JsonValue('AWESOME')
  awesome('AWESOME');

  final String? value;

  const DaySummaryHumor(this.value);
}

enum DaySummaryHunger {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('BAD')
  bad('BAD'),
  @JsonValue('MEDIUM')
  medium('MEDIUM'),
  @JsonValue('GOOD')
  good('GOOD'),
  @JsonValue('AWESOME')
  awesome('AWESOME');

  final String? value;

  const DaySummaryHunger(this.value);
}

enum DaySummaryActivityParticipation {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('BAD')
  bad('BAD'),
  @JsonValue('MEDIUM')
  medium('MEDIUM'),
  @JsonValue('GOOD')
  good('GOOD'),
  @JsonValue('AWESOME')
  awesome('AWESOME');

  final String? value;

  const DaySummaryActivityParticipation(this.value);
}

enum DaySummaryNap {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('BAD')
  bad('BAD'),
  @JsonValue('MEDIUM')
  medium('MEDIUM'),
  @JsonValue('GOOD')
  good('GOOD'),
  @JsonValue('AWESOME')
  awesome('AWESOME');

  final String? value;

  const DaySummaryNap(this.value);
}

enum DaySummaryInteractions {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('BAD')
  bad('BAD'),
  @JsonValue('MEDIUM')
  medium('MEDIUM'),
  @JsonValue('GOOD')
  good('GOOD'),
  @JsonValue('AWESOME')
  awesome('AWESOME');

  final String? value;

  const DaySummaryInteractions(this.value);
}

enum DaySummaryOutsidePlaytime {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('BAD')
  bad('BAD'),
  @JsonValue('MEDIUM')
  medium('MEDIUM'),
  @JsonValue('GOOD')
  good('GOOD'),
  @JsonValue('AWESOME')
  awesome('AWESOME');

  final String? value;

  const DaySummaryOutsidePlaytime(this.value);
}

enum DaySummaryPooping {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('BAD')
  bad('BAD'),
  @JsonValue('MEDIUM')
  medium('MEDIUM'),
  @JsonValue('GOOD')
  good('GOOD'),
  @JsonValue('AWESOME')
  awesome('AWESOME');

  final String? value;

  const DaySummaryPooping(this.value);
}

enum EventRecurrence {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('RRULE:FREQ=DAILY')
  rruleFreqDaily('RRULE:FREQ=DAILY'),
  @JsonValue('RRULE:FREQ=WEEKLY')
  rruleFreqWeekly('RRULE:FREQ=WEEKLY'),
  @JsonValue('RRULE:FREQ=WEEKLY;INTERVAL=2')
  rruleFreqWeeklyInterval2('RRULE:FREQ=WEEKLY;INTERVAL=2'),
  @JsonValue('RRULE:FREQ=MONTHLY')
  rruleFreqMonthly('RRULE:FREQ=MONTHLY'),
  @JsonValue('RRULE:FREQ=YEARLY')
  rruleFreqYearly('RRULE:FREQ=YEARLY');

  final String? value;

  const EventRecurrence(this.value);
}

enum NotificationSerializerUserReadOnlyNType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('CHAT')
  chat('CHAT'),
  @JsonValue('COMMENT')
  comment('COMMENT'),
  @JsonValue('PUBLICATION')
  publication('PUBLICATION'),
  @JsonValue('CUSTOM')
  custom('CUSTOM');

  final String? value;

  const NotificationSerializerUserReadOnlyNType(this.value);
}

enum PaymentStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('NOT_ISSUED')
  notIssued('NOT_ISSUED'),
  @JsonValue('FUTURE')
  future('FUTURE'),
  @JsonValue('PENDING')
  pending('PENDING'),
  @JsonValue('APPROVED')
  approved('APPROVED'),
  @JsonValue('DECLINED')
  declined('DECLINED');

  final String? value;

  const PaymentStatus(this.value);
}

enum PaymentDeclinedReason {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('NSF')
  nsf('NSF'),
  @JsonValue('STR')
  str('STR'),
  @JsonValue('ED')
  ed('ED'),
  @JsonValue('FNC')
  fnc('FNC'),
  @JsonValue('AC')
  ac('AC'),
  @JsonValue('INAC')
  inac('INAC'),
  @JsonValue('ANF')
  anf('ANF'),
  @JsonValue('AF')
  af('AF'),
  @JsonValue('AR')
  ar('AR'),
  @JsonValue('NDA')
  nda('NDA'),
  @JsonValue('NULL')
  $null('NULL');

  final String? value;

  const PaymentDeclinedReason(this.value);
}

enum EducatorKindergartenPermissionMenu {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue(1)
  value_1(1),
  @JsonValue(3)
  value_3(3),
  @JsonValue(5)
  value_5(5),
  @JsonValue(9)
  value_9(9),
  @JsonValue(17)
  value_17(17),
  @JsonValue(31)
  value_31(31),
  @JsonValue(2)
  value_2(2),
  @JsonValue(6)
  value_6(6),
  @JsonValue(10)
  value_10(10),
  @JsonValue(18)
  value_18(18),
  @JsonValue(30)
  value_30(30),
  @JsonValue(4)
  value_4(4),
  @JsonValue(12)
  value_12(12),
  @JsonValue(20)
  value_20(20),
  @JsonValue(8)
  value_8(8),
  @JsonValue(24)
  value_24(24),
  @JsonValue(16)
  value_16(16);

  final int? value;

  const EducatorKindergartenPermissionMenu(this.value);
}

enum EducatorKindergartenPermissionCalendar {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue(1)
  value_1(1),
  @JsonValue(3)
  value_3(3),
  @JsonValue(5)
  value_5(5),
  @JsonValue(9)
  value_9(9),
  @JsonValue(17)
  value_17(17),
  @JsonValue(31)
  value_31(31),
  @JsonValue(2)
  value_2(2),
  @JsonValue(6)
  value_6(6),
  @JsonValue(10)
  value_10(10),
  @JsonValue(18)
  value_18(18),
  @JsonValue(30)
  value_30(30),
  @JsonValue(4)
  value_4(4),
  @JsonValue(12)
  value_12(12),
  @JsonValue(20)
  value_20(20),
  @JsonValue(8)
  value_8(8),
  @JsonValue(24)
  value_24(24),
  @JsonValue(16)
  value_16(16);

  final int? value;

  const EducatorKindergartenPermissionCalendar(this.value);
}

enum EducatorKindergartenPermissionEducatorContracts {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue(1)
  value_1(1),
  @JsonValue(3)
  value_3(3),
  @JsonValue(5)
  value_5(5),
  @JsonValue(9)
  value_9(9),
  @JsonValue(17)
  value_17(17),
  @JsonValue(31)
  value_31(31),
  @JsonValue(2)
  value_2(2),
  @JsonValue(6)
  value_6(6),
  @JsonValue(10)
  value_10(10),
  @JsonValue(18)
  value_18(18),
  @JsonValue(30)
  value_30(30),
  @JsonValue(4)
  value_4(4),
  @JsonValue(12)
  value_12(12),
  @JsonValue(20)
  value_20(20),
  @JsonValue(8)
  value_8(8),
  @JsonValue(24)
  value_24(24),
  @JsonValue(16)
  value_16(16);

  final int? value;

  const EducatorKindergartenPermissionEducatorContracts(this.value);
}

enum EducatorKindergartenPermissionPayments {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue(1)
  value_1(1),
  @JsonValue(3)
  value_3(3),
  @JsonValue(5)
  value_5(5),
  @JsonValue(9)
  value_9(9),
  @JsonValue(17)
  value_17(17),
  @JsonValue(31)
  value_31(31),
  @JsonValue(2)
  value_2(2),
  @JsonValue(6)
  value_6(6),
  @JsonValue(10)
  value_10(10),
  @JsonValue(18)
  value_18(18),
  @JsonValue(30)
  value_30(30),
  @JsonValue(4)
  value_4(4),
  @JsonValue(12)
  value_12(12),
  @JsonValue(20)
  value_20(20),
  @JsonValue(8)
  value_8(8),
  @JsonValue(24)
  value_24(24),
  @JsonValue(16)
  value_16(16);

  final int? value;

  const EducatorKindergartenPermissionPayments(this.value);
}

enum EducatorKindergartenPermissionPresence {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue(1)
  value_1(1),
  @JsonValue(3)
  value_3(3),
  @JsonValue(5)
  value_5(5),
  @JsonValue(9)
  value_9(9),
  @JsonValue(17)
  value_17(17),
  @JsonValue(31)
  value_31(31),
  @JsonValue(2)
  value_2(2),
  @JsonValue(6)
  value_6(6),
  @JsonValue(10)
  value_10(10),
  @JsonValue(18)
  value_18(18),
  @JsonValue(30)
  value_30(30),
  @JsonValue(4)
  value_4(4),
  @JsonValue(12)
  value_12(12),
  @JsonValue(20)
  value_20(20),
  @JsonValue(8)
  value_8(8),
  @JsonValue(24)
  value_24(24),
  @JsonValue(16)
  value_16(16);

  final int? value;

  const EducatorKindergartenPermissionPresence(this.value);
}

enum EducatorKindergartenPermissionDayEvaluation {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue(1)
  value_1(1),
  @JsonValue(3)
  value_3(3),
  @JsonValue(5)
  value_5(5),
  @JsonValue(9)
  value_9(9),
  @JsonValue(17)
  value_17(17),
  @JsonValue(31)
  value_31(31),
  @JsonValue(2)
  value_2(2),
  @JsonValue(6)
  value_6(6),
  @JsonValue(10)
  value_10(10),
  @JsonValue(18)
  value_18(18),
  @JsonValue(30)
  value_30(30),
  @JsonValue(4)
  value_4(4),
  @JsonValue(12)
  value_12(12),
  @JsonValue(20)
  value_20(20),
  @JsonValue(8)
  value_8(8),
  @JsonValue(24)
  value_24(24),
  @JsonValue(16)
  value_16(16);

  final int? value;

  const EducatorKindergartenPermissionDayEvaluation(this.value);
}

enum EducatorKindergartenPermissionGroups {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue(1)
  value_1(1),
  @JsonValue(3)
  value_3(3),
  @JsonValue(5)
  value_5(5),
  @JsonValue(9)
  value_9(9),
  @JsonValue(17)
  value_17(17),
  @JsonValue(31)
  value_31(31),
  @JsonValue(2)
  value_2(2),
  @JsonValue(6)
  value_6(6),
  @JsonValue(10)
  value_10(10),
  @JsonValue(18)
  value_18(18),
  @JsonValue(30)
  value_30(30),
  @JsonValue(4)
  value_4(4),
  @JsonValue(12)
  value_12(12),
  @JsonValue(20)
  value_20(20),
  @JsonValue(8)
  value_8(8),
  @JsonValue(24)
  value_24(24),
  @JsonValue(16)
  value_16(16);

  final int? value;

  const EducatorKindergartenPermissionGroups(this.value);
}

enum EducatorKindergartenPermissionFastPickup {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue(1)
  value_1(1),
  @JsonValue(3)
  value_3(3),
  @JsonValue(5)
  value_5(5),
  @JsonValue(9)
  value_9(9),
  @JsonValue(17)
  value_17(17),
  @JsonValue(31)
  value_31(31),
  @JsonValue(2)
  value_2(2),
  @JsonValue(6)
  value_6(6),
  @JsonValue(10)
  value_10(10),
  @JsonValue(18)
  value_18(18),
  @JsonValue(30)
  value_30(30),
  @JsonValue(4)
  value_4(4),
  @JsonValue(12)
  value_12(12),
  @JsonValue(20)
  value_20(20),
  @JsonValue(8)
  value_8(8),
  @JsonValue(24)
  value_24(24),
  @JsonValue(16)
  value_16(16);

  final int? value;

  const EducatorKindergartenPermissionFastPickup(this.value);
}

enum EducatorKindergartenPermissionChildDevelopmentProfile {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue(1)
  value_1(1),
  @JsonValue(3)
  value_3(3),
  @JsonValue(5)
  value_5(5),
  @JsonValue(9)
  value_9(9),
  @JsonValue(17)
  value_17(17),
  @JsonValue(31)
  value_31(31),
  @JsonValue(2)
  value_2(2),
  @JsonValue(6)
  value_6(6),
  @JsonValue(10)
  value_10(10),
  @JsonValue(18)
  value_18(18),
  @JsonValue(30)
  value_30(30),
  @JsonValue(4)
  value_4(4),
  @JsonValue(12)
  value_12(12),
  @JsonValue(20)
  value_20(20),
  @JsonValue(8)
  value_8(8),
  @JsonValue(24)
  value_24(24),
  @JsonValue(16)
  value_16(16);

  final int? value;

  const EducatorKindergartenPermissionChildDevelopmentProfile(this.value);
}

enum EducatorKindergartenPermissionPosting {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue(1)
  value_1(1),
  @JsonValue(3)
  value_3(3),
  @JsonValue(5)
  value_5(5),
  @JsonValue(9)
  value_9(9),
  @JsonValue(17)
  value_17(17),
  @JsonValue(31)
  value_31(31),
  @JsonValue(2)
  value_2(2),
  @JsonValue(6)
  value_6(6),
  @JsonValue(10)
  value_10(10),
  @JsonValue(18)
  value_18(18),
  @JsonValue(30)
  value_30(30),
  @JsonValue(4)
  value_4(4),
  @JsonValue(12)
  value_12(12),
  @JsonValue(20)
  value_20(20),
  @JsonValue(8)
  value_8(8),
  @JsonValue(24)
  value_24(24),
  @JsonValue(16)
  value_16(16);

  final int? value;

  const EducatorKindergartenPermissionPosting(this.value);
}

enum EducatorKindergartenPermissionChat {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue(1)
  value_1(1),
  @JsonValue(3)
  value_3(3),
  @JsonValue(5)
  value_5(5),
  @JsonValue(9)
  value_9(9),
  @JsonValue(17)
  value_17(17),
  @JsonValue(31)
  value_31(31),
  @JsonValue(2)
  value_2(2),
  @JsonValue(6)
  value_6(6),
  @JsonValue(10)
  value_10(10),
  @JsonValue(18)
  value_18(18),
  @JsonValue(30)
  value_30(30),
  @JsonValue(4)
  value_4(4),
  @JsonValue(12)
  value_12(12),
  @JsonValue(20)
  value_20(20),
  @JsonValue(8)
  value_8(8),
  @JsonValue(24)
  value_24(24),
  @JsonValue(16)
  value_16(16);

  final int? value;

  const EducatorKindergartenPermissionChat(this.value);
}

enum EducatorKindergartenPermissionInscriptions {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue(1)
  value_1(1),
  @JsonValue(3)
  value_3(3),
  @JsonValue(5)
  value_5(5),
  @JsonValue(9)
  value_9(9),
  @JsonValue(17)
  value_17(17),
  @JsonValue(31)
  value_31(31),
  @JsonValue(2)
  value_2(2),
  @JsonValue(6)
  value_6(6),
  @JsonValue(10)
  value_10(10),
  @JsonValue(18)
  value_18(18),
  @JsonValue(30)
  value_30(30),
  @JsonValue(4)
  value_4(4),
  @JsonValue(12)
  value_12(12),
  @JsonValue(20)
  value_20(20),
  @JsonValue(8)
  value_8(8),
  @JsonValue(24)
  value_24(24),
  @JsonValue(16)
  value_16(16);

  final int? value;

  const EducatorKindergartenPermissionInscriptions(this.value);
}

enum EducatorKindergartenPermissionParentsFamilyProfile {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue(1)
  value_1(1),
  @JsonValue(3)
  value_3(3),
  @JsonValue(5)
  value_5(5),
  @JsonValue(9)
  value_9(9),
  @JsonValue(17)
  value_17(17),
  @JsonValue(31)
  value_31(31),
  @JsonValue(2)
  value_2(2),
  @JsonValue(6)
  value_6(6),
  @JsonValue(10)
  value_10(10),
  @JsonValue(18)
  value_18(18),
  @JsonValue(30)
  value_30(30),
  @JsonValue(4)
  value_4(4),
  @JsonValue(12)
  value_12(12),
  @JsonValue(20)
  value_20(20),
  @JsonValue(8)
  value_8(8),
  @JsonValue(24)
  value_24(24),
  @JsonValue(16)
  value_16(16);

  final int? value;

  const EducatorKindergartenPermissionParentsFamilyProfile(this.value);
}

enum EducatorKindergartenPermissionEducatorProfile {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue(1)
  value_1(1),
  @JsonValue(3)
  value_3(3),
  @JsonValue(5)
  value_5(5),
  @JsonValue(9)
  value_9(9),
  @JsonValue(17)
  value_17(17),
  @JsonValue(31)
  value_31(31),
  @JsonValue(2)
  value_2(2),
  @JsonValue(6)
  value_6(6),
  @JsonValue(10)
  value_10(10),
  @JsonValue(18)
  value_18(18),
  @JsonValue(30)
  value_30(30),
  @JsonValue(4)
  value_4(4),
  @JsonValue(12)
  value_12(12),
  @JsonValue(20)
  value_20(20),
  @JsonValue(8)
  value_8(8),
  @JsonValue(24)
  value_24(24),
  @JsonValue(16)
  value_16(16);

  final int? value;

  const EducatorKindergartenPermissionEducatorProfile(this.value);
}

enum EducatorKindergartenPermissionMedicalFileForm {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue(1)
  value_1(1),
  @JsonValue(3)
  value_3(3),
  @JsonValue(5)
  value_5(5),
  @JsonValue(9)
  value_9(9),
  @JsonValue(17)
  value_17(17),
  @JsonValue(31)
  value_31(31),
  @JsonValue(2)
  value_2(2),
  @JsonValue(6)
  value_6(6),
  @JsonValue(10)
  value_10(10),
  @JsonValue(18)
  value_18(18),
  @JsonValue(30)
  value_30(30),
  @JsonValue(4)
  value_4(4),
  @JsonValue(12)
  value_12(12),
  @JsonValue(20)
  value_20(20),
  @JsonValue(8)
  value_8(8),
  @JsonValue(24)
  value_24(24),
  @JsonValue(16)
  value_16(16);

  final int? value;

  const EducatorKindergartenPermissionMedicalFileForm(this.value);
}

enum ChildMedicalFileAllergySeverity {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('SEVERE')
  severe('SEVERE'),
  @JsonValue('MODERATE')
  moderate('MODERATE'),
  @JsonValue('MILD')
  mild('MILD');

  final String? value;

  const ChildMedicalFileAllergySeverity(this.value);
}

enum ChildMedicalFileMedicalConditionSeverity {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('SEVERE')
  severe('SEVERE'),
  @JsonValue('MODERATE')
  moderate('MODERATE'),
  @JsonValue('MILD')
  mild('MILD');

  final String? value;

  const ChildMedicalFileMedicalConditionSeverity(this.value);
}

enum ChildSex {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('MALE')
  male('MALE'),
  @JsonValue('FEMALE')
  female('FEMALE');

  final String? value;

  const ChildSex(this.value);
}

enum TrustedPerson$PhoneKind {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('LANDLINE')
  landline('LANDLINE'),
  @JsonValue('CELLPHONE')
  cellphone('CELLPHONE');

  final String? value;

  const TrustedPerson$PhoneKind(this.value);
}

enum TrustedPersonSex {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('MALE')
  male('MALE'),
  @JsonValue('FEMALE')
  female('FEMALE');

  final String? value;

  const TrustedPersonSex(this.value);
}

enum TrustedPersonLink {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('FRIEND')
  friend('FRIEND'),
  @JsonValue('GRAND_PARENT')
  grandParent('GRAND_PARENT'),
  @JsonValue('BROTHER')
  brother('BROTHER'),
  @JsonValue('UNCLE')
  uncle('UNCLE'),
  @JsonValue('DIVORCED_PARENT')
  divorcedParent('DIVORCED_PARENT'),
  @JsonValue('OTHER')
  other('OTHER');

  final String? value;

  const TrustedPersonLink(this.value);
}

enum CommentReactionReaction {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('LIKED')
  liked('LIKED'),
  @JsonValue('DISLIKED')
  disliked('DISLIKED');

  final String? value;

  const CommentReactionReaction(this.value);
}

enum QuestionSubType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Mood')
  mood('Mood'),
  @JsonValue('Sleep')
  sleep('Sleep'),
  @JsonValue('Hunger')
  hunger('Hunger'),
  @JsonValue('Pooping')
  pooping('Pooping'),
  @JsonValue('Activities')
  activities('Activities'),
  @JsonValue('Participation')
  participation('Participation'),
  @JsonValue('Humor')
  humor('Humor');

  final String? value;

  const QuestionSubType(this.value);
}

enum PublicationReactionReaction {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('LIKED')
  liked('LIKED'),
  @JsonValue('DISLIKED')
  disliked('DISLIKED');

  final String? value;

  const PublicationReactionReaction(this.value);
}

enum Educator$EducatorprofileSex {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('MALE')
  male('MALE'),
  @JsonValue('FEMALE')
  female('FEMALE');

  final String? value;

  const Educator$EducatorprofileSex(this.value);
}

enum ChildSearchSex {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('MALE')
  male('MALE'),
  @JsonValue('FEMALE')
  female('FEMALE');

  final String? value;

  const ChildSearchSex(this.value);
}

enum ParentProfile$PhoneKind {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('LANDLINE')
  landline('LANDLINE'),
  @JsonValue('CELLPHONE')
  cellphone('CELLPHONE');

  final String? value;

  const ParentProfile$PhoneKind(this.value);
}

enum ParentProfileSex {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('MALE')
  male('MALE'),
  @JsonValue('FEMALE')
  female('FEMALE');

  final String? value;

  const ParentProfileSex(this.value);
}

enum WholeChildFamilyPrimaryContact {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('PARENT1')
  parent1('PARENT1'),
  @JsonValue('PARENT2')
  parent2('PARENT2');

  final String? value;

  const WholeChildFamilyPrimaryContact(this.value);
}

enum WholeChildSex {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('MALE')
  male('MALE'),
  @JsonValue('FEMALE')
  female('FEMALE');

  final String? value;

  const WholeChildSex(this.value);
}
