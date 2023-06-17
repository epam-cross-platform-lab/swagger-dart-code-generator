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
import 'devlesgenies.enums.swagger.dart' as enums;
export 'devlesgenies.enums.swagger.dart';

part 'devlesgenies.swagger.chopper.dart';
part 'devlesgenies.swagger.g.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class Devlesgenies extends ChopperService {
  static Devlesgenies create({
    ChopperClient? client,
    http.Client? httpClient,
    Authenticator? authenticator,
    Converter? converter,
    Uri? baseUrl,
    Iterable<dynamic>? interceptors,
  }) {
    if (client != null) {
      return _$Devlesgenies(client);
    }

    final newClient = ChopperClient(
        services: [_$Devlesgenies()],
        converter: converter ?? $JsonSerializableConverter(),
        interceptors: interceptors ?? [],
        client: httpClient,
        authenticator: authenticator,
        baseUrl: baseUrl ?? Uri.parse('http://dev.lesgenies.io/api'));
    return _$Devlesgenies(newClient);
  }

  ///Confirms email address using key from path.
  ///@param data
  Future<chopper.Response<CustomVerifyEmail>>
      authenticationAccountConfirmEmailKeyPost({
    required CustomVerifyEmail? data,
    required String? key,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        CustomVerifyEmail, () => CustomVerifyEmail.fromJsonFactory);

    return _authenticationAccountConfirmEmailKeyPost(
        data: data, key: key, cacheControl: cacheControl);
  }

  ///Confirms email address using key from path.
  ///@param data
  @Post(path: '/authentication/account-confirm-email/{key}/')
  Future<chopper.Response<CustomVerifyEmail>>
      _authenticationAccountConfirmEmailKeyPost({
    @Body() required CustomVerifyEmail? data,
    @Path('key') required String? key,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param data
  Future<chopper.Response<Login>> authenticationLoginPost({
    required Login? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(Login, () => Login.fromJsonFactory);

    return _authenticationLoginPost(data: data, cacheControl: cacheControl);
  }

  ///
  ///@param data
  @Post(path: '/authentication/login/')
  Future<chopper.Response<Login>> _authenticationLoginPost({
    @Body() required Login? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Calls Django logout method and delete the Token object
  ///assigned to the current User object.
  Future<chopper.Response> authenticationLogoutGet({String? cacheControl}) {
    return _authenticationLogoutGet(cacheControl: cacheControl);
  }

  ///Calls Django logout method and delete the Token object
  ///assigned to the current User object.
  @Get(path: '/authentication/logout/')
  Future<chopper.Response> _authenticationLogoutGet(
      {@Header('Cache-Control') String? cacheControl});

  ///Calls Django logout method and delete the Token object
  ///assigned to the current User object.
  Future<chopper.Response> authenticationLogoutPost({String? cacheControl}) {
    return _authenticationLogoutPost(cacheControl: cacheControl);
  }

  ///Calls Django logout method and delete the Token object
  ///assigned to the current User object.
  @Post(
    path: '/authentication/logout/',
    optionalBody: true,
  )
  Future<chopper.Response> _authenticationLogoutPost(
      {@Header('Cache-Control') String? cacheControl});

  ///Calls Django Auth SetPasswordForm save method.
  ///@param data
  Future<chopper.Response<PasswordChange>> authenticationPasswordChangePost({
    required PasswordChange? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        PasswordChange, () => PasswordChange.fromJsonFactory);

    return _authenticationPasswordChangePost(
        data: data, cacheControl: cacheControl);
  }

  ///Calls Django Auth SetPasswordForm save method.
  ///@param data
  @Post(path: '/authentication/password/change/')
  Future<chopper.Response<PasswordChange>> _authenticationPasswordChangePost({
    @Body() required PasswordChange? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Confirms and resets password to the one specified in payload.
  ///@param data
  Future<chopper.Response<CustomPasswordResetConfirm>>
      authenticationPasswordResetConfirmUidb64TokenPost({
    required CustomPasswordResetConfirm? data,
    required String? token,
    required String? uidb64,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(CustomPasswordResetConfirm,
        () => CustomPasswordResetConfirm.fromJsonFactory);

    return _authenticationPasswordResetConfirmUidb64TokenPost(
        data: data, token: token, uidb64: uidb64, cacheControl: cacheControl);
  }

  ///Confirms and resets password to the one specified in payload.
  ///@param data
  @Post(path: '/authentication/password/reset-confirm/{uidb64}/{token}/')
  Future<chopper.Response<CustomPasswordResetConfirm>>
      _authenticationPasswordResetConfirmUidb64TokenPost({
    @Body() required CustomPasswordResetConfirm? data,
    @Path('token') required String? token,
    @Path('uidb64') required String? uidb64,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Calls Django Auth PasswordResetForm save method.
  ///@param data
  Future<chopper.Response<PasswordReset>> authenticationPasswordResetPost({
    required PasswordReset? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        PasswordReset, () => PasswordReset.fromJsonFactory);

    return _authenticationPasswordResetPost(
        data: data, cacheControl: cacheControl);
  }

  ///Calls Django Auth PasswordResetForm save method.
  ///@param data
  @Post(path: '/authentication/password/reset/')
  Future<chopper.Response<PasswordReset>> _authenticationPasswordResetPost({
    @Body() required PasswordReset? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///List Educator Educator Profile.
  ///@param user__email
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  Future<chopper.Response<AuthenticationProfileEducatorGet$Response>>
      authenticationProfileEducatorGet({
    String? userEmail,
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(AuthenticationProfileEducatorGet$Response,
        () => AuthenticationProfileEducatorGet$Response.fromJsonFactory);

    return _authenticationProfileEducatorGet(
        userEmail: userEmail,
        page: page,
        pageSize: pageSize,
        cacheControl: cacheControl);
  }

  ///List Educator Educator Profile.
  ///@param user__email
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  @Get(path: '/authentication/profile/educator/')
  Future<chopper.Response<AuthenticationProfileEducatorGet$Response>>
      _authenticationProfileEducatorGet({
    @Query('user__email') String? userEmail,
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Retrieve Educator Educator Profile.
  Future<chopper.Response<EducatorProfile>>
      authenticationProfileEducatorUserGet({
    required String? user,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        EducatorProfile, () => EducatorProfile.fromJsonFactory);

    return _authenticationProfileEducatorUserGet(
        user: user, cacheControl: cacheControl);
  }

  ///Retrieve Educator Educator Profile.
  @Get(path: '/authentication/profile/educator/{user}/')
  Future<chopper.Response<EducatorProfile>>
      _authenticationProfileEducatorUserGet({
    @Path('user') required String? user,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update Educator Educator Profile.
  ///@param data
  Future<chopper.Response<EducatorProfile>>
      authenticationProfileEducatorUserPut({
    required EducatorProfile? data,
    required String? user,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        EducatorProfile, () => EducatorProfile.fromJsonFactory);

    return _authenticationProfileEducatorUserPut(
        data: data, user: user, cacheControl: cacheControl);
  }

  ///Update Educator Educator Profile.
  ///@param data
  @Put(path: '/authentication/profile/educator/{user}/')
  Future<chopper.Response<EducatorProfile>>
      _authenticationProfileEducatorUserPut({
    @Body() required EducatorProfile? data,
    @Path('user') required String? user,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update Educator Educator Profile.
  ///@param data
  Future<chopper.Response<EducatorProfile>>
      authenticationProfileEducatorUserPatch({
    required EducatorProfile? data,
    required String? user,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        EducatorProfile, () => EducatorProfile.fromJsonFactory);

    return _authenticationProfileEducatorUserPatch(
        data: data, user: user, cacheControl: cacheControl);
  }

  ///Update Educator Educator Profile.
  ///@param data
  @Patch(path: '/authentication/profile/educator/{user}/')
  Future<chopper.Response<EducatorProfile>>
      _authenticationProfileEducatorUserPatch({
    @Body() required EducatorProfile? data,
    @Path('user') required String? user,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Retrieve all available Kindergarten profiles.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  Future<chopper.Response<AuthenticationProfileKindergartenGet$Response>>
      authenticationProfileKindergartenGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(AuthenticationProfileKindergartenGet$Response,
        () => AuthenticationProfileKindergartenGet$Response.fromJsonFactory);

    return _authenticationProfileKindergartenGet(
        page: page, pageSize: pageSize, cacheControl: cacheControl);
  }

  ///Retrieve all available Kindergarten profiles.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  @Get(path: '/authentication/profile/kindergarten/')
  Future<chopper.Response<AuthenticationProfileKindergartenGet$Response>>
      _authenticationProfileKindergartenGet({
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Retrieve own Kindergarten profile settings.
  Future<chopper.Response<KindergartenProfileSettings>>
      authenticationProfileKindergartenPublicSettingsProfileUserGet({
    required String? profileUser,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(KindergartenProfileSettings,
        () => KindergartenProfileSettings.fromJsonFactory);

    return _authenticationProfileKindergartenPublicSettingsProfileUserGet(
        profileUser: profileUser, cacheControl: cacheControl);
  }

  ///Retrieve own Kindergarten profile settings.
  @Get(
      path:
          '/authentication/profile/kindergarten/public_settings/{profile__user}/')
  Future<chopper.Response<KindergartenProfileSettings>>
      _authenticationProfileKindergartenPublicSettingsProfileUserGet({
    @Path('profile__user') required String? profileUser,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update own Kindergarten profile settings.
  ///@param data
  Future<chopper.Response<KindergartenProfileSettings>>
      authenticationProfileKindergartenPublicSettingsProfileUserPut({
    required KindergartenProfileSettings? data,
    required String? profileUser,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(KindergartenProfileSettings,
        () => KindergartenProfileSettings.fromJsonFactory);

    return _authenticationProfileKindergartenPublicSettingsProfileUserPut(
        data: data, profileUser: profileUser, cacheControl: cacheControl);
  }

  ///Update own Kindergarten profile settings.
  ///@param data
  @Put(
      path:
          '/authentication/profile/kindergarten/public_settings/{profile__user}/')
  Future<chopper.Response<KindergartenProfileSettings>>
      _authenticationProfileKindergartenPublicSettingsProfileUserPut({
    @Body() required KindergartenProfileSettings? data,
    @Path('profile__user') required String? profileUser,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update own Kindergarten profile settings.
  ///@param data
  Future<chopper.Response<KindergartenProfileSettings>>
      authenticationProfileKindergartenPublicSettingsProfileUserPatch({
    required KindergartenProfileSettings? data,
    required String? profileUser,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(KindergartenProfileSettings,
        () => KindergartenProfileSettings.fromJsonFactory);

    return _authenticationProfileKindergartenPublicSettingsProfileUserPatch(
        data: data, profileUser: profileUser, cacheControl: cacheControl);
  }

  ///Update own Kindergarten profile settings.
  ///@param data
  @Patch(
      path:
          '/authentication/profile/kindergarten/public_settings/{profile__user}/')
  Future<chopper.Response<KindergartenProfileSettings>>
      _authenticationProfileKindergartenPublicSettingsProfileUserPatch({
    @Body() required KindergartenProfileSettings? data,
    @Path('profile__user') required String? profileUser,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Retrieve Kindergarten profile.
  Future<chopper.Response<KindergartenProfileRead>>
      authenticationProfileKindergartenUserGet({
    required String? user,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        KindergartenProfileRead, () => KindergartenProfileRead.fromJsonFactory);

    return _authenticationProfileKindergartenUserGet(
        user: user, cacheControl: cacheControl);
  }

  ///Retrieve Kindergarten profile.
  @Get(path: '/authentication/profile/kindergarten/{user}/')
  Future<chopper.Response<KindergartenProfileRead>>
      _authenticationProfileKindergartenUserGet({
    @Path('user') required String? user,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update own Kindergarten profile.
  ///@param data
  Future<chopper.Response<KindergartenProfile>>
      authenticationProfileKindergartenUserPut({
    required KindergartenProfile? data,
    required String? user,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        KindergartenProfile, () => KindergartenProfile.fromJsonFactory);

    return _authenticationProfileKindergartenUserPut(
        data: data, user: user, cacheControl: cacheControl);
  }

  ///Update own Kindergarten profile.
  ///@param data
  @Put(path: '/authentication/profile/kindergarten/{user}/')
  Future<chopper.Response<KindergartenProfile>>
      _authenticationProfileKindergartenUserPut({
    @Body() required KindergartenProfile? data,
    @Path('user') required String? user,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update own Kindergarten profile.
  ///@param data
  Future<chopper.Response<KindergartenProfile>>
      authenticationProfileKindergartenUserPatch({
    required KindergartenProfile? data,
    required String? user,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        KindergartenProfile, () => KindergartenProfile.fromJsonFactory);

    return _authenticationProfileKindergartenUserPatch(
        data: data, user: user, cacheControl: cacheControl);
  }

  ///Update own Kindergarten profile.
  ///@param data
  @Patch(path: '/authentication/profile/kindergarten/{user}/')
  Future<chopper.Response<KindergartenProfile>>
      _authenticationProfileKindergartenUserPatch({
    @Body() required KindergartenProfile? data,
    @Path('user') required String? user,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Retrieve all available Parent profiles.
  ///@param user__email
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  Future<chopper.Response<AuthenticationProfileParentGet$Response>>
      authenticationProfileParentGet({
    String? userEmail,
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(AuthenticationProfileParentGet$Response,
        () => AuthenticationProfileParentGet$Response.fromJsonFactory);

    return _authenticationProfileParentGet(
        userEmail: userEmail,
        page: page,
        pageSize: pageSize,
        cacheControl: cacheControl);
  }

  ///Retrieve all available Parent profiles.
  ///@param user__email
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  @Get(path: '/authentication/profile/parent/')
  Future<chopper.Response<AuthenticationProfileParentGet$Response>>
      _authenticationProfileParentGet({
    @Query('user__email') String? userEmail,
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Retrieve Parent profile.
  Future<chopper.Response<ParentProfile>> authenticationProfileParentIdGet({
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        ParentProfile, () => ParentProfile.fromJsonFactory);

    return _authenticationProfileParentIdGet(
        id: id, cacheControl: cacheControl);
  }

  ///Retrieve Parent profile.
  @Get(path: '/authentication/profile/parent/{id}/')
  Future<chopper.Response<ParentProfile>> _authenticationProfileParentIdGet({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update own Parent profile.
  ///@param data
  Future<chopper.Response<ParentProfile>> authenticationProfileParentIdPut({
    required ParentProfile? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        ParentProfile, () => ParentProfile.fromJsonFactory);

    return _authenticationProfileParentIdPut(
        data: data, id: id, cacheControl: cacheControl);
  }

  ///Update own Parent profile.
  ///@param data
  @Put(path: '/authentication/profile/parent/{id}/')
  Future<chopper.Response<ParentProfile>> _authenticationProfileParentIdPut({
    @Body() required ParentProfile? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update own Parent profile.
  ///@param data
  Future<chopper.Response<ParentProfile>> authenticationProfileParentIdPatch({
    required ParentProfile? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        ParentProfile, () => ParentProfile.fromJsonFactory);

    return _authenticationProfileParentIdPatch(
        data: data, id: id, cacheControl: cacheControl);
  }

  ///Update own Parent profile.
  ///@param data
  @Patch(path: '/authentication/profile/parent/{id}/')
  Future<chopper.Response<ParentProfile>> _authenticationProfileParentIdPatch({
    @Body() required ParentProfile? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Register a new Educator.
  ///@param data
  Future<chopper.Response> authenticationRegisterEducatorPost({
    required EducatorRegistration? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        EducatorRegistration, () => EducatorRegistration.fromJsonFactory);

    return _authenticationRegisterEducatorPost(
        data: data, cacheControl: cacheControl);
  }

  ///Register a new Educator.
  ///@param data
  @Post(path: '/authentication/register/educator/')
  Future<chopper.Response> _authenticationRegisterEducatorPost({
    @Body() required EducatorRegistration? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Register a new Family with both parents.
  ///@param data
  Future<chopper.Response> authenticationRegisterFamilyPost({
    required FamilyRegistration? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        FamilyRegistration, () => FamilyRegistration.fromJsonFactory);

    return _authenticationRegisterFamilyPost(
        data: data, cacheControl: cacheControl);
  }

  ///Register a new Family with both parents.
  ///@param data
  @Post(path: '/authentication/register/family/')
  Future<chopper.Response> _authenticationRegisterFamilyPost({
    @Body() required FamilyRegistration? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Register a new Family with 1 parent and invite the second parent.
  ///@param data
  Future<chopper.Response> authenticationRegisterFamilyInviteParent2Post({
    required FamilyRegistrationInviteSecondParent? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(FamilyRegistrationInviteSecondParent,
        () => FamilyRegistrationInviteSecondParent.fromJsonFactory);

    return _authenticationRegisterFamilyInviteParent2Post(
        data: data, cacheControl: cacheControl);
  }

  ///Register a new Family with 1 parent and invite the second parent.
  ///@param data
  @Post(path: '/authentication/register/family_invite_parent2/')
  Future<chopper.Response> _authenticationRegisterFamilyInviteParent2Post({
    @Body() required FamilyRegistrationInviteSecondParent? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Invite second parent to existing family.
  ///@param data
  Future<chopper.Response<ParentInvitationInitiate>>
      authenticationRegisterInviteParent2Post({
    required ParentInvitationInitiate? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(ParentInvitationInitiate,
        () => ParentInvitationInitiate.fromJsonFactory);

    return _authenticationRegisterInviteParent2Post(
        data: data, cacheControl: cacheControl);
  }

  ///Invite second parent to existing family.
  ///@param data
  @Post(path: '/authentication/register/invite_parent2/')
  Future<chopper.Response<ParentInvitationInitiate>>
      _authenticationRegisterInviteParent2Post({
    @Body() required ParentInvitationInitiate? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///List the invitations to join a Family made by the user who requests them.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  Future<
          chopper.Response<
              AuthenticationRegisterInviteParent2InvitationsGet$Response>>
      authenticationRegisterInviteParent2InvitationsGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        AuthenticationRegisterInviteParent2InvitationsGet$Response,
        () => AuthenticationRegisterInviteParent2InvitationsGet$Response
            .fromJsonFactory);

    return _authenticationRegisterInviteParent2InvitationsGet(
        page: page, pageSize: pageSize, cacheControl: cacheControl);
  }

  ///List the invitations to join a Family made by the user who requests them.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  @Get(path: '/authentication/register/invite_parent2/invitations')
  Future<
          chopper.Response<
              AuthenticationRegisterInviteParent2InvitationsGet$Response>>
      _authenticationRegisterInviteParent2InvitationsGet({
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Reinvites a parent who was invited to join a Family by Parent or Kindergarten.
  ///@param data
  Future<chopper.Response<ResendParentInvitation>>
      authenticationRegisterInviteParent2ReinviteIdPut({
    required ResendParentInvitation? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        ResendParentInvitation, () => ResendParentInvitation.fromJsonFactory);

    return _authenticationRegisterInviteParent2ReinviteIdPut(
        data: data, id: id, cacheControl: cacheControl);
  }

  ///Reinvites a parent who was invited to join a Family by Parent or Kindergarten.
  ///@param data
  @Put(path: '/authentication/register/invite_parent2/reinvite/{id}')
  Future<chopper.Response<ResendParentInvitation>>
      _authenticationRegisterInviteParent2ReinviteIdPut({
    @Body() required ResendParentInvitation? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Reinvites a parent who was invited to join a Family by Parent or Kindergarten.
  ///@param data
  Future<chopper.Response<ResendParentInvitation>>
      authenticationRegisterInviteParent2ReinviteIdPatch({
    required ResendParentInvitation? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        ResendParentInvitation, () => ResendParentInvitation.fromJsonFactory);

    return _authenticationRegisterInviteParent2ReinviteIdPatch(
        data: data, id: id, cacheControl: cacheControl);
  }

  ///Reinvites a parent who was invited to join a Family by Parent or Kindergarten.
  ///@param data
  @Patch(path: '/authentication/register/invite_parent2/reinvite/{id}')
  Future<chopper.Response<ResendParentInvitation>>
      _authenticationRegisterInviteParent2ReinviteIdPatch({
    @Body() required ResendParentInvitation? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Confirms the invitation of parent.
  Future<chopper.Response<ConfirmParentInvitation>>
      authenticationRegisterInviteParent2KeyConfirmedGet({
    required String? key,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        ConfirmParentInvitation, () => ConfirmParentInvitation.fromJsonFactory);

    return _authenticationRegisterInviteParent2KeyConfirmedGet(
        key: key, cacheControl: cacheControl);
  }

  ///Confirms the invitation of parent.
  @Get(path: '/authentication/register/invite_parent2/{key}/confirmed')
  Future<chopper.Response<ConfirmParentInvitation>>
      _authenticationRegisterInviteParent2KeyConfirmedGet({
    @Path('key') required String? key,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Register a new Kindergarten.
  ///@param data
  Future<chopper.Response> authenticationRegisterKindergartenPost({
    required KindergartenRegistration? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(KindergartenRegistration,
        () => KindergartenRegistration.fromJsonFactory);

    return _authenticationRegisterKindergartenPost(
        data: data, cacheControl: cacheControl);
  }

  ///Register a new Kindergarten.
  ///@param data
  @Post(path: '/authentication/register/kindergarten/')
  Future<chopper.Response> _authenticationRegisterKindergartenPost({
    @Body() required KindergartenRegistration? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Create or add a new educator by kindergarten
  ///@param data
  Future<chopper.Response>
      authenticationRegisterKindergartenInitiatedEducatorPost({
    required EducatorContractRegistration? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(EducatorContractRegistration,
        () => EducatorContractRegistration.fromJsonFactory);

    return _authenticationRegisterKindergartenInitiatedEducatorPost(
        data: data, cacheControl: cacheControl);
  }

  ///Create or add a new educator by kindergarten
  ///@param data
  @Post(path: '/authentication/register/kindergarten_initiated/educator')
  Future<chopper.Response>
      _authenticationRegisterKindergartenInitiatedEducatorPost({
    @Body() required EducatorContractRegistration? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Check invitations sent by the Kindergarten to the Educator
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  Future<
          chopper.Response<
              AuthenticationRegisterKindergartenInitiatedEducatorInvitationsGet$Response>>
      authenticationRegisterKindergartenInitiatedEducatorInvitationsGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        AuthenticationRegisterKindergartenInitiatedEducatorInvitationsGet$Response,
        () =>
            AuthenticationRegisterKindergartenInitiatedEducatorInvitationsGet$Response
                .fromJsonFactory);

    return _authenticationRegisterKindergartenInitiatedEducatorInvitationsGet(
        page: page, pageSize: pageSize, cacheControl: cacheControl);
  }

  ///Check invitations sent by the Kindergarten to the Educator
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  @Get(
      path:
          '/authentication/register/kindergarten_initiated/educator/invitations/')
  Future<
          chopper.Response<
              AuthenticationRegisterKindergartenInitiatedEducatorInvitationsGet$Response>>
      _authenticationRegisterKindergartenInitiatedEducatorInvitationsGet({
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Resend educator signup confirmation by the Kindergarten
  ///@param data
  Future<chopper.Response<ResendEducatorSignupByKindergartenEmailConfirmation>>
      authenticationRegisterKindergartenInitiatedEducatorReinviteEducatorIdPatch({
    required ResendEducatorSignupByKindergartenEmailConfirmation? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        ResendEducatorSignupByKindergartenEmailConfirmation,
        () => ResendEducatorSignupByKindergartenEmailConfirmation
            .fromJsonFactory);

    return _authenticationRegisterKindergartenInitiatedEducatorReinviteEducatorIdPatch(
        data: data, id: id, cacheControl: cacheControl);
  }

  ///Resend educator signup confirmation by the Kindergarten
  ///@param data
  @Patch(
      path:
          '/authentication/register/kindergarten_initiated/educator/reinvite_educator/{id}')
  Future<chopper.Response<ResendEducatorSignupByKindergartenEmailConfirmation>>
      _authenticationRegisterKindergartenInitiatedEducatorReinviteEducatorIdPatch({
    @Body() required ResendEducatorSignupByKindergartenEmailConfirmation? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Confirm the new Educator account by the Educator
  Future<chopper.Response<ConfirmEducatorSignup>>
      authenticationRegisterKindergartenInitiatedEducatorKeyConfirmedGet({
    required String? key,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        ConfirmEducatorSignup, () => ConfirmEducatorSignup.fromJsonFactory);

    return _authenticationRegisterKindergartenInitiatedEducatorKeyConfirmedGet(
        key: key, cacheControl: cacheControl);
  }

  ///Confirm the new Educator account by the Educator
  @Get(
      path:
          '/authentication/register/kindergarten_initiated/educator/{key}/confirmed')
  Future<chopper.Response<ConfirmEducatorSignup>>
      _authenticationRegisterKindergartenInitiatedEducatorKeyConfirmedGet({
    @Path('key') required String? key,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Educator fill new password for the new account
  ///@param data
  Future<chopper.Response>
      authenticationRegisterKindergartenInitiatedEducatorTokenPost({
    required FinalizeEducatorSignup? data,
    required String? token,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        FinalizeEducatorSignup, () => FinalizeEducatorSignup.fromJsonFactory);

    return _authenticationRegisterKindergartenInitiatedEducatorTokenPost(
        data: data, token: token, cacheControl: cacheControl);
  }

  ///Educator fill new password for the new account
  ///@param data
  @Post(
      path: '/authentication/register/kindergarten_initiated/educator/{token}')
  Future<chopper.Response>
      _authenticationRegisterKindergartenInitiatedEducatorTokenPost({
    @Body() required FinalizeEducatorSignup? data,
    @Path('token') required String? token,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Create new family by kindergarten.
  ///@param data
  Future<chopper.Response>
      authenticationRegisterKindergartenInitiatedFamilyPost({
    required InscriptionRegistration? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        InscriptionRegistration, () => InscriptionRegistration.fromJsonFactory);

    return _authenticationRegisterKindergartenInitiatedFamilyPost(
        data: data, cacheControl: cacheControl);
  }

  ///Create new family by kindergarten.
  ///@param data
  @Post(path: '/authentication/register/kindergarten_initiated/family')
  Future<chopper.Response>
      _authenticationRegisterKindergartenInitiatedFamilyPost({
    @Body() required InscriptionRegistration? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Check invitations sent by the Kindergarten to the Parent.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  Future<
          chopper.Response<
              AuthenticationRegisterKindergartenInitiatedFamilyInvitationsGet$Response>>
      authenticationRegisterKindergartenInitiatedFamilyInvitationsGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        AuthenticationRegisterKindergartenInitiatedFamilyInvitationsGet$Response,
        () =>
            AuthenticationRegisterKindergartenInitiatedFamilyInvitationsGet$Response
                .fromJsonFactory);

    return _authenticationRegisterKindergartenInitiatedFamilyInvitationsGet(
        page: page, pageSize: pageSize, cacheControl: cacheControl);
  }

  ///Check invitations sent by the Kindergarten to the Parent.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  @Get(
      path:
          '/authentication/register/kindergarten_initiated/family/invitations/')
  Future<
          chopper.Response<
              AuthenticationRegisterKindergartenInitiatedFamilyInvitationsGet$Response>>
      _authenticationRegisterKindergartenInitiatedFamilyInvitationsGet({
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Resend parent signup confirmation by the Kindergarten to all parents of Family.
  ///@param data
  Future<chopper.Response<ResendFamilySignupByKindergartenEmailConfirmation>>
      authenticationRegisterKindergartenInitiatedFamilyReinviteFamilyInscriptionPatch({
    required ResendFamilySignupByKindergartenEmailConfirmation? data,
    required String? inscription,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        ResendFamilySignupByKindergartenEmailConfirmation,
        () =>
            ResendFamilySignupByKindergartenEmailConfirmation.fromJsonFactory);

    return _authenticationRegisterKindergartenInitiatedFamilyReinviteFamilyInscriptionPatch(
        data: data, inscription: inscription, cacheControl: cacheControl);
  }

  ///Resend parent signup confirmation by the Kindergarten to all parents of Family.
  ///@param data
  @Patch(
      path:
          '/authentication/register/kindergarten_initiated/family/reinvite_family/{inscription}')
  Future<chopper.Response<ResendFamilySignupByKindergartenEmailConfirmation>>
      _authenticationRegisterKindergartenInitiatedFamilyReinviteFamilyInscriptionPatch({
    @Body() required ResendFamilySignupByKindergartenEmailConfirmation? data,
    @Path('inscription') required String? inscription,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Resend parent signup confirmation by the Kindergarten.
  ///@param data
  Future<chopper.Response<ResendParentSignupByKindergartenEmailConfirmation>>
      authenticationRegisterKindergartenInitiatedFamilyReinviteParentIdPatch({
    required ResendParentSignupByKindergartenEmailConfirmation? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        ResendParentSignupByKindergartenEmailConfirmation,
        () =>
            ResendParentSignupByKindergartenEmailConfirmation.fromJsonFactory);

    return _authenticationRegisterKindergartenInitiatedFamilyReinviteParentIdPatch(
        data: data, id: id, cacheControl: cacheControl);
  }

  ///Resend parent signup confirmation by the Kindergarten.
  ///@param data
  @Patch(
      path:
          '/authentication/register/kindergarten_initiated/family/reinvite_parent/{id}')
  Future<chopper.Response<ResendParentSignupByKindergartenEmailConfirmation>>
      _authenticationRegisterKindergartenInitiatedFamilyReinviteParentIdPatch({
    @Body() required ResendParentSignupByKindergartenEmailConfirmation? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Confirm signed up family by Kindergarten using email invitation.
  Future<chopper.Response<ConfirmParentSignup>>
      authenticationRegisterKindergartenInitiatedFamilyKeyConfirmedGet({
    required String? key,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        ConfirmParentSignup, () => ConfirmParentSignup.fromJsonFactory);

    return _authenticationRegisterKindergartenInitiatedFamilyKeyConfirmedGet(
        key: key, cacheControl: cacheControl);
  }

  ///Confirm signed up family by Kindergarten using email invitation.
  @Get(
      path:
          '/authentication/register/kindergarten_initiated/family/{key}/confirmed')
  Future<chopper.Response<ConfirmParentSignup>>
      _authenticationRegisterKindergartenInitiatedFamilyKeyConfirmedGet({
    @Path('key') required String? key,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Parent fills new password for the new account.
  ///@param data
  Future<chopper.Response>
      authenticationRegisterKindergartenInitiatedFamilyTokenPost({
    required FinalizeParentSignup? data,
    required String? token,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        FinalizeParentSignup, () => FinalizeParentSignup.fromJsonFactory);

    return _authenticationRegisterKindergartenInitiatedFamilyTokenPost(
        data: data, token: token, cacheControl: cacheControl);
  }

  ///Parent fills new password for the new account.
  ///@param data
  @Post(path: '/authentication/register/kindergarten_initiated/family/{token}')
  Future<chopper.Response>
      _authenticationRegisterKindergartenInitiatedFamilyTokenPost({
    @Body() required FinalizeParentSignup? data,
    @Path('token') required String? token,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Register a new Parent after being invited by Parent or Kindergarten.
  ///@param data
  Future<chopper.Response<ParentInvitationRegistration>>
      authenticationRegisterParent2TokenPost({
    required ParentInvitationRegistration? data,
    required String? token,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(ParentInvitationRegistration,
        () => ParentInvitationRegistration.fromJsonFactory);

    return _authenticationRegisterParent2TokenPost(
        data: data, token: token, cacheControl: cacheControl);
  }

  ///Register a new Parent after being invited by Parent or Kindergarten.
  ///@param data
  @Post(path: '/authentication/register/parent2/{token}/')
  Future<chopper.Response<ParentInvitationRegistration>>
      _authenticationRegisterParent2TokenPost({
    @Body() required ParentInvitationRegistration? data,
    @Path('token') required String? token,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Resend email verification.
  ///@param data
  Future<chopper.Response<CustomResendEmailVerification>>
      authenticationResendEmailConfirmationPost({
    required CustomResendEmailVerification? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(CustomResendEmailVerification,
        () => CustomResendEmailVerification.fromJsonFactory);

    return _authenticationResendEmailConfirmationPost(
        data: data, cacheControl: cacheControl);
  }

  ///Resend email verification.
  ///@param data
  @Post(path: '/authentication/resend-email-confirmation/')
  Future<chopper.Response<CustomResendEmailVerification>>
      _authenticationResendEmailConfirmationPost({
    @Body() required CustomResendEmailVerification? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param data
  Future<chopper.Response<CookieTokenRefresh>> authenticationTokenRefreshPost({
    required CookieTokenRefresh? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        CookieTokenRefresh, () => CookieTokenRefresh.fromJsonFactory);

    return _authenticationTokenRefreshPost(
        data: data, cacheControl: cacheControl);
  }

  ///
  ///@param data
  @Post(path: '/authentication/token/refresh/')
  Future<chopper.Response<CookieTokenRefresh>> _authenticationTokenRefreshPost({
    @Body() required CookieTokenRefresh? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param data
  Future<chopper.Response<TokenVerify>> authenticationTokenVerifyPost({
    required TokenVerify? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        TokenVerify, () => TokenVerify.fromJsonFactory);

    return _authenticationTokenVerifyPost(
        data: data, cacheControl: cacheControl);
  }

  ///
  ///@param data
  @Post(path: '/authentication/token/verify/')
  Future<chopper.Response<TokenVerify>> _authenticationTokenVerifyPost({
    @Body() required TokenVerify? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///List Child Child.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  Future<chopper.Response<ChildChildGet$Response>> childChildGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        ChildChildGet$Response, () => ChildChildGet$Response.fromJsonFactory);

    return _childChildGet(
        page: page, pageSize: pageSize, cacheControl: cacheControl);
  }

  ///List Child Child.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  @Get(path: '/child/child/')
  Future<chopper.Response<ChildChildGet$Response>> _childChildGet({
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Create Child Child.
  ///@param data
  Future<chopper.Response<Child>> childChildPost({
    required Child? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(Child, () => Child.fromJsonFactory);

    return _childChildPost(data: data, cacheControl: cacheControl);
  }

  ///Create Child Child.
  ///@param data
  @Post(path: '/child/child/')
  Future<chopper.Response<Child>> _childChildPost({
    @Body() required Child? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Retrieve Child Child.
  Future<chopper.Response<Child>> childChildIdGet({
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(Child, () => Child.fromJsonFactory);

    return _childChildIdGet(id: id, cacheControl: cacheControl);
  }

  ///Retrieve Child Child.
  @Get(path: '/child/child/{id}/')
  Future<chopper.Response<Child>> _childChildIdGet({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update Child Child.
  ///@param data
  Future<chopper.Response<Child>> childChildIdPut({
    required Child? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(Child, () => Child.fromJsonFactory);

    return _childChildIdPut(data: data, id: id, cacheControl: cacheControl);
  }

  ///Update Child Child.
  ///@param data
  @Put(path: '/child/child/{id}/')
  Future<chopper.Response<Child>> _childChildIdPut({
    @Body() required Child? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update Child Child.
  ///@param data
  Future<chopper.Response<Child>> childChildIdPatch({
    required Child? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(Child, () => Child.fromJsonFactory);

    return _childChildIdPatch(data: data, id: id, cacheControl: cacheControl);
  }

  ///Update Child Child.
  ///@param data
  @Patch(path: '/child/child/{id}/')
  Future<chopper.Response<Child>> _childChildIdPatch({
    @Body() required Child? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Delete Child Child.
  Future<chopper.Response> childChildIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    return _childChildIdDelete(id: id, cacheControl: cacheControl);
  }

  ///Delete Child Child.
  @Delete(path: '/child/child/{id}/')
  Future<chopper.Response> _childChildIdDelete({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///List Child : Child Note Child Note.
  ///@param ordering Which field to use when ordering the results.
  ///@param child_id
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  Future<chopper.Response<ChildChildNotesGet$Response>> childChildNotesGet({
    String? ordering,
    String? childId,
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(ChildChildNotesGet$Response,
        () => ChildChildNotesGet$Response.fromJsonFactory);

    return _childChildNotesGet(
        ordering: ordering,
        childId: childId,
        page: page,
        pageSize: pageSize,
        cacheControl: cacheControl);
  }

  ///List Child : Child Note Child Note.
  ///@param ordering Which field to use when ordering the results.
  ///@param child_id
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  @Get(path: '/child/child_notes/')
  Future<chopper.Response<ChildChildNotesGet$Response>> _childChildNotesGet({
    @Query('ordering') String? ordering,
    @Query('child_id') String? childId,
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Create Child : Child Note Child Note.
  ///@param data
  Future<chopper.Response<ChildNotes>> childChildNotesPost({
    required ChildNotes? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(ChildNotes, () => ChildNotes.fromJsonFactory);

    return _childChildNotesPost(data: data, cacheControl: cacheControl);
  }

  ///Create Child : Child Note Child Note.
  ///@param data
  @Post(path: '/child/child_notes/')
  Future<chopper.Response<ChildNotes>> _childChildNotesPost({
    @Body() required ChildNotes? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Retrieve Child : Child Note Child Note.
  Future<chopper.Response<ChildNotes>> childChildNotesIdGet({
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(ChildNotes, () => ChildNotes.fromJsonFactory);

    return _childChildNotesIdGet(id: id, cacheControl: cacheControl);
  }

  ///Retrieve Child : Child Note Child Note.
  @Get(path: '/child/child_notes/{id}/')
  Future<chopper.Response<ChildNotes>> _childChildNotesIdGet({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update Child : Child Note Child Note.
  ///@param data
  Future<chopper.Response<ChildNotes>> childChildNotesIdPut({
    required ChildNotes? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(ChildNotes, () => ChildNotes.fromJsonFactory);

    return _childChildNotesIdPut(
        data: data, id: id, cacheControl: cacheControl);
  }

  ///Update Child : Child Note Child Note.
  ///@param data
  @Put(path: '/child/child_notes/{id}/')
  Future<chopper.Response<ChildNotes>> _childChildNotesIdPut({
    @Body() required ChildNotes? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update Child : Child Note Child Note.
  ///@param data
  Future<chopper.Response<ChildNotes>> childChildNotesIdPatch({
    required ChildNotes? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(ChildNotes, () => ChildNotes.fromJsonFactory);

    return _childChildNotesIdPatch(
        data: data, id: id, cacheControl: cacheControl);
  }

  ///Update Child : Child Note Child Note.
  ///@param data
  @Patch(path: '/child/child_notes/{id}/')
  Future<chopper.Response<ChildNotes>> _childChildNotesIdPatch({
    @Body() required ChildNotes? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Delete Child : Child Note Child Note.
  Future<chopper.Response> childChildNotesIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    return _childChildNotesIdDelete(id: id, cacheControl: cacheControl);
  }

  ///Delete Child : Child Note Child Note.
  @Delete(path: '/child/child_notes/{id}/')
  Future<chopper.Response> _childChildNotesIdDelete({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///List Child : Medical File Medical File.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  Future<chopper.Response<ChildMedicalFileGet$Response>> childMedicalFileGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(ChildMedicalFileGet$Response,
        () => ChildMedicalFileGet$Response.fromJsonFactory);

    return _childMedicalFileGet(
        page: page, pageSize: pageSize, cacheControl: cacheControl);
  }

  ///List Child : Medical File Medical File.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  @Get(path: '/child/medical_file/')
  Future<chopper.Response<ChildMedicalFileGet$Response>> _childMedicalFileGet({
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Header('Cache-Control') String? cacheControl,
  });

  ///List Child : Medical File : Allergy Allergy.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  Future<chopper.Response<ChildMedicalFileAllergyGet$Response>>
      childMedicalFileAllergyGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(ChildMedicalFileAllergyGet$Response,
        () => ChildMedicalFileAllergyGet$Response.fromJsonFactory);

    return _childMedicalFileAllergyGet(
        page: page, pageSize: pageSize, cacheControl: cacheControl);
  }

  ///List Child : Medical File : Allergy Allergy.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  @Get(path: '/child/medical_file/allergy/')
  Future<chopper.Response<ChildMedicalFileAllergyGet$Response>>
      _childMedicalFileAllergyGet({
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Create Child : Medical File : Allergy Allergy.
  ///@param data
  Future<chopper.Response<ChildMedicalFileAllergy>>
      childMedicalFileAllergyPost({
    required ChildMedicalFileAllergy? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        ChildMedicalFileAllergy, () => ChildMedicalFileAllergy.fromJsonFactory);

    return _childMedicalFileAllergyPost(data: data, cacheControl: cacheControl);
  }

  ///Create Child : Medical File : Allergy Allergy.
  ///@param data
  @Post(path: '/child/medical_file/allergy/')
  Future<chopper.Response<ChildMedicalFileAllergy>>
      _childMedicalFileAllergyPost({
    @Body() required ChildMedicalFileAllergy? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Retrieve Child : Medical File : Allergy Allergy.
  Future<chopper.Response<ChildMedicalFileAllergy>>
      childMedicalFileAllergyIdGet({
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        ChildMedicalFileAllergy, () => ChildMedicalFileAllergy.fromJsonFactory);

    return _childMedicalFileAllergyIdGet(id: id, cacheControl: cacheControl);
  }

  ///Retrieve Child : Medical File : Allergy Allergy.
  @Get(path: '/child/medical_file/allergy/{id}/')
  Future<chopper.Response<ChildMedicalFileAllergy>>
      _childMedicalFileAllergyIdGet({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update Child : Medical File : Allergy Allergy.
  ///@param data
  Future<chopper.Response<ChildMedicalFileAllergy>>
      childMedicalFileAllergyIdPut({
    required ChildMedicalFileAllergy? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        ChildMedicalFileAllergy, () => ChildMedicalFileAllergy.fromJsonFactory);

    return _childMedicalFileAllergyIdPut(
        data: data, id: id, cacheControl: cacheControl);
  }

  ///Update Child : Medical File : Allergy Allergy.
  ///@param data
  @Put(path: '/child/medical_file/allergy/{id}/')
  Future<chopper.Response<ChildMedicalFileAllergy>>
      _childMedicalFileAllergyIdPut({
    @Body() required ChildMedicalFileAllergy? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update Child : Medical File : Allergy Allergy.
  ///@param data
  Future<chopper.Response<ChildMedicalFileAllergy>>
      childMedicalFileAllergyIdPatch({
    required ChildMedicalFileAllergy? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        ChildMedicalFileAllergy, () => ChildMedicalFileAllergy.fromJsonFactory);

    return _childMedicalFileAllergyIdPatch(
        data: data, id: id, cacheControl: cacheControl);
  }

  ///Update Child : Medical File : Allergy Allergy.
  ///@param data
  @Patch(path: '/child/medical_file/allergy/{id}/')
  Future<chopper.Response<ChildMedicalFileAllergy>>
      _childMedicalFileAllergyIdPatch({
    @Body() required ChildMedicalFileAllergy? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Delete Child : Medical File : Allergy Allergy.
  Future<chopper.Response> childMedicalFileAllergyIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    return _childMedicalFileAllergyIdDelete(id: id, cacheControl: cacheControl);
  }

  ///Delete Child : Medical File : Allergy Allergy.
  @Delete(path: '/child/medical_file/allergy/{id}/')
  Future<chopper.Response> _childMedicalFileAllergyIdDelete({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///List Child : Medical File : Allergy Default Allergy.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  Future<chopper.Response<ChildMedicalFileDefaultAllergyGet$Response>>
      childMedicalFileDefaultAllergyGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(ChildMedicalFileDefaultAllergyGet$Response,
        () => ChildMedicalFileDefaultAllergyGet$Response.fromJsonFactory);

    return _childMedicalFileDefaultAllergyGet(
        page: page, pageSize: pageSize, cacheControl: cacheControl);
  }

  ///List Child : Medical File : Allergy Default Allergy.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  @Get(path: '/child/medical_file/default_allergy/')
  Future<chopper.Response<ChildMedicalFileDefaultAllergyGet$Response>>
      _childMedicalFileDefaultAllergyGet({
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Retrieve Child : Medical File : Allergy Default Allergy.
  Future<chopper.Response<ChildMedicalFileDefaultAllergy>>
      childMedicalFileDefaultAllergyIdGet({
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(ChildMedicalFileDefaultAllergy,
        () => ChildMedicalFileDefaultAllergy.fromJsonFactory);

    return _childMedicalFileDefaultAllergyIdGet(
        id: id, cacheControl: cacheControl);
  }

  ///Retrieve Child : Medical File : Allergy Default Allergy.
  @Get(path: '/child/medical_file/default_allergy/{id}/')
  Future<chopper.Response<ChildMedicalFileDefaultAllergy>>
      _childMedicalFileDefaultAllergyIdGet({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///List Child : Medical File : Medical Condition Default Medical Condition.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  Future<chopper.Response<ChildMedicalFileDefaultMedicalConditionGet$Response>>
      childMedicalFileDefaultMedicalConditionGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        ChildMedicalFileDefaultMedicalConditionGet$Response,
        () => ChildMedicalFileDefaultMedicalConditionGet$Response
            .fromJsonFactory);

    return _childMedicalFileDefaultMedicalConditionGet(
        page: page, pageSize: pageSize, cacheControl: cacheControl);
  }

  ///List Child : Medical File : Medical Condition Default Medical Condition.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  @Get(path: '/child/medical_file/default_medical_condition/')
  Future<chopper.Response<ChildMedicalFileDefaultMedicalConditionGet$Response>>
      _childMedicalFileDefaultMedicalConditionGet({
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Retrieve Child : Medical File : Medical Condition Default Medical Condition.
  Future<chopper.Response<ChildMedicalFileDefaultMedicalCondition>>
      childMedicalFileDefaultMedicalConditionIdGet({
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(ChildMedicalFileDefaultMedicalCondition,
        () => ChildMedicalFileDefaultMedicalCondition.fromJsonFactory);

    return _childMedicalFileDefaultMedicalConditionIdGet(
        id: id, cacheControl: cacheControl);
  }

  ///Retrieve Child : Medical File : Medical Condition Default Medical Condition.
  @Get(path: '/child/medical_file/default_medical_condition/{id}/')
  Future<chopper.Response<ChildMedicalFileDefaultMedicalCondition>>
      _childMedicalFileDefaultMedicalConditionIdGet({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///List Child : Medical File : Medication Default Medication.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  Future<chopper.Response<ChildMedicalFileDefaultMedicationGet$Response>>
      childMedicalFileDefaultMedicationGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(ChildMedicalFileDefaultMedicationGet$Response,
        () => ChildMedicalFileDefaultMedicationGet$Response.fromJsonFactory);

    return _childMedicalFileDefaultMedicationGet(
        page: page, pageSize: pageSize, cacheControl: cacheControl);
  }

  ///List Child : Medical File : Medication Default Medication.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  @Get(path: '/child/medical_file/default_medication/')
  Future<chopper.Response<ChildMedicalFileDefaultMedicationGet$Response>>
      _childMedicalFileDefaultMedicationGet({
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Retrieve Child : Medical File : Medication Default Medication.
  Future<chopper.Response<ChildMedicalFileDefaultMedication>>
      childMedicalFileDefaultMedicationIdGet({
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(ChildMedicalFileDefaultMedication,
        () => ChildMedicalFileDefaultMedication.fromJsonFactory);

    return _childMedicalFileDefaultMedicationIdGet(
        id: id, cacheControl: cacheControl);
  }

  ///Retrieve Child : Medical File : Medication Default Medication.
  @Get(path: '/child/medical_file/default_medication/{id}/')
  Future<chopper.Response<ChildMedicalFileDefaultMedication>>
      _childMedicalFileDefaultMedicationIdGet({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///List Child : Medical File : Medical Condition Medical Condition.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  Future<chopper.Response<ChildMedicalFileMedicalConditionGet$Response>>
      childMedicalFileMedicalConditionGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(ChildMedicalFileMedicalConditionGet$Response,
        () => ChildMedicalFileMedicalConditionGet$Response.fromJsonFactory);

    return _childMedicalFileMedicalConditionGet(
        page: page, pageSize: pageSize, cacheControl: cacheControl);
  }

  ///List Child : Medical File : Medical Condition Medical Condition.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  @Get(path: '/child/medical_file/medical_condition/')
  Future<chopper.Response<ChildMedicalFileMedicalConditionGet$Response>>
      _childMedicalFileMedicalConditionGet({
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Create Child : Medical File : Medical Condition Medical Condition.
  ///@param data
  Future<chopper.Response<ChildMedicalFileMedicalCondition>>
      childMedicalFileMedicalConditionPost({
    required ChildMedicalFileMedicalCondition? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(ChildMedicalFileMedicalCondition,
        () => ChildMedicalFileMedicalCondition.fromJsonFactory);

    return _childMedicalFileMedicalConditionPost(
        data: data, cacheControl: cacheControl);
  }

  ///Create Child : Medical File : Medical Condition Medical Condition.
  ///@param data
  @Post(path: '/child/medical_file/medical_condition/')
  Future<chopper.Response<ChildMedicalFileMedicalCondition>>
      _childMedicalFileMedicalConditionPost({
    @Body() required ChildMedicalFileMedicalCondition? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Retrieve Child : Medical File : Medical Condition Medical Condition.
  Future<chopper.Response<ChildMedicalFileMedicalCondition>>
      childMedicalFileMedicalConditionIdGet({
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(ChildMedicalFileMedicalCondition,
        () => ChildMedicalFileMedicalCondition.fromJsonFactory);

    return _childMedicalFileMedicalConditionIdGet(
        id: id, cacheControl: cacheControl);
  }

  ///Retrieve Child : Medical File : Medical Condition Medical Condition.
  @Get(path: '/child/medical_file/medical_condition/{id}/')
  Future<chopper.Response<ChildMedicalFileMedicalCondition>>
      _childMedicalFileMedicalConditionIdGet({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update Child : Medical File : Medical Condition Medical Condition.
  ///@param data
  Future<chopper.Response<ChildMedicalFileMedicalCondition>>
      childMedicalFileMedicalConditionIdPut({
    required ChildMedicalFileMedicalCondition? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(ChildMedicalFileMedicalCondition,
        () => ChildMedicalFileMedicalCondition.fromJsonFactory);

    return _childMedicalFileMedicalConditionIdPut(
        data: data, id: id, cacheControl: cacheControl);
  }

  ///Update Child : Medical File : Medical Condition Medical Condition.
  ///@param data
  @Put(path: '/child/medical_file/medical_condition/{id}/')
  Future<chopper.Response<ChildMedicalFileMedicalCondition>>
      _childMedicalFileMedicalConditionIdPut({
    @Body() required ChildMedicalFileMedicalCondition? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update Child : Medical File : Medical Condition Medical Condition.
  ///@param data
  Future<chopper.Response<ChildMedicalFileMedicalCondition>>
      childMedicalFileMedicalConditionIdPatch({
    required ChildMedicalFileMedicalCondition? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(ChildMedicalFileMedicalCondition,
        () => ChildMedicalFileMedicalCondition.fromJsonFactory);

    return _childMedicalFileMedicalConditionIdPatch(
        data: data, id: id, cacheControl: cacheControl);
  }

  ///Update Child : Medical File : Medical Condition Medical Condition.
  ///@param data
  @Patch(path: '/child/medical_file/medical_condition/{id}/')
  Future<chopper.Response<ChildMedicalFileMedicalCondition>>
      _childMedicalFileMedicalConditionIdPatch({
    @Body() required ChildMedicalFileMedicalCondition? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Delete Child : Medical File : Medical Condition Medical Condition.
  Future<chopper.Response> childMedicalFileMedicalConditionIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    return _childMedicalFileMedicalConditionIdDelete(
        id: id, cacheControl: cacheControl);
  }

  ///Delete Child : Medical File : Medical Condition Medical Condition.
  @Delete(path: '/child/medical_file/medical_condition/{id}/')
  Future<chopper.Response> _childMedicalFileMedicalConditionIdDelete({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///List Child : Medical File : Medication Medication.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  Future<chopper.Response<ChildMedicalFileMedicationGet$Response>>
      childMedicalFileMedicationGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(ChildMedicalFileMedicationGet$Response,
        () => ChildMedicalFileMedicationGet$Response.fromJsonFactory);

    return _childMedicalFileMedicationGet(
        page: page, pageSize: pageSize, cacheControl: cacheControl);
  }

  ///List Child : Medical File : Medication Medication.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  @Get(path: '/child/medical_file/medication/')
  Future<chopper.Response<ChildMedicalFileMedicationGet$Response>>
      _childMedicalFileMedicationGet({
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Create Child : Medical File : Medication Medication.
  ///@param data
  Future<chopper.Response<ChildMedicalFileMedication>>
      childMedicalFileMedicationPost({
    required ChildMedicalFileMedication? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(ChildMedicalFileMedication,
        () => ChildMedicalFileMedication.fromJsonFactory);

    return _childMedicalFileMedicationPost(
        data: data, cacheControl: cacheControl);
  }

  ///Create Child : Medical File : Medication Medication.
  ///@param data
  @Post(path: '/child/medical_file/medication/')
  Future<chopper.Response<ChildMedicalFileMedication>>
      _childMedicalFileMedicationPost({
    @Body() required ChildMedicalFileMedication? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Retrieve Child : Medical File : Medication Medication.
  Future<chopper.Response<ChildMedicalFileMedication>>
      childMedicalFileMedicationIdGet({
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(ChildMedicalFileMedication,
        () => ChildMedicalFileMedication.fromJsonFactory);

    return _childMedicalFileMedicationIdGet(id: id, cacheControl: cacheControl);
  }

  ///Retrieve Child : Medical File : Medication Medication.
  @Get(path: '/child/medical_file/medication/{id}/')
  Future<chopper.Response<ChildMedicalFileMedication>>
      _childMedicalFileMedicationIdGet({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update Child : Medical File : Medication Medication.
  ///@param data
  Future<chopper.Response<ChildMedicalFileMedication>>
      childMedicalFileMedicationIdPut({
    required ChildMedicalFileMedication? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(ChildMedicalFileMedication,
        () => ChildMedicalFileMedication.fromJsonFactory);

    return _childMedicalFileMedicationIdPut(
        data: data, id: id, cacheControl: cacheControl);
  }

  ///Update Child : Medical File : Medication Medication.
  ///@param data
  @Put(path: '/child/medical_file/medication/{id}/')
  Future<chopper.Response<ChildMedicalFileMedication>>
      _childMedicalFileMedicationIdPut({
    @Body() required ChildMedicalFileMedication? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update Child : Medical File : Medication Medication.
  ///@param data
  Future<chopper.Response<ChildMedicalFileMedication>>
      childMedicalFileMedicationIdPatch({
    required ChildMedicalFileMedication? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(ChildMedicalFileMedication,
        () => ChildMedicalFileMedication.fromJsonFactory);

    return _childMedicalFileMedicationIdPatch(
        data: data, id: id, cacheControl: cacheControl);
  }

  ///Update Child : Medical File : Medication Medication.
  ///@param data
  @Patch(path: '/child/medical_file/medication/{id}/')
  Future<chopper.Response<ChildMedicalFileMedication>>
      _childMedicalFileMedicationIdPatch({
    @Body() required ChildMedicalFileMedication? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Delete Child : Medical File : Medication Medication.
  Future<chopper.Response> childMedicalFileMedicationIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    return _childMedicalFileMedicationIdDelete(
        id: id, cacheControl: cacheControl);
  }

  ///Delete Child : Medical File : Medication Medication.
  @Delete(path: '/child/medical_file/medication/{id}/')
  Future<chopper.Response> _childMedicalFileMedicationIdDelete({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Retrieve Child : Medical File Medical File.
  Future<chopper.Response<ChildMedicalFile>> childMedicalFileChildGet({
    required String? child,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        ChildMedicalFile, () => ChildMedicalFile.fromJsonFactory);

    return _childMedicalFileChildGet(child: child, cacheControl: cacheControl);
  }

  ///Retrieve Child : Medical File Medical File.
  @Get(path: '/child/medical_file/{child}/')
  Future<chopper.Response<ChildMedicalFile>> _childMedicalFileChildGet({
    @Path('child') required String? child,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Create Contract : Inscription Contract Inscription Contract with New Child.
  ///@param data
  Future<chopper.Response<InscriptionNewChild>>
      contractsCreateInscriptionWithNewChildPost({
    required InscriptionNewChild? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        InscriptionNewChild, () => InscriptionNewChild.fromJsonFactory);

    return _contractsCreateInscriptionWithNewChildPost(
        data: data, cacheControl: cacheControl);
  }

  ///Create Contract : Inscription Contract Inscription Contract with New Child.
  ///@param data
  @Post(path: '/contracts/create_inscription_with_new_child/')
  Future<chopper.Response<InscriptionNewChild>>
      _contractsCreateInscriptionWithNewChildPost({
    @Body() required InscriptionNewChild? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Retrieve Default Actions.
  Future<chopper.Response<List<String>>> contractsDefaultActionsGet(
      {String? cacheControl}) {
    return _contractsDefaultActionsGet(cacheControl: cacheControl);
  }

  ///Retrieve Default Actions.
  @Get(path: '/contracts/default_actions/')
  Future<chopper.Response<List<String>>> _contractsDefaultActionsGet(
      {@Header('Cache-Control') String? cacheControl});

  ///Retrieve Default Statuses.
  Future<chopper.Response<List<String>>> contractsDefaultStatusesGet(
      {String? cacheControl}) {
    return _contractsDefaultStatusesGet(cacheControl: cacheControl);
  }

  ///Retrieve Default Statuses.
  @Get(path: '/contracts/default_statuses/')
  Future<chopper.Response<List<String>>> _contractsDefaultStatusesGet(
      {@Header('Cache-Control') String? cacheControl});

  ///List Contract : Educator Contract Educator Contract.
  ///@param search A search term.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  Future<chopper.Response<ContractsEducatorContractGet$Response>>
      contractsEducatorContractGet({
    String? search,
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(ContractsEducatorContractGet$Response,
        () => ContractsEducatorContractGet$Response.fromJsonFactory);

    return _contractsEducatorContractGet(
        search: search,
        page: page,
        pageSize: pageSize,
        cacheControl: cacheControl);
  }

  ///List Contract : Educator Contract Educator Contract.
  ///@param search A search term.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  @Get(path: '/contracts/educator_contract/')
  Future<chopper.Response<ContractsEducatorContractGet$Response>>
      _contractsEducatorContractGet({
    @Query('search') String? search,
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Create Contract : Educator Contract Educator Contract.
  ///@param data
  Future<chopper.Response<EducatorContract>> contractsEducatorContractPost({
    required EducatorContract? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        EducatorContract, () => EducatorContract.fromJsonFactory);

    return _contractsEducatorContractPost(
        data: data, cacheControl: cacheControl);
  }

  ///Create Contract : Educator Contract Educator Contract.
  ///@param data
  @Post(path: '/contracts/educator_contract/')
  Future<chopper.Response<EducatorContract>> _contractsEducatorContractPost({
    @Body() required EducatorContract? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Retrieve Contract : Educator Contract Educator Contract.
  Future<chopper.Response<EducatorContract>> contractsEducatorContractIdGet({
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        EducatorContract, () => EducatorContract.fromJsonFactory);

    return _contractsEducatorContractIdGet(id: id, cacheControl: cacheControl);
  }

  ///Retrieve Contract : Educator Contract Educator Contract.
  @Get(path: '/contracts/educator_contract/{id}/')
  Future<chopper.Response<EducatorContract>> _contractsEducatorContractIdGet({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update Contract : Educator Contract Educator Contract.
  ///@param data
  Future<chopper.Response<EducatorContractUpdate>>
      contractsEducatorContractIdPut({
    required EducatorContractUpdate? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        EducatorContractUpdate, () => EducatorContractUpdate.fromJsonFactory);

    return _contractsEducatorContractIdPut(
        data: data, id: id, cacheControl: cacheControl);
  }

  ///Update Contract : Educator Contract Educator Contract.
  ///@param data
  @Put(path: '/contracts/educator_contract/{id}/')
  Future<chopper.Response<EducatorContractUpdate>>
      _contractsEducatorContractIdPut({
    @Body() required EducatorContractUpdate? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update Contract : Educator Contract Educator Contract.
  ///@param data
  Future<chopper.Response<EducatorContractUpdate>>
      contractsEducatorContractIdPatch({
    required EducatorContractUpdate? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        EducatorContractUpdate, () => EducatorContractUpdate.fromJsonFactory);

    return _contractsEducatorContractIdPatch(
        data: data, id: id, cacheControl: cacheControl);
  }

  ///Update Contract : Educator Contract Educator Contract.
  ///@param data
  @Patch(path: '/contracts/educator_contract/{id}/')
  Future<chopper.Response<EducatorContractUpdate>>
      _contractsEducatorContractIdPatch({
    @Body() required EducatorContractUpdate? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///List Contract : Inscription Contract Inscription Contract.
  ///@param search A search term.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  Future<chopper.Response<ContractsInscriptionGet$Response>>
      contractsInscriptionGet({
    String? search,
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(ContractsInscriptionGet$Response,
        () => ContractsInscriptionGet$Response.fromJsonFactory);

    return _contractsInscriptionGet(
        search: search,
        page: page,
        pageSize: pageSize,
        cacheControl: cacheControl);
  }

  ///List Contract : Inscription Contract Inscription Contract.
  ///@param search A search term.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  @Get(path: '/contracts/inscription/')
  Future<chopper.Response<ContractsInscriptionGet$Response>>
      _contractsInscriptionGet({
    @Query('search') String? search,
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Create Contract : Inscription Contract Inscription Contract.
  ///@param data
  Future<chopper.Response<Inscription>> contractsInscriptionPost({
    required Inscription? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        Inscription, () => Inscription.fromJsonFactory);

    return _contractsInscriptionPost(data: data, cacheControl: cacheControl);
  }

  ///Create Contract : Inscription Contract Inscription Contract.
  ///@param data
  @Post(path: '/contracts/inscription/')
  Future<chopper.Response<Inscription>> _contractsInscriptionPost({
    @Body() required Inscription? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Retrieve Contract : Inscription Contract Inscription Contract.
  Future<chopper.Response<Inscription>> contractsInscriptionIdGet({
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        Inscription, () => Inscription.fromJsonFactory);

    return _contractsInscriptionIdGet(id: id, cacheControl: cacheControl);
  }

  ///Retrieve Contract : Inscription Contract Inscription Contract.
  @Get(path: '/contracts/inscription/{id}/')
  Future<chopper.Response<Inscription>> _contractsInscriptionIdGet({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update Contract : Inscription Contract Inscription Contract.
  ///@param data
  Future<chopper.Response<InscriptionUpdate>> contractsInscriptionIdPut({
    required InscriptionUpdate? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        InscriptionUpdate, () => InscriptionUpdate.fromJsonFactory);

    return _contractsInscriptionIdPut(
        data: data, id: id, cacheControl: cacheControl);
  }

  ///Update Contract : Inscription Contract Inscription Contract.
  ///@param data
  @Put(path: '/contracts/inscription/{id}/')
  Future<chopper.Response<InscriptionUpdate>> _contractsInscriptionIdPut({
    @Body() required InscriptionUpdate? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update Contract : Inscription Contract Inscription Contract.
  ///@param data
  Future<chopper.Response<InscriptionUpdate>> contractsInscriptionIdPatch({
    required InscriptionUpdate? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        InscriptionUpdate, () => InscriptionUpdate.fromJsonFactory);

    return _contractsInscriptionIdPatch(
        data: data, id: id, cacheControl: cacheControl);
  }

  ///Update Contract : Inscription Contract Inscription Contract.
  ///@param data
  @Patch(path: '/contracts/inscription/{id}/')
  Future<chopper.Response<InscriptionUpdate>> _contractsInscriptionIdPatch({
    @Body() required InscriptionUpdate? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///List Family Family.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  Future<chopper.Response<FamilyFamilyGet$Response>> familyFamilyGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(FamilyFamilyGet$Response,
        () => FamilyFamilyGet$Response.fromJsonFactory);

    return _familyFamilyGet(
        page: page, pageSize: pageSize, cacheControl: cacheControl);
  }

  ///List Family Family.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  @Get(path: '/family/family/')
  Future<chopper.Response<FamilyFamilyGet$Response>> _familyFamilyGet({
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Retrieve Family Family.
  Future<chopper.Response<Family>> familyFamilyIdGet({
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(Family, () => Family.fromJsonFactory);

    return _familyFamilyIdGet(id: id, cacheControl: cacheControl);
  }

  ///Retrieve Family Family.
  @Get(path: '/family/family/{id}/')
  Future<chopper.Response<Family>> _familyFamilyIdGet({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///List Family : Trusted Person Trusted Person.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  Future<chopper.Response<FamilyTrustedPersonGet$Response>>
      familyTrustedPersonGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(FamilyTrustedPersonGet$Response,
        () => FamilyTrustedPersonGet$Response.fromJsonFactory);

    return _familyTrustedPersonGet(
        page: page, pageSize: pageSize, cacheControl: cacheControl);
  }

  ///List Family : Trusted Person Trusted Person.
  ///@param page A page number within the paginated result set.
  ///@param page_size Number of results to return per page.
  @Get(path: '/family/trusted_person/')
  Future<chopper.Response<FamilyTrustedPersonGet$Response>>
      _familyTrustedPersonGet({
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Create Family : Trusted Person Trusted Person.
  ///@param data
  Future<chopper.Response<TrustedPerson>> familyTrustedPersonPost({
    required TrustedPerson? data,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        TrustedPerson, () => TrustedPerson.fromJsonFactory);

    return _familyTrustedPersonPost(data: data, cacheControl: cacheControl);
  }

  ///Create Family : Trusted Person Trusted Person.
  ///@param data
  @Post(path: '/family/trusted_person/')
  Future<chopper.Response<TrustedPerson>> _familyTrustedPersonPost({
    @Body() required TrustedPerson? data,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Retrieve Family : Trusted Person Trusted Person.
  Future<chopper.Response<TrustedPerson>> familyTrustedPersonIdGet({
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        TrustedPerson, () => TrustedPerson.fromJsonFactory);

    return _familyTrustedPersonIdGet(id: id, cacheControl: cacheControl);
  }

  ///Retrieve Family : Trusted Person Trusted Person.
  @Get(path: '/family/trusted_person/{id}/')
  Future<chopper.Response<TrustedPerson>> _familyTrustedPersonIdGet({
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update Family : Trusted Person Trusted Person.
  ///@param data
  Future<chopper.Response<TrustedPerson>> familyTrustedPersonIdPut({
    required TrustedPerson? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        TrustedPerson, () => TrustedPerson.fromJsonFactory);

    return _familyTrustedPersonIdPut(
        data: data, id: id, cacheControl: cacheControl);
  }

  ///Update Family : Trusted Person Trusted Person.
  ///@param data
  @Put(path: '/family/trusted_person/{id}/')
  Future<chopper.Response<TrustedPerson>> _familyTrustedPersonIdPut({
    @Body() required TrustedPerson? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update Family : Trusted Person Trusted Person.
  ///@param data
  Future<chopper.Response<TrustedPerson>> familyTrustedPersonIdPatch({
    required TrustedPerson? data,
    required int? id,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        TrustedPerson, () => TrustedPerson.fromJsonFactory);

    return _familyTrustedPersonIdPatch(
        data: data, id: id, cacheControl: cacheControl);
  }

  ///Update Family : Trusted Person Trusted Person.
  ///@param data
  @Patch(path: '/family/trusted_person/{id}/')
  Future<chopper.Response<TrustedPerson>> _familyTrustedPersonIdPatch({
    @Body() required TrustedPerson? data,
    @Path('id') required int? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Delete Family : Trusted Person Trusted Person.
  Future<chopper.Response> familyTrustedPersonIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    return _familyTrustedPersonIdDelete(id: id, cacheControl: cacheControl);
  }

  ///Delete Family : Trusted Person Trusted Person.
  @Delete(path: '/family/trusted_person/{id}/')
  Future<chopper.Response> _familyTrustedPersonIdDelete({
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

  ///
  Future<chopper.Response<GeneralUserSettings>> settingsUserGet({
    required String? user,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        GeneralUserSettings, () => GeneralUserSettings.fromJsonFactory);

    return _settingsUserGet(user: user, cacheControl: cacheControl);
  }

  ///
  @Get(path: '/settings/{user}/')
  Future<chopper.Response<GeneralUserSettings>> _settingsUserGet({
    @Path('user') required String? user,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param data
  Future<chopper.Response<GeneralUserSettings>> settingsUserPut({
    required GeneralUserSettings? data,
    required String? user,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        GeneralUserSettings, () => GeneralUserSettings.fromJsonFactory);

    return _settingsUserPut(data: data, user: user, cacheControl: cacheControl);
  }

  ///
  ///@param data
  @Put(path: '/settings/{user}/')
  Future<chopper.Response<GeneralUserSettings>> _settingsUserPut({
    @Body() required GeneralUserSettings? data,
    @Path('user') required String? user,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param data
  Future<chopper.Response<GeneralUserSettings>> settingsUserPatch({
    required GeneralUserSettings? data,
    required String? user,
    String? cacheControl,
  }) {
    generatedMapping.putIfAbsent(
        GeneralUserSettings, () => GeneralUserSettings.fromJsonFactory);

    return _settingsUserPatch(
        data: data, user: user, cacheControl: cacheControl);
  }

  ///
  ///@param data
  @Patch(path: '/settings/{user}/')
  Future<chopper.Response<GeneralUserSettings>> _settingsUserPatch({
    @Body() required GeneralUserSettings? data,
    @Path('user') required String? user,
    @Header('Cache-Control') String? cacheControl,
  });
}

@JsonSerializable(explicitToJson: true)
class CustomVerifyEmail {
  CustomVerifyEmail();

  factory CustomVerifyEmail.fromJson(Map<String, dynamic> json) =>
      _$CustomVerifyEmailFromJson(json);

  static const toJsonFactory = _$CustomVerifyEmailToJson;
  Map<String, dynamic> toJson() => _$CustomVerifyEmailToJson(this);

  static const fromJsonFactory = _$CustomVerifyEmailFromJson;

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

@JsonSerializable(explicitToJson: true)
class Login {
  Login({
    this.email,
    this.password,
  });

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);

  static const toJsonFactory = _$LoginToJson;
  Map<String, dynamic> toJson() => _$LoginToJson(this);

  @JsonKey(name: 'email', includeIfNull: false, defaultValue: '')
  final String? email;
  @JsonKey(name: 'password', includeIfNull: false, defaultValue: '')
  final String? password;
  static const fromJsonFactory = _$LoginFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Login &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password) ^
      runtimeType.hashCode;
}

extension $LoginExtension on Login {
  Login copyWith({String? email, String? password}) {
    return Login(
        email: email ?? this.email, password: password ?? this.password);
  }

  Login copyWithWrapped({Wrapped<String?>? email, Wrapped<String?>? password}) {
    return Login(
        email: (email != null ? email.value : this.email),
        password: (password != null ? password.value : this.password));
  }
}

@JsonSerializable(explicitToJson: true)
class PasswordChange {
  PasswordChange({
    this.newPassword1,
    this.newPassword2,
  });

  factory PasswordChange.fromJson(Map<String, dynamic> json) =>
      _$PasswordChangeFromJson(json);

  static const toJsonFactory = _$PasswordChangeToJson;
  Map<String, dynamic> toJson() => _$PasswordChangeToJson(this);

  @JsonKey(name: 'new_password1', includeIfNull: false, defaultValue: '')
  final String? newPassword1;
  @JsonKey(name: 'new_password2', includeIfNull: false, defaultValue: '')
  final String? newPassword2;
  static const fromJsonFactory = _$PasswordChangeFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PasswordChange &&
            (identical(other.newPassword1, newPassword1) ||
                const DeepCollectionEquality()
                    .equals(other.newPassword1, newPassword1)) &&
            (identical(other.newPassword2, newPassword2) ||
                const DeepCollectionEquality()
                    .equals(other.newPassword2, newPassword2)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(newPassword1) ^
      const DeepCollectionEquality().hash(newPassword2) ^
      runtimeType.hashCode;
}

extension $PasswordChangeExtension on PasswordChange {
  PasswordChange copyWith({String? newPassword1, String? newPassword2}) {
    return PasswordChange(
        newPassword1: newPassword1 ?? this.newPassword1,
        newPassword2: newPassword2 ?? this.newPassword2);
  }

  PasswordChange copyWithWrapped(
      {Wrapped<String?>? newPassword1, Wrapped<String?>? newPassword2}) {
    return PasswordChange(
        newPassword1:
            (newPassword1 != null ? newPassword1.value : this.newPassword1),
        newPassword2:
            (newPassword2 != null ? newPassword2.value : this.newPassword2));
  }
}

@JsonSerializable(explicitToJson: true)
class CustomPasswordResetConfirm {
  CustomPasswordResetConfirm({
    this.newPassword1,
    this.newPassword2,
  });

  factory CustomPasswordResetConfirm.fromJson(Map<String, dynamic> json) =>
      _$CustomPasswordResetConfirmFromJson(json);

  static const toJsonFactory = _$CustomPasswordResetConfirmToJson;
  Map<String, dynamic> toJson() => _$CustomPasswordResetConfirmToJson(this);

  @JsonKey(name: 'new_password1', includeIfNull: false, defaultValue: '')
  final String? newPassword1;
  @JsonKey(name: 'new_password2', includeIfNull: false, defaultValue: '')
  final String? newPassword2;
  static const fromJsonFactory = _$CustomPasswordResetConfirmFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CustomPasswordResetConfirm &&
            (identical(other.newPassword1, newPassword1) ||
                const DeepCollectionEquality()
                    .equals(other.newPassword1, newPassword1)) &&
            (identical(other.newPassword2, newPassword2) ||
                const DeepCollectionEquality()
                    .equals(other.newPassword2, newPassword2)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(newPassword1) ^
      const DeepCollectionEquality().hash(newPassword2) ^
      runtimeType.hashCode;
}

extension $CustomPasswordResetConfirmExtension on CustomPasswordResetConfirm {
  CustomPasswordResetConfirm copyWith(
      {String? newPassword1, String? newPassword2}) {
    return CustomPasswordResetConfirm(
        newPassword1: newPassword1 ?? this.newPassword1,
        newPassword2: newPassword2 ?? this.newPassword2);
  }

  CustomPasswordResetConfirm copyWithWrapped(
      {Wrapped<String?>? newPassword1, Wrapped<String?>? newPassword2}) {
    return CustomPasswordResetConfirm(
        newPassword1:
            (newPassword1 != null ? newPassword1.value : this.newPassword1),
        newPassword2:
            (newPassword2 != null ? newPassword2.value : this.newPassword2));
  }
}

@JsonSerializable(explicitToJson: true)
class PasswordReset {
  PasswordReset({
    this.email,
  });

  factory PasswordReset.fromJson(Map<String, dynamic> json) =>
      _$PasswordResetFromJson(json);

  static const toJsonFactory = _$PasswordResetToJson;
  Map<String, dynamic> toJson() => _$PasswordResetToJson(this);

  @JsonKey(name: 'email', includeIfNull: false, defaultValue: '')
  final String? email;
  static const fromJsonFactory = _$PasswordResetFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PasswordReset &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(email) ^ runtimeType.hashCode;
}

extension $PasswordResetExtension on PasswordReset {
  PasswordReset copyWith({String? email}) {
    return PasswordReset(email: email ?? this.email);
  }

  PasswordReset copyWithWrapped({Wrapped<String?>? email}) {
    return PasswordReset(email: (email != null ? email.value : this.email));
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
class EducatorProfile {
  EducatorProfile({
    this.id,
    this.user,
    this.phone,
    this.address,
    this.avatar,
    this.birthDate,
    this.firstName,
    this.lastName,
    this.sex,
    this.dateJoined,
  });

  factory EducatorProfile.fromJson(Map<String, dynamic> json) =>
      _$EducatorProfileFromJson(json);

  static const toJsonFactory = _$EducatorProfileToJson;
  Map<String, dynamic> toJson() => _$EducatorProfileToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'user', includeIfNull: false)
  final Educator? user;
  @JsonKey(name: 'phone', includeIfNull: false)
  final EducatorProfile$Phone? phone;
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
    toJson: educatorProfileSexToJson,
    fromJson: educatorProfileSexFromJson,
  )
  final enums.EducatorProfileSex? sex;
  @JsonKey(name: 'date_joined', includeIfNull: false)
  final DateTime? dateJoined;
  static const fromJsonFactory = _$EducatorProfileFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EducatorProfile &&
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
                const DeepCollectionEquality().equals(other.sex, sex)) &&
            (identical(other.dateJoined, dateJoined) ||
                const DeepCollectionEquality()
                    .equals(other.dateJoined, dateJoined)));
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
      const DeepCollectionEquality().hash(dateJoined) ^
      runtimeType.hashCode;
}

extension $EducatorProfileExtension on EducatorProfile {
  EducatorProfile copyWith(
      {int? id,
      Educator? user,
      EducatorProfile$Phone? phone,
      Address? address,
      String? avatar,
      DateTime? birthDate,
      String? firstName,
      String? lastName,
      enums.EducatorProfileSex? sex,
      DateTime? dateJoined}) {
    return EducatorProfile(
        id: id ?? this.id,
        user: user ?? this.user,
        phone: phone ?? this.phone,
        address: address ?? this.address,
        avatar: avatar ?? this.avatar,
        birthDate: birthDate ?? this.birthDate,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        sex: sex ?? this.sex,
        dateJoined: dateJoined ?? this.dateJoined);
  }

  EducatorProfile copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<Educator?>? user,
      Wrapped<EducatorProfile$Phone?>? phone,
      Wrapped<Address?>? address,
      Wrapped<String?>? avatar,
      Wrapped<DateTime?>? birthDate,
      Wrapped<String?>? firstName,
      Wrapped<String?>? lastName,
      Wrapped<enums.EducatorProfileSex?>? sex,
      Wrapped<DateTime?>? dateJoined}) {
    return EducatorProfile(
        id: (id != null ? id.value : this.id),
        user: (user != null ? user.value : this.user),
        phone: (phone != null ? phone.value : this.phone),
        address: (address != null ? address.value : this.address),
        avatar: (avatar != null ? avatar.value : this.avatar),
        birthDate: (birthDate != null ? birthDate.value : this.birthDate),
        firstName: (firstName != null ? firstName.value : this.firstName),
        lastName: (lastName != null ? lastName.value : this.lastName),
        sex: (sex != null ? sex.value : this.sex),
        dateJoined: (dateJoined != null ? dateJoined.value : this.dateJoined));
  }
}

@JsonSerializable(explicitToJson: true)
class KindergartenProfileServiceSchedule {
  KindergartenProfileServiceSchedule({
    this.id,
    this.type,
    this.mondayStart,
    this.mondayEnd,
    this.tuesdayStart,
    this.tuesdayEnd,
    this.wednesdayStart,
    this.wednesdayEnd,
    this.thursdayStart,
    this.thursdayEnd,
    this.fridayStart,
    this.fridayEnd,
    this.saturdayStart,
    this.saturdayEnd,
    this.sundayStart,
    this.sundayEnd,
  });

  factory KindergartenProfileServiceSchedule.fromJson(
          Map<String, dynamic> json) =>
      _$KindergartenProfileServiceScheduleFromJson(json);

  static const toJsonFactory = _$KindergartenProfileServiceScheduleToJson;
  Map<String, dynamic> toJson() =>
      _$KindergartenProfileServiceScheduleToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(
    name: 'type',
    includeIfNull: false,
    toJson: kindergartenProfileServiceScheduleTypeToJson,
    fromJson: kindergartenProfileServiceScheduleTypeFromJson,
  )
  final enums.KindergartenProfileServiceScheduleType? type;
  @JsonKey(name: 'monday_start', includeIfNull: false, defaultValue: '')
  final String? mondayStart;
  @JsonKey(name: 'monday_end', includeIfNull: false, defaultValue: '')
  final String? mondayEnd;
  @JsonKey(name: 'tuesday_start', includeIfNull: false, defaultValue: '')
  final String? tuesdayStart;
  @JsonKey(name: 'tuesday_end', includeIfNull: false, defaultValue: '')
  final String? tuesdayEnd;
  @JsonKey(name: 'wednesday_start', includeIfNull: false, defaultValue: '')
  final String? wednesdayStart;
  @JsonKey(name: 'wednesday_end', includeIfNull: false, defaultValue: '')
  final String? wednesdayEnd;
  @JsonKey(name: 'thursday_start', includeIfNull: false, defaultValue: '')
  final String? thursdayStart;
  @JsonKey(name: 'thursday_end', includeIfNull: false, defaultValue: '')
  final String? thursdayEnd;
  @JsonKey(name: 'friday_start', includeIfNull: false, defaultValue: '')
  final String? fridayStart;
  @JsonKey(name: 'friday_end', includeIfNull: false, defaultValue: '')
  final String? fridayEnd;
  @JsonKey(name: 'saturday_start', includeIfNull: false, defaultValue: '')
  final String? saturdayStart;
  @JsonKey(name: 'saturday_end', includeIfNull: false, defaultValue: '')
  final String? saturdayEnd;
  @JsonKey(name: 'sunday_start', includeIfNull: false, defaultValue: '')
  final String? sundayStart;
  @JsonKey(name: 'sunday_end', includeIfNull: false, defaultValue: '')
  final String? sundayEnd;
  static const fromJsonFactory = _$KindergartenProfileServiceScheduleFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is KindergartenProfileServiceSchedule &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.mondayStart, mondayStart) ||
                const DeepCollectionEquality()
                    .equals(other.mondayStart, mondayStart)) &&
            (identical(other.mondayEnd, mondayEnd) ||
                const DeepCollectionEquality()
                    .equals(other.mondayEnd, mondayEnd)) &&
            (identical(other.tuesdayStart, tuesdayStart) ||
                const DeepCollectionEquality()
                    .equals(other.tuesdayStart, tuesdayStart)) &&
            (identical(other.tuesdayEnd, tuesdayEnd) ||
                const DeepCollectionEquality()
                    .equals(other.tuesdayEnd, tuesdayEnd)) &&
            (identical(other.wednesdayStart, wednesdayStart) ||
                const DeepCollectionEquality()
                    .equals(other.wednesdayStart, wednesdayStart)) &&
            (identical(other.wednesdayEnd, wednesdayEnd) ||
                const DeepCollectionEquality()
                    .equals(other.wednesdayEnd, wednesdayEnd)) &&
            (identical(other.thursdayStart, thursdayStart) ||
                const DeepCollectionEquality()
                    .equals(other.thursdayStart, thursdayStart)) &&
            (identical(other.thursdayEnd, thursdayEnd) ||
                const DeepCollectionEquality()
                    .equals(other.thursdayEnd, thursdayEnd)) &&
            (identical(other.fridayStart, fridayStart) ||
                const DeepCollectionEquality()
                    .equals(other.fridayStart, fridayStart)) &&
            (identical(other.fridayEnd, fridayEnd) ||
                const DeepCollectionEquality()
                    .equals(other.fridayEnd, fridayEnd)) &&
            (identical(other.saturdayStart, saturdayStart) ||
                const DeepCollectionEquality()
                    .equals(other.saturdayStart, saturdayStart)) &&
            (identical(other.saturdayEnd, saturdayEnd) ||
                const DeepCollectionEquality()
                    .equals(other.saturdayEnd, saturdayEnd)) &&
            (identical(other.sundayStart, sundayStart) ||
                const DeepCollectionEquality()
                    .equals(other.sundayStart, sundayStart)) &&
            (identical(other.sundayEnd, sundayEnd) ||
                const DeepCollectionEquality()
                    .equals(other.sundayEnd, sundayEnd)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(mondayStart) ^
      const DeepCollectionEquality().hash(mondayEnd) ^
      const DeepCollectionEquality().hash(tuesdayStart) ^
      const DeepCollectionEquality().hash(tuesdayEnd) ^
      const DeepCollectionEquality().hash(wednesdayStart) ^
      const DeepCollectionEquality().hash(wednesdayEnd) ^
      const DeepCollectionEquality().hash(thursdayStart) ^
      const DeepCollectionEquality().hash(thursdayEnd) ^
      const DeepCollectionEquality().hash(fridayStart) ^
      const DeepCollectionEquality().hash(fridayEnd) ^
      const DeepCollectionEquality().hash(saturdayStart) ^
      const DeepCollectionEquality().hash(saturdayEnd) ^
      const DeepCollectionEquality().hash(sundayStart) ^
      const DeepCollectionEquality().hash(sundayEnd) ^
      runtimeType.hashCode;
}

extension $KindergartenProfileServiceScheduleExtension
    on KindergartenProfileServiceSchedule {
  KindergartenProfileServiceSchedule copyWith(
      {int? id,
      enums.KindergartenProfileServiceScheduleType? type,
      String? mondayStart,
      String? mondayEnd,
      String? tuesdayStart,
      String? tuesdayEnd,
      String? wednesdayStart,
      String? wednesdayEnd,
      String? thursdayStart,
      String? thursdayEnd,
      String? fridayStart,
      String? fridayEnd,
      String? saturdayStart,
      String? saturdayEnd,
      String? sundayStart,
      String? sundayEnd}) {
    return KindergartenProfileServiceSchedule(
        id: id ?? this.id,
        type: type ?? this.type,
        mondayStart: mondayStart ?? this.mondayStart,
        mondayEnd: mondayEnd ?? this.mondayEnd,
        tuesdayStart: tuesdayStart ?? this.tuesdayStart,
        tuesdayEnd: tuesdayEnd ?? this.tuesdayEnd,
        wednesdayStart: wednesdayStart ?? this.wednesdayStart,
        wednesdayEnd: wednesdayEnd ?? this.wednesdayEnd,
        thursdayStart: thursdayStart ?? this.thursdayStart,
        thursdayEnd: thursdayEnd ?? this.thursdayEnd,
        fridayStart: fridayStart ?? this.fridayStart,
        fridayEnd: fridayEnd ?? this.fridayEnd,
        saturdayStart: saturdayStart ?? this.saturdayStart,
        saturdayEnd: saturdayEnd ?? this.saturdayEnd,
        sundayStart: sundayStart ?? this.sundayStart,
        sundayEnd: sundayEnd ?? this.sundayEnd);
  }

  KindergartenProfileServiceSchedule copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<enums.KindergartenProfileServiceScheduleType?>? type,
      Wrapped<String?>? mondayStart,
      Wrapped<String?>? mondayEnd,
      Wrapped<String?>? tuesdayStart,
      Wrapped<String?>? tuesdayEnd,
      Wrapped<String?>? wednesdayStart,
      Wrapped<String?>? wednesdayEnd,
      Wrapped<String?>? thursdayStart,
      Wrapped<String?>? thursdayEnd,
      Wrapped<String?>? fridayStart,
      Wrapped<String?>? fridayEnd,
      Wrapped<String?>? saturdayStart,
      Wrapped<String?>? saturdayEnd,
      Wrapped<String?>? sundayStart,
      Wrapped<String?>? sundayEnd}) {
    return KindergartenProfileServiceSchedule(
        id: (id != null ? id.value : this.id),
        type: (type != null ? type.value : this.type),
        mondayStart:
            (mondayStart != null ? mondayStart.value : this.mondayStart),
        mondayEnd: (mondayEnd != null ? mondayEnd.value : this.mondayEnd),
        tuesdayStart:
            (tuesdayStart != null ? tuesdayStart.value : this.tuesdayStart),
        tuesdayEnd: (tuesdayEnd != null ? tuesdayEnd.value : this.tuesdayEnd),
        wednesdayStart: (wednesdayStart != null
            ? wednesdayStart.value
            : this.wednesdayStart),
        wednesdayEnd:
            (wednesdayEnd != null ? wednesdayEnd.value : this.wednesdayEnd),
        thursdayStart:
            (thursdayStart != null ? thursdayStart.value : this.thursdayStart),
        thursdayEnd:
            (thursdayEnd != null ? thursdayEnd.value : this.thursdayEnd),
        fridayStart:
            (fridayStart != null ? fridayStart.value : this.fridayStart),
        fridayEnd: (fridayEnd != null ? fridayEnd.value : this.fridayEnd),
        saturdayStart:
            (saturdayStart != null ? saturdayStart.value : this.saturdayStart),
        saturdayEnd:
            (saturdayEnd != null ? saturdayEnd.value : this.saturdayEnd),
        sundayStart:
            (sundayStart != null ? sundayStart.value : this.sundayStart),
        sundayEnd: (sundayEnd != null ? sundayEnd.value : this.sundayEnd));
  }
}

@JsonSerializable(explicitToJson: true)
class KindergartenProfilePaymentAgeConfiguration {
  KindergartenProfilePaymentAgeConfiguration({
    this.id,
    this.startAge,
    this.endAge,
    this.price,
  });

  factory KindergartenProfilePaymentAgeConfiguration.fromJson(
          Map<String, dynamic> json) =>
      _$KindergartenProfilePaymentAgeConfigurationFromJson(json);

  static const toJsonFactory =
      _$KindergartenProfilePaymentAgeConfigurationToJson;
  Map<String, dynamic> toJson() =>
      _$KindergartenProfilePaymentAgeConfigurationToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'start_age', includeIfNull: false)
  final int? startAge;
  @JsonKey(name: 'end_age', includeIfNull: false)
  final int? endAge;
  @JsonKey(name: 'price', includeIfNull: false)
  final int? price;
  static const fromJsonFactory =
      _$KindergartenProfilePaymentAgeConfigurationFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is KindergartenProfilePaymentAgeConfiguration &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.startAge, startAge) ||
                const DeepCollectionEquality()
                    .equals(other.startAge, startAge)) &&
            (identical(other.endAge, endAge) ||
                const DeepCollectionEquality().equals(other.endAge, endAge)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(startAge) ^
      const DeepCollectionEquality().hash(endAge) ^
      const DeepCollectionEquality().hash(price) ^
      runtimeType.hashCode;
}

extension $KindergartenProfilePaymentAgeConfigurationExtension
    on KindergartenProfilePaymentAgeConfiguration {
  KindergartenProfilePaymentAgeConfiguration copyWith(
      {int? id, int? startAge, int? endAge, int? price}) {
    return KindergartenProfilePaymentAgeConfiguration(
        id: id ?? this.id,
        startAge: startAge ?? this.startAge,
        endAge: endAge ?? this.endAge,
        price: price ?? this.price);
  }

  KindergartenProfilePaymentAgeConfiguration copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<int?>? startAge,
      Wrapped<int?>? endAge,
      Wrapped<int?>? price}) {
    return KindergartenProfilePaymentAgeConfiguration(
        id: (id != null ? id.value : this.id),
        startAge: (startAge != null ? startAge.value : this.startAge),
        endAge: (endAge != null ? endAge.value : this.endAge),
        price: (price != null ? price.value : this.price));
  }
}

@JsonSerializable(explicitToJson: true)
class KindergartenProfilePaymentSpecialConditionConfiguration {
  KindergartenProfilePaymentSpecialConditionConfiguration({
    this.id,
    this.price,
    this.condition,
  });

  factory KindergartenProfilePaymentSpecialConditionConfiguration.fromJson(
          Map<String, dynamic> json) =>
      _$KindergartenProfilePaymentSpecialConditionConfigurationFromJson(json);

  static const toJsonFactory =
      _$KindergartenProfilePaymentSpecialConditionConfigurationToJson;
  Map<String, dynamic> toJson() =>
      _$KindergartenProfilePaymentSpecialConditionConfigurationToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'price', includeIfNull: false)
  final int? price;
  @JsonKey(name: 'condition', includeIfNull: false)
  final int? condition;
  static const fromJsonFactory =
      _$KindergartenProfilePaymentSpecialConditionConfigurationFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is KindergartenProfilePaymentSpecialConditionConfiguration &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.condition, condition) ||
                const DeepCollectionEquality()
                    .equals(other.condition, condition)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(condition) ^
      runtimeType.hashCode;
}

extension $KindergartenProfilePaymentSpecialConditionConfigurationExtension
    on KindergartenProfilePaymentSpecialConditionConfiguration {
  KindergartenProfilePaymentSpecialConditionConfiguration copyWith(
      {int? id, int? price, int? condition}) {
    return KindergartenProfilePaymentSpecialConditionConfiguration(
        id: id ?? this.id,
        price: price ?? this.price,
        condition: condition ?? this.condition);
  }

  KindergartenProfilePaymentSpecialConditionConfiguration copyWithWrapped(
      {Wrapped<int?>? id, Wrapped<int?>? price, Wrapped<int?>? condition}) {
    return KindergartenProfilePaymentSpecialConditionConfiguration(
        id: (id != null ? id.value : this.id),
        price: (price != null ? price.value : this.price),
        condition: (condition != null ? condition.value : this.condition));
  }
}

@JsonSerializable(explicitToJson: true)
class KindergartenProfilePaymentOtherConfiguration {
  KindergartenProfilePaymentOtherConfiguration({
    this.id,
    this.price,
  });

  factory KindergartenProfilePaymentOtherConfiguration.fromJson(
          Map<String, dynamic> json) =>
      _$KindergartenProfilePaymentOtherConfigurationFromJson(json);

  static const toJsonFactory =
      _$KindergartenProfilePaymentOtherConfigurationToJson;
  Map<String, dynamic> toJson() =>
      _$KindergartenProfilePaymentOtherConfigurationToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'price', includeIfNull: false)
  final int? price;
  static const fromJsonFactory =
      _$KindergartenProfilePaymentOtherConfigurationFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is KindergartenProfilePaymentOtherConfiguration &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(price) ^
      runtimeType.hashCode;
}

extension $KindergartenProfilePaymentOtherConfigurationExtension
    on KindergartenProfilePaymentOtherConfiguration {
  KindergartenProfilePaymentOtherConfiguration copyWith({int? id, int? price}) {
    return KindergartenProfilePaymentOtherConfiguration(
        id: id ?? this.id, price: price ?? this.price);
  }

  KindergartenProfilePaymentOtherConfiguration copyWithWrapped(
      {Wrapped<int?>? id, Wrapped<int?>? price}) {
    return KindergartenProfilePaymentOtherConfiguration(
        id: (id != null ? id.value : this.id),
        price: (price != null ? price.value : this.price));
  }
}

@JsonSerializable(explicitToJson: true)
class KindergartenProfileTariffs {
  KindergartenProfileTariffs({
    this.paymentAgeConfigurations,
    this.paymentSpecialConditionConfigurations,
    this.paymentOtherConfigurations,
  });

  factory KindergartenProfileTariffs.fromJson(Map<String, dynamic> json) =>
      _$KindergartenProfileTariffsFromJson(json);

  static const toJsonFactory = _$KindergartenProfileTariffsToJson;
  Map<String, dynamic> toJson() => _$KindergartenProfileTariffsToJson(this);

  @JsonKey(
      name: 'payment_age_configurations',
      includeIfNull: false,
      defaultValue: <KindergartenProfilePaymentAgeConfiguration>[])
  final List<KindergartenProfilePaymentAgeConfiguration>?
      paymentAgeConfigurations;
  @JsonKey(
      name: 'payment_special_condition_configurations',
      includeIfNull: false,
      defaultValue: <KindergartenProfilePaymentSpecialConditionConfiguration>[])
  final List<KindergartenProfilePaymentSpecialConditionConfiguration>?
      paymentSpecialConditionConfigurations;
  @JsonKey(
      name: 'payment_other_configurations',
      includeIfNull: false,
      defaultValue: <KindergartenProfilePaymentOtherConfiguration>[])
  final List<KindergartenProfilePaymentOtherConfiguration>?
      paymentOtherConfigurations;
  static const fromJsonFactory = _$KindergartenProfileTariffsFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is KindergartenProfileTariffs &&
            (identical(
                    other.paymentAgeConfigurations, paymentAgeConfigurations) ||
                const DeepCollectionEquality().equals(
                    other.paymentAgeConfigurations,
                    paymentAgeConfigurations)) &&
            (identical(other.paymentSpecialConditionConfigurations,
                    paymentSpecialConditionConfigurations) ||
                const DeepCollectionEquality().equals(
                    other.paymentSpecialConditionConfigurations,
                    paymentSpecialConditionConfigurations)) &&
            (identical(other.paymentOtherConfigurations,
                    paymentOtherConfigurations) ||
                const DeepCollectionEquality().equals(
                    other.paymentOtherConfigurations,
                    paymentOtherConfigurations)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(paymentAgeConfigurations) ^
      const DeepCollectionEquality()
          .hash(paymentSpecialConditionConfigurations) ^
      const DeepCollectionEquality().hash(paymentOtherConfigurations) ^
      runtimeType.hashCode;
}

extension $KindergartenProfileTariffsExtension on KindergartenProfileTariffs {
  KindergartenProfileTariffs copyWith(
      {List<KindergartenProfilePaymentAgeConfiguration>?
          paymentAgeConfigurations,
      List<KindergartenProfilePaymentSpecialConditionConfiguration>?
          paymentSpecialConditionConfigurations,
      List<KindergartenProfilePaymentOtherConfiguration>?
          paymentOtherConfigurations}) {
    return KindergartenProfileTariffs(
        paymentAgeConfigurations:
            paymentAgeConfigurations ?? this.paymentAgeConfigurations,
        paymentSpecialConditionConfigurations:
            paymentSpecialConditionConfigurations ??
                this.paymentSpecialConditionConfigurations,
        paymentOtherConfigurations:
            paymentOtherConfigurations ?? this.paymentOtherConfigurations);
  }

  KindergartenProfileTariffs copyWithWrapped(
      {Wrapped<List<KindergartenProfilePaymentAgeConfiguration>?>?
          paymentAgeConfigurations,
      Wrapped<List<KindergartenProfilePaymentSpecialConditionConfiguration>?>?
          paymentSpecialConditionConfigurations,
      Wrapped<List<KindergartenProfilePaymentOtherConfiguration>?>?
          paymentOtherConfigurations}) {
    return KindergartenProfileTariffs(
        paymentAgeConfigurations: (paymentAgeConfigurations != null
            ? paymentAgeConfigurations.value
            : this.paymentAgeConfigurations),
        paymentSpecialConditionConfigurations:
            (paymentSpecialConditionConfigurations != null
                ? paymentSpecialConditionConfigurations.value
                : this.paymentSpecialConditionConfigurations),
        paymentOtherConfigurations: (paymentOtherConfigurations != null
            ? paymentOtherConfigurations.value
            : this.paymentOtherConfigurations));
  }
}

@JsonSerializable(explicitToJson: true)
class KindergartenProfileTypicalDayEvent {
  KindergartenProfileTypicalDayEvent({
    this.id,
    this.startHour,
    this.endHour,
    this.description,
    this.title,
  });

  factory KindergartenProfileTypicalDayEvent.fromJson(
          Map<String, dynamic> json) =>
      _$KindergartenProfileTypicalDayEventFromJson(json);

  static const toJsonFactory = _$KindergartenProfileTypicalDayEventToJson;
  Map<String, dynamic> toJson() =>
      _$KindergartenProfileTypicalDayEventToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'start_hour', includeIfNull: false, defaultValue: '')
  final String? startHour;
  @JsonKey(name: 'end_hour', includeIfNull: false, defaultValue: '')
  final String? endHour;
  @JsonKey(name: 'description', includeIfNull: false, defaultValue: '')
  final String? description;
  @JsonKey(name: 'title', includeIfNull: false, defaultValue: '')
  final String? title;
  static const fromJsonFactory = _$KindergartenProfileTypicalDayEventFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is KindergartenProfileTypicalDayEvent &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.startHour, startHour) ||
                const DeepCollectionEquality()
                    .equals(other.startHour, startHour)) &&
            (identical(other.endHour, endHour) ||
                const DeepCollectionEquality()
                    .equals(other.endHour, endHour)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(startHour) ^
      const DeepCollectionEquality().hash(endHour) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(title) ^
      runtimeType.hashCode;
}

extension $KindergartenProfileTypicalDayEventExtension
    on KindergartenProfileTypicalDayEvent {
  KindergartenProfileTypicalDayEvent copyWith(
      {int? id,
      String? startHour,
      String? endHour,
      String? description,
      String? title}) {
    return KindergartenProfileTypicalDayEvent(
        id: id ?? this.id,
        startHour: startHour ?? this.startHour,
        endHour: endHour ?? this.endHour,
        description: description ?? this.description,
        title: title ?? this.title);
  }

  KindergartenProfileTypicalDayEvent copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String?>? startHour,
      Wrapped<String?>? endHour,
      Wrapped<String?>? description,
      Wrapped<String?>? title}) {
    return KindergartenProfileTypicalDayEvent(
        id: (id != null ? id.value : this.id),
        startHour: (startHour != null ? startHour.value : this.startHour),
        endHour: (endHour != null ? endHour.value : this.endHour),
        description:
            (description != null ? description.value : this.description),
        title: (title != null ? title.value : this.title));
  }
}

@JsonSerializable(explicitToJson: true)
class KindergartenProfileTypicalDay {
  KindergartenProfileTypicalDay({
    this.events,
  });

  factory KindergartenProfileTypicalDay.fromJson(Map<String, dynamic> json) =>
      _$KindergartenProfileTypicalDayFromJson(json);

  static const toJsonFactory = _$KindergartenProfileTypicalDayToJson;
  Map<String, dynamic> toJson() => _$KindergartenProfileTypicalDayToJson(this);

  @JsonKey(
      name: 'events',
      includeIfNull: false,
      defaultValue: <KindergartenProfileTypicalDayEvent>[])
  final List<KindergartenProfileTypicalDayEvent>? events;
  static const fromJsonFactory = _$KindergartenProfileTypicalDayFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is KindergartenProfileTypicalDay &&
            (identical(other.events, events) ||
                const DeepCollectionEquality().equals(other.events, events)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(events) ^ runtimeType.hashCode;
}

extension $KindergartenProfileTypicalDayExtension
    on KindergartenProfileTypicalDay {
  KindergartenProfileTypicalDay copyWith(
      {List<KindergartenProfileTypicalDayEvent>? events}) {
    return KindergartenProfileTypicalDay(events: events ?? this.events);
  }

  KindergartenProfileTypicalDay copyWithWrapped(
      {Wrapped<List<KindergartenProfileTypicalDayEvent>?>? events}) {
    return KindergartenProfileTypicalDay(
        events: (events != null ? events.value : this.events));
  }
}

@JsonSerializable(explicitToJson: true)
class KindergartenProfileClassGalleryImage {
  KindergartenProfileClassGalleryImage({
    this.id,
    this.image,
  });

  factory KindergartenProfileClassGalleryImage.fromJson(
          Map<String, dynamic> json) =>
      _$KindergartenProfileClassGalleryImageFromJson(json);

  static const toJsonFactory = _$KindergartenProfileClassGalleryImageToJson;
  Map<String, dynamic> toJson() =>
      _$KindergartenProfileClassGalleryImageToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'image', includeIfNull: false, defaultValue: '')
  final String? image;
  static const fromJsonFactory = _$KindergartenProfileClassGalleryImageFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is KindergartenProfileClassGalleryImage &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(image) ^
      runtimeType.hashCode;
}

extension $KindergartenProfileClassGalleryImageExtension
    on KindergartenProfileClassGalleryImage {
  KindergartenProfileClassGalleryImage copyWith({int? id, String? image}) {
    return KindergartenProfileClassGalleryImage(
        id: id ?? this.id, image: image ?? this.image);
  }

  KindergartenProfileClassGalleryImage copyWithWrapped(
      {Wrapped<int?>? id, Wrapped<String?>? image}) {
    return KindergartenProfileClassGalleryImage(
        id: (id != null ? id.value : this.id),
        image: (image != null ? image.value : this.image));
  }
}

@JsonSerializable(explicitToJson: true)
class KindergartenProfileClass {
  KindergartenProfileClass({
    this.id,
    this.gallery,
    this.ageMin,
    this.ageMax,
    this.name,
    this.description,
    this.educatorName,
    this.mainImage,
  });

  factory KindergartenProfileClass.fromJson(Map<String, dynamic> json) =>
      _$KindergartenProfileClassFromJson(json);

  static const toJsonFactory = _$KindergartenProfileClassToJson;
  Map<String, dynamic> toJson() => _$KindergartenProfileClassToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(
      name: 'gallery',
      includeIfNull: false,
      defaultValue: <KindergartenProfileClassGalleryImage>[])
  final List<KindergartenProfileClassGalleryImage>? gallery;
  @JsonKey(name: 'age_min', includeIfNull: false)
  final int? ageMin;
  @JsonKey(name: 'age_max', includeIfNull: false)
  final int? ageMax;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  @JsonKey(name: 'description', includeIfNull: false, defaultValue: '')
  final String? description;
  @JsonKey(name: 'educator_name', includeIfNull: false, defaultValue: '')
  final String? educatorName;
  @JsonKey(name: 'main_image', includeIfNull: false, defaultValue: '')
  final String? mainImage;
  static const fromJsonFactory = _$KindergartenProfileClassFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is KindergartenProfileClass &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.gallery, gallery) ||
                const DeepCollectionEquality()
                    .equals(other.gallery, gallery)) &&
            (identical(other.ageMin, ageMin) ||
                const DeepCollectionEquality().equals(other.ageMin, ageMin)) &&
            (identical(other.ageMax, ageMax) ||
                const DeepCollectionEquality().equals(other.ageMax, ageMax)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.educatorName, educatorName) ||
                const DeepCollectionEquality()
                    .equals(other.educatorName, educatorName)) &&
            (identical(other.mainImage, mainImage) ||
                const DeepCollectionEquality()
                    .equals(other.mainImage, mainImage)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(gallery) ^
      const DeepCollectionEquality().hash(ageMin) ^
      const DeepCollectionEquality().hash(ageMax) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(educatorName) ^
      const DeepCollectionEquality().hash(mainImage) ^
      runtimeType.hashCode;
}

extension $KindergartenProfileClassExtension on KindergartenProfileClass {
  KindergartenProfileClass copyWith(
      {int? id,
      List<KindergartenProfileClassGalleryImage>? gallery,
      int? ageMin,
      int? ageMax,
      String? name,
      String? description,
      String? educatorName,
      String? mainImage}) {
    return KindergartenProfileClass(
        id: id ?? this.id,
        gallery: gallery ?? this.gallery,
        ageMin: ageMin ?? this.ageMin,
        ageMax: ageMax ?? this.ageMax,
        name: name ?? this.name,
        description: description ?? this.description,
        educatorName: educatorName ?? this.educatorName,
        mainImage: mainImage ?? this.mainImage);
  }

  KindergartenProfileClass copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<List<KindergartenProfileClassGalleryImage>?>? gallery,
      Wrapped<int?>? ageMin,
      Wrapped<int?>? ageMax,
      Wrapped<String?>? name,
      Wrapped<String?>? description,
      Wrapped<String?>? educatorName,
      Wrapped<String?>? mainImage}) {
    return KindergartenProfileClass(
        id: (id != null ? id.value : this.id),
        gallery: (gallery != null ? gallery.value : this.gallery),
        ageMin: (ageMin != null ? ageMin.value : this.ageMin),
        ageMax: (ageMax != null ? ageMax.value : this.ageMax),
        name: (name != null ? name.value : this.name),
        description:
            (description != null ? description.value : this.description),
        educatorName:
            (educatorName != null ? educatorName.value : this.educatorName),
        mainImage: (mainImage != null ? mainImage.value : this.mainImage));
  }
}

@JsonSerializable(explicitToJson: true)
class KindergartenProfilePlacesAvailability {
  KindergartenProfilePlacesAvailability({
    this.id,
    this.ageMin,
    this.ageMax,
    this.title,
    this.freePlaces,
  });

  factory KindergartenProfilePlacesAvailability.fromJson(
          Map<String, dynamic> json) =>
      _$KindergartenProfilePlacesAvailabilityFromJson(json);

  static const toJsonFactory = _$KindergartenProfilePlacesAvailabilityToJson;
  Map<String, dynamic> toJson() =>
      _$KindergartenProfilePlacesAvailabilityToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'age_min', includeIfNull: false)
  final int? ageMin;
  @JsonKey(name: 'age_max', includeIfNull: false)
  final int? ageMax;
  @JsonKey(name: 'title', includeIfNull: false, defaultValue: '')
  final String? title;
  @JsonKey(name: 'free_places', includeIfNull: false)
  final int? freePlaces;
  static const fromJsonFactory =
      _$KindergartenProfilePlacesAvailabilityFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is KindergartenProfilePlacesAvailability &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.ageMin, ageMin) ||
                const DeepCollectionEquality().equals(other.ageMin, ageMin)) &&
            (identical(other.ageMax, ageMax) ||
                const DeepCollectionEquality().equals(other.ageMax, ageMax)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.freePlaces, freePlaces) ||
                const DeepCollectionEquality()
                    .equals(other.freePlaces, freePlaces)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(ageMin) ^
      const DeepCollectionEquality().hash(ageMax) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(freePlaces) ^
      runtimeType.hashCode;
}

extension $KindergartenProfilePlacesAvailabilityExtension
    on KindergartenProfilePlacesAvailability {
  KindergartenProfilePlacesAvailability copyWith(
      {int? id, int? ageMin, int? ageMax, String? title, int? freePlaces}) {
    return KindergartenProfilePlacesAvailability(
        id: id ?? this.id,
        ageMin: ageMin ?? this.ageMin,
        ageMax: ageMax ?? this.ageMax,
        title: title ?? this.title,
        freePlaces: freePlaces ?? this.freePlaces);
  }

  KindergartenProfilePlacesAvailability copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<int?>? ageMin,
      Wrapped<int?>? ageMax,
      Wrapped<String?>? title,
      Wrapped<int?>? freePlaces}) {
    return KindergartenProfilePlacesAvailability(
        id: (id != null ? id.value : this.id),
        ageMin: (ageMin != null ? ageMin.value : this.ageMin),
        ageMax: (ageMax != null ? ageMax.value : this.ageMax),
        title: (title != null ? title.value : this.title),
        freePlaces: (freePlaces != null ? freePlaces.value : this.freePlaces));
  }
}

@JsonSerializable(explicitToJson: true)
class KindergartenProfileSpecialKidsAccomodation {
  KindergartenProfileSpecialKidsAccomodation({
    this.description,
    this.acceptedAllergies,
    this.acceptedDiseases,
  });

  factory KindergartenProfileSpecialKidsAccomodation.fromJson(
          Map<String, dynamic> json) =>
      _$KindergartenProfileSpecialKidsAccomodationFromJson(json);

  static const toJsonFactory =
      _$KindergartenProfileSpecialKidsAccomodationToJson;
  Map<String, dynamic> toJson() =>
      _$KindergartenProfileSpecialKidsAccomodationToJson(this);

  @JsonKey(name: 'description', includeIfNull: false, defaultValue: '')
  final String? description;
  @JsonKey(
      name: 'accepted_allergies', includeIfNull: false, defaultValue: <int>[])
  final List<int>? acceptedAllergies;
  @JsonKey(
      name: 'accepted_diseases', includeIfNull: false, defaultValue: <int>[])
  final List<int>? acceptedDiseases;
  static const fromJsonFactory =
      _$KindergartenProfileSpecialKidsAccomodationFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is KindergartenProfileSpecialKidsAccomodation &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.acceptedAllergies, acceptedAllergies) ||
                const DeepCollectionEquality()
                    .equals(other.acceptedAllergies, acceptedAllergies)) &&
            (identical(other.acceptedDiseases, acceptedDiseases) ||
                const DeepCollectionEquality()
                    .equals(other.acceptedDiseases, acceptedDiseases)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(acceptedAllergies) ^
      const DeepCollectionEquality().hash(acceptedDiseases) ^
      runtimeType.hashCode;
}

extension $KindergartenProfileSpecialKidsAccomodationExtension
    on KindergartenProfileSpecialKidsAccomodation {
  KindergartenProfileSpecialKidsAccomodation copyWith(
      {String? description,
      List<int>? acceptedAllergies,
      List<int>? acceptedDiseases}) {
    return KindergartenProfileSpecialKidsAccomodation(
        description: description ?? this.description,
        acceptedAllergies: acceptedAllergies ?? this.acceptedAllergies,
        acceptedDiseases: acceptedDiseases ?? this.acceptedDiseases);
  }

  KindergartenProfileSpecialKidsAccomodation copyWithWrapped(
      {Wrapped<String?>? description,
      Wrapped<List<int>?>? acceptedAllergies,
      Wrapped<List<int>?>? acceptedDiseases}) {
    return KindergartenProfileSpecialKidsAccomodation(
        description:
            (description != null ? description.value : this.description),
        acceptedAllergies: (acceptedAllergies != null
            ? acceptedAllergies.value
            : this.acceptedAllergies),
        acceptedDiseases: (acceptedDiseases != null
            ? acceptedDiseases.value
            : this.acceptedDiseases));
  }
}

@JsonSerializable(explicitToJson: true)
class KindergartenProfileRead {
  KindergartenProfileRead({
    this.userId,
    this.phone,
    this.name,
    this.address,
    this.phone1,
    this.phone2,
    this.avatar,
    this.email1,
    this.email2,
    this.childCareType,
    this.website,
    this.presentationOfKindergarten,
    this.descriptionOfServices,
    this.educationalProgram,
    this.groups,
    this.serviceSchedule,
    this.tariffs,
    this.typicalDay,
    this.menu,
    this.classes,
    this.placesAvailability,
    this.accomodationForSpecialKids,
    this.admissionPolicy,
  });

  factory KindergartenProfileRead.fromJson(Map<String, dynamic> json) =>
      _$KindergartenProfileReadFromJson(json);

  static const toJsonFactory = _$KindergartenProfileReadToJson;
  Map<String, dynamic> toJson() => _$KindergartenProfileReadToJson(this);

  @JsonKey(name: 'user_id', includeIfNull: false, defaultValue: '')
  final String? userId;
  @JsonKey(name: 'phone', includeIfNull: false)
  final KindergartenProfileRead$Phone? phone;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  @JsonKey(name: 'address', includeIfNull: false)
  final Address? address;
  @JsonKey(name: 'phone_1', includeIfNull: false)
  final KindergartenProfileRead$Phone1? phone1;
  @JsonKey(name: 'phone_2', includeIfNull: false)
  final KindergartenProfileRead$Phone2? phone2;
  @JsonKey(name: 'avatar', includeIfNull: false, defaultValue: '')
  final String? avatar;
  @JsonKey(name: 'email_1', includeIfNull: false, defaultValue: '')
  final String? email1;
  @JsonKey(name: 'email_2', includeIfNull: false, defaultValue: '')
  final String? email2;
  @JsonKey(
    name: 'child_care_type',
    includeIfNull: false,
    toJson: kindergartenProfileReadChildCareTypeToJson,
    fromJson: kindergartenProfileReadChildCareTypeFromJson,
  )
  final enums.KindergartenProfileReadChildCareType? childCareType;
  @JsonKey(name: 'website', includeIfNull: false, defaultValue: '')
  final String? website;
  @JsonKey(
      name: 'presentation_of_kindergarten',
      includeIfNull: false,
      defaultValue: '')
  final String? presentationOfKindergarten;
  @JsonKey(
      name: 'description_of_services', includeIfNull: false, defaultValue: '')
  final String? descriptionOfServices;
  @JsonKey(name: 'educational_program', includeIfNull: false, defaultValue: '')
  final String? educationalProgram;
  @JsonKey(name: 'groups', includeIfNull: false, defaultValue: '')
  final String? groups;
  @JsonKey(name: 'service_schedule', includeIfNull: false)
  final KindergartenProfileServiceSchedule? serviceSchedule;
  @JsonKey(name: 'tariffs', includeIfNull: false)
  final KindergartenProfileTariffs? tariffs;
  @JsonKey(name: 'typical_day', includeIfNull: false)
  final KindergartenProfileTypicalDay? typicalDay;
  @JsonKey(name: 'menu', includeIfNull: false, defaultValue: '')
  final String? menu;
  @JsonKey(
      name: 'classes',
      includeIfNull: false,
      defaultValue: <KindergartenProfileClass>[])
  final List<KindergartenProfileClass>? classes;
  @JsonKey(
      name: 'places_availability',
      includeIfNull: false,
      defaultValue: <KindergartenProfilePlacesAvailability>[])
  final List<KindergartenProfilePlacesAvailability>? placesAvailability;
  @JsonKey(name: 'accomodation_for_special_kids', includeIfNull: false)
  final KindergartenProfileSpecialKidsAccomodation? accomodationForSpecialKids;
  @JsonKey(name: 'admission_policy', includeIfNull: false, defaultValue: '')
  final String? admissionPolicy;
  static const fromJsonFactory = _$KindergartenProfileReadFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is KindergartenProfileRead &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.phone1, phone1) ||
                const DeepCollectionEquality().equals(other.phone1, phone1)) &&
            (identical(other.phone2, phone2) ||
                const DeepCollectionEquality().equals(other.phone2, phone2)) &&
            (identical(other.avatar, avatar) ||
                const DeepCollectionEquality().equals(other.avatar, avatar)) &&
            (identical(other.email1, email1) ||
                const DeepCollectionEquality().equals(other.email1, email1)) &&
            (identical(other.email2, email2) ||
                const DeepCollectionEquality().equals(other.email2, email2)) &&
            (identical(other.childCareType, childCareType) ||
                const DeepCollectionEquality()
                    .equals(other.childCareType, childCareType)) &&
            (identical(other.website, website) ||
                const DeepCollectionEquality()
                    .equals(other.website, website)) &&
            (identical(other.presentationOfKindergarten, presentationOfKindergarten) ||
                const DeepCollectionEquality().equals(
                    other.presentationOfKindergarten,
                    presentationOfKindergarten)) &&
            (identical(other.descriptionOfServices, descriptionOfServices) ||
                const DeepCollectionEquality().equals(
                    other.descriptionOfServices, descriptionOfServices)) &&
            (identical(other.educationalProgram, educationalProgram) ||
                const DeepCollectionEquality()
                    .equals(other.educationalProgram, educationalProgram)) &&
            (identical(other.groups, groups) ||
                const DeepCollectionEquality().equals(other.groups, groups)) &&
            (identical(other.serviceSchedule, serviceSchedule) ||
                const DeepCollectionEquality()
                    .equals(other.serviceSchedule, serviceSchedule)) &&
            (identical(other.tariffs, tariffs) ||
                const DeepCollectionEquality()
                    .equals(other.tariffs, tariffs)) &&
            (identical(other.typicalDay, typicalDay) ||
                const DeepCollectionEquality()
                    .equals(other.typicalDay, typicalDay)) &&
            (identical(other.menu, menu) ||
                const DeepCollectionEquality().equals(other.menu, menu)) &&
            (identical(other.classes, classes) ||
                const DeepCollectionEquality()
                    .equals(other.classes, classes)) &&
            (identical(other.placesAvailability, placesAvailability) ||
                const DeepCollectionEquality()
                    .equals(other.placesAvailability, placesAvailability)) &&
            (identical(other.accomodationForSpecialKids, accomodationForSpecialKids) ||
                const DeepCollectionEquality().equals(
                    other.accomodationForSpecialKids,
                    accomodationForSpecialKids)) &&
            (identical(other.admissionPolicy, admissionPolicy) || const DeepCollectionEquality().equals(other.admissionPolicy, admissionPolicy)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(phone1) ^
      const DeepCollectionEquality().hash(phone2) ^
      const DeepCollectionEquality().hash(avatar) ^
      const DeepCollectionEquality().hash(email1) ^
      const DeepCollectionEquality().hash(email2) ^
      const DeepCollectionEquality().hash(childCareType) ^
      const DeepCollectionEquality().hash(website) ^
      const DeepCollectionEquality().hash(presentationOfKindergarten) ^
      const DeepCollectionEquality().hash(descriptionOfServices) ^
      const DeepCollectionEquality().hash(educationalProgram) ^
      const DeepCollectionEquality().hash(groups) ^
      const DeepCollectionEquality().hash(serviceSchedule) ^
      const DeepCollectionEquality().hash(tariffs) ^
      const DeepCollectionEquality().hash(typicalDay) ^
      const DeepCollectionEquality().hash(menu) ^
      const DeepCollectionEquality().hash(classes) ^
      const DeepCollectionEquality().hash(placesAvailability) ^
      const DeepCollectionEquality().hash(accomodationForSpecialKids) ^
      const DeepCollectionEquality().hash(admissionPolicy) ^
      runtimeType.hashCode;
}

extension $KindergartenProfileReadExtension on KindergartenProfileRead {
  KindergartenProfileRead copyWith(
      {String? userId,
      KindergartenProfileRead$Phone? phone,
      String? name,
      Address? address,
      KindergartenProfileRead$Phone1? phone1,
      KindergartenProfileRead$Phone2? phone2,
      String? avatar,
      String? email1,
      String? email2,
      enums.KindergartenProfileReadChildCareType? childCareType,
      String? website,
      String? presentationOfKindergarten,
      String? descriptionOfServices,
      String? educationalProgram,
      String? groups,
      KindergartenProfileServiceSchedule? serviceSchedule,
      KindergartenProfileTariffs? tariffs,
      KindergartenProfileTypicalDay? typicalDay,
      String? menu,
      List<KindergartenProfileClass>? classes,
      List<KindergartenProfilePlacesAvailability>? placesAvailability,
      KindergartenProfileSpecialKidsAccomodation? accomodationForSpecialKids,
      String? admissionPolicy}) {
    return KindergartenProfileRead(
        userId: userId ?? this.userId,
        phone: phone ?? this.phone,
        name: name ?? this.name,
        address: address ?? this.address,
        phone1: phone1 ?? this.phone1,
        phone2: phone2 ?? this.phone2,
        avatar: avatar ?? this.avatar,
        email1: email1 ?? this.email1,
        email2: email2 ?? this.email2,
        childCareType: childCareType ?? this.childCareType,
        website: website ?? this.website,
        presentationOfKindergarten:
            presentationOfKindergarten ?? this.presentationOfKindergarten,
        descriptionOfServices:
            descriptionOfServices ?? this.descriptionOfServices,
        educationalProgram: educationalProgram ?? this.educationalProgram,
        groups: groups ?? this.groups,
        serviceSchedule: serviceSchedule ?? this.serviceSchedule,
        tariffs: tariffs ?? this.tariffs,
        typicalDay: typicalDay ?? this.typicalDay,
        menu: menu ?? this.menu,
        classes: classes ?? this.classes,
        placesAvailability: placesAvailability ?? this.placesAvailability,
        accomodationForSpecialKids:
            accomodationForSpecialKids ?? this.accomodationForSpecialKids,
        admissionPolicy: admissionPolicy ?? this.admissionPolicy);
  }

  KindergartenProfileRead copyWithWrapped(
      {Wrapped<String?>? userId,
      Wrapped<KindergartenProfileRead$Phone?>? phone,
      Wrapped<String?>? name,
      Wrapped<Address?>? address,
      Wrapped<KindergartenProfileRead$Phone1?>? phone1,
      Wrapped<KindergartenProfileRead$Phone2?>? phone2,
      Wrapped<String?>? avatar,
      Wrapped<String?>? email1,
      Wrapped<String?>? email2,
      Wrapped<enums.KindergartenProfileReadChildCareType?>? childCareType,
      Wrapped<String?>? website,
      Wrapped<String?>? presentationOfKindergarten,
      Wrapped<String?>? descriptionOfServices,
      Wrapped<String?>? educationalProgram,
      Wrapped<String?>? groups,
      Wrapped<KindergartenProfileServiceSchedule?>? serviceSchedule,
      Wrapped<KindergartenProfileTariffs?>? tariffs,
      Wrapped<KindergartenProfileTypicalDay?>? typicalDay,
      Wrapped<String?>? menu,
      Wrapped<List<KindergartenProfileClass>?>? classes,
      Wrapped<List<KindergartenProfilePlacesAvailability>?>? placesAvailability,
      Wrapped<KindergartenProfileSpecialKidsAccomodation?>?
          accomodationForSpecialKids,
      Wrapped<String?>? admissionPolicy}) {
    return KindergartenProfileRead(
        userId: (userId != null ? userId.value : this.userId),
        phone: (phone != null ? phone.value : this.phone),
        name: (name != null ? name.value : this.name),
        address: (address != null ? address.value : this.address),
        phone1: (phone1 != null ? phone1.value : this.phone1),
        phone2: (phone2 != null ? phone2.value : this.phone2),
        avatar: (avatar != null ? avatar.value : this.avatar),
        email1: (email1 != null ? email1.value : this.email1),
        email2: (email2 != null ? email2.value : this.email2),
        childCareType:
            (childCareType != null ? childCareType.value : this.childCareType),
        website: (website != null ? website.value : this.website),
        presentationOfKindergarten: (presentationOfKindergarten != null
            ? presentationOfKindergarten.value
            : this.presentationOfKindergarten),
        descriptionOfServices: (descriptionOfServices != null
            ? descriptionOfServices.value
            : this.descriptionOfServices),
        educationalProgram: (educationalProgram != null
            ? educationalProgram.value
            : this.educationalProgram),
        groups: (groups != null ? groups.value : this.groups),
        serviceSchedule: (serviceSchedule != null
            ? serviceSchedule.value
            : this.serviceSchedule),
        tariffs: (tariffs != null ? tariffs.value : this.tariffs),
        typicalDay: (typicalDay != null ? typicalDay.value : this.typicalDay),
        menu: (menu != null ? menu.value : this.menu),
        classes: (classes != null ? classes.value : this.classes),
        placesAvailability: (placesAvailability != null
            ? placesAvailability.value
            : this.placesAvailability),
        accomodationForSpecialKids: (accomodationForSpecialKids != null
            ? accomodationForSpecialKids.value
            : this.accomodationForSpecialKids),
        admissionPolicy: (admissionPolicy != null
            ? admissionPolicy.value
            : this.admissionPolicy));
  }
}

@JsonSerializable(explicitToJson: true)
class KindergartenProfileSettings {
  KindergartenProfileSettings({
    this.email1,
    this.email2,
    this.name,
    this.address,
    this.phone1,
    this.phone2,
    this.website,
    this.presentationOfKindergarten,
    this.descriptionOfServices,
    this.educationalProgram,
    this.typicalDay,
    this.menu,
    this.classes,
    this.placesAvailability,
    this.accomodationForSpecialKids,
    this.admissionPolicy,
    this.serviceSchedule,
    this.tariffs,
  });

  factory KindergartenProfileSettings.fromJson(Map<String, dynamic> json) =>
      _$KindergartenProfileSettingsFromJson(json);

  static const toJsonFactory = _$KindergartenProfileSettingsToJson;
  Map<String, dynamic> toJson() => _$KindergartenProfileSettingsToJson(this);

  @JsonKey(name: 'email_1', includeIfNull: false)
  final bool? email1;
  @JsonKey(name: 'email_2', includeIfNull: false)
  final bool? email2;
  @JsonKey(name: 'name', includeIfNull: false)
  final bool? name;
  @JsonKey(name: 'address', includeIfNull: false)
  final bool? address;
  @JsonKey(name: 'phone_1', includeIfNull: false)
  final bool? phone1;
  @JsonKey(name: 'phone_2', includeIfNull: false)
  final bool? phone2;
  @JsonKey(name: 'website', includeIfNull: false)
  final bool? website;
  @JsonKey(name: 'presentation_of_kindergarten', includeIfNull: false)
  final bool? presentationOfKindergarten;
  @JsonKey(name: 'description_of_services', includeIfNull: false)
  final bool? descriptionOfServices;
  @JsonKey(name: 'educational_program', includeIfNull: false)
  final bool? educationalProgram;
  @JsonKey(name: 'typical_day', includeIfNull: false)
  final bool? typicalDay;
  @JsonKey(name: 'menu', includeIfNull: false)
  final bool? menu;
  @JsonKey(name: 'classes', includeIfNull: false)
  final bool? classes;
  @JsonKey(name: 'places_availability', includeIfNull: false)
  final bool? placesAvailability;
  @JsonKey(name: 'accomodation_for_special_kids', includeIfNull: false)
  final bool? accomodationForSpecialKids;
  @JsonKey(name: 'admission_policy', includeIfNull: false)
  final bool? admissionPolicy;
  @JsonKey(name: 'service_schedule', includeIfNull: false)
  final bool? serviceSchedule;
  @JsonKey(name: 'tariffs', includeIfNull: false)
  final bool? tariffs;
  static const fromJsonFactory = _$KindergartenProfileSettingsFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is KindergartenProfileSettings &&
            (identical(other.email1, email1) ||
                const DeepCollectionEquality().equals(other.email1, email1)) &&
            (identical(other.email2, email2) ||
                const DeepCollectionEquality().equals(other.email2, email2)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.phone1, phone1) ||
                const DeepCollectionEquality().equals(other.phone1, phone1)) &&
            (identical(other.phone2, phone2) ||
                const DeepCollectionEquality().equals(other.phone2, phone2)) &&
            (identical(other.website, website) ||
                const DeepCollectionEquality()
                    .equals(other.website, website)) &&
            (identical(other.presentationOfKindergarten, presentationOfKindergarten) ||
                const DeepCollectionEquality().equals(
                    other.presentationOfKindergarten,
                    presentationOfKindergarten)) &&
            (identical(other.descriptionOfServices, descriptionOfServices) ||
                const DeepCollectionEquality().equals(
                    other.descriptionOfServices, descriptionOfServices)) &&
            (identical(other.educationalProgram, educationalProgram) ||
                const DeepCollectionEquality()
                    .equals(other.educationalProgram, educationalProgram)) &&
            (identical(other.typicalDay, typicalDay) ||
                const DeepCollectionEquality()
                    .equals(other.typicalDay, typicalDay)) &&
            (identical(other.menu, menu) ||
                const DeepCollectionEquality().equals(other.menu, menu)) &&
            (identical(other.classes, classes) ||
                const DeepCollectionEquality()
                    .equals(other.classes, classes)) &&
            (identical(other.placesAvailability, placesAvailability) ||
                const DeepCollectionEquality()
                    .equals(other.placesAvailability, placesAvailability)) &&
            (identical(other.accomodationForSpecialKids,
                    accomodationForSpecialKids) ||
                const DeepCollectionEquality().equals(
                    other.accomodationForSpecialKids,
                    accomodationForSpecialKids)) &&
            (identical(other.admissionPolicy, admissionPolicy) ||
                const DeepCollectionEquality()
                    .equals(other.admissionPolicy, admissionPolicy)) &&
            (identical(other.serviceSchedule, serviceSchedule) ||
                const DeepCollectionEquality()
                    .equals(other.serviceSchedule, serviceSchedule)) &&
            (identical(other.tariffs, tariffs) ||
                const DeepCollectionEquality().equals(other.tariffs, tariffs)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(email1) ^
      const DeepCollectionEquality().hash(email2) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(phone1) ^
      const DeepCollectionEquality().hash(phone2) ^
      const DeepCollectionEquality().hash(website) ^
      const DeepCollectionEquality().hash(presentationOfKindergarten) ^
      const DeepCollectionEquality().hash(descriptionOfServices) ^
      const DeepCollectionEquality().hash(educationalProgram) ^
      const DeepCollectionEquality().hash(typicalDay) ^
      const DeepCollectionEquality().hash(menu) ^
      const DeepCollectionEquality().hash(classes) ^
      const DeepCollectionEquality().hash(placesAvailability) ^
      const DeepCollectionEquality().hash(accomodationForSpecialKids) ^
      const DeepCollectionEquality().hash(admissionPolicy) ^
      const DeepCollectionEquality().hash(serviceSchedule) ^
      const DeepCollectionEquality().hash(tariffs) ^
      runtimeType.hashCode;
}

extension $KindergartenProfileSettingsExtension on KindergartenProfileSettings {
  KindergartenProfileSettings copyWith(
      {bool? email1,
      bool? email2,
      bool? name,
      bool? address,
      bool? phone1,
      bool? phone2,
      bool? website,
      bool? presentationOfKindergarten,
      bool? descriptionOfServices,
      bool? educationalProgram,
      bool? typicalDay,
      bool? menu,
      bool? classes,
      bool? placesAvailability,
      bool? accomodationForSpecialKids,
      bool? admissionPolicy,
      bool? serviceSchedule,
      bool? tariffs}) {
    return KindergartenProfileSettings(
        email1: email1 ?? this.email1,
        email2: email2 ?? this.email2,
        name: name ?? this.name,
        address: address ?? this.address,
        phone1: phone1 ?? this.phone1,
        phone2: phone2 ?? this.phone2,
        website: website ?? this.website,
        presentationOfKindergarten:
            presentationOfKindergarten ?? this.presentationOfKindergarten,
        descriptionOfServices:
            descriptionOfServices ?? this.descriptionOfServices,
        educationalProgram: educationalProgram ?? this.educationalProgram,
        typicalDay: typicalDay ?? this.typicalDay,
        menu: menu ?? this.menu,
        classes: classes ?? this.classes,
        placesAvailability: placesAvailability ?? this.placesAvailability,
        accomodationForSpecialKids:
            accomodationForSpecialKids ?? this.accomodationForSpecialKids,
        admissionPolicy: admissionPolicy ?? this.admissionPolicy,
        serviceSchedule: serviceSchedule ?? this.serviceSchedule,
        tariffs: tariffs ?? this.tariffs);
  }

  KindergartenProfileSettings copyWithWrapped(
      {Wrapped<bool?>? email1,
      Wrapped<bool?>? email2,
      Wrapped<bool?>? name,
      Wrapped<bool?>? address,
      Wrapped<bool?>? phone1,
      Wrapped<bool?>? phone2,
      Wrapped<bool?>? website,
      Wrapped<bool?>? presentationOfKindergarten,
      Wrapped<bool?>? descriptionOfServices,
      Wrapped<bool?>? educationalProgram,
      Wrapped<bool?>? typicalDay,
      Wrapped<bool?>? menu,
      Wrapped<bool?>? classes,
      Wrapped<bool?>? placesAvailability,
      Wrapped<bool?>? accomodationForSpecialKids,
      Wrapped<bool?>? admissionPolicy,
      Wrapped<bool?>? serviceSchedule,
      Wrapped<bool?>? tariffs}) {
    return KindergartenProfileSettings(
        email1: (email1 != null ? email1.value : this.email1),
        email2: (email2 != null ? email2.value : this.email2),
        name: (name != null ? name.value : this.name),
        address: (address != null ? address.value : this.address),
        phone1: (phone1 != null ? phone1.value : this.phone1),
        phone2: (phone2 != null ? phone2.value : this.phone2),
        website: (website != null ? website.value : this.website),
        presentationOfKindergarten: (presentationOfKindergarten != null
            ? presentationOfKindergarten.value
            : this.presentationOfKindergarten),
        descriptionOfServices: (descriptionOfServices != null
            ? descriptionOfServices.value
            : this.descriptionOfServices),
        educationalProgram: (educationalProgram != null
            ? educationalProgram.value
            : this.educationalProgram),
        typicalDay: (typicalDay != null ? typicalDay.value : this.typicalDay),
        menu: (menu != null ? menu.value : this.menu),
        classes: (classes != null ? classes.value : this.classes),
        placesAvailability: (placesAvailability != null
            ? placesAvailability.value
            : this.placesAvailability),
        accomodationForSpecialKids: (accomodationForSpecialKids != null
            ? accomodationForSpecialKids.value
            : this.accomodationForSpecialKids),
        admissionPolicy: (admissionPolicy != null
            ? admissionPolicy.value
            : this.admissionPolicy),
        serviceSchedule: (serviceSchedule != null
            ? serviceSchedule.value
            : this.serviceSchedule),
        tariffs: (tariffs != null ? tariffs.value : this.tariffs));
  }
}

@JsonSerializable(explicitToJson: true)
class BaseProfileSignature {
  BaseProfileSignature({
    this.image,
    this.date,
  });

  factory BaseProfileSignature.fromJson(Map<String, dynamic> json) =>
      _$BaseProfileSignatureFromJson(json);

  static const toJsonFactory = _$BaseProfileSignatureToJson;
  Map<String, dynamic> toJson() => _$BaseProfileSignatureToJson(this);

  @JsonKey(name: 'image', includeIfNull: false, defaultValue: '')
  final String? image;
  @JsonKey(name: 'date', includeIfNull: false)
  final DateTime? date;
  static const fromJsonFactory = _$BaseProfileSignatureFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is BaseProfileSignature &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(date) ^
      runtimeType.hashCode;
}

extension $BaseProfileSignatureExtension on BaseProfileSignature {
  BaseProfileSignature copyWith({String? image, DateTime? date}) {
    return BaseProfileSignature(
        image: image ?? this.image, date: date ?? this.date);
  }

  BaseProfileSignature copyWithWrapped(
      {Wrapped<String?>? image, Wrapped<DateTime?>? date}) {
    return BaseProfileSignature(
        image: (image != null ? image.value : this.image),
        date: (date != null ? date.value : this.date));
  }
}

@JsonSerializable(explicitToJson: true)
class BaseProfileUser {
  BaseProfileUser({
    this.email,
    this.id,
    this.signature,
    this.isEmailVerified,
  });

  factory BaseProfileUser.fromJson(Map<String, dynamic> json) =>
      _$BaseProfileUserFromJson(json);

  static const toJsonFactory = _$BaseProfileUserToJson;
  Map<String, dynamic> toJson() => _$BaseProfileUserToJson(this);

  @JsonKey(name: 'email', includeIfNull: false, defaultValue: '')
  final String? email;
  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'signature', includeIfNull: false)
  final BaseProfileSignature? signature;
  @JsonKey(name: 'is_email_verified', includeIfNull: false, defaultValue: '')
  final String? isEmailVerified;
  static const fromJsonFactory = _$BaseProfileUserFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is BaseProfileUser &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.signature, signature) ||
                const DeepCollectionEquality()
                    .equals(other.signature, signature)) &&
            (identical(other.isEmailVerified, isEmailVerified) ||
                const DeepCollectionEquality()
                    .equals(other.isEmailVerified, isEmailVerified)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(signature) ^
      const DeepCollectionEquality().hash(isEmailVerified) ^
      runtimeType.hashCode;
}

extension $BaseProfileUserExtension on BaseProfileUser {
  BaseProfileUser copyWith(
      {String? email,
      int? id,
      BaseProfileSignature? signature,
      String? isEmailVerified}) {
    return BaseProfileUser(
        email: email ?? this.email,
        id: id ?? this.id,
        signature: signature ?? this.signature,
        isEmailVerified: isEmailVerified ?? this.isEmailVerified);
  }

  BaseProfileUser copyWithWrapped(
      {Wrapped<String?>? email,
      Wrapped<int?>? id,
      Wrapped<BaseProfileSignature?>? signature,
      Wrapped<String?>? isEmailVerified}) {
    return BaseProfileUser(
        email: (email != null ? email.value : this.email),
        id: (id != null ? id.value : this.id),
        signature: (signature != null ? signature.value : this.signature),
        isEmailVerified: (isEmailVerified != null
            ? isEmailVerified.value
            : this.isEmailVerified));
  }
}

@JsonSerializable(explicitToJson: true)
class KindergartenProfile {
  KindergartenProfile({
    this.phone,
    this.name,
    this.address,
    this.phone1,
    this.phone2,
    this.avatar,
    this.email1,
    this.email2,
    this.childCareType,
    this.website,
    this.presentationOfKindergarten,
    this.descriptionOfServices,
    this.educationalProgram,
    this.serviceSchedule,
    this.tariffs,
    this.typicalDay,
    this.menu,
    this.classes,
    this.placesAvailability,
    this.accomodationForSpecialKids,
    this.admissionPolicy,
    this.user,
  });

  factory KindergartenProfile.fromJson(Map<String, dynamic> json) =>
      _$KindergartenProfileFromJson(json);

  static const toJsonFactory = _$KindergartenProfileToJson;
  Map<String, dynamic> toJson() => _$KindergartenProfileToJson(this);

  @JsonKey(name: 'phone', includeIfNull: false)
  final KindergartenProfile$Phone? phone;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  @JsonKey(name: 'address', includeIfNull: false)
  final Address? address;
  @JsonKey(name: 'phone_1', includeIfNull: false)
  final KindergartenProfile$Phone1? phone1;
  @JsonKey(name: 'phone_2', includeIfNull: false)
  final KindergartenProfile$Phone2? phone2;
  @JsonKey(name: 'avatar', includeIfNull: false, defaultValue: '')
  final String? avatar;
  @JsonKey(name: 'email_1', includeIfNull: false, defaultValue: '')
  final String? email1;
  @JsonKey(name: 'email_2', includeIfNull: false, defaultValue: '')
  final String? email2;
  @JsonKey(
    name: 'child_care_type',
    includeIfNull: false,
    toJson: kindergartenProfileChildCareTypeToJson,
    fromJson: kindergartenProfileChildCareTypeFromJson,
  )
  final enums.KindergartenProfileChildCareType? childCareType;
  @JsonKey(name: 'website', includeIfNull: false, defaultValue: '')
  final String? website;
  @JsonKey(
      name: 'presentation_of_kindergarten',
      includeIfNull: false,
      defaultValue: '')
  final String? presentationOfKindergarten;
  @JsonKey(
      name: 'description_of_services', includeIfNull: false, defaultValue: '')
  final String? descriptionOfServices;
  @JsonKey(name: 'educational_program', includeIfNull: false, defaultValue: '')
  final String? educationalProgram;
  @JsonKey(name: 'service_schedule', includeIfNull: false)
  final KindergartenProfileServiceSchedule? serviceSchedule;
  @JsonKey(name: 'tariffs', includeIfNull: false)
  final KindergartenProfileTariffs? tariffs;
  @JsonKey(name: 'typical_day', includeIfNull: false)
  final KindergartenProfileTypicalDay? typicalDay;
  @JsonKey(name: 'menu', includeIfNull: false, defaultValue: '')
  final String? menu;
  @JsonKey(
      name: 'classes',
      includeIfNull: false,
      defaultValue: <KindergartenProfileClass>[])
  final List<KindergartenProfileClass>? classes;
  @JsonKey(
      name: 'places_availability',
      includeIfNull: false,
      defaultValue: <KindergartenProfilePlacesAvailability>[])
  final List<KindergartenProfilePlacesAvailability>? placesAvailability;
  @JsonKey(name: 'accomodation_for_special_kids', includeIfNull: false)
  final KindergartenProfileSpecialKidsAccomodation? accomodationForSpecialKids;
  @JsonKey(name: 'admission_policy', includeIfNull: false, defaultValue: '')
  final String? admissionPolicy;
  @JsonKey(name: 'user', includeIfNull: false)
  final BaseProfileUser? user;
  static const fromJsonFactory = _$KindergartenProfileFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is KindergartenProfile &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.phone1, phone1) ||
                const DeepCollectionEquality().equals(other.phone1, phone1)) &&
            (identical(other.phone2, phone2) ||
                const DeepCollectionEquality().equals(other.phone2, phone2)) &&
            (identical(other.avatar, avatar) ||
                const DeepCollectionEquality().equals(other.avatar, avatar)) &&
            (identical(other.email1, email1) ||
                const DeepCollectionEquality().equals(other.email1, email1)) &&
            (identical(other.email2, email2) ||
                const DeepCollectionEquality().equals(other.email2, email2)) &&
            (identical(other.childCareType, childCareType) ||
                const DeepCollectionEquality()
                    .equals(other.childCareType, childCareType)) &&
            (identical(other.website, website) ||
                const DeepCollectionEquality()
                    .equals(other.website, website)) &&
            (identical(other.presentationOfKindergarten, presentationOfKindergarten) ||
                const DeepCollectionEquality().equals(
                    other.presentationOfKindergarten,
                    presentationOfKindergarten)) &&
            (identical(other.descriptionOfServices, descriptionOfServices) ||
                const DeepCollectionEquality().equals(
                    other.descriptionOfServices, descriptionOfServices)) &&
            (identical(other.educationalProgram, educationalProgram) ||
                const DeepCollectionEquality()
                    .equals(other.educationalProgram, educationalProgram)) &&
            (identical(other.serviceSchedule, serviceSchedule) ||
                const DeepCollectionEquality()
                    .equals(other.serviceSchedule, serviceSchedule)) &&
            (identical(other.tariffs, tariffs) ||
                const DeepCollectionEquality()
                    .equals(other.tariffs, tariffs)) &&
            (identical(other.typicalDay, typicalDay) ||
                const DeepCollectionEquality()
                    .equals(other.typicalDay, typicalDay)) &&
            (identical(other.menu, menu) ||
                const DeepCollectionEquality().equals(other.menu, menu)) &&
            (identical(other.classes, classes) ||
                const DeepCollectionEquality()
                    .equals(other.classes, classes)) &&
            (identical(other.placesAvailability, placesAvailability) ||
                const DeepCollectionEquality()
                    .equals(other.placesAvailability, placesAvailability)) &&
            (identical(other.accomodationForSpecialKids, accomodationForSpecialKids) ||
                const DeepCollectionEquality().equals(
                    other.accomodationForSpecialKids,
                    accomodationForSpecialKids)) &&
            (identical(other.admissionPolicy, admissionPolicy) ||
                const DeepCollectionEquality()
                    .equals(other.admissionPolicy, admissionPolicy)) &&
            (identical(other.user, user) || const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(phone1) ^
      const DeepCollectionEquality().hash(phone2) ^
      const DeepCollectionEquality().hash(avatar) ^
      const DeepCollectionEquality().hash(email1) ^
      const DeepCollectionEquality().hash(email2) ^
      const DeepCollectionEquality().hash(childCareType) ^
      const DeepCollectionEquality().hash(website) ^
      const DeepCollectionEquality().hash(presentationOfKindergarten) ^
      const DeepCollectionEquality().hash(descriptionOfServices) ^
      const DeepCollectionEquality().hash(educationalProgram) ^
      const DeepCollectionEquality().hash(serviceSchedule) ^
      const DeepCollectionEquality().hash(tariffs) ^
      const DeepCollectionEquality().hash(typicalDay) ^
      const DeepCollectionEquality().hash(menu) ^
      const DeepCollectionEquality().hash(classes) ^
      const DeepCollectionEquality().hash(placesAvailability) ^
      const DeepCollectionEquality().hash(accomodationForSpecialKids) ^
      const DeepCollectionEquality().hash(admissionPolicy) ^
      const DeepCollectionEquality().hash(user) ^
      runtimeType.hashCode;
}

extension $KindergartenProfileExtension on KindergartenProfile {
  KindergartenProfile copyWith(
      {KindergartenProfile$Phone? phone,
      String? name,
      Address? address,
      KindergartenProfile$Phone1? phone1,
      KindergartenProfile$Phone2? phone2,
      String? avatar,
      String? email1,
      String? email2,
      enums.KindergartenProfileChildCareType? childCareType,
      String? website,
      String? presentationOfKindergarten,
      String? descriptionOfServices,
      String? educationalProgram,
      KindergartenProfileServiceSchedule? serviceSchedule,
      KindergartenProfileTariffs? tariffs,
      KindergartenProfileTypicalDay? typicalDay,
      String? menu,
      List<KindergartenProfileClass>? classes,
      List<KindergartenProfilePlacesAvailability>? placesAvailability,
      KindergartenProfileSpecialKidsAccomodation? accomodationForSpecialKids,
      String? admissionPolicy,
      BaseProfileUser? user}) {
    return KindergartenProfile(
        phone: phone ?? this.phone,
        name: name ?? this.name,
        address: address ?? this.address,
        phone1: phone1 ?? this.phone1,
        phone2: phone2 ?? this.phone2,
        avatar: avatar ?? this.avatar,
        email1: email1 ?? this.email1,
        email2: email2 ?? this.email2,
        childCareType: childCareType ?? this.childCareType,
        website: website ?? this.website,
        presentationOfKindergarten:
            presentationOfKindergarten ?? this.presentationOfKindergarten,
        descriptionOfServices:
            descriptionOfServices ?? this.descriptionOfServices,
        educationalProgram: educationalProgram ?? this.educationalProgram,
        serviceSchedule: serviceSchedule ?? this.serviceSchedule,
        tariffs: tariffs ?? this.tariffs,
        typicalDay: typicalDay ?? this.typicalDay,
        menu: menu ?? this.menu,
        classes: classes ?? this.classes,
        placesAvailability: placesAvailability ?? this.placesAvailability,
        accomodationForSpecialKids:
            accomodationForSpecialKids ?? this.accomodationForSpecialKids,
        admissionPolicy: admissionPolicy ?? this.admissionPolicy,
        user: user ?? this.user);
  }

  KindergartenProfile copyWithWrapped(
      {Wrapped<KindergartenProfile$Phone?>? phone,
      Wrapped<String?>? name,
      Wrapped<Address?>? address,
      Wrapped<KindergartenProfile$Phone1?>? phone1,
      Wrapped<KindergartenProfile$Phone2?>? phone2,
      Wrapped<String?>? avatar,
      Wrapped<String?>? email1,
      Wrapped<String?>? email2,
      Wrapped<enums.KindergartenProfileChildCareType?>? childCareType,
      Wrapped<String?>? website,
      Wrapped<String?>? presentationOfKindergarten,
      Wrapped<String?>? descriptionOfServices,
      Wrapped<String?>? educationalProgram,
      Wrapped<KindergartenProfileServiceSchedule?>? serviceSchedule,
      Wrapped<KindergartenProfileTariffs?>? tariffs,
      Wrapped<KindergartenProfileTypicalDay?>? typicalDay,
      Wrapped<String?>? menu,
      Wrapped<List<KindergartenProfileClass>?>? classes,
      Wrapped<List<KindergartenProfilePlacesAvailability>?>? placesAvailability,
      Wrapped<KindergartenProfileSpecialKidsAccomodation?>?
          accomodationForSpecialKids,
      Wrapped<String?>? admissionPolicy,
      Wrapped<BaseProfileUser?>? user}) {
    return KindergartenProfile(
        phone: (phone != null ? phone.value : this.phone),
        name: (name != null ? name.value : this.name),
        address: (address != null ? address.value : this.address),
        phone1: (phone1 != null ? phone1.value : this.phone1),
        phone2: (phone2 != null ? phone2.value : this.phone2),
        avatar: (avatar != null ? avatar.value : this.avatar),
        email1: (email1 != null ? email1.value : this.email1),
        email2: (email2 != null ? email2.value : this.email2),
        childCareType:
            (childCareType != null ? childCareType.value : this.childCareType),
        website: (website != null ? website.value : this.website),
        presentationOfKindergarten: (presentationOfKindergarten != null
            ? presentationOfKindergarten.value
            : this.presentationOfKindergarten),
        descriptionOfServices: (descriptionOfServices != null
            ? descriptionOfServices.value
            : this.descriptionOfServices),
        educationalProgram: (educationalProgram != null
            ? educationalProgram.value
            : this.educationalProgram),
        serviceSchedule: (serviceSchedule != null
            ? serviceSchedule.value
            : this.serviceSchedule),
        tariffs: (tariffs != null ? tariffs.value : this.tariffs),
        typicalDay: (typicalDay != null ? typicalDay.value : this.typicalDay),
        menu: (menu != null ? menu.value : this.menu),
        classes: (classes != null ? classes.value : this.classes),
        placesAvailability: (placesAvailability != null
            ? placesAvailability.value
            : this.placesAvailability),
        accomodationForSpecialKids: (accomodationForSpecialKids != null
            ? accomodationForSpecialKids.value
            : this.accomodationForSpecialKids),
        admissionPolicy: (admissionPolicy != null
            ? admissionPolicy.value
            : this.admissionPolicy),
        user: (user != null ? user.value : this.user));
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
class ParentProfile {
  ParentProfile({
    this.id,
    this.user,
    this.phone,
    this.address,
    this.familyId,
    this.avatar,
    this.birthDate,
    this.firstName,
    this.lastName,
    this.sex,
    this.dateJoined,
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
  @JsonKey(name: 'family_id', includeIfNull: false, defaultValue: '')
  final String? familyId;
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
  @JsonKey(name: 'date_joined', includeIfNull: false)
  final DateTime? dateJoined;
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
            (identical(other.familyId, familyId) ||
                const DeepCollectionEquality()
                    .equals(other.familyId, familyId)) &&
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
                    .equals(other.dateJoined, dateJoined)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(familyId) ^
      const DeepCollectionEquality().hash(avatar) ^
      const DeepCollectionEquality().hash(birthDate) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(sex) ^
      const DeepCollectionEquality().hash(dateJoined) ^
      runtimeType.hashCode;
}

extension $ParentProfileExtension on ParentProfile {
  ParentProfile copyWith(
      {int? id,
      Parent? user,
      ParentProfile$Phone? phone,
      Address? address,
      String? familyId,
      String? avatar,
      DateTime? birthDate,
      String? firstName,
      String? lastName,
      enums.ParentProfileSex? sex,
      DateTime? dateJoined}) {
    return ParentProfile(
        id: id ?? this.id,
        user: user ?? this.user,
        phone: phone ?? this.phone,
        address: address ?? this.address,
        familyId: familyId ?? this.familyId,
        avatar: avatar ?? this.avatar,
        birthDate: birthDate ?? this.birthDate,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        sex: sex ?? this.sex,
        dateJoined: dateJoined ?? this.dateJoined);
  }

  ParentProfile copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<Parent?>? user,
      Wrapped<ParentProfile$Phone?>? phone,
      Wrapped<Address?>? address,
      Wrapped<String?>? familyId,
      Wrapped<String?>? avatar,
      Wrapped<DateTime?>? birthDate,
      Wrapped<String?>? firstName,
      Wrapped<String?>? lastName,
      Wrapped<enums.ParentProfileSex?>? sex,
      Wrapped<DateTime?>? dateJoined}) {
    return ParentProfile(
        id: (id != null ? id.value : this.id),
        user: (user != null ? user.value : this.user),
        phone: (phone != null ? phone.value : this.phone),
        address: (address != null ? address.value : this.address),
        familyId: (familyId != null ? familyId.value : this.familyId),
        avatar: (avatar != null ? avatar.value : this.avatar),
        birthDate: (birthDate != null ? birthDate.value : this.birthDate),
        firstName: (firstName != null ? firstName.value : this.firstName),
        lastName: (lastName != null ? lastName.value : this.lastName),
        sex: (sex != null ? sex.value : this.sex),
        dateJoined: (dateJoined != null ? dateJoined.value : this.dateJoined));
  }
}

@JsonSerializable(explicitToJson: true)
class EducatorUserRegistration {
  EducatorUserRegistration({
    this.email,
    this.password1,
    this.password2,
  });

  factory EducatorUserRegistration.fromJson(Map<String, dynamic> json) =>
      _$EducatorUserRegistrationFromJson(json);

  static const toJsonFactory = _$EducatorUserRegistrationToJson;
  Map<String, dynamic> toJson() => _$EducatorUserRegistrationToJson(this);

  @JsonKey(name: 'email', includeIfNull: false, defaultValue: '')
  final String? email;
  @JsonKey(name: 'password1', includeIfNull: false, defaultValue: '')
  final String? password1;
  @JsonKey(name: 'password2', includeIfNull: false, defaultValue: '')
  final String? password2;
  static const fromJsonFactory = _$EducatorUserRegistrationFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EducatorUserRegistration &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password1, password1) ||
                const DeepCollectionEquality()
                    .equals(other.password1, password1)) &&
            (identical(other.password2, password2) ||
                const DeepCollectionEquality()
                    .equals(other.password2, password2)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password1) ^
      const DeepCollectionEquality().hash(password2) ^
      runtimeType.hashCode;
}

extension $EducatorUserRegistrationExtension on EducatorUserRegistration {
  EducatorUserRegistration copyWith(
      {String? email, String? password1, String? password2}) {
    return EducatorUserRegistration(
        email: email ?? this.email,
        password1: password1 ?? this.password1,
        password2: password2 ?? this.password2);
  }

  EducatorUserRegistration copyWithWrapped(
      {Wrapped<String?>? email,
      Wrapped<String?>? password1,
      Wrapped<String?>? password2}) {
    return EducatorUserRegistration(
        email: (email != null ? email.value : this.email),
        password1: (password1 != null ? password1.value : this.password1),
        password2: (password2 != null ? password2.value : this.password2));
  }
}

@JsonSerializable(explicitToJson: true)
class EducatorRegistration {
  EducatorRegistration({
    this.user,
    this.phone,
    this.address,
    this.birthDate,
    this.firstName,
    this.lastName,
    this.sex,
    this.avatar,
  });

  factory EducatorRegistration.fromJson(Map<String, dynamic> json) =>
      _$EducatorRegistrationFromJson(json);

  static const toJsonFactory = _$EducatorRegistrationToJson;
  Map<String, dynamic> toJson() => _$EducatorRegistrationToJson(this);

  @JsonKey(name: 'user', includeIfNull: false)
  final EducatorUserRegistration? user;
  @JsonKey(name: 'phone', includeIfNull: false)
  final EducatorRegistration$Phone? phone;
  @JsonKey(name: 'address', includeIfNull: false)
  final Address? address;
  @JsonKey(name: 'birth_date', includeIfNull: false)
  final DateTime? birthDate;
  @JsonKey(name: 'first_name', includeIfNull: false, defaultValue: '')
  final String? firstName;
  @JsonKey(name: 'last_name', includeIfNull: false, defaultValue: '')
  final String? lastName;
  @JsonKey(
    name: 'sex',
    includeIfNull: false,
    toJson: educatorRegistrationSexToJson,
    fromJson: educatorRegistrationSexFromJson,
  )
  final enums.EducatorRegistrationSex? sex;
  @JsonKey(name: 'avatar', includeIfNull: false, defaultValue: '')
  final String? avatar;
  static const fromJsonFactory = _$EducatorRegistrationFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EducatorRegistration &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
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
            (identical(other.avatar, avatar) ||
                const DeepCollectionEquality().equals(other.avatar, avatar)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(birthDate) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(sex) ^
      const DeepCollectionEquality().hash(avatar) ^
      runtimeType.hashCode;
}

extension $EducatorRegistrationExtension on EducatorRegistration {
  EducatorRegistration copyWith(
      {EducatorUserRegistration? user,
      EducatorRegistration$Phone? phone,
      Address? address,
      DateTime? birthDate,
      String? firstName,
      String? lastName,
      enums.EducatorRegistrationSex? sex,
      String? avatar}) {
    return EducatorRegistration(
        user: user ?? this.user,
        phone: phone ?? this.phone,
        address: address ?? this.address,
        birthDate: birthDate ?? this.birthDate,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        sex: sex ?? this.sex,
        avatar: avatar ?? this.avatar);
  }

  EducatorRegistration copyWithWrapped(
      {Wrapped<EducatorUserRegistration?>? user,
      Wrapped<EducatorRegistration$Phone?>? phone,
      Wrapped<Address?>? address,
      Wrapped<DateTime?>? birthDate,
      Wrapped<String?>? firstName,
      Wrapped<String?>? lastName,
      Wrapped<enums.EducatorRegistrationSex?>? sex,
      Wrapped<String?>? avatar}) {
    return EducatorRegistration(
        user: (user != null ? user.value : this.user),
        phone: (phone != null ? phone.value : this.phone),
        address: (address != null ? address.value : this.address),
        birthDate: (birthDate != null ? birthDate.value : this.birthDate),
        firstName: (firstName != null ? firstName.value : this.firstName),
        lastName: (lastName != null ? lastName.value : this.lastName),
        sex: (sex != null ? sex.value : this.sex),
        avatar: (avatar != null ? avatar.value : this.avatar));
  }
}

@JsonSerializable(explicitToJson: true)
class ParentRegistrationUser {
  ParentRegistrationUser({
    this.email,
    this.password1,
    this.password2,
  });

  factory ParentRegistrationUser.fromJson(Map<String, dynamic> json) =>
      _$ParentRegistrationUserFromJson(json);

  static const toJsonFactory = _$ParentRegistrationUserToJson;
  Map<String, dynamic> toJson() => _$ParentRegistrationUserToJson(this);

  @JsonKey(name: 'email', includeIfNull: false, defaultValue: '')
  final String? email;
  @JsonKey(name: 'password1', includeIfNull: false, defaultValue: '')
  final String? password1;
  @JsonKey(name: 'password2', includeIfNull: false, defaultValue: '')
  final String? password2;
  static const fromJsonFactory = _$ParentRegistrationUserFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ParentRegistrationUser &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password1, password1) ||
                const DeepCollectionEquality()
                    .equals(other.password1, password1)) &&
            (identical(other.password2, password2) ||
                const DeepCollectionEquality()
                    .equals(other.password2, password2)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password1) ^
      const DeepCollectionEquality().hash(password2) ^
      runtimeType.hashCode;
}

extension $ParentRegistrationUserExtension on ParentRegistrationUser {
  ParentRegistrationUser copyWith(
      {String? email, String? password1, String? password2}) {
    return ParentRegistrationUser(
        email: email ?? this.email,
        password1: password1 ?? this.password1,
        password2: password2 ?? this.password2);
  }

  ParentRegistrationUser copyWithWrapped(
      {Wrapped<String?>? email,
      Wrapped<String?>? password1,
      Wrapped<String?>? password2}) {
    return ParentRegistrationUser(
        email: (email != null ? email.value : this.email),
        password1: (password1 != null ? password1.value : this.password1),
        password2: (password2 != null ? password2.value : this.password2));
  }
}

@JsonSerializable(explicitToJson: true)
class ParentRegistration {
  ParentRegistration({
    this.user,
    this.phone,
    this.address,
    this.birthDate,
    this.firstName,
    this.lastName,
    this.sex,
    this.avatar,
  });

  factory ParentRegistration.fromJson(Map<String, dynamic> json) =>
      _$ParentRegistrationFromJson(json);

  static const toJsonFactory = _$ParentRegistrationToJson;
  Map<String, dynamic> toJson() => _$ParentRegistrationToJson(this);

  @JsonKey(name: 'user', includeIfNull: false)
  final ParentRegistrationUser? user;
  @JsonKey(name: 'phone', includeIfNull: false)
  final ParentRegistration$Phone? phone;
  @JsonKey(name: 'address', includeIfNull: false)
  final Address? address;
  @JsonKey(name: 'birth_date', includeIfNull: false)
  final DateTime? birthDate;
  @JsonKey(name: 'first_name', includeIfNull: false, defaultValue: '')
  final String? firstName;
  @JsonKey(name: 'last_name', includeIfNull: false, defaultValue: '')
  final String? lastName;
  @JsonKey(
    name: 'sex',
    includeIfNull: false,
    toJson: parentRegistrationSexToJson,
    fromJson: parentRegistrationSexFromJson,
  )
  final enums.ParentRegistrationSex? sex;
  @JsonKey(name: 'avatar', includeIfNull: false, defaultValue: '')
  final String? avatar;
  static const fromJsonFactory = _$ParentRegistrationFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ParentRegistration &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
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
            (identical(other.avatar, avatar) ||
                const DeepCollectionEquality().equals(other.avatar, avatar)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(birthDate) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(sex) ^
      const DeepCollectionEquality().hash(avatar) ^
      runtimeType.hashCode;
}

extension $ParentRegistrationExtension on ParentRegistration {
  ParentRegistration copyWith(
      {ParentRegistrationUser? user,
      ParentRegistration$Phone? phone,
      Address? address,
      DateTime? birthDate,
      String? firstName,
      String? lastName,
      enums.ParentRegistrationSex? sex,
      String? avatar}) {
    return ParentRegistration(
        user: user ?? this.user,
        phone: phone ?? this.phone,
        address: address ?? this.address,
        birthDate: birthDate ?? this.birthDate,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        sex: sex ?? this.sex,
        avatar: avatar ?? this.avatar);
  }

  ParentRegistration copyWithWrapped(
      {Wrapped<ParentRegistrationUser?>? user,
      Wrapped<ParentRegistration$Phone?>? phone,
      Wrapped<Address?>? address,
      Wrapped<DateTime?>? birthDate,
      Wrapped<String?>? firstName,
      Wrapped<String?>? lastName,
      Wrapped<enums.ParentRegistrationSex?>? sex,
      Wrapped<String?>? avatar}) {
    return ParentRegistration(
        user: (user != null ? user.value : this.user),
        phone: (phone != null ? phone.value : this.phone),
        address: (address != null ? address.value : this.address),
        birthDate: (birthDate != null ? birthDate.value : this.birthDate),
        firstName: (firstName != null ? firstName.value : this.firstName),
        lastName: (lastName != null ? lastName.value : this.lastName),
        sex: (sex != null ? sex.value : this.sex),
        avatar: (avatar != null ? avatar.value : this.avatar));
  }
}

@JsonSerializable(explicitToJson: true)
class FamilyRegistration {
  FamilyRegistration({
    this.id,
    this.parent1,
    this.parent2,
    this.primaryContact,
  });

  factory FamilyRegistration.fromJson(Map<String, dynamic> json) =>
      _$FamilyRegistrationFromJson(json);

  static const toJsonFactory = _$FamilyRegistrationToJson;
  Map<String, dynamic> toJson() => _$FamilyRegistrationToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'parent1', includeIfNull: false)
  final ParentRegistration? parent1;
  @JsonKey(name: 'parent2', includeIfNull: false)
  final ParentRegistration? parent2;
  @JsonKey(
    name: 'primary_contact',
    includeIfNull: false,
    toJson: familyRegistrationPrimaryContactToJson,
    fromJson: familyRegistrationPrimaryContactFromJson,
  )
  final enums.FamilyRegistrationPrimaryContact? primaryContact;
  static const fromJsonFactory = _$FamilyRegistrationFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FamilyRegistration &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.parent1, parent1) ||
                const DeepCollectionEquality()
                    .equals(other.parent1, parent1)) &&
            (identical(other.parent2, parent2) ||
                const DeepCollectionEquality()
                    .equals(other.parent2, parent2)) &&
            (identical(other.primaryContact, primaryContact) ||
                const DeepCollectionEquality()
                    .equals(other.primaryContact, primaryContact)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(parent1) ^
      const DeepCollectionEquality().hash(parent2) ^
      const DeepCollectionEquality().hash(primaryContact) ^
      runtimeType.hashCode;
}

extension $FamilyRegistrationExtension on FamilyRegistration {
  FamilyRegistration copyWith(
      {int? id,
      ParentRegistration? parent1,
      ParentRegistration? parent2,
      enums.FamilyRegistrationPrimaryContact? primaryContact}) {
    return FamilyRegistration(
        id: id ?? this.id,
        parent1: parent1 ?? this.parent1,
        parent2: parent2 ?? this.parent2,
        primaryContact: primaryContact ?? this.primaryContact);
  }

  FamilyRegistration copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<ParentRegistration?>? parent1,
      Wrapped<ParentRegistration?>? parent2,
      Wrapped<enums.FamilyRegistrationPrimaryContact?>? primaryContact}) {
    return FamilyRegistration(
        id: (id != null ? id.value : this.id),
        parent1: (parent1 != null ? parent1.value : this.parent1),
        parent2: (parent2 != null ? parent2.value : this.parent2),
        primaryContact: (primaryContact != null
            ? primaryContact.value
            : this.primaryContact));
  }
}

@JsonSerializable(explicitToJson: true)
class FamilyRegistrationInviteSecondParent {
  FamilyRegistrationInviteSecondParent({
    this.parent1,
    this.parent2Email,
  });

  factory FamilyRegistrationInviteSecondParent.fromJson(
          Map<String, dynamic> json) =>
      _$FamilyRegistrationInviteSecondParentFromJson(json);

  static const toJsonFactory = _$FamilyRegistrationInviteSecondParentToJson;
  Map<String, dynamic> toJson() =>
      _$FamilyRegistrationInviteSecondParentToJson(this);

  @JsonKey(name: 'parent1', includeIfNull: false)
  final ParentRegistration? parent1;
  @JsonKey(name: 'parent2_email', includeIfNull: false, defaultValue: '')
  final String? parent2Email;
  static const fromJsonFactory = _$FamilyRegistrationInviteSecondParentFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FamilyRegistrationInviteSecondParent &&
            (identical(other.parent1, parent1) ||
                const DeepCollectionEquality()
                    .equals(other.parent1, parent1)) &&
            (identical(other.parent2Email, parent2Email) ||
                const DeepCollectionEquality()
                    .equals(other.parent2Email, parent2Email)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(parent1) ^
      const DeepCollectionEquality().hash(parent2Email) ^
      runtimeType.hashCode;
}

extension $FamilyRegistrationInviteSecondParentExtension
    on FamilyRegistrationInviteSecondParent {
  FamilyRegistrationInviteSecondParent copyWith(
      {ParentRegistration? parent1, String? parent2Email}) {
    return FamilyRegistrationInviteSecondParent(
        parent1: parent1 ?? this.parent1,
        parent2Email: parent2Email ?? this.parent2Email);
  }

  FamilyRegistrationInviteSecondParent copyWithWrapped(
      {Wrapped<ParentRegistration?>? parent1, Wrapped<String?>? parent2Email}) {
    return FamilyRegistrationInviteSecondParent(
        parent1: (parent1 != null ? parent1.value : this.parent1),
        parent2Email:
            (parent2Email != null ? parent2Email.value : this.parent2Email));
  }
}

@JsonSerializable(explicitToJson: true)
class ParentInvitationInitiate {
  ParentInvitationInitiate({
    this.email,
    this.family,
  });

  factory ParentInvitationInitiate.fromJson(Map<String, dynamic> json) =>
      _$ParentInvitationInitiateFromJson(json);

  static const toJsonFactory = _$ParentInvitationInitiateToJson;
  Map<String, dynamic> toJson() => _$ParentInvitationInitiateToJson(this);

  @JsonKey(name: 'email', includeIfNull: false, defaultValue: '')
  final String? email;
  @JsonKey(name: 'family', includeIfNull: false)
  final int? family;
  static const fromJsonFactory = _$ParentInvitationInitiateFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ParentInvitationInitiate &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.family, family) ||
                const DeepCollectionEquality().equals(other.family, family)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(family) ^
      runtimeType.hashCode;
}

extension $ParentInvitationInitiateExtension on ParentInvitationInitiate {
  ParentInvitationInitiate copyWith({String? email, int? family}) {
    return ParentInvitationInitiate(
        email: email ?? this.email, family: family ?? this.family);
  }

  ParentInvitationInitiate copyWithWrapped(
      {Wrapped<String?>? email, Wrapped<int?>? family}) {
    return ParentInvitationInitiate(
        email: (email != null ? email.value : this.email),
        family: (family != null ? family.value : this.family));
  }
}

@JsonSerializable(explicitToJson: true)
class ParentInvitationInfo {
  ParentInvitationInfo({
    this.id,
    this.email,
    this.family,
  });

  factory ParentInvitationInfo.fromJson(Map<String, dynamic> json) =>
      _$ParentInvitationInfoFromJson(json);

  static const toJsonFactory = _$ParentInvitationInfoToJson;
  Map<String, dynamic> toJson() => _$ParentInvitationInfoToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'email', includeIfNull: false, defaultValue: '')
  final String? email;
  @JsonKey(name: 'family', includeIfNull: false)
  final int? family;
  static const fromJsonFactory = _$ParentInvitationInfoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ParentInvitationInfo &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.family, family) ||
                const DeepCollectionEquality().equals(other.family, family)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(family) ^
      runtimeType.hashCode;
}

extension $ParentInvitationInfoExtension on ParentInvitationInfo {
  ParentInvitationInfo copyWith({int? id, String? email, int? family}) {
    return ParentInvitationInfo(
        id: id ?? this.id,
        email: email ?? this.email,
        family: family ?? this.family);
  }

  ParentInvitationInfo copyWithWrapped(
      {Wrapped<int?>? id, Wrapped<String?>? email, Wrapped<int?>? family}) {
    return ParentInvitationInfo(
        id: (id != null ? id.value : this.id),
        email: (email != null ? email.value : this.email),
        family: (family != null ? family.value : this.family));
  }
}

@JsonSerializable(explicitToJson: true)
class ResendParentInvitation {
  ResendParentInvitation();

  factory ResendParentInvitation.fromJson(Map<String, dynamic> json) =>
      _$ResendParentInvitationFromJson(json);

  static const toJsonFactory = _$ResendParentInvitationToJson;
  Map<String, dynamic> toJson() => _$ResendParentInvitationToJson(this);

  static const fromJsonFactory = _$ResendParentInvitationFromJson;

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

@JsonSerializable(explicitToJson: true)
class ConfirmParentInvitation {
  ConfirmParentInvitation({
    this.email,
    this.inviter,
    this.family,
    this.key,
  });

  factory ConfirmParentInvitation.fromJson(Map<String, dynamic> json) =>
      _$ConfirmParentInvitationFromJson(json);

  static const toJsonFactory = _$ConfirmParentInvitationToJson;
  Map<String, dynamic> toJson() => _$ConfirmParentInvitationToJson(this);

  @JsonKey(name: 'email', includeIfNull: false, defaultValue: '')
  final String? email;
  @JsonKey(name: 'inviter', includeIfNull: false)
  final int? inviter;
  @JsonKey(name: 'family', includeIfNull: false)
  final int? family;
  @JsonKey(name: 'key', includeIfNull: false, defaultValue: '')
  final String? key;
  static const fromJsonFactory = _$ConfirmParentInvitationFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ConfirmParentInvitation &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.inviter, inviter) ||
                const DeepCollectionEquality()
                    .equals(other.inviter, inviter)) &&
            (identical(other.family, family) ||
                const DeepCollectionEquality().equals(other.family, family)) &&
            (identical(other.key, key) ||
                const DeepCollectionEquality().equals(other.key, key)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(inviter) ^
      const DeepCollectionEquality().hash(family) ^
      const DeepCollectionEquality().hash(key) ^
      runtimeType.hashCode;
}

extension $ConfirmParentInvitationExtension on ConfirmParentInvitation {
  ConfirmParentInvitation copyWith(
      {String? email, int? inviter, int? family, String? key}) {
    return ConfirmParentInvitation(
        email: email ?? this.email,
        inviter: inviter ?? this.inviter,
        family: family ?? this.family,
        key: key ?? this.key);
  }

  ConfirmParentInvitation copyWithWrapped(
      {Wrapped<String?>? email,
      Wrapped<int?>? inviter,
      Wrapped<int?>? family,
      Wrapped<String?>? key}) {
    return ConfirmParentInvitation(
        email: (email != null ? email.value : this.email),
        inviter: (inviter != null ? inviter.value : this.inviter),
        family: (family != null ? family.value : this.family),
        key: (key != null ? key.value : this.key));
  }
}

@JsonSerializable(explicitToJson: true)
class KindergartenUserRegistration {
  KindergartenUserRegistration({
    this.email,
    this.password1,
    this.password2,
  });

  factory KindergartenUserRegistration.fromJson(Map<String, dynamic> json) =>
      _$KindergartenUserRegistrationFromJson(json);

  static const toJsonFactory = _$KindergartenUserRegistrationToJson;
  Map<String, dynamic> toJson() => _$KindergartenUserRegistrationToJson(this);

  @JsonKey(name: 'email', includeIfNull: false, defaultValue: '')
  final String? email;
  @JsonKey(name: 'password1', includeIfNull: false, defaultValue: '')
  final String? password1;
  @JsonKey(name: 'password2', includeIfNull: false, defaultValue: '')
  final String? password2;
  static const fromJsonFactory = _$KindergartenUserRegistrationFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is KindergartenUserRegistration &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password1, password1) ||
                const DeepCollectionEquality()
                    .equals(other.password1, password1)) &&
            (identical(other.password2, password2) ||
                const DeepCollectionEquality()
                    .equals(other.password2, password2)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password1) ^
      const DeepCollectionEquality().hash(password2) ^
      runtimeType.hashCode;
}

extension $KindergartenUserRegistrationExtension
    on KindergartenUserRegistration {
  KindergartenUserRegistration copyWith(
      {String? email, String? password1, String? password2}) {
    return KindergartenUserRegistration(
        email: email ?? this.email,
        password1: password1 ?? this.password1,
        password2: password2 ?? this.password2);
  }

  KindergartenUserRegistration copyWithWrapped(
      {Wrapped<String?>? email,
      Wrapped<String?>? password1,
      Wrapped<String?>? password2}) {
    return KindergartenUserRegistration(
        email: (email != null ? email.value : this.email),
        password1: (password1 != null ? password1.value : this.password1),
        password2: (password2 != null ? password2.value : this.password2));
  }
}

@JsonSerializable(explicitToJson: true)
class KindergartenRegistration {
  KindergartenRegistration({
    this.user,
    this.phone,
    this.name,
    this.address,
    this.phone1,
    this.phone2,
    this.avatar,
    this.email1,
    this.email2,
    this.childCareType,
    this.website,
    this.presentationOfKindergarten,
    this.descriptionOfServices,
    this.educationalProgram,
    this.serviceSchedule,
    this.tariffs,
    this.typicalDay,
    this.menu,
    this.settings,
    this.classes,
    this.placesAvailability,
    this.accomodationForSpecialKids,
    this.admissionPolicy,
  });

  factory KindergartenRegistration.fromJson(Map<String, dynamic> json) =>
      _$KindergartenRegistrationFromJson(json);

  static const toJsonFactory = _$KindergartenRegistrationToJson;
  Map<String, dynamic> toJson() => _$KindergartenRegistrationToJson(this);

  @JsonKey(name: 'user', includeIfNull: false)
  final KindergartenUserRegistration? user;
  @JsonKey(name: 'phone', includeIfNull: false)
  final KindergartenRegistration$Phone? phone;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  @JsonKey(name: 'address', includeIfNull: false)
  final Address? address;
  @JsonKey(name: 'phone_1', includeIfNull: false)
  final KindergartenRegistration$Phone1? phone1;
  @JsonKey(name: 'phone_2', includeIfNull: false)
  final KindergartenRegistration$Phone2? phone2;
  @JsonKey(name: 'avatar', includeIfNull: false, defaultValue: '')
  final String? avatar;
  @JsonKey(name: 'email_1', includeIfNull: false, defaultValue: '')
  final String? email1;
  @JsonKey(name: 'email_2', includeIfNull: false, defaultValue: '')
  final String? email2;
  @JsonKey(
    name: 'child_care_type',
    includeIfNull: false,
    toJson: kindergartenRegistrationChildCareTypeToJson,
    fromJson: kindergartenRegistrationChildCareTypeFromJson,
  )
  final enums.KindergartenRegistrationChildCareType? childCareType;
  @JsonKey(name: 'website', includeIfNull: false, defaultValue: '')
  final String? website;
  @JsonKey(
      name: 'presentation_of_kindergarten',
      includeIfNull: false,
      defaultValue: '')
  final String? presentationOfKindergarten;
  @JsonKey(
      name: 'description_of_services', includeIfNull: false, defaultValue: '')
  final String? descriptionOfServices;
  @JsonKey(name: 'educational_program', includeIfNull: false, defaultValue: '')
  final String? educationalProgram;
  @JsonKey(name: 'service_schedule', includeIfNull: false)
  final KindergartenProfileServiceSchedule? serviceSchedule;
  @JsonKey(name: 'tariffs', includeIfNull: false)
  final KindergartenProfileTariffs? tariffs;
  @JsonKey(name: 'typical_day', includeIfNull: false)
  final KindergartenProfileTypicalDay? typicalDay;
  @JsonKey(name: 'menu', includeIfNull: false, defaultValue: '')
  final String? menu;
  @JsonKey(name: 'settings', includeIfNull: false)
  final KindergartenProfileSettings? settings;
  @JsonKey(
      name: 'classes',
      includeIfNull: false,
      defaultValue: <KindergartenProfileClass>[])
  final List<KindergartenProfileClass>? classes;
  @JsonKey(
      name: 'places_availability',
      includeIfNull: false,
      defaultValue: <KindergartenProfilePlacesAvailability>[])
  final List<KindergartenProfilePlacesAvailability>? placesAvailability;
  @JsonKey(name: 'accomodation_for_special_kids', includeIfNull: false)
  final KindergartenProfileSpecialKidsAccomodation? accomodationForSpecialKids;
  @JsonKey(name: 'admission_policy', includeIfNull: false, defaultValue: '')
  final String? admissionPolicy;
  static const fromJsonFactory = _$KindergartenRegistrationFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is KindergartenRegistration &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.phone1, phone1) ||
                const DeepCollectionEquality().equals(other.phone1, phone1)) &&
            (identical(other.phone2, phone2) ||
                const DeepCollectionEquality().equals(other.phone2, phone2)) &&
            (identical(other.avatar, avatar) ||
                const DeepCollectionEquality().equals(other.avatar, avatar)) &&
            (identical(other.email1, email1) ||
                const DeepCollectionEquality().equals(other.email1, email1)) &&
            (identical(other.email2, email2) ||
                const DeepCollectionEquality().equals(other.email2, email2)) &&
            (identical(other.childCareType, childCareType) ||
                const DeepCollectionEquality()
                    .equals(other.childCareType, childCareType)) &&
            (identical(other.website, website) ||
                const DeepCollectionEquality()
                    .equals(other.website, website)) &&
            (identical(other.presentationOfKindergarten, presentationOfKindergarten) ||
                const DeepCollectionEquality().equals(
                    other.presentationOfKindergarten,
                    presentationOfKindergarten)) &&
            (identical(other.descriptionOfServices, descriptionOfServices) ||
                const DeepCollectionEquality().equals(
                    other.descriptionOfServices, descriptionOfServices)) &&
            (identical(other.educationalProgram, educationalProgram) ||
                const DeepCollectionEquality()
                    .equals(other.educationalProgram, educationalProgram)) &&
            (identical(other.serviceSchedule, serviceSchedule) ||
                const DeepCollectionEquality()
                    .equals(other.serviceSchedule, serviceSchedule)) &&
            (identical(other.tariffs, tariffs) ||
                const DeepCollectionEquality()
                    .equals(other.tariffs, tariffs)) &&
            (identical(other.typicalDay, typicalDay) ||
                const DeepCollectionEquality()
                    .equals(other.typicalDay, typicalDay)) &&
            (identical(other.menu, menu) ||
                const DeepCollectionEquality().equals(other.menu, menu)) &&
            (identical(other.settings, settings) ||
                const DeepCollectionEquality()
                    .equals(other.settings, settings)) &&
            (identical(other.classes, classes) ||
                const DeepCollectionEquality()
                    .equals(other.classes, classes)) &&
            (identical(other.placesAvailability, placesAvailability) ||
                const DeepCollectionEquality()
                    .equals(other.placesAvailability, placesAvailability)) &&
            (identical(other.accomodationForSpecialKids, accomodationForSpecialKids) ||
                const DeepCollectionEquality().equals(
                    other.accomodationForSpecialKids, accomodationForSpecialKids)) &&
            (identical(other.admissionPolicy, admissionPolicy) || const DeepCollectionEquality().equals(other.admissionPolicy, admissionPolicy)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(phone1) ^
      const DeepCollectionEquality().hash(phone2) ^
      const DeepCollectionEquality().hash(avatar) ^
      const DeepCollectionEquality().hash(email1) ^
      const DeepCollectionEquality().hash(email2) ^
      const DeepCollectionEquality().hash(childCareType) ^
      const DeepCollectionEquality().hash(website) ^
      const DeepCollectionEquality().hash(presentationOfKindergarten) ^
      const DeepCollectionEquality().hash(descriptionOfServices) ^
      const DeepCollectionEquality().hash(educationalProgram) ^
      const DeepCollectionEquality().hash(serviceSchedule) ^
      const DeepCollectionEquality().hash(tariffs) ^
      const DeepCollectionEquality().hash(typicalDay) ^
      const DeepCollectionEquality().hash(menu) ^
      const DeepCollectionEquality().hash(settings) ^
      const DeepCollectionEquality().hash(classes) ^
      const DeepCollectionEquality().hash(placesAvailability) ^
      const DeepCollectionEquality().hash(accomodationForSpecialKids) ^
      const DeepCollectionEquality().hash(admissionPolicy) ^
      runtimeType.hashCode;
}

extension $KindergartenRegistrationExtension on KindergartenRegistration {
  KindergartenRegistration copyWith(
      {KindergartenUserRegistration? user,
      KindergartenRegistration$Phone? phone,
      String? name,
      Address? address,
      KindergartenRegistration$Phone1? phone1,
      KindergartenRegistration$Phone2? phone2,
      String? avatar,
      String? email1,
      String? email2,
      enums.KindergartenRegistrationChildCareType? childCareType,
      String? website,
      String? presentationOfKindergarten,
      String? descriptionOfServices,
      String? educationalProgram,
      KindergartenProfileServiceSchedule? serviceSchedule,
      KindergartenProfileTariffs? tariffs,
      KindergartenProfileTypicalDay? typicalDay,
      String? menu,
      KindergartenProfileSettings? settings,
      List<KindergartenProfileClass>? classes,
      List<KindergartenProfilePlacesAvailability>? placesAvailability,
      KindergartenProfileSpecialKidsAccomodation? accomodationForSpecialKids,
      String? admissionPolicy}) {
    return KindergartenRegistration(
        user: user ?? this.user,
        phone: phone ?? this.phone,
        name: name ?? this.name,
        address: address ?? this.address,
        phone1: phone1 ?? this.phone1,
        phone2: phone2 ?? this.phone2,
        avatar: avatar ?? this.avatar,
        email1: email1 ?? this.email1,
        email2: email2 ?? this.email2,
        childCareType: childCareType ?? this.childCareType,
        website: website ?? this.website,
        presentationOfKindergarten:
            presentationOfKindergarten ?? this.presentationOfKindergarten,
        descriptionOfServices:
            descriptionOfServices ?? this.descriptionOfServices,
        educationalProgram: educationalProgram ?? this.educationalProgram,
        serviceSchedule: serviceSchedule ?? this.serviceSchedule,
        tariffs: tariffs ?? this.tariffs,
        typicalDay: typicalDay ?? this.typicalDay,
        menu: menu ?? this.menu,
        settings: settings ?? this.settings,
        classes: classes ?? this.classes,
        placesAvailability: placesAvailability ?? this.placesAvailability,
        accomodationForSpecialKids:
            accomodationForSpecialKids ?? this.accomodationForSpecialKids,
        admissionPolicy: admissionPolicy ?? this.admissionPolicy);
  }

  KindergartenRegistration copyWithWrapped(
      {Wrapped<KindergartenUserRegistration?>? user,
      Wrapped<KindergartenRegistration$Phone?>? phone,
      Wrapped<String?>? name,
      Wrapped<Address?>? address,
      Wrapped<KindergartenRegistration$Phone1?>? phone1,
      Wrapped<KindergartenRegistration$Phone2?>? phone2,
      Wrapped<String?>? avatar,
      Wrapped<String?>? email1,
      Wrapped<String?>? email2,
      Wrapped<enums.KindergartenRegistrationChildCareType?>? childCareType,
      Wrapped<String?>? website,
      Wrapped<String?>? presentationOfKindergarten,
      Wrapped<String?>? descriptionOfServices,
      Wrapped<String?>? educationalProgram,
      Wrapped<KindergartenProfileServiceSchedule?>? serviceSchedule,
      Wrapped<KindergartenProfileTariffs?>? tariffs,
      Wrapped<KindergartenProfileTypicalDay?>? typicalDay,
      Wrapped<String?>? menu,
      Wrapped<KindergartenProfileSettings?>? settings,
      Wrapped<List<KindergartenProfileClass>?>? classes,
      Wrapped<List<KindergartenProfilePlacesAvailability>?>? placesAvailability,
      Wrapped<KindergartenProfileSpecialKidsAccomodation?>?
          accomodationForSpecialKids,
      Wrapped<String?>? admissionPolicy}) {
    return KindergartenRegistration(
        user: (user != null ? user.value : this.user),
        phone: (phone != null ? phone.value : this.phone),
        name: (name != null ? name.value : this.name),
        address: (address != null ? address.value : this.address),
        phone1: (phone1 != null ? phone1.value : this.phone1),
        phone2: (phone2 != null ? phone2.value : this.phone2),
        avatar: (avatar != null ? avatar.value : this.avatar),
        email1: (email1 != null ? email1.value : this.email1),
        email2: (email2 != null ? email2.value : this.email2),
        childCareType:
            (childCareType != null ? childCareType.value : this.childCareType),
        website: (website != null ? website.value : this.website),
        presentationOfKindergarten: (presentationOfKindergarten != null
            ? presentationOfKindergarten.value
            : this.presentationOfKindergarten),
        descriptionOfServices: (descriptionOfServices != null
            ? descriptionOfServices.value
            : this.descriptionOfServices),
        educationalProgram: (educationalProgram != null
            ? educationalProgram.value
            : this.educationalProgram),
        serviceSchedule: (serviceSchedule != null
            ? serviceSchedule.value
            : this.serviceSchedule),
        tariffs: (tariffs != null ? tariffs.value : this.tariffs),
        typicalDay: (typicalDay != null ? typicalDay.value : this.typicalDay),
        menu: (menu != null ? menu.value : this.menu),
        settings: (settings != null ? settings.value : this.settings),
        classes: (classes != null ? classes.value : this.classes),
        placesAvailability: (placesAvailability != null
            ? placesAvailability.value
            : this.placesAvailability),
        accomodationForSpecialKids: (accomodationForSpecialKids != null
            ? accomodationForSpecialKids.value
            : this.accomodationForSpecialKids),
        admissionPolicy: (admissionPolicy != null
            ? admissionPolicy.value
            : this.admissionPolicy));
  }
}

@JsonSerializable(explicitToJson: true)
class EducatorContractRegistrationEducatorUser {
  EducatorContractRegistrationEducatorUser({
    this.email,
  });

  factory EducatorContractRegistrationEducatorUser.fromJson(
          Map<String, dynamic> json) =>
      _$EducatorContractRegistrationEducatorUserFromJson(json);

  static const toJsonFactory = _$EducatorContractRegistrationEducatorUserToJson;
  Map<String, dynamic> toJson() =>
      _$EducatorContractRegistrationEducatorUserToJson(this);

  @JsonKey(name: 'email', includeIfNull: false, defaultValue: '')
  final String? email;
  static const fromJsonFactory =
      _$EducatorContractRegistrationEducatorUserFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EducatorContractRegistrationEducatorUser &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(email) ^ runtimeType.hashCode;
}

extension $EducatorContractRegistrationEducatorUserExtension
    on EducatorContractRegistrationEducatorUser {
  EducatorContractRegistrationEducatorUser copyWith({String? email}) {
    return EducatorContractRegistrationEducatorUser(email: email ?? this.email);
  }

  EducatorContractRegistrationEducatorUser copyWithWrapped(
      {Wrapped<String?>? email}) {
    return EducatorContractRegistrationEducatorUser(
        email: (email != null ? email.value : this.email));
  }
}

@JsonSerializable(explicitToJson: true)
class EducatorContractRegistrationEducator {
  EducatorContractRegistrationEducator({
    this.user,
    this.phone,
    this.address,
    this.birthDate,
    this.firstName,
    this.lastName,
    this.sex,
    this.avatar,
  });

  factory EducatorContractRegistrationEducator.fromJson(
          Map<String, dynamic> json) =>
      _$EducatorContractRegistrationEducatorFromJson(json);

  static const toJsonFactory = _$EducatorContractRegistrationEducatorToJson;
  Map<String, dynamic> toJson() =>
      _$EducatorContractRegistrationEducatorToJson(this);

  @JsonKey(name: 'user', includeIfNull: false)
  final EducatorContractRegistrationEducatorUser? user;
  @JsonKey(name: 'phone', includeIfNull: false)
  final EducatorContractRegistrationEducator$Phone? phone;
  @JsonKey(name: 'address', includeIfNull: false)
  final Address? address;
  @JsonKey(name: 'birth_date', includeIfNull: false)
  final DateTime? birthDate;
  @JsonKey(name: 'first_name', includeIfNull: false, defaultValue: '')
  final String? firstName;
  @JsonKey(name: 'last_name', includeIfNull: false, defaultValue: '')
  final String? lastName;
  @JsonKey(
    name: 'sex',
    includeIfNull: false,
    toJson: educatorContractRegistrationEducatorSexToJson,
    fromJson: educatorContractRegistrationEducatorSexFromJson,
  )
  final enums.EducatorContractRegistrationEducatorSex? sex;
  @JsonKey(name: 'avatar', includeIfNull: false, defaultValue: '')
  final String? avatar;
  static const fromJsonFactory = _$EducatorContractRegistrationEducatorFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EducatorContractRegistrationEducator &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
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
            (identical(other.avatar, avatar) ||
                const DeepCollectionEquality().equals(other.avatar, avatar)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(birthDate) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(sex) ^
      const DeepCollectionEquality().hash(avatar) ^
      runtimeType.hashCode;
}

extension $EducatorContractRegistrationEducatorExtension
    on EducatorContractRegistrationEducator {
  EducatorContractRegistrationEducator copyWith(
      {EducatorContractRegistrationEducatorUser? user,
      EducatorContractRegistrationEducator$Phone? phone,
      Address? address,
      DateTime? birthDate,
      String? firstName,
      String? lastName,
      enums.EducatorContractRegistrationEducatorSex? sex,
      String? avatar}) {
    return EducatorContractRegistrationEducator(
        user: user ?? this.user,
        phone: phone ?? this.phone,
        address: address ?? this.address,
        birthDate: birthDate ?? this.birthDate,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        sex: sex ?? this.sex,
        avatar: avatar ?? this.avatar);
  }

  EducatorContractRegistrationEducator copyWithWrapped(
      {Wrapped<EducatorContractRegistrationEducatorUser?>? user,
      Wrapped<EducatorContractRegistrationEducator$Phone?>? phone,
      Wrapped<Address?>? address,
      Wrapped<DateTime?>? birthDate,
      Wrapped<String?>? firstName,
      Wrapped<String?>? lastName,
      Wrapped<enums.EducatorContractRegistrationEducatorSex?>? sex,
      Wrapped<String?>? avatar}) {
    return EducatorContractRegistrationEducator(
        user: (user != null ? user.value : this.user),
        phone: (phone != null ? phone.value : this.phone),
        address: (address != null ? address.value : this.address),
        birthDate: (birthDate != null ? birthDate.value : this.birthDate),
        firstName: (firstName != null ? firstName.value : this.firstName),
        lastName: (lastName != null ? lastName.value : this.lastName),
        sex: (sex != null ? sex.value : this.sex),
        avatar: (avatar != null ? avatar.value : this.avatar));
  }
}

@JsonSerializable(explicitToJson: true)
class EducatorContractRegistration {
  EducatorContractRegistration({
    this.id,
    this.kindergarten,
    this.educator,
    this.acceptedKindergarten,
    this.acceptedEducator,
    this.terminatedKindergarten,
    this.terminatedEducator,
    this.startDate,
    this.endDate,
    this.status,
    this.statusAction,
    this.statusDate,
    this.possibleNextActions,
    this.educatorProfile,
  });

  factory EducatorContractRegistration.fromJson(Map<String, dynamic> json) =>
      _$EducatorContractRegistrationFromJson(json);

  static const toJsonFactory = _$EducatorContractRegistrationToJson;
  Map<String, dynamic> toJson() => _$EducatorContractRegistrationToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'kindergarten', includeIfNull: false, defaultValue: '')
  final String? kindergarten;
  @JsonKey(name: 'educator', includeIfNull: false)
  final EducatorContractRegistrationEducator? educator;
  @JsonKey(name: 'accepted_kindergarten', includeIfNull: false)
  final DateTime? acceptedKindergarten;
  @JsonKey(name: 'accepted_educator', includeIfNull: false)
  final DateTime? acceptedEducator;
  @JsonKey(name: 'terminated_kindergarten', includeIfNull: false)
  final DateTime? terminatedKindergarten;
  @JsonKey(name: 'terminated_educator', includeIfNull: false)
  final DateTime? terminatedEducator;
  @JsonKey(name: 'start_date', includeIfNull: false)
  final DateTime? startDate;
  @JsonKey(name: 'end_date', includeIfNull: false)
  final DateTime? endDate;
  @JsonKey(name: 'status', includeIfNull: false, defaultValue: '')
  final String? status;
  @JsonKey(
    name: 'status_action',
    includeIfNull: false,
    toJson: educatorContractRegistrationStatusActionToJson,
    fromJson: educatorContractRegistrationStatusActionFromJson,
  )
  final enums.EducatorContractRegistrationStatusAction? statusAction;
  @JsonKey(name: 'status_date', includeIfNull: false)
  final DateTime? statusDate;
  @JsonKey(
      name: 'possible_next_actions', includeIfNull: false, defaultValue: '')
  final String? possibleNextActions;
  @JsonKey(name: 'educator_profile', includeIfNull: false)
  final EducatorContractRegistrationEducator? educatorProfile;
  static const fromJsonFactory = _$EducatorContractRegistrationFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EducatorContractRegistration &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.kindergarten, kindergarten) ||
                const DeepCollectionEquality()
                    .equals(other.kindergarten, kindergarten)) &&
            (identical(other.educator, educator) ||
                const DeepCollectionEquality()
                    .equals(other.educator, educator)) &&
            (identical(other.acceptedKindergarten, acceptedKindergarten) ||
                const DeepCollectionEquality().equals(
                    other.acceptedKindergarten, acceptedKindergarten)) &&
            (identical(other.acceptedEducator, acceptedEducator) ||
                const DeepCollectionEquality()
                    .equals(other.acceptedEducator, acceptedEducator)) &&
            (identical(other.terminatedKindergarten, terminatedKindergarten) ||
                const DeepCollectionEquality().equals(
                    other.terminatedKindergarten, terminatedKindergarten)) &&
            (identical(other.terminatedEducator, terminatedEducator) ||
                const DeepCollectionEquality()
                    .equals(other.terminatedEducator, terminatedEducator)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.statusAction, statusAction) ||
                const DeepCollectionEquality()
                    .equals(other.statusAction, statusAction)) &&
            (identical(other.statusDate, statusDate) ||
                const DeepCollectionEquality()
                    .equals(other.statusDate, statusDate)) &&
            (identical(other.possibleNextActions, possibleNextActions) ||
                const DeepCollectionEquality()
                    .equals(other.possibleNextActions, possibleNextActions)) &&
            (identical(other.educatorProfile, educatorProfile) ||
                const DeepCollectionEquality()
                    .equals(other.educatorProfile, educatorProfile)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(kindergarten) ^
      const DeepCollectionEquality().hash(educator) ^
      const DeepCollectionEquality().hash(acceptedKindergarten) ^
      const DeepCollectionEquality().hash(acceptedEducator) ^
      const DeepCollectionEquality().hash(terminatedKindergarten) ^
      const DeepCollectionEquality().hash(terminatedEducator) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(statusAction) ^
      const DeepCollectionEquality().hash(statusDate) ^
      const DeepCollectionEquality().hash(possibleNextActions) ^
      const DeepCollectionEquality().hash(educatorProfile) ^
      runtimeType.hashCode;
}

extension $EducatorContractRegistrationExtension
    on EducatorContractRegistration {
  EducatorContractRegistration copyWith(
      {int? id,
      String? kindergarten,
      EducatorContractRegistrationEducator? educator,
      DateTime? acceptedKindergarten,
      DateTime? acceptedEducator,
      DateTime? terminatedKindergarten,
      DateTime? terminatedEducator,
      DateTime? startDate,
      DateTime? endDate,
      String? status,
      enums.EducatorContractRegistrationStatusAction? statusAction,
      DateTime? statusDate,
      String? possibleNextActions,
      EducatorContractRegistrationEducator? educatorProfile}) {
    return EducatorContractRegistration(
        id: id ?? this.id,
        kindergarten: kindergarten ?? this.kindergarten,
        educator: educator ?? this.educator,
        acceptedKindergarten: acceptedKindergarten ?? this.acceptedKindergarten,
        acceptedEducator: acceptedEducator ?? this.acceptedEducator,
        terminatedKindergarten:
            terminatedKindergarten ?? this.terminatedKindergarten,
        terminatedEducator: terminatedEducator ?? this.terminatedEducator,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        status: status ?? this.status,
        statusAction: statusAction ?? this.statusAction,
        statusDate: statusDate ?? this.statusDate,
        possibleNextActions: possibleNextActions ?? this.possibleNextActions,
        educatorProfile: educatorProfile ?? this.educatorProfile);
  }

  EducatorContractRegistration copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String?>? kindergarten,
      Wrapped<EducatorContractRegistrationEducator?>? educator,
      Wrapped<DateTime?>? acceptedKindergarten,
      Wrapped<DateTime?>? acceptedEducator,
      Wrapped<DateTime?>? terminatedKindergarten,
      Wrapped<DateTime?>? terminatedEducator,
      Wrapped<DateTime?>? startDate,
      Wrapped<DateTime?>? endDate,
      Wrapped<String?>? status,
      Wrapped<enums.EducatorContractRegistrationStatusAction?>? statusAction,
      Wrapped<DateTime?>? statusDate,
      Wrapped<String?>? possibleNextActions,
      Wrapped<EducatorContractRegistrationEducator?>? educatorProfile}) {
    return EducatorContractRegistration(
        id: (id != null ? id.value : this.id),
        kindergarten:
            (kindergarten != null ? kindergarten.value : this.kindergarten),
        educator: (educator != null ? educator.value : this.educator),
        acceptedKindergarten: (acceptedKindergarten != null
            ? acceptedKindergarten.value
            : this.acceptedKindergarten),
        acceptedEducator: (acceptedEducator != null
            ? acceptedEducator.value
            : this.acceptedEducator),
        terminatedKindergarten: (terminatedKindergarten != null
            ? terminatedKindergarten.value
            : this.terminatedKindergarten),
        terminatedEducator: (terminatedEducator != null
            ? terminatedEducator.value
            : this.terminatedEducator),
        startDate: (startDate != null ? startDate.value : this.startDate),
        endDate: (endDate != null ? endDate.value : this.endDate),
        status: (status != null ? status.value : this.status),
        statusAction:
            (statusAction != null ? statusAction.value : this.statusAction),
        statusDate: (statusDate != null ? statusDate.value : this.statusDate),
        possibleNextActions: (possibleNextActions != null
            ? possibleNextActions.value
            : this.possibleNextActions),
        educatorProfile: (educatorProfile != null
            ? educatorProfile.value
            : this.educatorProfile));
  }
}

@JsonSerializable(explicitToJson: true)
class EducatorSignupByKindergartenList {
  EducatorSignupByKindergartenList({
    this.id,
    this.educator,
    this.accepted,
    this.sent,
  });

  factory EducatorSignupByKindergartenList.fromJson(
          Map<String, dynamic> json) =>
      _$EducatorSignupByKindergartenListFromJson(json);

  static const toJsonFactory = _$EducatorSignupByKindergartenListToJson;
  Map<String, dynamic> toJson() =>
      _$EducatorSignupByKindergartenListToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'educator', includeIfNull: false, defaultValue: '')
  final String? educator;
  @JsonKey(name: 'accepted', includeIfNull: false)
  final bool? accepted;
  @JsonKey(name: 'sent', includeIfNull: false)
  final DateTime? sent;
  static const fromJsonFactory = _$EducatorSignupByKindergartenListFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EducatorSignupByKindergartenList &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.educator, educator) ||
                const DeepCollectionEquality()
                    .equals(other.educator, educator)) &&
            (identical(other.accepted, accepted) ||
                const DeepCollectionEquality()
                    .equals(other.accepted, accepted)) &&
            (identical(other.sent, sent) ||
                const DeepCollectionEquality().equals(other.sent, sent)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(educator) ^
      const DeepCollectionEquality().hash(accepted) ^
      const DeepCollectionEquality().hash(sent) ^
      runtimeType.hashCode;
}

extension $EducatorSignupByKindergartenListExtension
    on EducatorSignupByKindergartenList {
  EducatorSignupByKindergartenList copyWith(
      {int? id, String? educator, bool? accepted, DateTime? sent}) {
    return EducatorSignupByKindergartenList(
        id: id ?? this.id,
        educator: educator ?? this.educator,
        accepted: accepted ?? this.accepted,
        sent: sent ?? this.sent);
  }

  EducatorSignupByKindergartenList copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String?>? educator,
      Wrapped<bool?>? accepted,
      Wrapped<DateTime?>? sent}) {
    return EducatorSignupByKindergartenList(
        id: (id != null ? id.value : this.id),
        educator: (educator != null ? educator.value : this.educator),
        accepted: (accepted != null ? accepted.value : this.accepted),
        sent: (sent != null ? sent.value : this.sent));
  }
}

@JsonSerializable(explicitToJson: true)
class ResendEducatorSignupByKindergartenEmailConfirmation {
  ResendEducatorSignupByKindergartenEmailConfirmation();

  factory ResendEducatorSignupByKindergartenEmailConfirmation.fromJson(
          Map<String, dynamic> json) =>
      _$ResendEducatorSignupByKindergartenEmailConfirmationFromJson(json);

  static const toJsonFactory =
      _$ResendEducatorSignupByKindergartenEmailConfirmationToJson;
  Map<String, dynamic> toJson() =>
      _$ResendEducatorSignupByKindergartenEmailConfirmationToJson(this);

  static const fromJsonFactory =
      _$ResendEducatorSignupByKindergartenEmailConfirmationFromJson;

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

@JsonSerializable(explicitToJson: true)
class ConfirmEducatorSignup {
  ConfirmEducatorSignup({
    this.educator,
    this.key,
  });

  factory ConfirmEducatorSignup.fromJson(Map<String, dynamic> json) =>
      _$ConfirmEducatorSignupFromJson(json);

  static const toJsonFactory = _$ConfirmEducatorSignupToJson;
  Map<String, dynamic> toJson() => _$ConfirmEducatorSignupToJson(this);

  @JsonKey(name: 'educator', includeIfNull: false, defaultValue: '')
  final String? educator;
  @JsonKey(name: 'key', includeIfNull: false, defaultValue: '')
  final String? key;
  static const fromJsonFactory = _$ConfirmEducatorSignupFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ConfirmEducatorSignup &&
            (identical(other.educator, educator) ||
                const DeepCollectionEquality()
                    .equals(other.educator, educator)) &&
            (identical(other.key, key) ||
                const DeepCollectionEquality().equals(other.key, key)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(educator) ^
      const DeepCollectionEquality().hash(key) ^
      runtimeType.hashCode;
}

extension $ConfirmEducatorSignupExtension on ConfirmEducatorSignup {
  ConfirmEducatorSignup copyWith({String? educator, String? key}) {
    return ConfirmEducatorSignup(
        educator: educator ?? this.educator, key: key ?? this.key);
  }

  ConfirmEducatorSignup copyWithWrapped(
      {Wrapped<String?>? educator, Wrapped<String?>? key}) {
    return ConfirmEducatorSignup(
        educator: (educator != null ? educator.value : this.educator),
        key: (key != null ? key.value : this.key));
  }
}

@JsonSerializable(explicitToJson: true)
class FinalizeEducatorSignup {
  FinalizeEducatorSignup({
    this.password1,
    this.password2,
  });

  factory FinalizeEducatorSignup.fromJson(Map<String, dynamic> json) =>
      _$FinalizeEducatorSignupFromJson(json);

  static const toJsonFactory = _$FinalizeEducatorSignupToJson;
  Map<String, dynamic> toJson() => _$FinalizeEducatorSignupToJson(this);

  @JsonKey(name: 'password1', includeIfNull: false, defaultValue: '')
  final String? password1;
  @JsonKey(name: 'password2', includeIfNull: false, defaultValue: '')
  final String? password2;
  static const fromJsonFactory = _$FinalizeEducatorSignupFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FinalizeEducatorSignup &&
            (identical(other.password1, password1) ||
                const DeepCollectionEquality()
                    .equals(other.password1, password1)) &&
            (identical(other.password2, password2) ||
                const DeepCollectionEquality()
                    .equals(other.password2, password2)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(password1) ^
      const DeepCollectionEquality().hash(password2) ^
      runtimeType.hashCode;
}

extension $FinalizeEducatorSignupExtension on FinalizeEducatorSignup {
  FinalizeEducatorSignup copyWith({String? password1, String? password2}) {
    return FinalizeEducatorSignup(
        password1: password1 ?? this.password1,
        password2: password2 ?? this.password2);
  }

  FinalizeEducatorSignup copyWithWrapped(
      {Wrapped<String?>? password1, Wrapped<String?>? password2}) {
    return FinalizeEducatorSignup(
        password1: (password1 != null ? password1.value : this.password1),
        password2: (password2 != null ? password2.value : this.password2));
  }
}

@JsonSerializable(explicitToJson: true)
class InscriptionRegistrationParentUser {
  InscriptionRegistrationParentUser({
    this.email,
  });

  factory InscriptionRegistrationParentUser.fromJson(
          Map<String, dynamic> json) =>
      _$InscriptionRegistrationParentUserFromJson(json);

  static const toJsonFactory = _$InscriptionRegistrationParentUserToJson;
  Map<String, dynamic> toJson() =>
      _$InscriptionRegistrationParentUserToJson(this);

  @JsonKey(name: 'email', includeIfNull: false, defaultValue: '')
  final String? email;
  static const fromJsonFactory = _$InscriptionRegistrationParentUserFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InscriptionRegistrationParentUser &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(email) ^ runtimeType.hashCode;
}

extension $InscriptionRegistrationParentUserExtension
    on InscriptionRegistrationParentUser {
  InscriptionRegistrationParentUser copyWith({String? email}) {
    return InscriptionRegistrationParentUser(email: email ?? this.email);
  }

  InscriptionRegistrationParentUser copyWithWrapped({Wrapped<String?>? email}) {
    return InscriptionRegistrationParentUser(
        email: (email != null ? email.value : this.email));
  }
}

@JsonSerializable(explicitToJson: true)
class InscriptionRegistrationParent {
  InscriptionRegistrationParent({
    this.user,
    this.phone,
    this.address,
    this.birthDate,
    this.firstName,
    this.lastName,
    this.sex,
    this.avatar,
  });

  factory InscriptionRegistrationParent.fromJson(Map<String, dynamic> json) =>
      _$InscriptionRegistrationParentFromJson(json);

  static const toJsonFactory = _$InscriptionRegistrationParentToJson;
  Map<String, dynamic> toJson() => _$InscriptionRegistrationParentToJson(this);

  @JsonKey(name: 'user', includeIfNull: false)
  final InscriptionRegistrationParentUser? user;
  @JsonKey(name: 'phone', includeIfNull: false)
  final InscriptionRegistrationParent$Phone? phone;
  @JsonKey(name: 'address', includeIfNull: false)
  final Address? address;
  @JsonKey(name: 'birth_date', includeIfNull: false)
  final DateTime? birthDate;
  @JsonKey(name: 'first_name', includeIfNull: false, defaultValue: '')
  final String? firstName;
  @JsonKey(name: 'last_name', includeIfNull: false, defaultValue: '')
  final String? lastName;
  @JsonKey(
    name: 'sex',
    includeIfNull: false,
    toJson: inscriptionRegistrationParentSexToJson,
    fromJson: inscriptionRegistrationParentSexFromJson,
  )
  final enums.InscriptionRegistrationParentSex? sex;
  @JsonKey(name: 'avatar', includeIfNull: false, defaultValue: '')
  final String? avatar;
  static const fromJsonFactory = _$InscriptionRegistrationParentFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InscriptionRegistrationParent &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
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
            (identical(other.avatar, avatar) ||
                const DeepCollectionEquality().equals(other.avatar, avatar)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(birthDate) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(sex) ^
      const DeepCollectionEquality().hash(avatar) ^
      runtimeType.hashCode;
}

extension $InscriptionRegistrationParentExtension
    on InscriptionRegistrationParent {
  InscriptionRegistrationParent copyWith(
      {InscriptionRegistrationParentUser? user,
      InscriptionRegistrationParent$Phone? phone,
      Address? address,
      DateTime? birthDate,
      String? firstName,
      String? lastName,
      enums.InscriptionRegistrationParentSex? sex,
      String? avatar}) {
    return InscriptionRegistrationParent(
        user: user ?? this.user,
        phone: phone ?? this.phone,
        address: address ?? this.address,
        birthDate: birthDate ?? this.birthDate,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        sex: sex ?? this.sex,
        avatar: avatar ?? this.avatar);
  }

  InscriptionRegistrationParent copyWithWrapped(
      {Wrapped<InscriptionRegistrationParentUser?>? user,
      Wrapped<InscriptionRegistrationParent$Phone?>? phone,
      Wrapped<Address?>? address,
      Wrapped<DateTime?>? birthDate,
      Wrapped<String?>? firstName,
      Wrapped<String?>? lastName,
      Wrapped<enums.InscriptionRegistrationParentSex?>? sex,
      Wrapped<String?>? avatar}) {
    return InscriptionRegistrationParent(
        user: (user != null ? user.value : this.user),
        phone: (phone != null ? phone.value : this.phone),
        address: (address != null ? address.value : this.address),
        birthDate: (birthDate != null ? birthDate.value : this.birthDate),
        firstName: (firstName != null ? firstName.value : this.firstName),
        lastName: (lastName != null ? lastName.value : this.lastName),
        sex: (sex != null ? sex.value : this.sex),
        avatar: (avatar != null ? avatar.value : this.avatar));
  }
}

@JsonSerializable(explicitToJson: true)
class InscriptionRegistrationFamily {
  InscriptionRegistrationFamily({
    this.parent1,
    this.parent2,
    this.parent1Profile,
    this.parent2Profile,
  });

  factory InscriptionRegistrationFamily.fromJson(Map<String, dynamic> json) =>
      _$InscriptionRegistrationFamilyFromJson(json);

  static const toJsonFactory = _$InscriptionRegistrationFamilyToJson;
  Map<String, dynamic> toJson() => _$InscriptionRegistrationFamilyToJson(this);

  @JsonKey(name: 'parent1', includeIfNull: false)
  final InscriptionRegistrationParent? parent1;
  @JsonKey(name: 'parent2', includeIfNull: false)
  final InscriptionRegistrationParent? parent2;
  @JsonKey(name: 'parent1_profile', includeIfNull: false)
  final InscriptionRegistrationParent? parent1Profile;
  @JsonKey(name: 'parent2_profile', includeIfNull: false)
  final InscriptionRegistrationParent? parent2Profile;
  static const fromJsonFactory = _$InscriptionRegistrationFamilyFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InscriptionRegistrationFamily &&
            (identical(other.parent1, parent1) ||
                const DeepCollectionEquality()
                    .equals(other.parent1, parent1)) &&
            (identical(other.parent2, parent2) ||
                const DeepCollectionEquality()
                    .equals(other.parent2, parent2)) &&
            (identical(other.parent1Profile, parent1Profile) ||
                const DeepCollectionEquality()
                    .equals(other.parent1Profile, parent1Profile)) &&
            (identical(other.parent2Profile, parent2Profile) ||
                const DeepCollectionEquality()
                    .equals(other.parent2Profile, parent2Profile)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(parent1) ^
      const DeepCollectionEquality().hash(parent2) ^
      const DeepCollectionEquality().hash(parent1Profile) ^
      const DeepCollectionEquality().hash(parent2Profile) ^
      runtimeType.hashCode;
}

extension $InscriptionRegistrationFamilyExtension
    on InscriptionRegistrationFamily {
  InscriptionRegistrationFamily copyWith(
      {InscriptionRegistrationParent? parent1,
      InscriptionRegistrationParent? parent2,
      InscriptionRegistrationParent? parent1Profile,
      InscriptionRegistrationParent? parent2Profile}) {
    return InscriptionRegistrationFamily(
        parent1: parent1 ?? this.parent1,
        parent2: parent2 ?? this.parent2,
        parent1Profile: parent1Profile ?? this.parent1Profile,
        parent2Profile: parent2Profile ?? this.parent2Profile);
  }

  InscriptionRegistrationFamily copyWithWrapped(
      {Wrapped<InscriptionRegistrationParent?>? parent1,
      Wrapped<InscriptionRegistrationParent?>? parent2,
      Wrapped<InscriptionRegistrationParent?>? parent1Profile,
      Wrapped<InscriptionRegistrationParent?>? parent2Profile}) {
    return InscriptionRegistrationFamily(
        parent1: (parent1 != null ? parent1.value : this.parent1),
        parent2: (parent2 != null ? parent2.value : this.parent2),
        parent1Profile: (parent1Profile != null
            ? parent1Profile.value
            : this.parent1Profile),
        parent2Profile: (parent2Profile != null
            ? parent2Profile.value
            : this.parent2Profile));
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
class InscriptionChild {
  InscriptionChild({
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

  factory InscriptionChild.fromJson(Map<String, dynamic> json) =>
      _$InscriptionChildFromJson(json);

  static const toJsonFactory = _$InscriptionChildToJson;
  Map<String, dynamic> toJson() => _$InscriptionChildToJson(this);

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
    toJson: inscriptionChildSexToJson,
    fromJson: inscriptionChildSexFromJson,
  )
  final enums.InscriptionChildSex? sex;
  @JsonKey(name: 'avatar', includeIfNull: false, defaultValue: '')
  final String? avatar;
  @JsonKey(name: 'medical_file', includeIfNull: false)
  final ChildMedicalFile? medicalFile;
  static const fromJsonFactory = _$InscriptionChildFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InscriptionChild &&
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

extension $InscriptionChildExtension on InscriptionChild {
  InscriptionChild copyWith(
      {int? id,
      bool? deleted,
      int? family,
      String? firstName,
      String? lastName,
      DateTime? birthDate,
      enums.InscriptionChildSex? sex,
      String? avatar,
      ChildMedicalFile? medicalFile}) {
    return InscriptionChild(
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

  InscriptionChild copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<bool?>? deleted,
      Wrapped<int?>? family,
      Wrapped<String?>? firstName,
      Wrapped<String?>? lastName,
      Wrapped<DateTime?>? birthDate,
      Wrapped<enums.InscriptionChildSex?>? sex,
      Wrapped<String?>? avatar,
      Wrapped<ChildMedicalFile?>? medicalFile}) {
    return InscriptionChild(
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
class InscriptionWeeklyChildSchedule {
  InscriptionWeeklyChildSchedule({
    this.id,
    this.mondayStart,
    this.mondayEnd,
    this.tuesdayStart,
    this.tuesdayEnd,
    this.wednesdayStart,
    this.wednesdayEnd,
    this.thursdayStart,
    this.thursdayEnd,
    this.fridayStart,
    this.fridayEnd,
    this.saturdayStart,
    this.saturdayEnd,
    this.sundayStart,
    this.sundayEnd,
  });

  factory InscriptionWeeklyChildSchedule.fromJson(Map<String, dynamic> json) =>
      _$InscriptionWeeklyChildScheduleFromJson(json);

  static const toJsonFactory = _$InscriptionWeeklyChildScheduleToJson;
  Map<String, dynamic> toJson() => _$InscriptionWeeklyChildScheduleToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'monday_start', includeIfNull: false, defaultValue: '')
  final String? mondayStart;
  @JsonKey(name: 'monday_end', includeIfNull: false, defaultValue: '')
  final String? mondayEnd;
  @JsonKey(name: 'tuesday_start', includeIfNull: false, defaultValue: '')
  final String? tuesdayStart;
  @JsonKey(name: 'tuesday_end', includeIfNull: false, defaultValue: '')
  final String? tuesdayEnd;
  @JsonKey(name: 'wednesday_start', includeIfNull: false, defaultValue: '')
  final String? wednesdayStart;
  @JsonKey(name: 'wednesday_end', includeIfNull: false, defaultValue: '')
  final String? wednesdayEnd;
  @JsonKey(name: 'thursday_start', includeIfNull: false, defaultValue: '')
  final String? thursdayStart;
  @JsonKey(name: 'thursday_end', includeIfNull: false, defaultValue: '')
  final String? thursdayEnd;
  @JsonKey(name: 'friday_start', includeIfNull: false, defaultValue: '')
  final String? fridayStart;
  @JsonKey(name: 'friday_end', includeIfNull: false, defaultValue: '')
  final String? fridayEnd;
  @JsonKey(name: 'saturday_start', includeIfNull: false, defaultValue: '')
  final String? saturdayStart;
  @JsonKey(name: 'saturday_end', includeIfNull: false, defaultValue: '')
  final String? saturdayEnd;
  @JsonKey(name: 'sunday_start', includeIfNull: false, defaultValue: '')
  final String? sundayStart;
  @JsonKey(name: 'sunday_end', includeIfNull: false, defaultValue: '')
  final String? sundayEnd;
  static const fromJsonFactory = _$InscriptionWeeklyChildScheduleFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InscriptionWeeklyChildSchedule &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.mondayStart, mondayStart) ||
                const DeepCollectionEquality()
                    .equals(other.mondayStart, mondayStart)) &&
            (identical(other.mondayEnd, mondayEnd) ||
                const DeepCollectionEquality()
                    .equals(other.mondayEnd, mondayEnd)) &&
            (identical(other.tuesdayStart, tuesdayStart) ||
                const DeepCollectionEquality()
                    .equals(other.tuesdayStart, tuesdayStart)) &&
            (identical(other.tuesdayEnd, tuesdayEnd) ||
                const DeepCollectionEquality()
                    .equals(other.tuesdayEnd, tuesdayEnd)) &&
            (identical(other.wednesdayStart, wednesdayStart) ||
                const DeepCollectionEquality()
                    .equals(other.wednesdayStart, wednesdayStart)) &&
            (identical(other.wednesdayEnd, wednesdayEnd) ||
                const DeepCollectionEquality()
                    .equals(other.wednesdayEnd, wednesdayEnd)) &&
            (identical(other.thursdayStart, thursdayStart) ||
                const DeepCollectionEquality()
                    .equals(other.thursdayStart, thursdayStart)) &&
            (identical(other.thursdayEnd, thursdayEnd) ||
                const DeepCollectionEquality()
                    .equals(other.thursdayEnd, thursdayEnd)) &&
            (identical(other.fridayStart, fridayStart) ||
                const DeepCollectionEquality()
                    .equals(other.fridayStart, fridayStart)) &&
            (identical(other.fridayEnd, fridayEnd) ||
                const DeepCollectionEquality()
                    .equals(other.fridayEnd, fridayEnd)) &&
            (identical(other.saturdayStart, saturdayStart) ||
                const DeepCollectionEquality()
                    .equals(other.saturdayStart, saturdayStart)) &&
            (identical(other.saturdayEnd, saturdayEnd) ||
                const DeepCollectionEquality()
                    .equals(other.saturdayEnd, saturdayEnd)) &&
            (identical(other.sundayStart, sundayStart) ||
                const DeepCollectionEquality()
                    .equals(other.sundayStart, sundayStart)) &&
            (identical(other.sundayEnd, sundayEnd) ||
                const DeepCollectionEquality()
                    .equals(other.sundayEnd, sundayEnd)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(mondayStart) ^
      const DeepCollectionEquality().hash(mondayEnd) ^
      const DeepCollectionEquality().hash(tuesdayStart) ^
      const DeepCollectionEquality().hash(tuesdayEnd) ^
      const DeepCollectionEquality().hash(wednesdayStart) ^
      const DeepCollectionEquality().hash(wednesdayEnd) ^
      const DeepCollectionEquality().hash(thursdayStart) ^
      const DeepCollectionEquality().hash(thursdayEnd) ^
      const DeepCollectionEquality().hash(fridayStart) ^
      const DeepCollectionEquality().hash(fridayEnd) ^
      const DeepCollectionEquality().hash(saturdayStart) ^
      const DeepCollectionEquality().hash(saturdayEnd) ^
      const DeepCollectionEquality().hash(sundayStart) ^
      const DeepCollectionEquality().hash(sundayEnd) ^
      runtimeType.hashCode;
}

extension $InscriptionWeeklyChildScheduleExtension
    on InscriptionWeeklyChildSchedule {
  InscriptionWeeklyChildSchedule copyWith(
      {int? id,
      String? mondayStart,
      String? mondayEnd,
      String? tuesdayStart,
      String? tuesdayEnd,
      String? wednesdayStart,
      String? wednesdayEnd,
      String? thursdayStart,
      String? thursdayEnd,
      String? fridayStart,
      String? fridayEnd,
      String? saturdayStart,
      String? saturdayEnd,
      String? sundayStart,
      String? sundayEnd}) {
    return InscriptionWeeklyChildSchedule(
        id: id ?? this.id,
        mondayStart: mondayStart ?? this.mondayStart,
        mondayEnd: mondayEnd ?? this.mondayEnd,
        tuesdayStart: tuesdayStart ?? this.tuesdayStart,
        tuesdayEnd: tuesdayEnd ?? this.tuesdayEnd,
        wednesdayStart: wednesdayStart ?? this.wednesdayStart,
        wednesdayEnd: wednesdayEnd ?? this.wednesdayEnd,
        thursdayStart: thursdayStart ?? this.thursdayStart,
        thursdayEnd: thursdayEnd ?? this.thursdayEnd,
        fridayStart: fridayStart ?? this.fridayStart,
        fridayEnd: fridayEnd ?? this.fridayEnd,
        saturdayStart: saturdayStart ?? this.saturdayStart,
        saturdayEnd: saturdayEnd ?? this.saturdayEnd,
        sundayStart: sundayStart ?? this.sundayStart,
        sundayEnd: sundayEnd ?? this.sundayEnd);
  }

  InscriptionWeeklyChildSchedule copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String?>? mondayStart,
      Wrapped<String?>? mondayEnd,
      Wrapped<String?>? tuesdayStart,
      Wrapped<String?>? tuesdayEnd,
      Wrapped<String?>? wednesdayStart,
      Wrapped<String?>? wednesdayEnd,
      Wrapped<String?>? thursdayStart,
      Wrapped<String?>? thursdayEnd,
      Wrapped<String?>? fridayStart,
      Wrapped<String?>? fridayEnd,
      Wrapped<String?>? saturdayStart,
      Wrapped<String?>? saturdayEnd,
      Wrapped<String?>? sundayStart,
      Wrapped<String?>? sundayEnd}) {
    return InscriptionWeeklyChildSchedule(
        id: (id != null ? id.value : this.id),
        mondayStart:
            (mondayStart != null ? mondayStart.value : this.mondayStart),
        mondayEnd: (mondayEnd != null ? mondayEnd.value : this.mondayEnd),
        tuesdayStart:
            (tuesdayStart != null ? tuesdayStart.value : this.tuesdayStart),
        tuesdayEnd: (tuesdayEnd != null ? tuesdayEnd.value : this.tuesdayEnd),
        wednesdayStart: (wednesdayStart != null
            ? wednesdayStart.value
            : this.wednesdayStart),
        wednesdayEnd:
            (wednesdayEnd != null ? wednesdayEnd.value : this.wednesdayEnd),
        thursdayStart:
            (thursdayStart != null ? thursdayStart.value : this.thursdayStart),
        thursdayEnd:
            (thursdayEnd != null ? thursdayEnd.value : this.thursdayEnd),
        fridayStart:
            (fridayStart != null ? fridayStart.value : this.fridayStart),
        fridayEnd: (fridayEnd != null ? fridayEnd.value : this.fridayEnd),
        saturdayStart:
            (saturdayStart != null ? saturdayStart.value : this.saturdayStart),
        saturdayEnd:
            (saturdayEnd != null ? saturdayEnd.value : this.saturdayEnd),
        sundayStart:
            (sundayStart != null ? sundayStart.value : this.sundayStart),
        sundayEnd: (sundayEnd != null ? sundayEnd.value : this.sundayEnd));
  }
}

@JsonSerializable(explicitToJson: true)
class InscriptionRegistration {
  InscriptionRegistration({
    this.id,
    this.family,
    this.parent1,
    this.parent2,
    this.kindergarten,
    this.child,
    this.schedule,
    this.acceptedKindergarten,
    this.acceptedParent,
    this.terminatedKindergarten,
    this.terminatedParent,
    this.startDate,
    this.endDate,
    this.status,
    this.statusAction,
    this.statusDate,
    this.possibleNextActions,
  });

  factory InscriptionRegistration.fromJson(Map<String, dynamic> json) =>
      _$InscriptionRegistrationFromJson(json);

  static const toJsonFactory = _$InscriptionRegistrationToJson;
  Map<String, dynamic> toJson() => _$InscriptionRegistrationToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'family', includeIfNull: false)
  final InscriptionRegistrationFamily? family;
  @JsonKey(name: 'parent1', includeIfNull: false)
  final ParentProfile? parent1;
  @JsonKey(name: 'parent2', includeIfNull: false)
  final ParentProfile? parent2;
  @JsonKey(name: 'kindergarten', includeIfNull: false, defaultValue: '')
  final String? kindergarten;
  @JsonKey(name: 'child', includeIfNull: false)
  final InscriptionChild? child;
  @JsonKey(name: 'schedule', includeIfNull: false)
  final InscriptionWeeklyChildSchedule? schedule;
  @JsonKey(name: 'accepted_kindergarten', includeIfNull: false)
  final DateTime? acceptedKindergarten;
  @JsonKey(name: 'accepted_parent', includeIfNull: false)
  final DateTime? acceptedParent;
  @JsonKey(name: 'terminated_kindergarten', includeIfNull: false)
  final DateTime? terminatedKindergarten;
  @JsonKey(name: 'terminated_parent', includeIfNull: false)
  final DateTime? terminatedParent;
  @JsonKey(name: 'start_date', includeIfNull: false)
  final DateTime? startDate;
  @JsonKey(name: 'end_date', includeIfNull: false)
  final DateTime? endDate;
  @JsonKey(name: 'status', includeIfNull: false, defaultValue: '')
  final String? status;
  @JsonKey(
    name: 'status_action',
    includeIfNull: false,
    toJson: inscriptionRegistrationStatusActionToJson,
    fromJson: inscriptionRegistrationStatusActionFromJson,
  )
  final enums.InscriptionRegistrationStatusAction? statusAction;
  @JsonKey(name: 'status_date', includeIfNull: false)
  final DateTime? statusDate;
  @JsonKey(
      name: 'possible_next_actions', includeIfNull: false, defaultValue: '')
  final String? possibleNextActions;
  static const fromJsonFactory = _$InscriptionRegistrationFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InscriptionRegistration &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.family, family) ||
                const DeepCollectionEquality().equals(other.family, family)) &&
            (identical(other.parent1, parent1) ||
                const DeepCollectionEquality()
                    .equals(other.parent1, parent1)) &&
            (identical(other.parent2, parent2) ||
                const DeepCollectionEquality()
                    .equals(other.parent2, parent2)) &&
            (identical(other.kindergarten, kindergarten) ||
                const DeepCollectionEquality()
                    .equals(other.kindergarten, kindergarten)) &&
            (identical(other.child, child) ||
                const DeepCollectionEquality().equals(other.child, child)) &&
            (identical(other.schedule, schedule) ||
                const DeepCollectionEquality()
                    .equals(other.schedule, schedule)) &&
            (identical(other.acceptedKindergarten, acceptedKindergarten) ||
                const DeepCollectionEquality().equals(
                    other.acceptedKindergarten, acceptedKindergarten)) &&
            (identical(other.acceptedParent, acceptedParent) ||
                const DeepCollectionEquality()
                    .equals(other.acceptedParent, acceptedParent)) &&
            (identical(other.terminatedKindergarten, terminatedKindergarten) ||
                const DeepCollectionEquality().equals(
                    other.terminatedKindergarten, terminatedKindergarten)) &&
            (identical(other.terminatedParent, terminatedParent) ||
                const DeepCollectionEquality()
                    .equals(other.terminatedParent, terminatedParent)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.statusAction, statusAction) ||
                const DeepCollectionEquality()
                    .equals(other.statusAction, statusAction)) &&
            (identical(other.statusDate, statusDate) ||
                const DeepCollectionEquality()
                    .equals(other.statusDate, statusDate)) &&
            (identical(other.possibleNextActions, possibleNextActions) ||
                const DeepCollectionEquality()
                    .equals(other.possibleNextActions, possibleNextActions)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(family) ^
      const DeepCollectionEquality().hash(parent1) ^
      const DeepCollectionEquality().hash(parent2) ^
      const DeepCollectionEquality().hash(kindergarten) ^
      const DeepCollectionEquality().hash(child) ^
      const DeepCollectionEquality().hash(schedule) ^
      const DeepCollectionEquality().hash(acceptedKindergarten) ^
      const DeepCollectionEquality().hash(acceptedParent) ^
      const DeepCollectionEquality().hash(terminatedKindergarten) ^
      const DeepCollectionEquality().hash(terminatedParent) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(statusAction) ^
      const DeepCollectionEquality().hash(statusDate) ^
      const DeepCollectionEquality().hash(possibleNextActions) ^
      runtimeType.hashCode;
}

extension $InscriptionRegistrationExtension on InscriptionRegistration {
  InscriptionRegistration copyWith(
      {int? id,
      InscriptionRegistrationFamily? family,
      ParentProfile? parent1,
      ParentProfile? parent2,
      String? kindergarten,
      InscriptionChild? child,
      InscriptionWeeklyChildSchedule? schedule,
      DateTime? acceptedKindergarten,
      DateTime? acceptedParent,
      DateTime? terminatedKindergarten,
      DateTime? terminatedParent,
      DateTime? startDate,
      DateTime? endDate,
      String? status,
      enums.InscriptionRegistrationStatusAction? statusAction,
      DateTime? statusDate,
      String? possibleNextActions}) {
    return InscriptionRegistration(
        id: id ?? this.id,
        family: family ?? this.family,
        parent1: parent1 ?? this.parent1,
        parent2: parent2 ?? this.parent2,
        kindergarten: kindergarten ?? this.kindergarten,
        child: child ?? this.child,
        schedule: schedule ?? this.schedule,
        acceptedKindergarten: acceptedKindergarten ?? this.acceptedKindergarten,
        acceptedParent: acceptedParent ?? this.acceptedParent,
        terminatedKindergarten:
            terminatedKindergarten ?? this.terminatedKindergarten,
        terminatedParent: terminatedParent ?? this.terminatedParent,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        status: status ?? this.status,
        statusAction: statusAction ?? this.statusAction,
        statusDate: statusDate ?? this.statusDate,
        possibleNextActions: possibleNextActions ?? this.possibleNextActions);
  }

  InscriptionRegistration copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<InscriptionRegistrationFamily?>? family,
      Wrapped<ParentProfile?>? parent1,
      Wrapped<ParentProfile?>? parent2,
      Wrapped<String?>? kindergarten,
      Wrapped<InscriptionChild?>? child,
      Wrapped<InscriptionWeeklyChildSchedule?>? schedule,
      Wrapped<DateTime?>? acceptedKindergarten,
      Wrapped<DateTime?>? acceptedParent,
      Wrapped<DateTime?>? terminatedKindergarten,
      Wrapped<DateTime?>? terminatedParent,
      Wrapped<DateTime?>? startDate,
      Wrapped<DateTime?>? endDate,
      Wrapped<String?>? status,
      Wrapped<enums.InscriptionRegistrationStatusAction?>? statusAction,
      Wrapped<DateTime?>? statusDate,
      Wrapped<String?>? possibleNextActions}) {
    return InscriptionRegistration(
        id: (id != null ? id.value : this.id),
        family: (family != null ? family.value : this.family),
        parent1: (parent1 != null ? parent1.value : this.parent1),
        parent2: (parent2 != null ? parent2.value : this.parent2),
        kindergarten:
            (kindergarten != null ? kindergarten.value : this.kindergarten),
        child: (child != null ? child.value : this.child),
        schedule: (schedule != null ? schedule.value : this.schedule),
        acceptedKindergarten: (acceptedKindergarten != null
            ? acceptedKindergarten.value
            : this.acceptedKindergarten),
        acceptedParent: (acceptedParent != null
            ? acceptedParent.value
            : this.acceptedParent),
        terminatedKindergarten: (terminatedKindergarten != null
            ? terminatedKindergarten.value
            : this.terminatedKindergarten),
        terminatedParent: (terminatedParent != null
            ? terminatedParent.value
            : this.terminatedParent),
        startDate: (startDate != null ? startDate.value : this.startDate),
        endDate: (endDate != null ? endDate.value : this.endDate),
        status: (status != null ? status.value : this.status),
        statusAction:
            (statusAction != null ? statusAction.value : this.statusAction),
        statusDate: (statusDate != null ? statusDate.value : this.statusDate),
        possibleNextActions: (possibleNextActions != null
            ? possibleNextActions.value
            : this.possibleNextActions));
  }
}

@JsonSerializable(explicitToJson: true)
class ParentSignupByKindergartenList {
  ParentSignupByKindergartenList({
    this.id,
    this.parent,
    this.accepted,
    this.sent,
  });

  factory ParentSignupByKindergartenList.fromJson(Map<String, dynamic> json) =>
      _$ParentSignupByKindergartenListFromJson(json);

  static const toJsonFactory = _$ParentSignupByKindergartenListToJson;
  Map<String, dynamic> toJson() => _$ParentSignupByKindergartenListToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'parent', includeIfNull: false, defaultValue: '')
  final String? parent;
  @JsonKey(name: 'accepted', includeIfNull: false)
  final bool? accepted;
  @JsonKey(name: 'sent', includeIfNull: false)
  final DateTime? sent;
  static const fromJsonFactory = _$ParentSignupByKindergartenListFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ParentSignupByKindergartenList &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.parent, parent) ||
                const DeepCollectionEquality().equals(other.parent, parent)) &&
            (identical(other.accepted, accepted) ||
                const DeepCollectionEquality()
                    .equals(other.accepted, accepted)) &&
            (identical(other.sent, sent) ||
                const DeepCollectionEquality().equals(other.sent, sent)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(parent) ^
      const DeepCollectionEquality().hash(accepted) ^
      const DeepCollectionEquality().hash(sent) ^
      runtimeType.hashCode;
}

extension $ParentSignupByKindergartenListExtension
    on ParentSignupByKindergartenList {
  ParentSignupByKindergartenList copyWith(
      {int? id, String? parent, bool? accepted, DateTime? sent}) {
    return ParentSignupByKindergartenList(
        id: id ?? this.id,
        parent: parent ?? this.parent,
        accepted: accepted ?? this.accepted,
        sent: sent ?? this.sent);
  }

  ParentSignupByKindergartenList copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String?>? parent,
      Wrapped<bool?>? accepted,
      Wrapped<DateTime?>? sent}) {
    return ParentSignupByKindergartenList(
        id: (id != null ? id.value : this.id),
        parent: (parent != null ? parent.value : this.parent),
        accepted: (accepted != null ? accepted.value : this.accepted),
        sent: (sent != null ? sent.value : this.sent));
  }
}

@JsonSerializable(explicitToJson: true)
class FamilySignupByKindergartenList {
  FamilySignupByKindergartenList({
    this.id,
    this.parent1Signup,
    this.parent2Signup,
    this.kindergarten,
    this.inscription,
  });

  factory FamilySignupByKindergartenList.fromJson(Map<String, dynamic> json) =>
      _$FamilySignupByKindergartenListFromJson(json);

  static const toJsonFactory = _$FamilySignupByKindergartenListToJson;
  Map<String, dynamic> toJson() => _$FamilySignupByKindergartenListToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'parent1_signup', includeIfNull: false)
  final ParentSignupByKindergartenList? parent1Signup;
  @JsonKey(name: 'parent2_signup', includeIfNull: false)
  final ParentSignupByKindergartenList? parent2Signup;
  @JsonKey(name: 'kindergarten', includeIfNull: false, defaultValue: '')
  final String? kindergarten;
  @JsonKey(name: 'inscription', includeIfNull: false)
  final int? inscription;
  static const fromJsonFactory = _$FamilySignupByKindergartenListFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FamilySignupByKindergartenList &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.parent1Signup, parent1Signup) ||
                const DeepCollectionEquality()
                    .equals(other.parent1Signup, parent1Signup)) &&
            (identical(other.parent2Signup, parent2Signup) ||
                const DeepCollectionEquality()
                    .equals(other.parent2Signup, parent2Signup)) &&
            (identical(other.kindergarten, kindergarten) ||
                const DeepCollectionEquality()
                    .equals(other.kindergarten, kindergarten)) &&
            (identical(other.inscription, inscription) ||
                const DeepCollectionEquality()
                    .equals(other.inscription, inscription)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(parent1Signup) ^
      const DeepCollectionEquality().hash(parent2Signup) ^
      const DeepCollectionEquality().hash(kindergarten) ^
      const DeepCollectionEquality().hash(inscription) ^
      runtimeType.hashCode;
}

extension $FamilySignupByKindergartenListExtension
    on FamilySignupByKindergartenList {
  FamilySignupByKindergartenList copyWith(
      {int? id,
      ParentSignupByKindergartenList? parent1Signup,
      ParentSignupByKindergartenList? parent2Signup,
      String? kindergarten,
      int? inscription}) {
    return FamilySignupByKindergartenList(
        id: id ?? this.id,
        parent1Signup: parent1Signup ?? this.parent1Signup,
        parent2Signup: parent2Signup ?? this.parent2Signup,
        kindergarten: kindergarten ?? this.kindergarten,
        inscription: inscription ?? this.inscription);
  }

  FamilySignupByKindergartenList copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<ParentSignupByKindergartenList?>? parent1Signup,
      Wrapped<ParentSignupByKindergartenList?>? parent2Signup,
      Wrapped<String?>? kindergarten,
      Wrapped<int?>? inscription}) {
    return FamilySignupByKindergartenList(
        id: (id != null ? id.value : this.id),
        parent1Signup:
            (parent1Signup != null ? parent1Signup.value : this.parent1Signup),
        parent2Signup:
            (parent2Signup != null ? parent2Signup.value : this.parent2Signup),
        kindergarten:
            (kindergarten != null ? kindergarten.value : this.kindergarten),
        inscription:
            (inscription != null ? inscription.value : this.inscription));
  }
}

@JsonSerializable(explicitToJson: true)
class ResendFamilySignupByKindergartenEmailConfirmation {
  ResendFamilySignupByKindergartenEmailConfirmation();

  factory ResendFamilySignupByKindergartenEmailConfirmation.fromJson(
          Map<String, dynamic> json) =>
      _$ResendFamilySignupByKindergartenEmailConfirmationFromJson(json);

  static const toJsonFactory =
      _$ResendFamilySignupByKindergartenEmailConfirmationToJson;
  Map<String, dynamic> toJson() =>
      _$ResendFamilySignupByKindergartenEmailConfirmationToJson(this);

  static const fromJsonFactory =
      _$ResendFamilySignupByKindergartenEmailConfirmationFromJson;

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

@JsonSerializable(explicitToJson: true)
class ResendParentSignupByKindergartenEmailConfirmation {
  ResendParentSignupByKindergartenEmailConfirmation();

  factory ResendParentSignupByKindergartenEmailConfirmation.fromJson(
          Map<String, dynamic> json) =>
      _$ResendParentSignupByKindergartenEmailConfirmationFromJson(json);

  static const toJsonFactory =
      _$ResendParentSignupByKindergartenEmailConfirmationToJson;
  Map<String, dynamic> toJson() =>
      _$ResendParentSignupByKindergartenEmailConfirmationToJson(this);

  static const fromJsonFactory =
      _$ResendParentSignupByKindergartenEmailConfirmationFromJson;

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

@JsonSerializable(explicitToJson: true)
class ConfirmParentSignup {
  ConfirmParentSignup({
    this.parent,
    this.key,
  });

  factory ConfirmParentSignup.fromJson(Map<String, dynamic> json) =>
      _$ConfirmParentSignupFromJson(json);

  static const toJsonFactory = _$ConfirmParentSignupToJson;
  Map<String, dynamic> toJson() => _$ConfirmParentSignupToJson(this);

  @JsonKey(name: 'parent', includeIfNull: false, defaultValue: '')
  final String? parent;
  @JsonKey(name: 'key', includeIfNull: false, defaultValue: '')
  final String? key;
  static const fromJsonFactory = _$ConfirmParentSignupFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ConfirmParentSignup &&
            (identical(other.parent, parent) ||
                const DeepCollectionEquality().equals(other.parent, parent)) &&
            (identical(other.key, key) ||
                const DeepCollectionEquality().equals(other.key, key)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(parent) ^
      const DeepCollectionEquality().hash(key) ^
      runtimeType.hashCode;
}

extension $ConfirmParentSignupExtension on ConfirmParentSignup {
  ConfirmParentSignup copyWith({String? parent, String? key}) {
    return ConfirmParentSignup(
        parent: parent ?? this.parent, key: key ?? this.key);
  }

  ConfirmParentSignup copyWithWrapped(
      {Wrapped<String?>? parent, Wrapped<String?>? key}) {
    return ConfirmParentSignup(
        parent: (parent != null ? parent.value : this.parent),
        key: (key != null ? key.value : this.key));
  }
}

@JsonSerializable(explicitToJson: true)
class FinalizeParentSignup {
  FinalizeParentSignup({
    this.password1,
    this.password2,
  });

  factory FinalizeParentSignup.fromJson(Map<String, dynamic> json) =>
      _$FinalizeParentSignupFromJson(json);

  static const toJsonFactory = _$FinalizeParentSignupToJson;
  Map<String, dynamic> toJson() => _$FinalizeParentSignupToJson(this);

  @JsonKey(name: 'password1', includeIfNull: false, defaultValue: '')
  final String? password1;
  @JsonKey(name: 'password2', includeIfNull: false, defaultValue: '')
  final String? password2;
  static const fromJsonFactory = _$FinalizeParentSignupFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FinalizeParentSignup &&
            (identical(other.password1, password1) ||
                const DeepCollectionEquality()
                    .equals(other.password1, password1)) &&
            (identical(other.password2, password2) ||
                const DeepCollectionEquality()
                    .equals(other.password2, password2)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(password1) ^
      const DeepCollectionEquality().hash(password2) ^
      runtimeType.hashCode;
}

extension $FinalizeParentSignupExtension on FinalizeParentSignup {
  FinalizeParentSignup copyWith({String? password1, String? password2}) {
    return FinalizeParentSignup(
        password1: password1 ?? this.password1,
        password2: password2 ?? this.password2);
  }

  FinalizeParentSignup copyWithWrapped(
      {Wrapped<String?>? password1, Wrapped<String?>? password2}) {
    return FinalizeParentSignup(
        password1: (password1 != null ? password1.value : this.password1),
        password2: (password2 != null ? password2.value : this.password2));
  }
}

@JsonSerializable(explicitToJson: true)
class ParentInvitation {
  ParentInvitation({
    this.password1,
    this.password2,
  });

  factory ParentInvitation.fromJson(Map<String, dynamic> json) =>
      _$ParentInvitationFromJson(json);

  static const toJsonFactory = _$ParentInvitationToJson;
  Map<String, dynamic> toJson() => _$ParentInvitationToJson(this);

  @JsonKey(name: 'password1', includeIfNull: false, defaultValue: '')
  final String? password1;
  @JsonKey(name: 'password2', includeIfNull: false, defaultValue: '')
  final String? password2;
  static const fromJsonFactory = _$ParentInvitationFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ParentInvitation &&
            (identical(other.password1, password1) ||
                const DeepCollectionEquality()
                    .equals(other.password1, password1)) &&
            (identical(other.password2, password2) ||
                const DeepCollectionEquality()
                    .equals(other.password2, password2)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(password1) ^
      const DeepCollectionEquality().hash(password2) ^
      runtimeType.hashCode;
}

extension $ParentInvitationExtension on ParentInvitation {
  ParentInvitation copyWith({String? password1, String? password2}) {
    return ParentInvitation(
        password1: password1 ?? this.password1,
        password2: password2 ?? this.password2);
  }

  ParentInvitation copyWithWrapped(
      {Wrapped<String?>? password1, Wrapped<String?>? password2}) {
    return ParentInvitation(
        password1: (password1 != null ? password1.value : this.password1),
        password2: (password2 != null ? password2.value : this.password2));
  }
}

@JsonSerializable(explicitToJson: true)
class ParentInvitationRegistration {
  ParentInvitationRegistration({
    this.user,
    this.phone,
    this.address,
    this.birthDate,
    this.firstName,
    this.lastName,
    this.sex,
  });

  factory ParentInvitationRegistration.fromJson(Map<String, dynamic> json) =>
      _$ParentInvitationRegistrationFromJson(json);

  static const toJsonFactory = _$ParentInvitationRegistrationToJson;
  Map<String, dynamic> toJson() => _$ParentInvitationRegistrationToJson(this);

  @JsonKey(name: 'user', includeIfNull: false)
  final ParentInvitation? user;
  @JsonKey(name: 'phone', includeIfNull: false)
  final ParentInvitationRegistration$Phone? phone;
  @JsonKey(name: 'address', includeIfNull: false)
  final Address? address;
  @JsonKey(name: 'birth_date', includeIfNull: false)
  final DateTime? birthDate;
  @JsonKey(name: 'first_name', includeIfNull: false, defaultValue: '')
  final String? firstName;
  @JsonKey(name: 'last_name', includeIfNull: false, defaultValue: '')
  final String? lastName;
  @JsonKey(
    name: 'sex',
    includeIfNull: false,
    toJson: parentInvitationRegistrationSexToJson,
    fromJson: parentInvitationRegistrationSexFromJson,
  )
  final enums.ParentInvitationRegistrationSex? sex;
  static const fromJsonFactory = _$ParentInvitationRegistrationFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ParentInvitationRegistration &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
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
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(birthDate) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(sex) ^
      runtimeType.hashCode;
}

extension $ParentInvitationRegistrationExtension
    on ParentInvitationRegistration {
  ParentInvitationRegistration copyWith(
      {ParentInvitation? user,
      ParentInvitationRegistration$Phone? phone,
      Address? address,
      DateTime? birthDate,
      String? firstName,
      String? lastName,
      enums.ParentInvitationRegistrationSex? sex}) {
    return ParentInvitationRegistration(
        user: user ?? this.user,
        phone: phone ?? this.phone,
        address: address ?? this.address,
        birthDate: birthDate ?? this.birthDate,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        sex: sex ?? this.sex);
  }

  ParentInvitationRegistration copyWithWrapped(
      {Wrapped<ParentInvitation?>? user,
      Wrapped<ParentInvitationRegistration$Phone?>? phone,
      Wrapped<Address?>? address,
      Wrapped<DateTime?>? birthDate,
      Wrapped<String?>? firstName,
      Wrapped<String?>? lastName,
      Wrapped<enums.ParentInvitationRegistrationSex?>? sex}) {
    return ParentInvitationRegistration(
        user: (user != null ? user.value : this.user),
        phone: (phone != null ? phone.value : this.phone),
        address: (address != null ? address.value : this.address),
        birthDate: (birthDate != null ? birthDate.value : this.birthDate),
        firstName: (firstName != null ? firstName.value : this.firstName),
        lastName: (lastName != null ? lastName.value : this.lastName),
        sex: (sex != null ? sex.value : this.sex));
  }
}

@JsonSerializable(explicitToJson: true)
class CustomResendEmailVerification {
  CustomResendEmailVerification({
    this.email,
  });

  factory CustomResendEmailVerification.fromJson(Map<String, dynamic> json) =>
      _$CustomResendEmailVerificationFromJson(json);

  static const toJsonFactory = _$CustomResendEmailVerificationToJson;
  Map<String, dynamic> toJson() => _$CustomResendEmailVerificationToJson(this);

  @JsonKey(name: 'email', includeIfNull: false, defaultValue: '')
  final String? email;
  static const fromJsonFactory = _$CustomResendEmailVerificationFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CustomResendEmailVerification &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(email) ^ runtimeType.hashCode;
}

extension $CustomResendEmailVerificationExtension
    on CustomResendEmailVerification {
  CustomResendEmailVerification copyWith({String? email}) {
    return CustomResendEmailVerification(email: email ?? this.email);
  }

  CustomResendEmailVerification copyWithWrapped({Wrapped<String?>? email}) {
    return CustomResendEmailVerification(
        email: (email != null ? email.value : this.email));
  }
}

@JsonSerializable(explicitToJson: true)
class CookieTokenRefresh {
  CookieTokenRefresh({
    this.refresh,
    this.access,
  });

  factory CookieTokenRefresh.fromJson(Map<String, dynamic> json) =>
      _$CookieTokenRefreshFromJson(json);

  static const toJsonFactory = _$CookieTokenRefreshToJson;
  Map<String, dynamic> toJson() => _$CookieTokenRefreshToJson(this);

  @JsonKey(name: 'refresh', includeIfNull: false, defaultValue: '')
  final String? refresh;
  @JsonKey(name: 'access', includeIfNull: false, defaultValue: '')
  final String? access;
  static const fromJsonFactory = _$CookieTokenRefreshFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CookieTokenRefresh &&
            (identical(other.refresh, refresh) ||
                const DeepCollectionEquality()
                    .equals(other.refresh, refresh)) &&
            (identical(other.access, access) ||
                const DeepCollectionEquality().equals(other.access, access)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(refresh) ^
      const DeepCollectionEquality().hash(access) ^
      runtimeType.hashCode;
}

extension $CookieTokenRefreshExtension on CookieTokenRefresh {
  CookieTokenRefresh copyWith({String? refresh, String? access}) {
    return CookieTokenRefresh(
        refresh: refresh ?? this.refresh, access: access ?? this.access);
  }

  CookieTokenRefresh copyWithWrapped(
      {Wrapped<String?>? refresh, Wrapped<String?>? access}) {
    return CookieTokenRefresh(
        refresh: (refresh != null ? refresh.value : this.refresh),
        access: (access != null ? access.value : this.access));
  }
}

@JsonSerializable(explicitToJson: true)
class TokenVerify {
  TokenVerify({
    this.token,
  });

  factory TokenVerify.fromJson(Map<String, dynamic> json) =>
      _$TokenVerifyFromJson(json);

  static const toJsonFactory = _$TokenVerifyToJson;
  Map<String, dynamic> toJson() => _$TokenVerifyToJson(this);

  @JsonKey(name: 'token', includeIfNull: false, defaultValue: '')
  final String? token;
  static const fromJsonFactory = _$TokenVerifyFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TokenVerify &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(token) ^ runtimeType.hashCode;
}

extension $TokenVerifyExtension on TokenVerify {
  TokenVerify copyWith({String? token}) {
    return TokenVerify(token: token ?? this.token);
  }

  TokenVerify copyWithWrapped({Wrapped<String?>? token}) {
    return TokenVerify(token: (token != null ? token.value : this.token));
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
class Actor {
  Actor({
    this.id,
    this.name,
    this.userType,
  });

  factory Actor.fromJson(Map<String, dynamic> json) => _$ActorFromJson(json);

  static const toJsonFactory = _$ActorToJson;
  Map<String, dynamic> toJson() => _$ActorToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  @JsonKey(name: 'user_type', includeIfNull: false, defaultValue: '')
  final String? userType;
  static const fromJsonFactory = _$ActorFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Actor &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.userType, userType) ||
                const DeepCollectionEquality()
                    .equals(other.userType, userType)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(userType) ^
      runtimeType.hashCode;
}

extension $ActorExtension on Actor {
  Actor copyWith({int? id, String? name, String? userType}) {
    return Actor(
        id: id ?? this.id,
        name: name ?? this.name,
        userType: userType ?? this.userType);
  }

  Actor copyWithWrapped(
      {Wrapped<int?>? id, Wrapped<String?>? name, Wrapped<String?>? userType}) {
    return Actor(
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name),
        userType: (userType != null ? userType.value : this.userType));
  }
}

@JsonSerializable(explicitToJson: true)
class ChildNotes {
  ChildNotes({
    this.id,
    this.child,
    this.description,
    this.actor,
    this.timestamp,
  });

  factory ChildNotes.fromJson(Map<String, dynamic> json) =>
      _$ChildNotesFromJson(json);

  static const toJsonFactory = _$ChildNotesToJson;
  Map<String, dynamic> toJson() => _$ChildNotesToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'child', includeIfNull: false)
  final int? child;
  @JsonKey(name: 'description', includeIfNull: false, defaultValue: '')
  final String? description;
  @JsonKey(name: 'actor', includeIfNull: false)
  final Actor? actor;
  @JsonKey(name: 'timestamp', includeIfNull: false)
  final DateTime? timestamp;
  static const fromJsonFactory = _$ChildNotesFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChildNotes &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.child, child) ||
                const DeepCollectionEquality().equals(other.child, child)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.actor, actor) ||
                const DeepCollectionEquality().equals(other.actor, actor)) &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.timestamp, timestamp)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(child) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(actor) ^
      const DeepCollectionEquality().hash(timestamp) ^
      runtimeType.hashCode;
}

extension $ChildNotesExtension on ChildNotes {
  ChildNotes copyWith(
      {int? id,
      int? child,
      String? description,
      Actor? actor,
      DateTime? timestamp}) {
    return ChildNotes(
        id: id ?? this.id,
        child: child ?? this.child,
        description: description ?? this.description,
        actor: actor ?? this.actor,
        timestamp: timestamp ?? this.timestamp);
  }

  ChildNotes copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<int?>? child,
      Wrapped<String?>? description,
      Wrapped<Actor?>? actor,
      Wrapped<DateTime?>? timestamp}) {
    return ChildNotes(
        id: (id != null ? id.value : this.id),
        child: (child != null ? child.value : this.child),
        description:
            (description != null ? description.value : this.description),
        actor: (actor != null ? actor.value : this.actor),
        timestamp: (timestamp != null ? timestamp.value : this.timestamp));
  }
}

@JsonSerializable(explicitToJson: true)
class ChildMedicalFileDefaultAllergy {
  ChildMedicalFileDefaultAllergy({
    this.id,
    this.name,
    this.type,
    this.severity,
    this.description,
  });

  factory ChildMedicalFileDefaultAllergy.fromJson(Map<String, dynamic> json) =>
      _$ChildMedicalFileDefaultAllergyFromJson(json);

  static const toJsonFactory = _$ChildMedicalFileDefaultAllergyToJson;
  Map<String, dynamic> toJson() => _$ChildMedicalFileDefaultAllergyToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  @JsonKey(name: 'type', includeIfNull: false, defaultValue: '')
  final String? type;
  @JsonKey(
    name: 'severity',
    includeIfNull: false,
    toJson: childMedicalFileDefaultAllergySeverityToJson,
    fromJson: childMedicalFileDefaultAllergySeverityFromJson,
  )
  final enums.ChildMedicalFileDefaultAllergySeverity? severity;
  @JsonKey(name: 'description', includeIfNull: false, defaultValue: '')
  final String? description;
  static const fromJsonFactory = _$ChildMedicalFileDefaultAllergyFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChildMedicalFileDefaultAllergy &&
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
                    .equals(other.description, description)));
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
      runtimeType.hashCode;
}

extension $ChildMedicalFileDefaultAllergyExtension
    on ChildMedicalFileDefaultAllergy {
  ChildMedicalFileDefaultAllergy copyWith(
      {int? id,
      String? name,
      String? type,
      enums.ChildMedicalFileDefaultAllergySeverity? severity,
      String? description}) {
    return ChildMedicalFileDefaultAllergy(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
        severity: severity ?? this.severity,
        description: description ?? this.description);
  }

  ChildMedicalFileDefaultAllergy copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String?>? name,
      Wrapped<String?>? type,
      Wrapped<enums.ChildMedicalFileDefaultAllergySeverity?>? severity,
      Wrapped<String?>? description}) {
    return ChildMedicalFileDefaultAllergy(
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name),
        type: (type != null ? type.value : this.type),
        severity: (severity != null ? severity.value : this.severity),
        description:
            (description != null ? description.value : this.description));
  }
}

@JsonSerializable(explicitToJson: true)
class ChildMedicalFileDefaultMedicalCondition {
  ChildMedicalFileDefaultMedicalCondition({
    this.id,
    this.name,
    this.severity,
    this.description,
  });

  factory ChildMedicalFileDefaultMedicalCondition.fromJson(
          Map<String, dynamic> json) =>
      _$ChildMedicalFileDefaultMedicalConditionFromJson(json);

  static const toJsonFactory = _$ChildMedicalFileDefaultMedicalConditionToJson;
  Map<String, dynamic> toJson() =>
      _$ChildMedicalFileDefaultMedicalConditionToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  @JsonKey(
    name: 'severity',
    includeIfNull: false,
    toJson: childMedicalFileDefaultMedicalConditionSeverityToJson,
    fromJson: childMedicalFileDefaultMedicalConditionSeverityFromJson,
  )
  final enums.ChildMedicalFileDefaultMedicalConditionSeverity? severity;
  @JsonKey(name: 'description', includeIfNull: false, defaultValue: '')
  final String? description;
  static const fromJsonFactory =
      _$ChildMedicalFileDefaultMedicalConditionFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChildMedicalFileDefaultMedicalCondition &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.severity, severity) ||
                const DeepCollectionEquality()
                    .equals(other.severity, severity)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(severity) ^
      const DeepCollectionEquality().hash(description) ^
      runtimeType.hashCode;
}

extension $ChildMedicalFileDefaultMedicalConditionExtension
    on ChildMedicalFileDefaultMedicalCondition {
  ChildMedicalFileDefaultMedicalCondition copyWith(
      {int? id,
      String? name,
      enums.ChildMedicalFileDefaultMedicalConditionSeverity? severity,
      String? description}) {
    return ChildMedicalFileDefaultMedicalCondition(
        id: id ?? this.id,
        name: name ?? this.name,
        severity: severity ?? this.severity,
        description: description ?? this.description);
  }

  ChildMedicalFileDefaultMedicalCondition copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String?>? name,
      Wrapped<enums.ChildMedicalFileDefaultMedicalConditionSeverity?>? severity,
      Wrapped<String?>? description}) {
    return ChildMedicalFileDefaultMedicalCondition(
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name),
        severity: (severity != null ? severity.value : this.severity),
        description:
            (description != null ? description.value : this.description));
  }
}

@JsonSerializable(explicitToJson: true)
class ChildMedicalFileDefaultMedication {
  ChildMedicalFileDefaultMedication({
    this.id,
    this.name,
    this.type,
    this.description,
  });

  factory ChildMedicalFileDefaultMedication.fromJson(
          Map<String, dynamic> json) =>
      _$ChildMedicalFileDefaultMedicationFromJson(json);

  static const toJsonFactory = _$ChildMedicalFileDefaultMedicationToJson;
  Map<String, dynamic> toJson() =>
      _$ChildMedicalFileDefaultMedicationToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  @JsonKey(name: 'type', includeIfNull: false, defaultValue: '')
  final String? type;
  @JsonKey(name: 'description', includeIfNull: false, defaultValue: '')
  final String? description;
  static const fromJsonFactory = _$ChildMedicalFileDefaultMedicationFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChildMedicalFileDefaultMedication &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(description) ^
      runtimeType.hashCode;
}

extension $ChildMedicalFileDefaultMedicationExtension
    on ChildMedicalFileDefaultMedication {
  ChildMedicalFileDefaultMedication copyWith(
      {int? id, String? name, String? type, String? description}) {
    return ChildMedicalFileDefaultMedication(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
        description: description ?? this.description);
  }

  ChildMedicalFileDefaultMedication copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String?>? name,
      Wrapped<String?>? type,
      Wrapped<String?>? description}) {
    return ChildMedicalFileDefaultMedication(
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name),
        type: (type != null ? type.value : this.type),
        description:
            (description != null ? description.value : this.description));
  }
}

@JsonSerializable(explicitToJson: true)
class InscriptionNewChild {
  InscriptionNewChild({
    this.id,
    this.family,
    this.parent1,
    this.parent2,
    this.kindergarten,
    this.child,
    this.schedule,
    this.acceptedKindergarten,
    this.acceptedParent,
    this.terminatedKindergarten,
    this.terminatedParent,
    this.startDate,
    this.endDate,
    this.status,
    this.statusAction,
    this.statusDate,
    this.possibleNextActions,
  });

  factory InscriptionNewChild.fromJson(Map<String, dynamic> json) =>
      _$InscriptionNewChildFromJson(json);

  static const toJsonFactory = _$InscriptionNewChildToJson;
  Map<String, dynamic> toJson() => _$InscriptionNewChildToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'family', includeIfNull: false)
  final int? family;
  @JsonKey(name: 'parent1', includeIfNull: false)
  final ParentProfile? parent1;
  @JsonKey(name: 'parent2', includeIfNull: false)
  final ParentProfile? parent2;
  @JsonKey(name: 'kindergarten', includeIfNull: false, defaultValue: '')
  final String? kindergarten;
  @JsonKey(name: 'child', includeIfNull: false)
  final InscriptionChild? child;
  @JsonKey(name: 'schedule', includeIfNull: false)
  final InscriptionWeeklyChildSchedule? schedule;
  @JsonKey(name: 'accepted_kindergarten', includeIfNull: false)
  final DateTime? acceptedKindergarten;
  @JsonKey(name: 'accepted_parent', includeIfNull: false)
  final DateTime? acceptedParent;
  @JsonKey(name: 'terminated_kindergarten', includeIfNull: false)
  final DateTime? terminatedKindergarten;
  @JsonKey(name: 'terminated_parent', includeIfNull: false)
  final DateTime? terminatedParent;
  @JsonKey(name: 'start_date', includeIfNull: false)
  final DateTime? startDate;
  @JsonKey(name: 'end_date', includeIfNull: false)
  final DateTime? endDate;
  @JsonKey(name: 'status', includeIfNull: false, defaultValue: '')
  final String? status;
  @JsonKey(
    name: 'status_action',
    includeIfNull: false,
    toJson: inscriptionNewChildStatusActionToJson,
    fromJson: inscriptionNewChildStatusActionFromJson,
  )
  final enums.InscriptionNewChildStatusAction? statusAction;
  @JsonKey(name: 'status_date', includeIfNull: false)
  final DateTime? statusDate;
  @JsonKey(
      name: 'possible_next_actions', includeIfNull: false, defaultValue: '')
  final String? possibleNextActions;
  static const fromJsonFactory = _$InscriptionNewChildFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InscriptionNewChild &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.family, family) ||
                const DeepCollectionEquality().equals(other.family, family)) &&
            (identical(other.parent1, parent1) ||
                const DeepCollectionEquality()
                    .equals(other.parent1, parent1)) &&
            (identical(other.parent2, parent2) ||
                const DeepCollectionEquality()
                    .equals(other.parent2, parent2)) &&
            (identical(other.kindergarten, kindergarten) ||
                const DeepCollectionEquality()
                    .equals(other.kindergarten, kindergarten)) &&
            (identical(other.child, child) ||
                const DeepCollectionEquality().equals(other.child, child)) &&
            (identical(other.schedule, schedule) ||
                const DeepCollectionEquality()
                    .equals(other.schedule, schedule)) &&
            (identical(other.acceptedKindergarten, acceptedKindergarten) ||
                const DeepCollectionEquality().equals(
                    other.acceptedKindergarten, acceptedKindergarten)) &&
            (identical(other.acceptedParent, acceptedParent) ||
                const DeepCollectionEquality()
                    .equals(other.acceptedParent, acceptedParent)) &&
            (identical(other.terminatedKindergarten, terminatedKindergarten) ||
                const DeepCollectionEquality().equals(
                    other.terminatedKindergarten, terminatedKindergarten)) &&
            (identical(other.terminatedParent, terminatedParent) ||
                const DeepCollectionEquality()
                    .equals(other.terminatedParent, terminatedParent)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.statusAction, statusAction) ||
                const DeepCollectionEquality()
                    .equals(other.statusAction, statusAction)) &&
            (identical(other.statusDate, statusDate) ||
                const DeepCollectionEquality()
                    .equals(other.statusDate, statusDate)) &&
            (identical(other.possibleNextActions, possibleNextActions) ||
                const DeepCollectionEquality()
                    .equals(other.possibleNextActions, possibleNextActions)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(family) ^
      const DeepCollectionEquality().hash(parent1) ^
      const DeepCollectionEquality().hash(parent2) ^
      const DeepCollectionEquality().hash(kindergarten) ^
      const DeepCollectionEquality().hash(child) ^
      const DeepCollectionEquality().hash(schedule) ^
      const DeepCollectionEquality().hash(acceptedKindergarten) ^
      const DeepCollectionEquality().hash(acceptedParent) ^
      const DeepCollectionEquality().hash(terminatedKindergarten) ^
      const DeepCollectionEquality().hash(terminatedParent) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(statusAction) ^
      const DeepCollectionEquality().hash(statusDate) ^
      const DeepCollectionEquality().hash(possibleNextActions) ^
      runtimeType.hashCode;
}

extension $InscriptionNewChildExtension on InscriptionNewChild {
  InscriptionNewChild copyWith(
      {int? id,
      int? family,
      ParentProfile? parent1,
      ParentProfile? parent2,
      String? kindergarten,
      InscriptionChild? child,
      InscriptionWeeklyChildSchedule? schedule,
      DateTime? acceptedKindergarten,
      DateTime? acceptedParent,
      DateTime? terminatedKindergarten,
      DateTime? terminatedParent,
      DateTime? startDate,
      DateTime? endDate,
      String? status,
      enums.InscriptionNewChildStatusAction? statusAction,
      DateTime? statusDate,
      String? possibleNextActions}) {
    return InscriptionNewChild(
        id: id ?? this.id,
        family: family ?? this.family,
        parent1: parent1 ?? this.parent1,
        parent2: parent2 ?? this.parent2,
        kindergarten: kindergarten ?? this.kindergarten,
        child: child ?? this.child,
        schedule: schedule ?? this.schedule,
        acceptedKindergarten: acceptedKindergarten ?? this.acceptedKindergarten,
        acceptedParent: acceptedParent ?? this.acceptedParent,
        terminatedKindergarten:
            terminatedKindergarten ?? this.terminatedKindergarten,
        terminatedParent: terminatedParent ?? this.terminatedParent,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        status: status ?? this.status,
        statusAction: statusAction ?? this.statusAction,
        statusDate: statusDate ?? this.statusDate,
        possibleNextActions: possibleNextActions ?? this.possibleNextActions);
  }

  InscriptionNewChild copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<int?>? family,
      Wrapped<ParentProfile?>? parent1,
      Wrapped<ParentProfile?>? parent2,
      Wrapped<String?>? kindergarten,
      Wrapped<InscriptionChild?>? child,
      Wrapped<InscriptionWeeklyChildSchedule?>? schedule,
      Wrapped<DateTime?>? acceptedKindergarten,
      Wrapped<DateTime?>? acceptedParent,
      Wrapped<DateTime?>? terminatedKindergarten,
      Wrapped<DateTime?>? terminatedParent,
      Wrapped<DateTime?>? startDate,
      Wrapped<DateTime?>? endDate,
      Wrapped<String?>? status,
      Wrapped<enums.InscriptionNewChildStatusAction?>? statusAction,
      Wrapped<DateTime?>? statusDate,
      Wrapped<String?>? possibleNextActions}) {
    return InscriptionNewChild(
        id: (id != null ? id.value : this.id),
        family: (family != null ? family.value : this.family),
        parent1: (parent1 != null ? parent1.value : this.parent1),
        parent2: (parent2 != null ? parent2.value : this.parent2),
        kindergarten:
            (kindergarten != null ? kindergarten.value : this.kindergarten),
        child: (child != null ? child.value : this.child),
        schedule: (schedule != null ? schedule.value : this.schedule),
        acceptedKindergarten: (acceptedKindergarten != null
            ? acceptedKindergarten.value
            : this.acceptedKindergarten),
        acceptedParent: (acceptedParent != null
            ? acceptedParent.value
            : this.acceptedParent),
        terminatedKindergarten: (terminatedKindergarten != null
            ? terminatedKindergarten.value
            : this.terminatedKindergarten),
        terminatedParent: (terminatedParent != null
            ? terminatedParent.value
            : this.terminatedParent),
        startDate: (startDate != null ? startDate.value : this.startDate),
        endDate: (endDate != null ? endDate.value : this.endDate),
        status: (status != null ? status.value : this.status),
        statusAction:
            (statusAction != null ? statusAction.value : this.statusAction),
        statusDate: (statusDate != null ? statusDate.value : this.statusDate),
        possibleNextActions: (possibleNextActions != null
            ? possibleNextActions.value
            : this.possibleNextActions));
  }
}

@JsonSerializable(explicitToJson: true)
class EducatorContract {
  EducatorContract({
    this.id,
    this.kindergarten,
    this.educator,
    this.acceptedKindergarten,
    this.acceptedEducator,
    this.terminatedKindergarten,
    this.terminatedEducator,
    this.startDate,
    this.endDate,
    this.status,
    this.statusAction,
    this.statusDate,
    this.possibleNextActions,
  });

  factory EducatorContract.fromJson(Map<String, dynamic> json) =>
      _$EducatorContractFromJson(json);

  static const toJsonFactory = _$EducatorContractToJson;
  Map<String, dynamic> toJson() => _$EducatorContractToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'kindergarten', includeIfNull: false, defaultValue: '')
  final String? kindergarten;
  @JsonKey(name: 'educator', includeIfNull: false, defaultValue: '')
  final String? educator;
  @JsonKey(name: 'accepted_kindergarten', includeIfNull: false)
  final DateTime? acceptedKindergarten;
  @JsonKey(name: 'accepted_educator', includeIfNull: false)
  final DateTime? acceptedEducator;
  @JsonKey(name: 'terminated_kindergarten', includeIfNull: false)
  final DateTime? terminatedKindergarten;
  @JsonKey(name: 'terminated_educator', includeIfNull: false)
  final DateTime? terminatedEducator;
  @JsonKey(name: 'start_date', includeIfNull: false)
  final DateTime? startDate;
  @JsonKey(name: 'end_date', includeIfNull: false)
  final DateTime? endDate;
  @JsonKey(name: 'status', includeIfNull: false, defaultValue: '')
  final String? status;
  @JsonKey(
    name: 'status_action',
    includeIfNull: false,
    toJson: educatorContractStatusActionToJson,
    fromJson: educatorContractStatusActionFromJson,
  )
  final enums.EducatorContractStatusAction? statusAction;
  @JsonKey(name: 'status_date', includeIfNull: false)
  final DateTime? statusDate;
  @JsonKey(
      name: 'possible_next_actions', includeIfNull: false, defaultValue: '')
  final String? possibleNextActions;
  static const fromJsonFactory = _$EducatorContractFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EducatorContract &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.kindergarten, kindergarten) ||
                const DeepCollectionEquality()
                    .equals(other.kindergarten, kindergarten)) &&
            (identical(other.educator, educator) ||
                const DeepCollectionEquality()
                    .equals(other.educator, educator)) &&
            (identical(other.acceptedKindergarten, acceptedKindergarten) ||
                const DeepCollectionEquality().equals(
                    other.acceptedKindergarten, acceptedKindergarten)) &&
            (identical(other.acceptedEducator, acceptedEducator) ||
                const DeepCollectionEquality()
                    .equals(other.acceptedEducator, acceptedEducator)) &&
            (identical(other.terminatedKindergarten, terminatedKindergarten) ||
                const DeepCollectionEquality().equals(
                    other.terminatedKindergarten, terminatedKindergarten)) &&
            (identical(other.terminatedEducator, terminatedEducator) ||
                const DeepCollectionEquality()
                    .equals(other.terminatedEducator, terminatedEducator)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.statusAction, statusAction) ||
                const DeepCollectionEquality()
                    .equals(other.statusAction, statusAction)) &&
            (identical(other.statusDate, statusDate) ||
                const DeepCollectionEquality()
                    .equals(other.statusDate, statusDate)) &&
            (identical(other.possibleNextActions, possibleNextActions) ||
                const DeepCollectionEquality()
                    .equals(other.possibleNextActions, possibleNextActions)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(kindergarten) ^
      const DeepCollectionEquality().hash(educator) ^
      const DeepCollectionEquality().hash(acceptedKindergarten) ^
      const DeepCollectionEquality().hash(acceptedEducator) ^
      const DeepCollectionEquality().hash(terminatedKindergarten) ^
      const DeepCollectionEquality().hash(terminatedEducator) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(statusAction) ^
      const DeepCollectionEquality().hash(statusDate) ^
      const DeepCollectionEquality().hash(possibleNextActions) ^
      runtimeType.hashCode;
}

extension $EducatorContractExtension on EducatorContract {
  EducatorContract copyWith(
      {int? id,
      String? kindergarten,
      String? educator,
      DateTime? acceptedKindergarten,
      DateTime? acceptedEducator,
      DateTime? terminatedKindergarten,
      DateTime? terminatedEducator,
      DateTime? startDate,
      DateTime? endDate,
      String? status,
      enums.EducatorContractStatusAction? statusAction,
      DateTime? statusDate,
      String? possibleNextActions}) {
    return EducatorContract(
        id: id ?? this.id,
        kindergarten: kindergarten ?? this.kindergarten,
        educator: educator ?? this.educator,
        acceptedKindergarten: acceptedKindergarten ?? this.acceptedKindergarten,
        acceptedEducator: acceptedEducator ?? this.acceptedEducator,
        terminatedKindergarten:
            terminatedKindergarten ?? this.terminatedKindergarten,
        terminatedEducator: terminatedEducator ?? this.terminatedEducator,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        status: status ?? this.status,
        statusAction: statusAction ?? this.statusAction,
        statusDate: statusDate ?? this.statusDate,
        possibleNextActions: possibleNextActions ?? this.possibleNextActions);
  }

  EducatorContract copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String?>? kindergarten,
      Wrapped<String?>? educator,
      Wrapped<DateTime?>? acceptedKindergarten,
      Wrapped<DateTime?>? acceptedEducator,
      Wrapped<DateTime?>? terminatedKindergarten,
      Wrapped<DateTime?>? terminatedEducator,
      Wrapped<DateTime?>? startDate,
      Wrapped<DateTime?>? endDate,
      Wrapped<String?>? status,
      Wrapped<enums.EducatorContractStatusAction?>? statusAction,
      Wrapped<DateTime?>? statusDate,
      Wrapped<String?>? possibleNextActions}) {
    return EducatorContract(
        id: (id != null ? id.value : this.id),
        kindergarten:
            (kindergarten != null ? kindergarten.value : this.kindergarten),
        educator: (educator != null ? educator.value : this.educator),
        acceptedKindergarten: (acceptedKindergarten != null
            ? acceptedKindergarten.value
            : this.acceptedKindergarten),
        acceptedEducator: (acceptedEducator != null
            ? acceptedEducator.value
            : this.acceptedEducator),
        terminatedKindergarten: (terminatedKindergarten != null
            ? terminatedKindergarten.value
            : this.terminatedKindergarten),
        terminatedEducator: (terminatedEducator != null
            ? terminatedEducator.value
            : this.terminatedEducator),
        startDate: (startDate != null ? startDate.value : this.startDate),
        endDate: (endDate != null ? endDate.value : this.endDate),
        status: (status != null ? status.value : this.status),
        statusAction:
            (statusAction != null ? statusAction.value : this.statusAction),
        statusDate: (statusDate != null ? statusDate.value : this.statusDate),
        possibleNextActions: (possibleNextActions != null
            ? possibleNextActions.value
            : this.possibleNextActions));
  }
}

@JsonSerializable(explicitToJson: true)
class EducatorContractUpdate {
  EducatorContractUpdate({
    this.id,
    this.kindergarten,
    this.educator,
    this.acceptedKindergarten,
    this.acceptedEducator,
    this.terminatedKindergarten,
    this.terminatedEducator,
    this.startDate,
    this.endDate,
    this.status,
    this.statusAction,
    this.statusDate,
    this.possibleNextActions,
  });

  factory EducatorContractUpdate.fromJson(Map<String, dynamic> json) =>
      _$EducatorContractUpdateFromJson(json);

  static const toJsonFactory = _$EducatorContractUpdateToJson;
  Map<String, dynamic> toJson() => _$EducatorContractUpdateToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'kindergarten', includeIfNull: false, defaultValue: '')
  final String? kindergarten;
  @JsonKey(name: 'educator', includeIfNull: false, defaultValue: '')
  final String? educator;
  @JsonKey(name: 'accepted_kindergarten', includeIfNull: false)
  final DateTime? acceptedKindergarten;
  @JsonKey(name: 'accepted_educator', includeIfNull: false)
  final DateTime? acceptedEducator;
  @JsonKey(name: 'terminated_kindergarten', includeIfNull: false)
  final DateTime? terminatedKindergarten;
  @JsonKey(name: 'terminated_educator', includeIfNull: false)
  final DateTime? terminatedEducator;
  @JsonKey(name: 'start_date', includeIfNull: false)
  final DateTime? startDate;
  @JsonKey(name: 'end_date', includeIfNull: false)
  final DateTime? endDate;
  @JsonKey(name: 'status', includeIfNull: false, defaultValue: '')
  final String? status;
  @JsonKey(
    name: 'status_action',
    includeIfNull: false,
    toJson: educatorContractUpdateStatusActionToJson,
    fromJson: educatorContractUpdateStatusActionFromJson,
  )
  final enums.EducatorContractUpdateStatusAction? statusAction;
  @JsonKey(name: 'status_date', includeIfNull: false)
  final DateTime? statusDate;
  @JsonKey(
      name: 'possible_next_actions', includeIfNull: false, defaultValue: '')
  final String? possibleNextActions;
  static const fromJsonFactory = _$EducatorContractUpdateFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EducatorContractUpdate &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.kindergarten, kindergarten) ||
                const DeepCollectionEquality()
                    .equals(other.kindergarten, kindergarten)) &&
            (identical(other.educator, educator) ||
                const DeepCollectionEquality()
                    .equals(other.educator, educator)) &&
            (identical(other.acceptedKindergarten, acceptedKindergarten) ||
                const DeepCollectionEquality().equals(
                    other.acceptedKindergarten, acceptedKindergarten)) &&
            (identical(other.acceptedEducator, acceptedEducator) ||
                const DeepCollectionEquality()
                    .equals(other.acceptedEducator, acceptedEducator)) &&
            (identical(other.terminatedKindergarten, terminatedKindergarten) ||
                const DeepCollectionEquality().equals(
                    other.terminatedKindergarten, terminatedKindergarten)) &&
            (identical(other.terminatedEducator, terminatedEducator) ||
                const DeepCollectionEquality()
                    .equals(other.terminatedEducator, terminatedEducator)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.statusAction, statusAction) ||
                const DeepCollectionEquality()
                    .equals(other.statusAction, statusAction)) &&
            (identical(other.statusDate, statusDate) ||
                const DeepCollectionEquality()
                    .equals(other.statusDate, statusDate)) &&
            (identical(other.possibleNextActions, possibleNextActions) ||
                const DeepCollectionEquality()
                    .equals(other.possibleNextActions, possibleNextActions)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(kindergarten) ^
      const DeepCollectionEquality().hash(educator) ^
      const DeepCollectionEquality().hash(acceptedKindergarten) ^
      const DeepCollectionEquality().hash(acceptedEducator) ^
      const DeepCollectionEquality().hash(terminatedKindergarten) ^
      const DeepCollectionEquality().hash(terminatedEducator) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(statusAction) ^
      const DeepCollectionEquality().hash(statusDate) ^
      const DeepCollectionEquality().hash(possibleNextActions) ^
      runtimeType.hashCode;
}

extension $EducatorContractUpdateExtension on EducatorContractUpdate {
  EducatorContractUpdate copyWith(
      {int? id,
      String? kindergarten,
      String? educator,
      DateTime? acceptedKindergarten,
      DateTime? acceptedEducator,
      DateTime? terminatedKindergarten,
      DateTime? terminatedEducator,
      DateTime? startDate,
      DateTime? endDate,
      String? status,
      enums.EducatorContractUpdateStatusAction? statusAction,
      DateTime? statusDate,
      String? possibleNextActions}) {
    return EducatorContractUpdate(
        id: id ?? this.id,
        kindergarten: kindergarten ?? this.kindergarten,
        educator: educator ?? this.educator,
        acceptedKindergarten: acceptedKindergarten ?? this.acceptedKindergarten,
        acceptedEducator: acceptedEducator ?? this.acceptedEducator,
        terminatedKindergarten:
            terminatedKindergarten ?? this.terminatedKindergarten,
        terminatedEducator: terminatedEducator ?? this.terminatedEducator,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        status: status ?? this.status,
        statusAction: statusAction ?? this.statusAction,
        statusDate: statusDate ?? this.statusDate,
        possibleNextActions: possibleNextActions ?? this.possibleNextActions);
  }

  EducatorContractUpdate copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String?>? kindergarten,
      Wrapped<String?>? educator,
      Wrapped<DateTime?>? acceptedKindergarten,
      Wrapped<DateTime?>? acceptedEducator,
      Wrapped<DateTime?>? terminatedKindergarten,
      Wrapped<DateTime?>? terminatedEducator,
      Wrapped<DateTime?>? startDate,
      Wrapped<DateTime?>? endDate,
      Wrapped<String?>? status,
      Wrapped<enums.EducatorContractUpdateStatusAction?>? statusAction,
      Wrapped<DateTime?>? statusDate,
      Wrapped<String?>? possibleNextActions}) {
    return EducatorContractUpdate(
        id: (id != null ? id.value : this.id),
        kindergarten:
            (kindergarten != null ? kindergarten.value : this.kindergarten),
        educator: (educator != null ? educator.value : this.educator),
        acceptedKindergarten: (acceptedKindergarten != null
            ? acceptedKindergarten.value
            : this.acceptedKindergarten),
        acceptedEducator: (acceptedEducator != null
            ? acceptedEducator.value
            : this.acceptedEducator),
        terminatedKindergarten: (terminatedKindergarten != null
            ? terminatedKindergarten.value
            : this.terminatedKindergarten),
        terminatedEducator: (terminatedEducator != null
            ? terminatedEducator.value
            : this.terminatedEducator),
        startDate: (startDate != null ? startDate.value : this.startDate),
        endDate: (endDate != null ? endDate.value : this.endDate),
        status: (status != null ? status.value : this.status),
        statusAction:
            (statusAction != null ? statusAction.value : this.statusAction),
        statusDate: (statusDate != null ? statusDate.value : this.statusDate),
        possibleNextActions: (possibleNextActions != null
            ? possibleNextActions.value
            : this.possibleNextActions));
  }
}

@JsonSerializable(explicitToJson: true)
class Inscription {
  Inscription({
    this.id,
    this.family,
    this.parent1,
    this.parent2,
    this.kindergarten,
    this.child,
    this.schedule,
    this.acceptedKindergarten,
    this.acceptedParent,
    this.terminatedKindergarten,
    this.terminatedParent,
    this.startDate,
    this.endDate,
    this.status,
    this.statusAction,
    this.statusDate,
    this.possibleNextActions,
  });

  factory Inscription.fromJson(Map<String, dynamic> json) =>
      _$InscriptionFromJson(json);

  static const toJsonFactory = _$InscriptionToJson;
  Map<String, dynamic> toJson() => _$InscriptionToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'family', includeIfNull: false)
  final int? family;
  @JsonKey(name: 'parent1', includeIfNull: false)
  final ParentProfile? parent1;
  @JsonKey(name: 'parent2', includeIfNull: false)
  final ParentProfile? parent2;
  @JsonKey(name: 'kindergarten', includeIfNull: false, defaultValue: '')
  final String? kindergarten;
  @JsonKey(name: 'child', includeIfNull: false)
  final int? child;
  @JsonKey(name: 'schedule', includeIfNull: false)
  final InscriptionWeeklyChildSchedule? schedule;
  @JsonKey(name: 'accepted_kindergarten', includeIfNull: false)
  final DateTime? acceptedKindergarten;
  @JsonKey(name: 'accepted_parent', includeIfNull: false)
  final DateTime? acceptedParent;
  @JsonKey(name: 'terminated_kindergarten', includeIfNull: false)
  final DateTime? terminatedKindergarten;
  @JsonKey(name: 'terminated_parent', includeIfNull: false)
  final DateTime? terminatedParent;
  @JsonKey(name: 'start_date', includeIfNull: false)
  final DateTime? startDate;
  @JsonKey(name: 'end_date', includeIfNull: false)
  final DateTime? endDate;
  @JsonKey(name: 'status', includeIfNull: false, defaultValue: '')
  final String? status;
  @JsonKey(
    name: 'status_action',
    includeIfNull: false,
    toJson: inscriptionStatusActionToJson,
    fromJson: inscriptionStatusActionFromJson,
  )
  final enums.InscriptionStatusAction? statusAction;
  @JsonKey(name: 'status_date', includeIfNull: false)
  final DateTime? statusDate;
  @JsonKey(
      name: 'possible_next_actions', includeIfNull: false, defaultValue: '')
  final String? possibleNextActions;
  static const fromJsonFactory = _$InscriptionFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Inscription &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.family, family) ||
                const DeepCollectionEquality().equals(other.family, family)) &&
            (identical(other.parent1, parent1) ||
                const DeepCollectionEquality()
                    .equals(other.parent1, parent1)) &&
            (identical(other.parent2, parent2) ||
                const DeepCollectionEquality()
                    .equals(other.parent2, parent2)) &&
            (identical(other.kindergarten, kindergarten) ||
                const DeepCollectionEquality()
                    .equals(other.kindergarten, kindergarten)) &&
            (identical(other.child, child) ||
                const DeepCollectionEquality().equals(other.child, child)) &&
            (identical(other.schedule, schedule) ||
                const DeepCollectionEquality()
                    .equals(other.schedule, schedule)) &&
            (identical(other.acceptedKindergarten, acceptedKindergarten) ||
                const DeepCollectionEquality().equals(
                    other.acceptedKindergarten, acceptedKindergarten)) &&
            (identical(other.acceptedParent, acceptedParent) ||
                const DeepCollectionEquality()
                    .equals(other.acceptedParent, acceptedParent)) &&
            (identical(other.terminatedKindergarten, terminatedKindergarten) ||
                const DeepCollectionEquality().equals(
                    other.terminatedKindergarten, terminatedKindergarten)) &&
            (identical(other.terminatedParent, terminatedParent) ||
                const DeepCollectionEquality()
                    .equals(other.terminatedParent, terminatedParent)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.statusAction, statusAction) ||
                const DeepCollectionEquality()
                    .equals(other.statusAction, statusAction)) &&
            (identical(other.statusDate, statusDate) ||
                const DeepCollectionEquality()
                    .equals(other.statusDate, statusDate)) &&
            (identical(other.possibleNextActions, possibleNextActions) ||
                const DeepCollectionEquality()
                    .equals(other.possibleNextActions, possibleNextActions)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(family) ^
      const DeepCollectionEquality().hash(parent1) ^
      const DeepCollectionEquality().hash(parent2) ^
      const DeepCollectionEquality().hash(kindergarten) ^
      const DeepCollectionEquality().hash(child) ^
      const DeepCollectionEquality().hash(schedule) ^
      const DeepCollectionEquality().hash(acceptedKindergarten) ^
      const DeepCollectionEquality().hash(acceptedParent) ^
      const DeepCollectionEquality().hash(terminatedKindergarten) ^
      const DeepCollectionEquality().hash(terminatedParent) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(statusAction) ^
      const DeepCollectionEquality().hash(statusDate) ^
      const DeepCollectionEquality().hash(possibleNextActions) ^
      runtimeType.hashCode;
}

extension $InscriptionExtension on Inscription {
  Inscription copyWith(
      {int? id,
      int? family,
      ParentProfile? parent1,
      ParentProfile? parent2,
      String? kindergarten,
      int? child,
      InscriptionWeeklyChildSchedule? schedule,
      DateTime? acceptedKindergarten,
      DateTime? acceptedParent,
      DateTime? terminatedKindergarten,
      DateTime? terminatedParent,
      DateTime? startDate,
      DateTime? endDate,
      String? status,
      enums.InscriptionStatusAction? statusAction,
      DateTime? statusDate,
      String? possibleNextActions}) {
    return Inscription(
        id: id ?? this.id,
        family: family ?? this.family,
        parent1: parent1 ?? this.parent1,
        parent2: parent2 ?? this.parent2,
        kindergarten: kindergarten ?? this.kindergarten,
        child: child ?? this.child,
        schedule: schedule ?? this.schedule,
        acceptedKindergarten: acceptedKindergarten ?? this.acceptedKindergarten,
        acceptedParent: acceptedParent ?? this.acceptedParent,
        terminatedKindergarten:
            terminatedKindergarten ?? this.terminatedKindergarten,
        terminatedParent: terminatedParent ?? this.terminatedParent,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        status: status ?? this.status,
        statusAction: statusAction ?? this.statusAction,
        statusDate: statusDate ?? this.statusDate,
        possibleNextActions: possibleNextActions ?? this.possibleNextActions);
  }

  Inscription copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<int?>? family,
      Wrapped<ParentProfile?>? parent1,
      Wrapped<ParentProfile?>? parent2,
      Wrapped<String?>? kindergarten,
      Wrapped<int?>? child,
      Wrapped<InscriptionWeeklyChildSchedule?>? schedule,
      Wrapped<DateTime?>? acceptedKindergarten,
      Wrapped<DateTime?>? acceptedParent,
      Wrapped<DateTime?>? terminatedKindergarten,
      Wrapped<DateTime?>? terminatedParent,
      Wrapped<DateTime?>? startDate,
      Wrapped<DateTime?>? endDate,
      Wrapped<String?>? status,
      Wrapped<enums.InscriptionStatusAction?>? statusAction,
      Wrapped<DateTime?>? statusDate,
      Wrapped<String?>? possibleNextActions}) {
    return Inscription(
        id: (id != null ? id.value : this.id),
        family: (family != null ? family.value : this.family),
        parent1: (parent1 != null ? parent1.value : this.parent1),
        parent2: (parent2 != null ? parent2.value : this.parent2),
        kindergarten:
            (kindergarten != null ? kindergarten.value : this.kindergarten),
        child: (child != null ? child.value : this.child),
        schedule: (schedule != null ? schedule.value : this.schedule),
        acceptedKindergarten: (acceptedKindergarten != null
            ? acceptedKindergarten.value
            : this.acceptedKindergarten),
        acceptedParent: (acceptedParent != null
            ? acceptedParent.value
            : this.acceptedParent),
        terminatedKindergarten: (terminatedKindergarten != null
            ? terminatedKindergarten.value
            : this.terminatedKindergarten),
        terminatedParent: (terminatedParent != null
            ? terminatedParent.value
            : this.terminatedParent),
        startDate: (startDate != null ? startDate.value : this.startDate),
        endDate: (endDate != null ? endDate.value : this.endDate),
        status: (status != null ? status.value : this.status),
        statusAction:
            (statusAction != null ? statusAction.value : this.statusAction),
        statusDate: (statusDate != null ? statusDate.value : this.statusDate),
        possibleNextActions: (possibleNextActions != null
            ? possibleNextActions.value
            : this.possibleNextActions));
  }
}

@JsonSerializable(explicitToJson: true)
class InscriptionUpdate {
  InscriptionUpdate({
    this.id,
    this.family,
    this.parent1,
    this.parent2,
    this.kindergarten,
    this.child,
    this.schedule,
    this.acceptedKindergarten,
    this.acceptedParent,
    this.terminatedKindergarten,
    this.terminatedParent,
    this.startDate,
    this.endDate,
    this.status,
    this.statusAction,
    this.statusDate,
    this.possibleNextActions,
  });

  factory InscriptionUpdate.fromJson(Map<String, dynamic> json) =>
      _$InscriptionUpdateFromJson(json);

  static const toJsonFactory = _$InscriptionUpdateToJson;
  Map<String, dynamic> toJson() => _$InscriptionUpdateToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'family', includeIfNull: false)
  final int? family;
  @JsonKey(name: 'parent1', includeIfNull: false)
  final ParentProfile? parent1;
  @JsonKey(name: 'parent2', includeIfNull: false)
  final ParentProfile? parent2;
  @JsonKey(name: 'kindergarten', includeIfNull: false, defaultValue: '')
  final String? kindergarten;
  @JsonKey(name: 'child', includeIfNull: false)
  final int? child;
  @JsonKey(name: 'schedule', includeIfNull: false)
  final InscriptionWeeklyChildSchedule? schedule;
  @JsonKey(name: 'accepted_kindergarten', includeIfNull: false)
  final DateTime? acceptedKindergarten;
  @JsonKey(name: 'accepted_parent', includeIfNull: false)
  final DateTime? acceptedParent;
  @JsonKey(name: 'terminated_kindergarten', includeIfNull: false)
  final DateTime? terminatedKindergarten;
  @JsonKey(name: 'terminated_parent', includeIfNull: false)
  final DateTime? terminatedParent;
  @JsonKey(name: 'start_date', includeIfNull: false)
  final DateTime? startDate;
  @JsonKey(name: 'end_date', includeIfNull: false)
  final DateTime? endDate;
  @JsonKey(name: 'status', includeIfNull: false, defaultValue: '')
  final String? status;
  @JsonKey(
    name: 'status_action',
    includeIfNull: false,
    toJson: inscriptionUpdateStatusActionToJson,
    fromJson: inscriptionUpdateStatusActionFromJson,
  )
  final enums.InscriptionUpdateStatusAction? statusAction;
  @JsonKey(name: 'status_date', includeIfNull: false)
  final DateTime? statusDate;
  @JsonKey(
      name: 'possible_next_actions', includeIfNull: false, defaultValue: '')
  final String? possibleNextActions;
  static const fromJsonFactory = _$InscriptionUpdateFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InscriptionUpdate &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.family, family) ||
                const DeepCollectionEquality().equals(other.family, family)) &&
            (identical(other.parent1, parent1) ||
                const DeepCollectionEquality()
                    .equals(other.parent1, parent1)) &&
            (identical(other.parent2, parent2) ||
                const DeepCollectionEquality()
                    .equals(other.parent2, parent2)) &&
            (identical(other.kindergarten, kindergarten) ||
                const DeepCollectionEquality()
                    .equals(other.kindergarten, kindergarten)) &&
            (identical(other.child, child) ||
                const DeepCollectionEquality().equals(other.child, child)) &&
            (identical(other.schedule, schedule) ||
                const DeepCollectionEquality()
                    .equals(other.schedule, schedule)) &&
            (identical(other.acceptedKindergarten, acceptedKindergarten) ||
                const DeepCollectionEquality().equals(
                    other.acceptedKindergarten, acceptedKindergarten)) &&
            (identical(other.acceptedParent, acceptedParent) ||
                const DeepCollectionEquality()
                    .equals(other.acceptedParent, acceptedParent)) &&
            (identical(other.terminatedKindergarten, terminatedKindergarten) ||
                const DeepCollectionEquality().equals(
                    other.terminatedKindergarten, terminatedKindergarten)) &&
            (identical(other.terminatedParent, terminatedParent) ||
                const DeepCollectionEquality()
                    .equals(other.terminatedParent, terminatedParent)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.statusAction, statusAction) ||
                const DeepCollectionEquality()
                    .equals(other.statusAction, statusAction)) &&
            (identical(other.statusDate, statusDate) ||
                const DeepCollectionEquality()
                    .equals(other.statusDate, statusDate)) &&
            (identical(other.possibleNextActions, possibleNextActions) ||
                const DeepCollectionEquality()
                    .equals(other.possibleNextActions, possibleNextActions)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(family) ^
      const DeepCollectionEquality().hash(parent1) ^
      const DeepCollectionEquality().hash(parent2) ^
      const DeepCollectionEquality().hash(kindergarten) ^
      const DeepCollectionEquality().hash(child) ^
      const DeepCollectionEquality().hash(schedule) ^
      const DeepCollectionEquality().hash(acceptedKindergarten) ^
      const DeepCollectionEquality().hash(acceptedParent) ^
      const DeepCollectionEquality().hash(terminatedKindergarten) ^
      const DeepCollectionEquality().hash(terminatedParent) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(statusAction) ^
      const DeepCollectionEquality().hash(statusDate) ^
      const DeepCollectionEquality().hash(possibleNextActions) ^
      runtimeType.hashCode;
}

extension $InscriptionUpdateExtension on InscriptionUpdate {
  InscriptionUpdate copyWith(
      {int? id,
      int? family,
      ParentProfile? parent1,
      ParentProfile? parent2,
      String? kindergarten,
      int? child,
      InscriptionWeeklyChildSchedule? schedule,
      DateTime? acceptedKindergarten,
      DateTime? acceptedParent,
      DateTime? terminatedKindergarten,
      DateTime? terminatedParent,
      DateTime? startDate,
      DateTime? endDate,
      String? status,
      enums.InscriptionUpdateStatusAction? statusAction,
      DateTime? statusDate,
      String? possibleNextActions}) {
    return InscriptionUpdate(
        id: id ?? this.id,
        family: family ?? this.family,
        parent1: parent1 ?? this.parent1,
        parent2: parent2 ?? this.parent2,
        kindergarten: kindergarten ?? this.kindergarten,
        child: child ?? this.child,
        schedule: schedule ?? this.schedule,
        acceptedKindergarten: acceptedKindergarten ?? this.acceptedKindergarten,
        acceptedParent: acceptedParent ?? this.acceptedParent,
        terminatedKindergarten:
            terminatedKindergarten ?? this.terminatedKindergarten,
        terminatedParent: terminatedParent ?? this.terminatedParent,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        status: status ?? this.status,
        statusAction: statusAction ?? this.statusAction,
        statusDate: statusDate ?? this.statusDate,
        possibleNextActions: possibleNextActions ?? this.possibleNextActions);
  }

  InscriptionUpdate copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<int?>? family,
      Wrapped<ParentProfile?>? parent1,
      Wrapped<ParentProfile?>? parent2,
      Wrapped<String?>? kindergarten,
      Wrapped<int?>? child,
      Wrapped<InscriptionWeeklyChildSchedule?>? schedule,
      Wrapped<DateTime?>? acceptedKindergarten,
      Wrapped<DateTime?>? acceptedParent,
      Wrapped<DateTime?>? terminatedKindergarten,
      Wrapped<DateTime?>? terminatedParent,
      Wrapped<DateTime?>? startDate,
      Wrapped<DateTime?>? endDate,
      Wrapped<String?>? status,
      Wrapped<enums.InscriptionUpdateStatusAction?>? statusAction,
      Wrapped<DateTime?>? statusDate,
      Wrapped<String?>? possibleNextActions}) {
    return InscriptionUpdate(
        id: (id != null ? id.value : this.id),
        family: (family != null ? family.value : this.family),
        parent1: (parent1 != null ? parent1.value : this.parent1),
        parent2: (parent2 != null ? parent2.value : this.parent2),
        kindergarten:
            (kindergarten != null ? kindergarten.value : this.kindergarten),
        child: (child != null ? child.value : this.child),
        schedule: (schedule != null ? schedule.value : this.schedule),
        acceptedKindergarten: (acceptedKindergarten != null
            ? acceptedKindergarten.value
            : this.acceptedKindergarten),
        acceptedParent: (acceptedParent != null
            ? acceptedParent.value
            : this.acceptedParent),
        terminatedKindergarten: (terminatedKindergarten != null
            ? terminatedKindergarten.value
            : this.terminatedKindergarten),
        terminatedParent: (terminatedParent != null
            ? terminatedParent.value
            : this.terminatedParent),
        startDate: (startDate != null ? startDate.value : this.startDate),
        endDate: (endDate != null ? endDate.value : this.endDate),
        status: (status != null ? status.value : this.status),
        statusAction:
            (statusAction != null ? statusAction.value : this.statusAction),
        statusDate: (statusDate != null ? statusDate.value : this.statusDate),
        possibleNextActions: (possibleNextActions != null
            ? possibleNextActions.value
            : this.possibleNextActions));
  }
}

@JsonSerializable(explicitToJson: true)
class Family {
  Family({
    this.id,
    this.children,
    this.trustedPerson,
    this.parent1,
    this.parent2,
    this.familyInscriptions,
  });

  factory Family.fromJson(Map<String, dynamic> json) => _$FamilyFromJson(json);

  static const toJsonFactory = _$FamilyToJson;
  Map<String, dynamic> toJson() => _$FamilyToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'children', includeIfNull: false, defaultValue: <int>[])
  final List<int>? children;
  @JsonKey(
      name: 'trusted_person', includeIfNull: false, defaultValue: <String>[])
  final List<String>? trustedPerson;
  @JsonKey(name: 'parent1', includeIfNull: false)
  final Parent? parent1;
  @JsonKey(name: 'parent2', includeIfNull: false)
  final Parent? parent2;
  @JsonKey(
      name: 'family_inscriptions', includeIfNull: false, defaultValue: <int>[])
  final List<int>? familyInscriptions;
  static const fromJsonFactory = _$FamilyFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Family &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.children, children) ||
                const DeepCollectionEquality()
                    .equals(other.children, children)) &&
            (identical(other.trustedPerson, trustedPerson) ||
                const DeepCollectionEquality()
                    .equals(other.trustedPerson, trustedPerson)) &&
            (identical(other.parent1, parent1) ||
                const DeepCollectionEquality()
                    .equals(other.parent1, parent1)) &&
            (identical(other.parent2, parent2) ||
                const DeepCollectionEquality()
                    .equals(other.parent2, parent2)) &&
            (identical(other.familyInscriptions, familyInscriptions) ||
                const DeepCollectionEquality()
                    .equals(other.familyInscriptions, familyInscriptions)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(children) ^
      const DeepCollectionEquality().hash(trustedPerson) ^
      const DeepCollectionEquality().hash(parent1) ^
      const DeepCollectionEquality().hash(parent2) ^
      const DeepCollectionEquality().hash(familyInscriptions) ^
      runtimeType.hashCode;
}

extension $FamilyExtension on Family {
  Family copyWith(
      {int? id,
      List<int>? children,
      List<String>? trustedPerson,
      Parent? parent1,
      Parent? parent2,
      List<int>? familyInscriptions}) {
    return Family(
        id: id ?? this.id,
        children: children ?? this.children,
        trustedPerson: trustedPerson ?? this.trustedPerson,
        parent1: parent1 ?? this.parent1,
        parent2: parent2 ?? this.parent2,
        familyInscriptions: familyInscriptions ?? this.familyInscriptions);
  }

  Family copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<List<int>?>? children,
      Wrapped<List<String>?>? trustedPerson,
      Wrapped<Parent?>? parent1,
      Wrapped<Parent?>? parent2,
      Wrapped<List<int>?>? familyInscriptions}) {
    return Family(
        id: (id != null ? id.value : this.id),
        children: (children != null ? children.value : this.children),
        trustedPerson:
            (trustedPerson != null ? trustedPerson.value : this.trustedPerson),
        parent1: (parent1 != null ? parent1.value : this.parent1),
        parent2: (parent2 != null ? parent2.value : this.parent2),
        familyInscriptions: (familyInscriptions != null
            ? familyInscriptions.value
            : this.familyInscriptions));
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
class GeneralUserSettings {
  GeneralUserSettings({
    this.id,
    this.chatNotificationsStatus,
    this.socialNotificationsStatus,
    this.generalNotificationsStatus,
  });

  factory GeneralUserSettings.fromJson(Map<String, dynamic> json) =>
      _$GeneralUserSettingsFromJson(json);

  static const toJsonFactory = _$GeneralUserSettingsToJson;
  Map<String, dynamic> toJson() => _$GeneralUserSettingsToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(
    name: 'chat_notifications_status',
    includeIfNull: false,
    toJson: generalUserSettingsChatNotificationsStatusToJson,
    fromJson: generalUserSettingsChatNotificationsStatusFromJson,
  )
  final enums.GeneralUserSettingsChatNotificationsStatus?
      chatNotificationsStatus;
  @JsonKey(
    name: 'social_notifications_status',
    includeIfNull: false,
    toJson: generalUserSettingsSocialNotificationsStatusToJson,
    fromJson: generalUserSettingsSocialNotificationsStatusFromJson,
  )
  final enums.GeneralUserSettingsSocialNotificationsStatus?
      socialNotificationsStatus;
  @JsonKey(
    name: 'general_notifications_status',
    includeIfNull: false,
    toJson: generalUserSettingsGeneralNotificationsStatusToJson,
    fromJson: generalUserSettingsGeneralNotificationsStatusFromJson,
  )
  final enums.GeneralUserSettingsGeneralNotificationsStatus?
      generalNotificationsStatus;
  static const fromJsonFactory = _$GeneralUserSettingsFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GeneralUserSettings &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(
                    other.chatNotificationsStatus, chatNotificationsStatus) ||
                const DeepCollectionEquality().equals(
                    other.chatNotificationsStatus, chatNotificationsStatus)) &&
            (identical(other.socialNotificationsStatus,
                    socialNotificationsStatus) ||
                const DeepCollectionEquality().equals(
                    other.socialNotificationsStatus,
                    socialNotificationsStatus)) &&
            (identical(other.generalNotificationsStatus,
                    generalNotificationsStatus) ||
                const DeepCollectionEquality().equals(
                    other.generalNotificationsStatus,
                    generalNotificationsStatus)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(chatNotificationsStatus) ^
      const DeepCollectionEquality().hash(socialNotificationsStatus) ^
      const DeepCollectionEquality().hash(generalNotificationsStatus) ^
      runtimeType.hashCode;
}

extension $GeneralUserSettingsExtension on GeneralUserSettings {
  GeneralUserSettings copyWith(
      {int? id,
      enums.GeneralUserSettingsChatNotificationsStatus? chatNotificationsStatus,
      enums.GeneralUserSettingsSocialNotificationsStatus?
          socialNotificationsStatus,
      enums.GeneralUserSettingsGeneralNotificationsStatus?
          generalNotificationsStatus}) {
    return GeneralUserSettings(
        id: id ?? this.id,
        chatNotificationsStatus:
            chatNotificationsStatus ?? this.chatNotificationsStatus,
        socialNotificationsStatus:
            socialNotificationsStatus ?? this.socialNotificationsStatus,
        generalNotificationsStatus:
            generalNotificationsStatus ?? this.generalNotificationsStatus);
  }

  GeneralUserSettings copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<enums.GeneralUserSettingsChatNotificationsStatus?>?
          chatNotificationsStatus,
      Wrapped<enums.GeneralUserSettingsSocialNotificationsStatus?>?
          socialNotificationsStatus,
      Wrapped<enums.GeneralUserSettingsGeneralNotificationsStatus?>?
          generalNotificationsStatus}) {
    return GeneralUserSettings(
        id: (id != null ? id.value : this.id),
        chatNotificationsStatus: (chatNotificationsStatus != null
            ? chatNotificationsStatus.value
            : this.chatNotificationsStatus),
        socialNotificationsStatus: (socialNotificationsStatus != null
            ? socialNotificationsStatus.value
            : this.socialNotificationsStatus),
        generalNotificationsStatus: (generalNotificationsStatus != null
            ? generalNotificationsStatus.value
            : this.generalNotificationsStatus));
  }
}

@JsonSerializable(explicitToJson: true)
class AuthenticationProfileEducatorGet$Response {
  AuthenticationProfileEducatorGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory AuthenticationProfileEducatorGet$Response.fromJson(
          Map<String, dynamic> json) =>
      _$AuthenticationProfileEducatorGet$ResponseFromJson(json);

  static const toJsonFactory =
      _$AuthenticationProfileEducatorGet$ResponseToJson;
  Map<String, dynamic> toJson() =>
      _$AuthenticationProfileEducatorGet$ResponseToJson(this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(
      name: 'results', includeIfNull: false, defaultValue: <EducatorProfile>[])
  final List<EducatorProfile>? results;
  static const fromJsonFactory =
      _$AuthenticationProfileEducatorGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AuthenticationProfileEducatorGet$Response &&
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

extension $AuthenticationProfileEducatorGet$ResponseExtension
    on AuthenticationProfileEducatorGet$Response {
  AuthenticationProfileEducatorGet$Response copyWith(
      {int? count,
      String? next,
      String? previous,
      List<EducatorProfile>? results}) {
    return AuthenticationProfileEducatorGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  AuthenticationProfileEducatorGet$Response copyWithWrapped(
      {Wrapped<int?>? count,
      Wrapped<String?>? next,
      Wrapped<String?>? previous,
      Wrapped<List<EducatorProfile>?>? results}) {
    return AuthenticationProfileEducatorGet$Response(
        count: (count != null ? count.value : this.count),
        next: (next != null ? next.value : this.next),
        previous: (previous != null ? previous.value : this.previous),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class AuthenticationProfileKindergartenGet$Response {
  AuthenticationProfileKindergartenGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory AuthenticationProfileKindergartenGet$Response.fromJson(
          Map<String, dynamic> json) =>
      _$AuthenticationProfileKindergartenGet$ResponseFromJson(json);

  static const toJsonFactory =
      _$AuthenticationProfileKindergartenGet$ResponseToJson;
  Map<String, dynamic> toJson() =>
      _$AuthenticationProfileKindergartenGet$ResponseToJson(this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(
      name: 'results',
      includeIfNull: false,
      defaultValue: <KindergartenProfileRead>[])
  final List<KindergartenProfileRead>? results;
  static const fromJsonFactory =
      _$AuthenticationProfileKindergartenGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AuthenticationProfileKindergartenGet$Response &&
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

extension $AuthenticationProfileKindergartenGet$ResponseExtension
    on AuthenticationProfileKindergartenGet$Response {
  AuthenticationProfileKindergartenGet$Response copyWith(
      {int? count,
      String? next,
      String? previous,
      List<KindergartenProfileRead>? results}) {
    return AuthenticationProfileKindergartenGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  AuthenticationProfileKindergartenGet$Response copyWithWrapped(
      {Wrapped<int?>? count,
      Wrapped<String?>? next,
      Wrapped<String?>? previous,
      Wrapped<List<KindergartenProfileRead>?>? results}) {
    return AuthenticationProfileKindergartenGet$Response(
        count: (count != null ? count.value : this.count),
        next: (next != null ? next.value : this.next),
        previous: (previous != null ? previous.value : this.previous),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class AuthenticationProfileParentGet$Response {
  AuthenticationProfileParentGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory AuthenticationProfileParentGet$Response.fromJson(
          Map<String, dynamic> json) =>
      _$AuthenticationProfileParentGet$ResponseFromJson(json);

  static const toJsonFactory = _$AuthenticationProfileParentGet$ResponseToJson;
  Map<String, dynamic> toJson() =>
      _$AuthenticationProfileParentGet$ResponseToJson(this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(
      name: 'results', includeIfNull: false, defaultValue: <ParentProfile>[])
  final List<ParentProfile>? results;
  static const fromJsonFactory =
      _$AuthenticationProfileParentGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AuthenticationProfileParentGet$Response &&
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

extension $AuthenticationProfileParentGet$ResponseExtension
    on AuthenticationProfileParentGet$Response {
  AuthenticationProfileParentGet$Response copyWith(
      {int? count,
      String? next,
      String? previous,
      List<ParentProfile>? results}) {
    return AuthenticationProfileParentGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  AuthenticationProfileParentGet$Response copyWithWrapped(
      {Wrapped<int?>? count,
      Wrapped<String?>? next,
      Wrapped<String?>? previous,
      Wrapped<List<ParentProfile>?>? results}) {
    return AuthenticationProfileParentGet$Response(
        count: (count != null ? count.value : this.count),
        next: (next != null ? next.value : this.next),
        previous: (previous != null ? previous.value : this.previous),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class AuthenticationRegisterInviteParent2InvitationsGet$Response {
  AuthenticationRegisterInviteParent2InvitationsGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory AuthenticationRegisterInviteParent2InvitationsGet$Response.fromJson(
          Map<String, dynamic> json) =>
      _$AuthenticationRegisterInviteParent2InvitationsGet$ResponseFromJson(
          json);

  static const toJsonFactory =
      _$AuthenticationRegisterInviteParent2InvitationsGet$ResponseToJson;
  Map<String, dynamic> toJson() =>
      _$AuthenticationRegisterInviteParent2InvitationsGet$ResponseToJson(this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(
      name: 'results',
      includeIfNull: false,
      defaultValue: <ParentInvitationInfo>[])
  final List<ParentInvitationInfo>? results;
  static const fromJsonFactory =
      _$AuthenticationRegisterInviteParent2InvitationsGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AuthenticationRegisterInviteParent2InvitationsGet$Response &&
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

extension $AuthenticationRegisterInviteParent2InvitationsGet$ResponseExtension
    on AuthenticationRegisterInviteParent2InvitationsGet$Response {
  AuthenticationRegisterInviteParent2InvitationsGet$Response copyWith(
      {int? count,
      String? next,
      String? previous,
      List<ParentInvitationInfo>? results}) {
    return AuthenticationRegisterInviteParent2InvitationsGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  AuthenticationRegisterInviteParent2InvitationsGet$Response copyWithWrapped(
      {Wrapped<int?>? count,
      Wrapped<String?>? next,
      Wrapped<String?>? previous,
      Wrapped<List<ParentInvitationInfo>?>? results}) {
    return AuthenticationRegisterInviteParent2InvitationsGet$Response(
        count: (count != null ? count.value : this.count),
        next: (next != null ? next.value : this.next),
        previous: (previous != null ? previous.value : this.previous),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class AuthenticationRegisterKindergartenInitiatedEducatorInvitationsGet$Response {
  AuthenticationRegisterKindergartenInitiatedEducatorInvitationsGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory AuthenticationRegisterKindergartenInitiatedEducatorInvitationsGet$Response.fromJson(
          Map<String, dynamic> json) =>
      _$AuthenticationRegisterKindergartenInitiatedEducatorInvitationsGet$ResponseFromJson(
          json);

  static const toJsonFactory =
      _$AuthenticationRegisterKindergartenInitiatedEducatorInvitationsGet$ResponseToJson;
  Map<String, dynamic> toJson() =>
      _$AuthenticationRegisterKindergartenInitiatedEducatorInvitationsGet$ResponseToJson(
          this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(
      name: 'results',
      includeIfNull: false,
      defaultValue: <EducatorSignupByKindergartenList>[])
  final List<EducatorSignupByKindergartenList>? results;
  static const fromJsonFactory =
      _$AuthenticationRegisterKindergartenInitiatedEducatorInvitationsGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AuthenticationRegisterKindergartenInitiatedEducatorInvitationsGet$Response &&
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

extension $AuthenticationRegisterKindergartenInitiatedEducatorInvitationsGet$ResponseExtension
    on AuthenticationRegisterKindergartenInitiatedEducatorInvitationsGet$Response {
  AuthenticationRegisterKindergartenInitiatedEducatorInvitationsGet$Response
      copyWith(
          {int? count,
          String? next,
          String? previous,
          List<EducatorSignupByKindergartenList>? results}) {
    return AuthenticationRegisterKindergartenInitiatedEducatorInvitationsGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  AuthenticationRegisterKindergartenInitiatedEducatorInvitationsGet$Response
      copyWithWrapped(
          {Wrapped<int?>? count,
          Wrapped<String?>? next,
          Wrapped<String?>? previous,
          Wrapped<List<EducatorSignupByKindergartenList>?>? results}) {
    return AuthenticationRegisterKindergartenInitiatedEducatorInvitationsGet$Response(
        count: (count != null ? count.value : this.count),
        next: (next != null ? next.value : this.next),
        previous: (previous != null ? previous.value : this.previous),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class AuthenticationRegisterKindergartenInitiatedFamilyInvitationsGet$Response {
  AuthenticationRegisterKindergartenInitiatedFamilyInvitationsGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory AuthenticationRegisterKindergartenInitiatedFamilyInvitationsGet$Response.fromJson(
          Map<String, dynamic> json) =>
      _$AuthenticationRegisterKindergartenInitiatedFamilyInvitationsGet$ResponseFromJson(
          json);

  static const toJsonFactory =
      _$AuthenticationRegisterKindergartenInitiatedFamilyInvitationsGet$ResponseToJson;
  Map<String, dynamic> toJson() =>
      _$AuthenticationRegisterKindergartenInitiatedFamilyInvitationsGet$ResponseToJson(
          this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(
      name: 'results',
      includeIfNull: false,
      defaultValue: <FamilySignupByKindergartenList>[])
  final List<FamilySignupByKindergartenList>? results;
  static const fromJsonFactory =
      _$AuthenticationRegisterKindergartenInitiatedFamilyInvitationsGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AuthenticationRegisterKindergartenInitiatedFamilyInvitationsGet$Response &&
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

extension $AuthenticationRegisterKindergartenInitiatedFamilyInvitationsGet$ResponseExtension
    on AuthenticationRegisterKindergartenInitiatedFamilyInvitationsGet$Response {
  AuthenticationRegisterKindergartenInitiatedFamilyInvitationsGet$Response
      copyWith(
          {int? count,
          String? next,
          String? previous,
          List<FamilySignupByKindergartenList>? results}) {
    return AuthenticationRegisterKindergartenInitiatedFamilyInvitationsGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  AuthenticationRegisterKindergartenInitiatedFamilyInvitationsGet$Response
      copyWithWrapped(
          {Wrapped<int?>? count,
          Wrapped<String?>? next,
          Wrapped<String?>? previous,
          Wrapped<List<FamilySignupByKindergartenList>?>? results}) {
    return AuthenticationRegisterKindergartenInitiatedFamilyInvitationsGet$Response(
        count: (count != null ? count.value : this.count),
        next: (next != null ? next.value : this.next),
        previous: (previous != null ? previous.value : this.previous),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class ChildChildGet$Response {
  ChildChildGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory ChildChildGet$Response.fromJson(Map<String, dynamic> json) =>
      _$ChildChildGet$ResponseFromJson(json);

  static const toJsonFactory = _$ChildChildGet$ResponseToJson;
  Map<String, dynamic> toJson() => _$ChildChildGet$ResponseToJson(this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(name: 'results', includeIfNull: false, defaultValue: <Child>[])
  final List<Child>? results;
  static const fromJsonFactory = _$ChildChildGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChildChildGet$Response &&
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

extension $ChildChildGet$ResponseExtension on ChildChildGet$Response {
  ChildChildGet$Response copyWith(
      {int? count, String? next, String? previous, List<Child>? results}) {
    return ChildChildGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  ChildChildGet$Response copyWithWrapped(
      {Wrapped<int?>? count,
      Wrapped<String?>? next,
      Wrapped<String?>? previous,
      Wrapped<List<Child>?>? results}) {
    return ChildChildGet$Response(
        count: (count != null ? count.value : this.count),
        next: (next != null ? next.value : this.next),
        previous: (previous != null ? previous.value : this.previous),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class ChildChildNotesGet$Response {
  ChildChildNotesGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory ChildChildNotesGet$Response.fromJson(Map<String, dynamic> json) =>
      _$ChildChildNotesGet$ResponseFromJson(json);

  static const toJsonFactory = _$ChildChildNotesGet$ResponseToJson;
  Map<String, dynamic> toJson() => _$ChildChildNotesGet$ResponseToJson(this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(name: 'results', includeIfNull: false, defaultValue: <ChildNotes>[])
  final List<ChildNotes>? results;
  static const fromJsonFactory = _$ChildChildNotesGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChildChildNotesGet$Response &&
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

extension $ChildChildNotesGet$ResponseExtension on ChildChildNotesGet$Response {
  ChildChildNotesGet$Response copyWith(
      {int? count, String? next, String? previous, List<ChildNotes>? results}) {
    return ChildChildNotesGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  ChildChildNotesGet$Response copyWithWrapped(
      {Wrapped<int?>? count,
      Wrapped<String?>? next,
      Wrapped<String?>? previous,
      Wrapped<List<ChildNotes>?>? results}) {
    return ChildChildNotesGet$Response(
        count: (count != null ? count.value : this.count),
        next: (next != null ? next.value : this.next),
        previous: (previous != null ? previous.value : this.previous),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class ChildMedicalFileGet$Response {
  ChildMedicalFileGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory ChildMedicalFileGet$Response.fromJson(Map<String, dynamic> json) =>
      _$ChildMedicalFileGet$ResponseFromJson(json);

  static const toJsonFactory = _$ChildMedicalFileGet$ResponseToJson;
  Map<String, dynamic> toJson() => _$ChildMedicalFileGet$ResponseToJson(this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(
      name: 'results', includeIfNull: false, defaultValue: <ChildMedicalFile>[])
  final List<ChildMedicalFile>? results;
  static const fromJsonFactory = _$ChildMedicalFileGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChildMedicalFileGet$Response &&
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

extension $ChildMedicalFileGet$ResponseExtension
    on ChildMedicalFileGet$Response {
  ChildMedicalFileGet$Response copyWith(
      {int? count,
      String? next,
      String? previous,
      List<ChildMedicalFile>? results}) {
    return ChildMedicalFileGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  ChildMedicalFileGet$Response copyWithWrapped(
      {Wrapped<int?>? count,
      Wrapped<String?>? next,
      Wrapped<String?>? previous,
      Wrapped<List<ChildMedicalFile>?>? results}) {
    return ChildMedicalFileGet$Response(
        count: (count != null ? count.value : this.count),
        next: (next != null ? next.value : this.next),
        previous: (previous != null ? previous.value : this.previous),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class ChildMedicalFileAllergyGet$Response {
  ChildMedicalFileAllergyGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory ChildMedicalFileAllergyGet$Response.fromJson(
          Map<String, dynamic> json) =>
      _$ChildMedicalFileAllergyGet$ResponseFromJson(json);

  static const toJsonFactory = _$ChildMedicalFileAllergyGet$ResponseToJson;
  Map<String, dynamic> toJson() =>
      _$ChildMedicalFileAllergyGet$ResponseToJson(this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(
      name: 'results',
      includeIfNull: false,
      defaultValue: <ChildMedicalFileAllergy>[])
  final List<ChildMedicalFileAllergy>? results;
  static const fromJsonFactory = _$ChildMedicalFileAllergyGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChildMedicalFileAllergyGet$Response &&
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

extension $ChildMedicalFileAllergyGet$ResponseExtension
    on ChildMedicalFileAllergyGet$Response {
  ChildMedicalFileAllergyGet$Response copyWith(
      {int? count,
      String? next,
      String? previous,
      List<ChildMedicalFileAllergy>? results}) {
    return ChildMedicalFileAllergyGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  ChildMedicalFileAllergyGet$Response copyWithWrapped(
      {Wrapped<int?>? count,
      Wrapped<String?>? next,
      Wrapped<String?>? previous,
      Wrapped<List<ChildMedicalFileAllergy>?>? results}) {
    return ChildMedicalFileAllergyGet$Response(
        count: (count != null ? count.value : this.count),
        next: (next != null ? next.value : this.next),
        previous: (previous != null ? previous.value : this.previous),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class ChildMedicalFileDefaultAllergyGet$Response {
  ChildMedicalFileDefaultAllergyGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory ChildMedicalFileDefaultAllergyGet$Response.fromJson(
          Map<String, dynamic> json) =>
      _$ChildMedicalFileDefaultAllergyGet$ResponseFromJson(json);

  static const toJsonFactory =
      _$ChildMedicalFileDefaultAllergyGet$ResponseToJson;
  Map<String, dynamic> toJson() =>
      _$ChildMedicalFileDefaultAllergyGet$ResponseToJson(this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(
      name: 'results',
      includeIfNull: false,
      defaultValue: <ChildMedicalFileDefaultAllergy>[])
  final List<ChildMedicalFileDefaultAllergy>? results;
  static const fromJsonFactory =
      _$ChildMedicalFileDefaultAllergyGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChildMedicalFileDefaultAllergyGet$Response &&
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

extension $ChildMedicalFileDefaultAllergyGet$ResponseExtension
    on ChildMedicalFileDefaultAllergyGet$Response {
  ChildMedicalFileDefaultAllergyGet$Response copyWith(
      {int? count,
      String? next,
      String? previous,
      List<ChildMedicalFileDefaultAllergy>? results}) {
    return ChildMedicalFileDefaultAllergyGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  ChildMedicalFileDefaultAllergyGet$Response copyWithWrapped(
      {Wrapped<int?>? count,
      Wrapped<String?>? next,
      Wrapped<String?>? previous,
      Wrapped<List<ChildMedicalFileDefaultAllergy>?>? results}) {
    return ChildMedicalFileDefaultAllergyGet$Response(
        count: (count != null ? count.value : this.count),
        next: (next != null ? next.value : this.next),
        previous: (previous != null ? previous.value : this.previous),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class ChildMedicalFileDefaultMedicalConditionGet$Response {
  ChildMedicalFileDefaultMedicalConditionGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory ChildMedicalFileDefaultMedicalConditionGet$Response.fromJson(
          Map<String, dynamic> json) =>
      _$ChildMedicalFileDefaultMedicalConditionGet$ResponseFromJson(json);

  static const toJsonFactory =
      _$ChildMedicalFileDefaultMedicalConditionGet$ResponseToJson;
  Map<String, dynamic> toJson() =>
      _$ChildMedicalFileDefaultMedicalConditionGet$ResponseToJson(this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(
      name: 'results',
      includeIfNull: false,
      defaultValue: <ChildMedicalFileDefaultMedicalCondition>[])
  final List<ChildMedicalFileDefaultMedicalCondition>? results;
  static const fromJsonFactory =
      _$ChildMedicalFileDefaultMedicalConditionGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChildMedicalFileDefaultMedicalConditionGet$Response &&
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

extension $ChildMedicalFileDefaultMedicalConditionGet$ResponseExtension
    on ChildMedicalFileDefaultMedicalConditionGet$Response {
  ChildMedicalFileDefaultMedicalConditionGet$Response copyWith(
      {int? count,
      String? next,
      String? previous,
      List<ChildMedicalFileDefaultMedicalCondition>? results}) {
    return ChildMedicalFileDefaultMedicalConditionGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  ChildMedicalFileDefaultMedicalConditionGet$Response copyWithWrapped(
      {Wrapped<int?>? count,
      Wrapped<String?>? next,
      Wrapped<String?>? previous,
      Wrapped<List<ChildMedicalFileDefaultMedicalCondition>?>? results}) {
    return ChildMedicalFileDefaultMedicalConditionGet$Response(
        count: (count != null ? count.value : this.count),
        next: (next != null ? next.value : this.next),
        previous: (previous != null ? previous.value : this.previous),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class ChildMedicalFileDefaultMedicationGet$Response {
  ChildMedicalFileDefaultMedicationGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory ChildMedicalFileDefaultMedicationGet$Response.fromJson(
          Map<String, dynamic> json) =>
      _$ChildMedicalFileDefaultMedicationGet$ResponseFromJson(json);

  static const toJsonFactory =
      _$ChildMedicalFileDefaultMedicationGet$ResponseToJson;
  Map<String, dynamic> toJson() =>
      _$ChildMedicalFileDefaultMedicationGet$ResponseToJson(this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(
      name: 'results',
      includeIfNull: false,
      defaultValue: <ChildMedicalFileDefaultMedication>[])
  final List<ChildMedicalFileDefaultMedication>? results;
  static const fromJsonFactory =
      _$ChildMedicalFileDefaultMedicationGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChildMedicalFileDefaultMedicationGet$Response &&
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

extension $ChildMedicalFileDefaultMedicationGet$ResponseExtension
    on ChildMedicalFileDefaultMedicationGet$Response {
  ChildMedicalFileDefaultMedicationGet$Response copyWith(
      {int? count,
      String? next,
      String? previous,
      List<ChildMedicalFileDefaultMedication>? results}) {
    return ChildMedicalFileDefaultMedicationGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  ChildMedicalFileDefaultMedicationGet$Response copyWithWrapped(
      {Wrapped<int?>? count,
      Wrapped<String?>? next,
      Wrapped<String?>? previous,
      Wrapped<List<ChildMedicalFileDefaultMedication>?>? results}) {
    return ChildMedicalFileDefaultMedicationGet$Response(
        count: (count != null ? count.value : this.count),
        next: (next != null ? next.value : this.next),
        previous: (previous != null ? previous.value : this.previous),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class ChildMedicalFileMedicalConditionGet$Response {
  ChildMedicalFileMedicalConditionGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory ChildMedicalFileMedicalConditionGet$Response.fromJson(
          Map<String, dynamic> json) =>
      _$ChildMedicalFileMedicalConditionGet$ResponseFromJson(json);

  static const toJsonFactory =
      _$ChildMedicalFileMedicalConditionGet$ResponseToJson;
  Map<String, dynamic> toJson() =>
      _$ChildMedicalFileMedicalConditionGet$ResponseToJson(this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(
      name: 'results',
      includeIfNull: false,
      defaultValue: <ChildMedicalFileMedicalCondition>[])
  final List<ChildMedicalFileMedicalCondition>? results;
  static const fromJsonFactory =
      _$ChildMedicalFileMedicalConditionGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChildMedicalFileMedicalConditionGet$Response &&
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

extension $ChildMedicalFileMedicalConditionGet$ResponseExtension
    on ChildMedicalFileMedicalConditionGet$Response {
  ChildMedicalFileMedicalConditionGet$Response copyWith(
      {int? count,
      String? next,
      String? previous,
      List<ChildMedicalFileMedicalCondition>? results}) {
    return ChildMedicalFileMedicalConditionGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  ChildMedicalFileMedicalConditionGet$Response copyWithWrapped(
      {Wrapped<int?>? count,
      Wrapped<String?>? next,
      Wrapped<String?>? previous,
      Wrapped<List<ChildMedicalFileMedicalCondition>?>? results}) {
    return ChildMedicalFileMedicalConditionGet$Response(
        count: (count != null ? count.value : this.count),
        next: (next != null ? next.value : this.next),
        previous: (previous != null ? previous.value : this.previous),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class ChildMedicalFileMedicationGet$Response {
  ChildMedicalFileMedicationGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory ChildMedicalFileMedicationGet$Response.fromJson(
          Map<String, dynamic> json) =>
      _$ChildMedicalFileMedicationGet$ResponseFromJson(json);

  static const toJsonFactory = _$ChildMedicalFileMedicationGet$ResponseToJson;
  Map<String, dynamic> toJson() =>
      _$ChildMedicalFileMedicationGet$ResponseToJson(this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(
      name: 'results',
      includeIfNull: false,
      defaultValue: <ChildMedicalFileMedication>[])
  final List<ChildMedicalFileMedication>? results;
  static const fromJsonFactory =
      _$ChildMedicalFileMedicationGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChildMedicalFileMedicationGet$Response &&
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

extension $ChildMedicalFileMedicationGet$ResponseExtension
    on ChildMedicalFileMedicationGet$Response {
  ChildMedicalFileMedicationGet$Response copyWith(
      {int? count,
      String? next,
      String? previous,
      List<ChildMedicalFileMedication>? results}) {
    return ChildMedicalFileMedicationGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  ChildMedicalFileMedicationGet$Response copyWithWrapped(
      {Wrapped<int?>? count,
      Wrapped<String?>? next,
      Wrapped<String?>? previous,
      Wrapped<List<ChildMedicalFileMedication>?>? results}) {
    return ChildMedicalFileMedicationGet$Response(
        count: (count != null ? count.value : this.count),
        next: (next != null ? next.value : this.next),
        previous: (previous != null ? previous.value : this.previous),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class ContractsEducatorContractGet$Response {
  ContractsEducatorContractGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory ContractsEducatorContractGet$Response.fromJson(
          Map<String, dynamic> json) =>
      _$ContractsEducatorContractGet$ResponseFromJson(json);

  static const toJsonFactory = _$ContractsEducatorContractGet$ResponseToJson;
  Map<String, dynamic> toJson() =>
      _$ContractsEducatorContractGet$ResponseToJson(this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(
      name: 'results', includeIfNull: false, defaultValue: <EducatorContract>[])
  final List<EducatorContract>? results;
  static const fromJsonFactory =
      _$ContractsEducatorContractGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ContractsEducatorContractGet$Response &&
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

extension $ContractsEducatorContractGet$ResponseExtension
    on ContractsEducatorContractGet$Response {
  ContractsEducatorContractGet$Response copyWith(
      {int? count,
      String? next,
      String? previous,
      List<EducatorContract>? results}) {
    return ContractsEducatorContractGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  ContractsEducatorContractGet$Response copyWithWrapped(
      {Wrapped<int?>? count,
      Wrapped<String?>? next,
      Wrapped<String?>? previous,
      Wrapped<List<EducatorContract>?>? results}) {
    return ContractsEducatorContractGet$Response(
        count: (count != null ? count.value : this.count),
        next: (next != null ? next.value : this.next),
        previous: (previous != null ? previous.value : this.previous),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class ContractsInscriptionGet$Response {
  ContractsInscriptionGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory ContractsInscriptionGet$Response.fromJson(
          Map<String, dynamic> json) =>
      _$ContractsInscriptionGet$ResponseFromJson(json);

  static const toJsonFactory = _$ContractsInscriptionGet$ResponseToJson;
  Map<String, dynamic> toJson() =>
      _$ContractsInscriptionGet$ResponseToJson(this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(name: 'results', includeIfNull: false, defaultValue: <Inscription>[])
  final List<Inscription>? results;
  static const fromJsonFactory = _$ContractsInscriptionGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ContractsInscriptionGet$Response &&
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

extension $ContractsInscriptionGet$ResponseExtension
    on ContractsInscriptionGet$Response {
  ContractsInscriptionGet$Response copyWith(
      {int? count,
      String? next,
      String? previous,
      List<Inscription>? results}) {
    return ContractsInscriptionGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  ContractsInscriptionGet$Response copyWithWrapped(
      {Wrapped<int?>? count,
      Wrapped<String?>? next,
      Wrapped<String?>? previous,
      Wrapped<List<Inscription>?>? results}) {
    return ContractsInscriptionGet$Response(
        count: (count != null ? count.value : this.count),
        next: (next != null ? next.value : this.next),
        previous: (previous != null ? previous.value : this.previous),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class FamilyFamilyGet$Response {
  FamilyFamilyGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory FamilyFamilyGet$Response.fromJson(Map<String, dynamic> json) =>
      _$FamilyFamilyGet$ResponseFromJson(json);

  static const toJsonFactory = _$FamilyFamilyGet$ResponseToJson;
  Map<String, dynamic> toJson() => _$FamilyFamilyGet$ResponseToJson(this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(name: 'results', includeIfNull: false, defaultValue: <Family>[])
  final List<Family>? results;
  static const fromJsonFactory = _$FamilyFamilyGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FamilyFamilyGet$Response &&
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

extension $FamilyFamilyGet$ResponseExtension on FamilyFamilyGet$Response {
  FamilyFamilyGet$Response copyWith(
      {int? count, String? next, String? previous, List<Family>? results}) {
    return FamilyFamilyGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  FamilyFamilyGet$Response copyWithWrapped(
      {Wrapped<int?>? count,
      Wrapped<String?>? next,
      Wrapped<String?>? previous,
      Wrapped<List<Family>?>? results}) {
    return FamilyFamilyGet$Response(
        count: (count != null ? count.value : this.count),
        next: (next != null ? next.value : this.next),
        previous: (previous != null ? previous.value : this.previous),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class FamilyTrustedPersonGet$Response {
  FamilyTrustedPersonGet$Response({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory FamilyTrustedPersonGet$Response.fromJson(Map<String, dynamic> json) =>
      _$FamilyTrustedPersonGet$ResponseFromJson(json);

  static const toJsonFactory = _$FamilyTrustedPersonGet$ResponseToJson;
  Map<String, dynamic> toJson() =>
      _$FamilyTrustedPersonGet$ResponseToJson(this);

  @JsonKey(name: 'count', includeIfNull: false)
  final int? count;
  @JsonKey(name: 'next', includeIfNull: false, defaultValue: '')
  final String? next;
  @JsonKey(name: 'previous', includeIfNull: false, defaultValue: '')
  final String? previous;
  @JsonKey(
      name: 'results', includeIfNull: false, defaultValue: <TrustedPerson>[])
  final List<TrustedPerson>? results;
  static const fromJsonFactory = _$FamilyTrustedPersonGet$ResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FamilyTrustedPersonGet$Response &&
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

extension $FamilyTrustedPersonGet$ResponseExtension
    on FamilyTrustedPersonGet$Response {
  FamilyTrustedPersonGet$Response copyWith(
      {int? count,
      String? next,
      String? previous,
      List<TrustedPerson>? results}) {
    return FamilyTrustedPersonGet$Response(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results);
  }

  FamilyTrustedPersonGet$Response copyWithWrapped(
      {Wrapped<int?>? count,
      Wrapped<String?>? next,
      Wrapped<String?>? previous,
      Wrapped<List<TrustedPerson>?>? results}) {
    return FamilyTrustedPersonGet$Response(
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
class EducatorProfile$Phone {
  EducatorProfile$Phone({
    this.kind,
    this.number,
  });

  factory EducatorProfile$Phone.fromJson(Map<String, dynamic> json) =>
      _$EducatorProfile$PhoneFromJson(json);

  static const toJsonFactory = _$EducatorProfile$PhoneToJson;
  Map<String, dynamic> toJson() => _$EducatorProfile$PhoneToJson(this);

  @JsonKey(
    name: 'kind',
    includeIfNull: false,
    toJson: educatorProfile$PhoneKindToJson,
    fromJson: educatorProfile$PhoneKindFromJson,
  )
  final enums.EducatorProfile$PhoneKind? kind;
  @JsonKey(name: 'number', includeIfNull: false, defaultValue: '')
  final String? number;
  static const fromJsonFactory = _$EducatorProfile$PhoneFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EducatorProfile$Phone &&
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

extension $EducatorProfile$PhoneExtension on EducatorProfile$Phone {
  EducatorProfile$Phone copyWith(
      {enums.EducatorProfile$PhoneKind? kind, String? number}) {
    return EducatorProfile$Phone(
        kind: kind ?? this.kind, number: number ?? this.number);
  }

  EducatorProfile$Phone copyWithWrapped(
      {Wrapped<enums.EducatorProfile$PhoneKind?>? kind,
      Wrapped<String?>? number}) {
    return EducatorProfile$Phone(
        kind: (kind != null ? kind.value : this.kind),
        number: (number != null ? number.value : this.number));
  }
}

@JsonSerializable(explicitToJson: true)
class KindergartenProfileRead$Phone {
  KindergartenProfileRead$Phone({
    this.kind,
    this.number,
  });

  factory KindergartenProfileRead$Phone.fromJson(Map<String, dynamic> json) =>
      _$KindergartenProfileRead$PhoneFromJson(json);

  static const toJsonFactory = _$KindergartenProfileRead$PhoneToJson;
  Map<String, dynamic> toJson() => _$KindergartenProfileRead$PhoneToJson(this);

  @JsonKey(
    name: 'kind',
    includeIfNull: false,
    toJson: kindergartenProfileRead$PhoneKindToJson,
    fromJson: kindergartenProfileRead$PhoneKindFromJson,
  )
  final enums.KindergartenProfileRead$PhoneKind? kind;
  @JsonKey(name: 'number', includeIfNull: false, defaultValue: '')
  final String? number;
  static const fromJsonFactory = _$KindergartenProfileRead$PhoneFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is KindergartenProfileRead$Phone &&
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

extension $KindergartenProfileRead$PhoneExtension
    on KindergartenProfileRead$Phone {
  KindergartenProfileRead$Phone copyWith(
      {enums.KindergartenProfileRead$PhoneKind? kind, String? number}) {
    return KindergartenProfileRead$Phone(
        kind: kind ?? this.kind, number: number ?? this.number);
  }

  KindergartenProfileRead$Phone copyWithWrapped(
      {Wrapped<enums.KindergartenProfileRead$PhoneKind?>? kind,
      Wrapped<String?>? number}) {
    return KindergartenProfileRead$Phone(
        kind: (kind != null ? kind.value : this.kind),
        number: (number != null ? number.value : this.number));
  }
}

@JsonSerializable(explicitToJson: true)
class KindergartenProfileRead$Phone1 {
  KindergartenProfileRead$Phone1({
    this.kind,
    this.number,
  });

  factory KindergartenProfileRead$Phone1.fromJson(Map<String, dynamic> json) =>
      _$KindergartenProfileRead$Phone1FromJson(json);

  static const toJsonFactory = _$KindergartenProfileRead$Phone1ToJson;
  Map<String, dynamic> toJson() => _$KindergartenProfileRead$Phone1ToJson(this);

  @JsonKey(
    name: 'kind',
    includeIfNull: false,
    toJson: kindergartenProfileRead$Phone1KindToJson,
    fromJson: kindergartenProfileRead$Phone1KindFromJson,
  )
  final enums.KindergartenProfileRead$Phone1Kind? kind;
  @JsonKey(name: 'number', includeIfNull: false, defaultValue: '')
  final String? number;
  static const fromJsonFactory = _$KindergartenProfileRead$Phone1FromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is KindergartenProfileRead$Phone1 &&
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

extension $KindergartenProfileRead$Phone1Extension
    on KindergartenProfileRead$Phone1 {
  KindergartenProfileRead$Phone1 copyWith(
      {enums.KindergartenProfileRead$Phone1Kind? kind, String? number}) {
    return KindergartenProfileRead$Phone1(
        kind: kind ?? this.kind, number: number ?? this.number);
  }

  KindergartenProfileRead$Phone1 copyWithWrapped(
      {Wrapped<enums.KindergartenProfileRead$Phone1Kind?>? kind,
      Wrapped<String?>? number}) {
    return KindergartenProfileRead$Phone1(
        kind: (kind != null ? kind.value : this.kind),
        number: (number != null ? number.value : this.number));
  }
}

@JsonSerializable(explicitToJson: true)
class KindergartenProfileRead$Phone2 {
  KindergartenProfileRead$Phone2({
    this.kind,
    this.number,
  });

  factory KindergartenProfileRead$Phone2.fromJson(Map<String, dynamic> json) =>
      _$KindergartenProfileRead$Phone2FromJson(json);

  static const toJsonFactory = _$KindergartenProfileRead$Phone2ToJson;
  Map<String, dynamic> toJson() => _$KindergartenProfileRead$Phone2ToJson(this);

  @JsonKey(
    name: 'kind',
    includeIfNull: false,
    toJson: kindergartenProfileRead$Phone2KindToJson,
    fromJson: kindergartenProfileRead$Phone2KindFromJson,
  )
  final enums.KindergartenProfileRead$Phone2Kind? kind;
  @JsonKey(name: 'number', includeIfNull: false, defaultValue: '')
  final String? number;
  static const fromJsonFactory = _$KindergartenProfileRead$Phone2FromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is KindergartenProfileRead$Phone2 &&
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

extension $KindergartenProfileRead$Phone2Extension
    on KindergartenProfileRead$Phone2 {
  KindergartenProfileRead$Phone2 copyWith(
      {enums.KindergartenProfileRead$Phone2Kind? kind, String? number}) {
    return KindergartenProfileRead$Phone2(
        kind: kind ?? this.kind, number: number ?? this.number);
  }

  KindergartenProfileRead$Phone2 copyWithWrapped(
      {Wrapped<enums.KindergartenProfileRead$Phone2Kind?>? kind,
      Wrapped<String?>? number}) {
    return KindergartenProfileRead$Phone2(
        kind: (kind != null ? kind.value : this.kind),
        number: (number != null ? number.value : this.number));
  }
}

@JsonSerializable(explicitToJson: true)
class KindergartenProfile$Phone {
  KindergartenProfile$Phone({
    this.kind,
    this.number,
  });

  factory KindergartenProfile$Phone.fromJson(Map<String, dynamic> json) =>
      _$KindergartenProfile$PhoneFromJson(json);

  static const toJsonFactory = _$KindergartenProfile$PhoneToJson;
  Map<String, dynamic> toJson() => _$KindergartenProfile$PhoneToJson(this);

  @JsonKey(
    name: 'kind',
    includeIfNull: false,
    toJson: kindergartenProfile$PhoneKindToJson,
    fromJson: kindergartenProfile$PhoneKindFromJson,
  )
  final enums.KindergartenProfile$PhoneKind? kind;
  @JsonKey(name: 'number', includeIfNull: false, defaultValue: '')
  final String? number;
  static const fromJsonFactory = _$KindergartenProfile$PhoneFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is KindergartenProfile$Phone &&
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

extension $KindergartenProfile$PhoneExtension on KindergartenProfile$Phone {
  KindergartenProfile$Phone copyWith(
      {enums.KindergartenProfile$PhoneKind? kind, String? number}) {
    return KindergartenProfile$Phone(
        kind: kind ?? this.kind, number: number ?? this.number);
  }

  KindergartenProfile$Phone copyWithWrapped(
      {Wrapped<enums.KindergartenProfile$PhoneKind?>? kind,
      Wrapped<String?>? number}) {
    return KindergartenProfile$Phone(
        kind: (kind != null ? kind.value : this.kind),
        number: (number != null ? number.value : this.number));
  }
}

@JsonSerializable(explicitToJson: true)
class KindergartenProfile$Phone1 {
  KindergartenProfile$Phone1({
    this.kind,
    this.number,
  });

  factory KindergartenProfile$Phone1.fromJson(Map<String, dynamic> json) =>
      _$KindergartenProfile$Phone1FromJson(json);

  static const toJsonFactory = _$KindergartenProfile$Phone1ToJson;
  Map<String, dynamic> toJson() => _$KindergartenProfile$Phone1ToJson(this);

  @JsonKey(
    name: 'kind',
    includeIfNull: false,
    toJson: kindergartenProfile$Phone1KindToJson,
    fromJson: kindergartenProfile$Phone1KindFromJson,
  )
  final enums.KindergartenProfile$Phone1Kind? kind;
  @JsonKey(name: 'number', includeIfNull: false, defaultValue: '')
  final String? number;
  static const fromJsonFactory = _$KindergartenProfile$Phone1FromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is KindergartenProfile$Phone1 &&
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

extension $KindergartenProfile$Phone1Extension on KindergartenProfile$Phone1 {
  KindergartenProfile$Phone1 copyWith(
      {enums.KindergartenProfile$Phone1Kind? kind, String? number}) {
    return KindergartenProfile$Phone1(
        kind: kind ?? this.kind, number: number ?? this.number);
  }

  KindergartenProfile$Phone1 copyWithWrapped(
      {Wrapped<enums.KindergartenProfile$Phone1Kind?>? kind,
      Wrapped<String?>? number}) {
    return KindergartenProfile$Phone1(
        kind: (kind != null ? kind.value : this.kind),
        number: (number != null ? number.value : this.number));
  }
}

@JsonSerializable(explicitToJson: true)
class KindergartenProfile$Phone2 {
  KindergartenProfile$Phone2({
    this.kind,
    this.number,
  });

  factory KindergartenProfile$Phone2.fromJson(Map<String, dynamic> json) =>
      _$KindergartenProfile$Phone2FromJson(json);

  static const toJsonFactory = _$KindergartenProfile$Phone2ToJson;
  Map<String, dynamic> toJson() => _$KindergartenProfile$Phone2ToJson(this);

  @JsonKey(
    name: 'kind',
    includeIfNull: false,
    toJson: kindergartenProfile$Phone2KindToJson,
    fromJson: kindergartenProfile$Phone2KindFromJson,
  )
  final enums.KindergartenProfile$Phone2Kind? kind;
  @JsonKey(name: 'number', includeIfNull: false, defaultValue: '')
  final String? number;
  static const fromJsonFactory = _$KindergartenProfile$Phone2FromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is KindergartenProfile$Phone2 &&
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

extension $KindergartenProfile$Phone2Extension on KindergartenProfile$Phone2 {
  KindergartenProfile$Phone2 copyWith(
      {enums.KindergartenProfile$Phone2Kind? kind, String? number}) {
    return KindergartenProfile$Phone2(
        kind: kind ?? this.kind, number: number ?? this.number);
  }

  KindergartenProfile$Phone2 copyWithWrapped(
      {Wrapped<enums.KindergartenProfile$Phone2Kind?>? kind,
      Wrapped<String?>? number}) {
    return KindergartenProfile$Phone2(
        kind: (kind != null ? kind.value : this.kind),
        number: (number != null ? number.value : this.number));
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

@JsonSerializable(explicitToJson: true)
class EducatorRegistration$Phone {
  EducatorRegistration$Phone({
    this.kind,
    this.number,
  });

  factory EducatorRegistration$Phone.fromJson(Map<String, dynamic> json) =>
      _$EducatorRegistration$PhoneFromJson(json);

  static const toJsonFactory = _$EducatorRegistration$PhoneToJson;
  Map<String, dynamic> toJson() => _$EducatorRegistration$PhoneToJson(this);

  @JsonKey(
    name: 'kind',
    includeIfNull: false,
    toJson: educatorRegistration$PhoneKindToJson,
    fromJson: educatorRegistration$PhoneKindFromJson,
  )
  final enums.EducatorRegistration$PhoneKind? kind;
  @JsonKey(name: 'number', includeIfNull: false, defaultValue: '')
  final String? number;
  static const fromJsonFactory = _$EducatorRegistration$PhoneFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EducatorRegistration$Phone &&
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

extension $EducatorRegistration$PhoneExtension on EducatorRegistration$Phone {
  EducatorRegistration$Phone copyWith(
      {enums.EducatorRegistration$PhoneKind? kind, String? number}) {
    return EducatorRegistration$Phone(
        kind: kind ?? this.kind, number: number ?? this.number);
  }

  EducatorRegistration$Phone copyWithWrapped(
      {Wrapped<enums.EducatorRegistration$PhoneKind?>? kind,
      Wrapped<String?>? number}) {
    return EducatorRegistration$Phone(
        kind: (kind != null ? kind.value : this.kind),
        number: (number != null ? number.value : this.number));
  }
}

@JsonSerializable(explicitToJson: true)
class ParentRegistration$Phone {
  ParentRegistration$Phone({
    this.kind,
    this.number,
  });

  factory ParentRegistration$Phone.fromJson(Map<String, dynamic> json) =>
      _$ParentRegistration$PhoneFromJson(json);

  static const toJsonFactory = _$ParentRegistration$PhoneToJson;
  Map<String, dynamic> toJson() => _$ParentRegistration$PhoneToJson(this);

  @JsonKey(
    name: 'kind',
    includeIfNull: false,
    toJson: parentRegistration$PhoneKindToJson,
    fromJson: parentRegistration$PhoneKindFromJson,
  )
  final enums.ParentRegistration$PhoneKind? kind;
  @JsonKey(name: 'number', includeIfNull: false, defaultValue: '')
  final String? number;
  static const fromJsonFactory = _$ParentRegistration$PhoneFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ParentRegistration$Phone &&
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

extension $ParentRegistration$PhoneExtension on ParentRegistration$Phone {
  ParentRegistration$Phone copyWith(
      {enums.ParentRegistration$PhoneKind? kind, String? number}) {
    return ParentRegistration$Phone(
        kind: kind ?? this.kind, number: number ?? this.number);
  }

  ParentRegistration$Phone copyWithWrapped(
      {Wrapped<enums.ParentRegistration$PhoneKind?>? kind,
      Wrapped<String?>? number}) {
    return ParentRegistration$Phone(
        kind: (kind != null ? kind.value : this.kind),
        number: (number != null ? number.value : this.number));
  }
}

@JsonSerializable(explicitToJson: true)
class KindergartenRegistration$Phone {
  KindergartenRegistration$Phone({
    this.kind,
    this.number,
  });

  factory KindergartenRegistration$Phone.fromJson(Map<String, dynamic> json) =>
      _$KindergartenRegistration$PhoneFromJson(json);

  static const toJsonFactory = _$KindergartenRegistration$PhoneToJson;
  Map<String, dynamic> toJson() => _$KindergartenRegistration$PhoneToJson(this);

  @JsonKey(
    name: 'kind',
    includeIfNull: false,
    toJson: kindergartenRegistration$PhoneKindToJson,
    fromJson: kindergartenRegistration$PhoneKindFromJson,
  )
  final enums.KindergartenRegistration$PhoneKind? kind;
  @JsonKey(name: 'number', includeIfNull: false, defaultValue: '')
  final String? number;
  static const fromJsonFactory = _$KindergartenRegistration$PhoneFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is KindergartenRegistration$Phone &&
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

extension $KindergartenRegistration$PhoneExtension
    on KindergartenRegistration$Phone {
  KindergartenRegistration$Phone copyWith(
      {enums.KindergartenRegistration$PhoneKind? kind, String? number}) {
    return KindergartenRegistration$Phone(
        kind: kind ?? this.kind, number: number ?? this.number);
  }

  KindergartenRegistration$Phone copyWithWrapped(
      {Wrapped<enums.KindergartenRegistration$PhoneKind?>? kind,
      Wrapped<String?>? number}) {
    return KindergartenRegistration$Phone(
        kind: (kind != null ? kind.value : this.kind),
        number: (number != null ? number.value : this.number));
  }
}

@JsonSerializable(explicitToJson: true)
class KindergartenRegistration$Phone1 {
  KindergartenRegistration$Phone1({
    this.kind,
    this.number,
  });

  factory KindergartenRegistration$Phone1.fromJson(Map<String, dynamic> json) =>
      _$KindergartenRegistration$Phone1FromJson(json);

  static const toJsonFactory = _$KindergartenRegistration$Phone1ToJson;
  Map<String, dynamic> toJson() =>
      _$KindergartenRegistration$Phone1ToJson(this);

  @JsonKey(
    name: 'kind',
    includeIfNull: false,
    toJson: kindergartenRegistration$Phone1KindToJson,
    fromJson: kindergartenRegistration$Phone1KindFromJson,
  )
  final enums.KindergartenRegistration$Phone1Kind? kind;
  @JsonKey(name: 'number', includeIfNull: false, defaultValue: '')
  final String? number;
  static const fromJsonFactory = _$KindergartenRegistration$Phone1FromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is KindergartenRegistration$Phone1 &&
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

extension $KindergartenRegistration$Phone1Extension
    on KindergartenRegistration$Phone1 {
  KindergartenRegistration$Phone1 copyWith(
      {enums.KindergartenRegistration$Phone1Kind? kind, String? number}) {
    return KindergartenRegistration$Phone1(
        kind: kind ?? this.kind, number: number ?? this.number);
  }

  KindergartenRegistration$Phone1 copyWithWrapped(
      {Wrapped<enums.KindergartenRegistration$Phone1Kind?>? kind,
      Wrapped<String?>? number}) {
    return KindergartenRegistration$Phone1(
        kind: (kind != null ? kind.value : this.kind),
        number: (number != null ? number.value : this.number));
  }
}

@JsonSerializable(explicitToJson: true)
class KindergartenRegistration$Phone2 {
  KindergartenRegistration$Phone2({
    this.kind,
    this.number,
  });

  factory KindergartenRegistration$Phone2.fromJson(Map<String, dynamic> json) =>
      _$KindergartenRegistration$Phone2FromJson(json);

  static const toJsonFactory = _$KindergartenRegistration$Phone2ToJson;
  Map<String, dynamic> toJson() =>
      _$KindergartenRegistration$Phone2ToJson(this);

  @JsonKey(
    name: 'kind',
    includeIfNull: false,
    toJson: kindergartenRegistration$Phone2KindToJson,
    fromJson: kindergartenRegistration$Phone2KindFromJson,
  )
  final enums.KindergartenRegistration$Phone2Kind? kind;
  @JsonKey(name: 'number', includeIfNull: false, defaultValue: '')
  final String? number;
  static const fromJsonFactory = _$KindergartenRegistration$Phone2FromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is KindergartenRegistration$Phone2 &&
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

extension $KindergartenRegistration$Phone2Extension
    on KindergartenRegistration$Phone2 {
  KindergartenRegistration$Phone2 copyWith(
      {enums.KindergartenRegistration$Phone2Kind? kind, String? number}) {
    return KindergartenRegistration$Phone2(
        kind: kind ?? this.kind, number: number ?? this.number);
  }

  KindergartenRegistration$Phone2 copyWithWrapped(
      {Wrapped<enums.KindergartenRegistration$Phone2Kind?>? kind,
      Wrapped<String?>? number}) {
    return KindergartenRegistration$Phone2(
        kind: (kind != null ? kind.value : this.kind),
        number: (number != null ? number.value : this.number));
  }
}

@JsonSerializable(explicitToJson: true)
class EducatorContractRegistrationEducator$Phone {
  EducatorContractRegistrationEducator$Phone({
    this.kind,
    this.number,
  });

  factory EducatorContractRegistrationEducator$Phone.fromJson(
          Map<String, dynamic> json) =>
      _$EducatorContractRegistrationEducator$PhoneFromJson(json);

  static const toJsonFactory =
      _$EducatorContractRegistrationEducator$PhoneToJson;
  Map<String, dynamic> toJson() =>
      _$EducatorContractRegistrationEducator$PhoneToJson(this);

  @JsonKey(
    name: 'kind',
    includeIfNull: false,
    toJson: educatorContractRegistrationEducator$PhoneKindToJson,
    fromJson: educatorContractRegistrationEducator$PhoneKindFromJson,
  )
  final enums.EducatorContractRegistrationEducator$PhoneKind? kind;
  @JsonKey(name: 'number', includeIfNull: false, defaultValue: '')
  final String? number;
  static const fromJsonFactory =
      _$EducatorContractRegistrationEducator$PhoneFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EducatorContractRegistrationEducator$Phone &&
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

extension $EducatorContractRegistrationEducator$PhoneExtension
    on EducatorContractRegistrationEducator$Phone {
  EducatorContractRegistrationEducator$Phone copyWith(
      {enums.EducatorContractRegistrationEducator$PhoneKind? kind,
      String? number}) {
    return EducatorContractRegistrationEducator$Phone(
        kind: kind ?? this.kind, number: number ?? this.number);
  }

  EducatorContractRegistrationEducator$Phone copyWithWrapped(
      {Wrapped<enums.EducatorContractRegistrationEducator$PhoneKind?>? kind,
      Wrapped<String?>? number}) {
    return EducatorContractRegistrationEducator$Phone(
        kind: (kind != null ? kind.value : this.kind),
        number: (number != null ? number.value : this.number));
  }
}

@JsonSerializable(explicitToJson: true)
class InscriptionRegistrationParent$Phone {
  InscriptionRegistrationParent$Phone({
    this.kind,
    this.number,
  });

  factory InscriptionRegistrationParent$Phone.fromJson(
          Map<String, dynamic> json) =>
      _$InscriptionRegistrationParent$PhoneFromJson(json);

  static const toJsonFactory = _$InscriptionRegistrationParent$PhoneToJson;
  Map<String, dynamic> toJson() =>
      _$InscriptionRegistrationParent$PhoneToJson(this);

  @JsonKey(
    name: 'kind',
    includeIfNull: false,
    toJson: inscriptionRegistrationParent$PhoneKindToJson,
    fromJson: inscriptionRegistrationParent$PhoneKindFromJson,
  )
  final enums.InscriptionRegistrationParent$PhoneKind? kind;
  @JsonKey(name: 'number', includeIfNull: false, defaultValue: '')
  final String? number;
  static const fromJsonFactory = _$InscriptionRegistrationParent$PhoneFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InscriptionRegistrationParent$Phone &&
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

extension $InscriptionRegistrationParent$PhoneExtension
    on InscriptionRegistrationParent$Phone {
  InscriptionRegistrationParent$Phone copyWith(
      {enums.InscriptionRegistrationParent$PhoneKind? kind, String? number}) {
    return InscriptionRegistrationParent$Phone(
        kind: kind ?? this.kind, number: number ?? this.number);
  }

  InscriptionRegistrationParent$Phone copyWithWrapped(
      {Wrapped<enums.InscriptionRegistrationParent$PhoneKind?>? kind,
      Wrapped<String?>? number}) {
    return InscriptionRegistrationParent$Phone(
        kind: (kind != null ? kind.value : this.kind),
        number: (number != null ? number.value : this.number));
  }
}

@JsonSerializable(explicitToJson: true)
class ParentInvitationRegistration$Phone {
  ParentInvitationRegistration$Phone({
    this.kind,
    this.number,
  });

  factory ParentInvitationRegistration$Phone.fromJson(
          Map<String, dynamic> json) =>
      _$ParentInvitationRegistration$PhoneFromJson(json);

  static const toJsonFactory = _$ParentInvitationRegistration$PhoneToJson;
  Map<String, dynamic> toJson() =>
      _$ParentInvitationRegistration$PhoneToJson(this);

  @JsonKey(
    name: 'kind',
    includeIfNull: false,
    toJson: parentInvitationRegistration$PhoneKindToJson,
    fromJson: parentInvitationRegistration$PhoneKindFromJson,
  )
  final enums.ParentInvitationRegistration$PhoneKind? kind;
  @JsonKey(name: 'number', includeIfNull: false, defaultValue: '')
  final String? number;
  static const fromJsonFactory = _$ParentInvitationRegistration$PhoneFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ParentInvitationRegistration$Phone &&
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

extension $ParentInvitationRegistration$PhoneExtension
    on ParentInvitationRegistration$Phone {
  ParentInvitationRegistration$Phone copyWith(
      {enums.ParentInvitationRegistration$PhoneKind? kind, String? number}) {
    return ParentInvitationRegistration$Phone(
        kind: kind ?? this.kind, number: number ?? this.number);
  }

  ParentInvitationRegistration$Phone copyWithWrapped(
      {Wrapped<enums.ParentInvitationRegistration$PhoneKind?>? kind,
      Wrapped<String?>? number}) {
    return ParentInvitationRegistration$Phone(
        kind: (kind != null ? kind.value : this.kind),
        number: (number != null ? number.value : this.number));
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

String? educatorProfile$PhoneKindToJson(
    enums.EducatorProfile$PhoneKind? educatorProfile$PhoneKind) {
  return educatorProfile$PhoneKind?.value;
}

enums.EducatorProfile$PhoneKind educatorProfile$PhoneKindFromJson(
  Object? educatorProfile$PhoneKind, [
  enums.EducatorProfile$PhoneKind? defaultValue,
]) {
  return enums.EducatorProfile$PhoneKind.values
          .firstWhereOrNull((e) => e.value == educatorProfile$PhoneKind) ??
      defaultValue ??
      enums.EducatorProfile$PhoneKind.swaggerGeneratedUnknown;
}

List<String> educatorProfile$PhoneKindListToJson(
    List<enums.EducatorProfile$PhoneKind>? educatorProfile$PhoneKind) {
  if (educatorProfile$PhoneKind == null) {
    return [];
  }

  return educatorProfile$PhoneKind.map((e) => e.value!).toList();
}

List<enums.EducatorProfile$PhoneKind> educatorProfile$PhoneKindListFromJson(
  List? educatorProfile$PhoneKind, [
  List<enums.EducatorProfile$PhoneKind>? defaultValue,
]) {
  if (educatorProfile$PhoneKind == null) {
    return defaultValue ?? [];
  }

  return educatorProfile$PhoneKind
      .map((e) => educatorProfile$PhoneKindFromJson(e.toString()))
      .toList();
}

List<enums.EducatorProfile$PhoneKind>?
    educatorProfile$PhoneKindNullableListFromJson(
  List? educatorProfile$PhoneKind, [
  List<enums.EducatorProfile$PhoneKind>? defaultValue,
]) {
  if (educatorProfile$PhoneKind == null) {
    return defaultValue;
  }

  return educatorProfile$PhoneKind
      .map((e) => educatorProfile$PhoneKindFromJson(e.toString()))
      .toList();
}

String? educatorProfileSexToJson(enums.EducatorProfileSex? educatorProfileSex) {
  return educatorProfileSex?.value;
}

enums.EducatorProfileSex educatorProfileSexFromJson(
  Object? educatorProfileSex, [
  enums.EducatorProfileSex? defaultValue,
]) {
  return enums.EducatorProfileSex.values
          .firstWhereOrNull((e) => e.value == educatorProfileSex) ??
      defaultValue ??
      enums.EducatorProfileSex.swaggerGeneratedUnknown;
}

List<String> educatorProfileSexListToJson(
    List<enums.EducatorProfileSex>? educatorProfileSex) {
  if (educatorProfileSex == null) {
    return [];
  }

  return educatorProfileSex.map((e) => e.value!).toList();
}

List<enums.EducatorProfileSex> educatorProfileSexListFromJson(
  List? educatorProfileSex, [
  List<enums.EducatorProfileSex>? defaultValue,
]) {
  if (educatorProfileSex == null) {
    return defaultValue ?? [];
  }

  return educatorProfileSex
      .map((e) => educatorProfileSexFromJson(e.toString()))
      .toList();
}

List<enums.EducatorProfileSex>? educatorProfileSexNullableListFromJson(
  List? educatorProfileSex, [
  List<enums.EducatorProfileSex>? defaultValue,
]) {
  if (educatorProfileSex == null) {
    return defaultValue;
  }

  return educatorProfileSex
      .map((e) => educatorProfileSexFromJson(e.toString()))
      .toList();
}

String? kindergartenProfileServiceScheduleTypeToJson(
    enums.KindergartenProfileServiceScheduleType?
        kindergartenProfileServiceScheduleType) {
  return kindergartenProfileServiceScheduleType?.value;
}

enums.KindergartenProfileServiceScheduleType
    kindergartenProfileServiceScheduleTypeFromJson(
  Object? kindergartenProfileServiceScheduleType, [
  enums.KindergartenProfileServiceScheduleType? defaultValue,
]) {
  return enums.KindergartenProfileServiceScheduleType.values.firstWhereOrNull(
          (e) => e.value == kindergartenProfileServiceScheduleType) ??
      defaultValue ??
      enums.KindergartenProfileServiceScheduleType.swaggerGeneratedUnknown;
}

List<String> kindergartenProfileServiceScheduleTypeListToJson(
    List<enums.KindergartenProfileServiceScheduleType>?
        kindergartenProfileServiceScheduleType) {
  if (kindergartenProfileServiceScheduleType == null) {
    return [];
  }

  return kindergartenProfileServiceScheduleType.map((e) => e.value!).toList();
}

List<enums.KindergartenProfileServiceScheduleType>
    kindergartenProfileServiceScheduleTypeListFromJson(
  List? kindergartenProfileServiceScheduleType, [
  List<enums.KindergartenProfileServiceScheduleType>? defaultValue,
]) {
  if (kindergartenProfileServiceScheduleType == null) {
    return defaultValue ?? [];
  }

  return kindergartenProfileServiceScheduleType
      .map((e) => kindergartenProfileServiceScheduleTypeFromJson(e.toString()))
      .toList();
}

List<enums.KindergartenProfileServiceScheduleType>?
    kindergartenProfileServiceScheduleTypeNullableListFromJson(
  List? kindergartenProfileServiceScheduleType, [
  List<enums.KindergartenProfileServiceScheduleType>? defaultValue,
]) {
  if (kindergartenProfileServiceScheduleType == null) {
    return defaultValue;
  }

  return kindergartenProfileServiceScheduleType
      .map((e) => kindergartenProfileServiceScheduleTypeFromJson(e.toString()))
      .toList();
}

String? kindergartenProfileRead$PhoneKindToJson(
    enums.KindergartenProfileRead$PhoneKind?
        kindergartenProfileRead$PhoneKind) {
  return kindergartenProfileRead$PhoneKind?.value;
}

enums.KindergartenProfileRead$PhoneKind
    kindergartenProfileRead$PhoneKindFromJson(
  Object? kindergartenProfileRead$PhoneKind, [
  enums.KindergartenProfileRead$PhoneKind? defaultValue,
]) {
  return enums.KindergartenProfileRead$PhoneKind.values.firstWhereOrNull(
          (e) => e.value == kindergartenProfileRead$PhoneKind) ??
      defaultValue ??
      enums.KindergartenProfileRead$PhoneKind.swaggerGeneratedUnknown;
}

List<String> kindergartenProfileRead$PhoneKindListToJson(
    List<enums.KindergartenProfileRead$PhoneKind>?
        kindergartenProfileRead$PhoneKind) {
  if (kindergartenProfileRead$PhoneKind == null) {
    return [];
  }

  return kindergartenProfileRead$PhoneKind.map((e) => e.value!).toList();
}

List<enums.KindergartenProfileRead$PhoneKind>
    kindergartenProfileRead$PhoneKindListFromJson(
  List? kindergartenProfileRead$PhoneKind, [
  List<enums.KindergartenProfileRead$PhoneKind>? defaultValue,
]) {
  if (kindergartenProfileRead$PhoneKind == null) {
    return defaultValue ?? [];
  }

  return kindergartenProfileRead$PhoneKind
      .map((e) => kindergartenProfileRead$PhoneKindFromJson(e.toString()))
      .toList();
}

List<enums.KindergartenProfileRead$PhoneKind>?
    kindergartenProfileRead$PhoneKindNullableListFromJson(
  List? kindergartenProfileRead$PhoneKind, [
  List<enums.KindergartenProfileRead$PhoneKind>? defaultValue,
]) {
  if (kindergartenProfileRead$PhoneKind == null) {
    return defaultValue;
  }

  return kindergartenProfileRead$PhoneKind
      .map((e) => kindergartenProfileRead$PhoneKindFromJson(e.toString()))
      .toList();
}

String? kindergartenProfileRead$Phone1KindToJson(
    enums.KindergartenProfileRead$Phone1Kind?
        kindergartenProfileRead$Phone1Kind) {
  return kindergartenProfileRead$Phone1Kind?.value;
}

enums.KindergartenProfileRead$Phone1Kind
    kindergartenProfileRead$Phone1KindFromJson(
  Object? kindergartenProfileRead$Phone1Kind, [
  enums.KindergartenProfileRead$Phone1Kind? defaultValue,
]) {
  return enums.KindergartenProfileRead$Phone1Kind.values.firstWhereOrNull(
          (e) => e.value == kindergartenProfileRead$Phone1Kind) ??
      defaultValue ??
      enums.KindergartenProfileRead$Phone1Kind.swaggerGeneratedUnknown;
}

List<String> kindergartenProfileRead$Phone1KindListToJson(
    List<enums.KindergartenProfileRead$Phone1Kind>?
        kindergartenProfileRead$Phone1Kind) {
  if (kindergartenProfileRead$Phone1Kind == null) {
    return [];
  }

  return kindergartenProfileRead$Phone1Kind.map((e) => e.value!).toList();
}

List<enums.KindergartenProfileRead$Phone1Kind>
    kindergartenProfileRead$Phone1KindListFromJson(
  List? kindergartenProfileRead$Phone1Kind, [
  List<enums.KindergartenProfileRead$Phone1Kind>? defaultValue,
]) {
  if (kindergartenProfileRead$Phone1Kind == null) {
    return defaultValue ?? [];
  }

  return kindergartenProfileRead$Phone1Kind
      .map((e) => kindergartenProfileRead$Phone1KindFromJson(e.toString()))
      .toList();
}

List<enums.KindergartenProfileRead$Phone1Kind>?
    kindergartenProfileRead$Phone1KindNullableListFromJson(
  List? kindergartenProfileRead$Phone1Kind, [
  List<enums.KindergartenProfileRead$Phone1Kind>? defaultValue,
]) {
  if (kindergartenProfileRead$Phone1Kind == null) {
    return defaultValue;
  }

  return kindergartenProfileRead$Phone1Kind
      .map((e) => kindergartenProfileRead$Phone1KindFromJson(e.toString()))
      .toList();
}

String? kindergartenProfileRead$Phone2KindToJson(
    enums.KindergartenProfileRead$Phone2Kind?
        kindergartenProfileRead$Phone2Kind) {
  return kindergartenProfileRead$Phone2Kind?.value;
}

enums.KindergartenProfileRead$Phone2Kind
    kindergartenProfileRead$Phone2KindFromJson(
  Object? kindergartenProfileRead$Phone2Kind, [
  enums.KindergartenProfileRead$Phone2Kind? defaultValue,
]) {
  return enums.KindergartenProfileRead$Phone2Kind.values.firstWhereOrNull(
          (e) => e.value == kindergartenProfileRead$Phone2Kind) ??
      defaultValue ??
      enums.KindergartenProfileRead$Phone2Kind.swaggerGeneratedUnknown;
}

List<String> kindergartenProfileRead$Phone2KindListToJson(
    List<enums.KindergartenProfileRead$Phone2Kind>?
        kindergartenProfileRead$Phone2Kind) {
  if (kindergartenProfileRead$Phone2Kind == null) {
    return [];
  }

  return kindergartenProfileRead$Phone2Kind.map((e) => e.value!).toList();
}

List<enums.KindergartenProfileRead$Phone2Kind>
    kindergartenProfileRead$Phone2KindListFromJson(
  List? kindergartenProfileRead$Phone2Kind, [
  List<enums.KindergartenProfileRead$Phone2Kind>? defaultValue,
]) {
  if (kindergartenProfileRead$Phone2Kind == null) {
    return defaultValue ?? [];
  }

  return kindergartenProfileRead$Phone2Kind
      .map((e) => kindergartenProfileRead$Phone2KindFromJson(e.toString()))
      .toList();
}

List<enums.KindergartenProfileRead$Phone2Kind>?
    kindergartenProfileRead$Phone2KindNullableListFromJson(
  List? kindergartenProfileRead$Phone2Kind, [
  List<enums.KindergartenProfileRead$Phone2Kind>? defaultValue,
]) {
  if (kindergartenProfileRead$Phone2Kind == null) {
    return defaultValue;
  }

  return kindergartenProfileRead$Phone2Kind
      .map((e) => kindergartenProfileRead$Phone2KindFromJson(e.toString()))
      .toList();
}

String? kindergartenProfileReadChildCareTypeToJson(
    enums.KindergartenProfileReadChildCareType?
        kindergartenProfileReadChildCareType) {
  return kindergartenProfileReadChildCareType?.value;
}

enums.KindergartenProfileReadChildCareType
    kindergartenProfileReadChildCareTypeFromJson(
  Object? kindergartenProfileReadChildCareType, [
  enums.KindergartenProfileReadChildCareType? defaultValue,
]) {
  return enums.KindergartenProfileReadChildCareType.values.firstWhereOrNull(
          (e) => e.value == kindergartenProfileReadChildCareType) ??
      defaultValue ??
      enums.KindergartenProfileReadChildCareType.swaggerGeneratedUnknown;
}

List<String> kindergartenProfileReadChildCareTypeListToJson(
    List<enums.KindergartenProfileReadChildCareType>?
        kindergartenProfileReadChildCareType) {
  if (kindergartenProfileReadChildCareType == null) {
    return [];
  }

  return kindergartenProfileReadChildCareType.map((e) => e.value!).toList();
}

List<enums.KindergartenProfileReadChildCareType>
    kindergartenProfileReadChildCareTypeListFromJson(
  List? kindergartenProfileReadChildCareType, [
  List<enums.KindergartenProfileReadChildCareType>? defaultValue,
]) {
  if (kindergartenProfileReadChildCareType == null) {
    return defaultValue ?? [];
  }

  return kindergartenProfileReadChildCareType
      .map((e) => kindergartenProfileReadChildCareTypeFromJson(e.toString()))
      .toList();
}

List<enums.KindergartenProfileReadChildCareType>?
    kindergartenProfileReadChildCareTypeNullableListFromJson(
  List? kindergartenProfileReadChildCareType, [
  List<enums.KindergartenProfileReadChildCareType>? defaultValue,
]) {
  if (kindergartenProfileReadChildCareType == null) {
    return defaultValue;
  }

  return kindergartenProfileReadChildCareType
      .map((e) => kindergartenProfileReadChildCareTypeFromJson(e.toString()))
      .toList();
}

String? kindergartenProfile$PhoneKindToJson(
    enums.KindergartenProfile$PhoneKind? kindergartenProfile$PhoneKind) {
  return kindergartenProfile$PhoneKind?.value;
}

enums.KindergartenProfile$PhoneKind kindergartenProfile$PhoneKindFromJson(
  Object? kindergartenProfile$PhoneKind, [
  enums.KindergartenProfile$PhoneKind? defaultValue,
]) {
  return enums.KindergartenProfile$PhoneKind.values
          .firstWhereOrNull((e) => e.value == kindergartenProfile$PhoneKind) ??
      defaultValue ??
      enums.KindergartenProfile$PhoneKind.swaggerGeneratedUnknown;
}

List<String> kindergartenProfile$PhoneKindListToJson(
    List<enums.KindergartenProfile$PhoneKind>? kindergartenProfile$PhoneKind) {
  if (kindergartenProfile$PhoneKind == null) {
    return [];
  }

  return kindergartenProfile$PhoneKind.map((e) => e.value!).toList();
}

List<enums.KindergartenProfile$PhoneKind>
    kindergartenProfile$PhoneKindListFromJson(
  List? kindergartenProfile$PhoneKind, [
  List<enums.KindergartenProfile$PhoneKind>? defaultValue,
]) {
  if (kindergartenProfile$PhoneKind == null) {
    return defaultValue ?? [];
  }

  return kindergartenProfile$PhoneKind
      .map((e) => kindergartenProfile$PhoneKindFromJson(e.toString()))
      .toList();
}

List<enums.KindergartenProfile$PhoneKind>?
    kindergartenProfile$PhoneKindNullableListFromJson(
  List? kindergartenProfile$PhoneKind, [
  List<enums.KindergartenProfile$PhoneKind>? defaultValue,
]) {
  if (kindergartenProfile$PhoneKind == null) {
    return defaultValue;
  }

  return kindergartenProfile$PhoneKind
      .map((e) => kindergartenProfile$PhoneKindFromJson(e.toString()))
      .toList();
}

String? kindergartenProfile$Phone1KindToJson(
    enums.KindergartenProfile$Phone1Kind? kindergartenProfile$Phone1Kind) {
  return kindergartenProfile$Phone1Kind?.value;
}

enums.KindergartenProfile$Phone1Kind kindergartenProfile$Phone1KindFromJson(
  Object? kindergartenProfile$Phone1Kind, [
  enums.KindergartenProfile$Phone1Kind? defaultValue,
]) {
  return enums.KindergartenProfile$Phone1Kind.values
          .firstWhereOrNull((e) => e.value == kindergartenProfile$Phone1Kind) ??
      defaultValue ??
      enums.KindergartenProfile$Phone1Kind.swaggerGeneratedUnknown;
}

List<String> kindergartenProfile$Phone1KindListToJson(
    List<enums.KindergartenProfile$Phone1Kind>?
        kindergartenProfile$Phone1Kind) {
  if (kindergartenProfile$Phone1Kind == null) {
    return [];
  }

  return kindergartenProfile$Phone1Kind.map((e) => e.value!).toList();
}

List<enums.KindergartenProfile$Phone1Kind>
    kindergartenProfile$Phone1KindListFromJson(
  List? kindergartenProfile$Phone1Kind, [
  List<enums.KindergartenProfile$Phone1Kind>? defaultValue,
]) {
  if (kindergartenProfile$Phone1Kind == null) {
    return defaultValue ?? [];
  }

  return kindergartenProfile$Phone1Kind
      .map((e) => kindergartenProfile$Phone1KindFromJson(e.toString()))
      .toList();
}

List<enums.KindergartenProfile$Phone1Kind>?
    kindergartenProfile$Phone1KindNullableListFromJson(
  List? kindergartenProfile$Phone1Kind, [
  List<enums.KindergartenProfile$Phone1Kind>? defaultValue,
]) {
  if (kindergartenProfile$Phone1Kind == null) {
    return defaultValue;
  }

  return kindergartenProfile$Phone1Kind
      .map((e) => kindergartenProfile$Phone1KindFromJson(e.toString()))
      .toList();
}

String? kindergartenProfile$Phone2KindToJson(
    enums.KindergartenProfile$Phone2Kind? kindergartenProfile$Phone2Kind) {
  return kindergartenProfile$Phone2Kind?.value;
}

enums.KindergartenProfile$Phone2Kind kindergartenProfile$Phone2KindFromJson(
  Object? kindergartenProfile$Phone2Kind, [
  enums.KindergartenProfile$Phone2Kind? defaultValue,
]) {
  return enums.KindergartenProfile$Phone2Kind.values
          .firstWhereOrNull((e) => e.value == kindergartenProfile$Phone2Kind) ??
      defaultValue ??
      enums.KindergartenProfile$Phone2Kind.swaggerGeneratedUnknown;
}

List<String> kindergartenProfile$Phone2KindListToJson(
    List<enums.KindergartenProfile$Phone2Kind>?
        kindergartenProfile$Phone2Kind) {
  if (kindergartenProfile$Phone2Kind == null) {
    return [];
  }

  return kindergartenProfile$Phone2Kind.map((e) => e.value!).toList();
}

List<enums.KindergartenProfile$Phone2Kind>
    kindergartenProfile$Phone2KindListFromJson(
  List? kindergartenProfile$Phone2Kind, [
  List<enums.KindergartenProfile$Phone2Kind>? defaultValue,
]) {
  if (kindergartenProfile$Phone2Kind == null) {
    return defaultValue ?? [];
  }

  return kindergartenProfile$Phone2Kind
      .map((e) => kindergartenProfile$Phone2KindFromJson(e.toString()))
      .toList();
}

List<enums.KindergartenProfile$Phone2Kind>?
    kindergartenProfile$Phone2KindNullableListFromJson(
  List? kindergartenProfile$Phone2Kind, [
  List<enums.KindergartenProfile$Phone2Kind>? defaultValue,
]) {
  if (kindergartenProfile$Phone2Kind == null) {
    return defaultValue;
  }

  return kindergartenProfile$Phone2Kind
      .map((e) => kindergartenProfile$Phone2KindFromJson(e.toString()))
      .toList();
}

String? kindergartenProfileChildCareTypeToJson(
    enums.KindergartenProfileChildCareType? kindergartenProfileChildCareType) {
  return kindergartenProfileChildCareType?.value;
}

enums.KindergartenProfileChildCareType kindergartenProfileChildCareTypeFromJson(
  Object? kindergartenProfileChildCareType, [
  enums.KindergartenProfileChildCareType? defaultValue,
]) {
  return enums.KindergartenProfileChildCareType.values.firstWhereOrNull(
          (e) => e.value == kindergartenProfileChildCareType) ??
      defaultValue ??
      enums.KindergartenProfileChildCareType.swaggerGeneratedUnknown;
}

List<String> kindergartenProfileChildCareTypeListToJson(
    List<enums.KindergartenProfileChildCareType>?
        kindergartenProfileChildCareType) {
  if (kindergartenProfileChildCareType == null) {
    return [];
  }

  return kindergartenProfileChildCareType.map((e) => e.value!).toList();
}

List<enums.KindergartenProfileChildCareType>
    kindergartenProfileChildCareTypeListFromJson(
  List? kindergartenProfileChildCareType, [
  List<enums.KindergartenProfileChildCareType>? defaultValue,
]) {
  if (kindergartenProfileChildCareType == null) {
    return defaultValue ?? [];
  }

  return kindergartenProfileChildCareType
      .map((e) => kindergartenProfileChildCareTypeFromJson(e.toString()))
      .toList();
}

List<enums.KindergartenProfileChildCareType>?
    kindergartenProfileChildCareTypeNullableListFromJson(
  List? kindergartenProfileChildCareType, [
  List<enums.KindergartenProfileChildCareType>? defaultValue,
]) {
  if (kindergartenProfileChildCareType == null) {
    return defaultValue;
  }

  return kindergartenProfileChildCareType
      .map((e) => kindergartenProfileChildCareTypeFromJson(e.toString()))
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

String? educatorRegistration$PhoneKindToJson(
    enums.EducatorRegistration$PhoneKind? educatorRegistration$PhoneKind) {
  return educatorRegistration$PhoneKind?.value;
}

enums.EducatorRegistration$PhoneKind educatorRegistration$PhoneKindFromJson(
  Object? educatorRegistration$PhoneKind, [
  enums.EducatorRegistration$PhoneKind? defaultValue,
]) {
  return enums.EducatorRegistration$PhoneKind.values
          .firstWhereOrNull((e) => e.value == educatorRegistration$PhoneKind) ??
      defaultValue ??
      enums.EducatorRegistration$PhoneKind.swaggerGeneratedUnknown;
}

List<String> educatorRegistration$PhoneKindListToJson(
    List<enums.EducatorRegistration$PhoneKind>?
        educatorRegistration$PhoneKind) {
  if (educatorRegistration$PhoneKind == null) {
    return [];
  }

  return educatorRegistration$PhoneKind.map((e) => e.value!).toList();
}

List<enums.EducatorRegistration$PhoneKind>
    educatorRegistration$PhoneKindListFromJson(
  List? educatorRegistration$PhoneKind, [
  List<enums.EducatorRegistration$PhoneKind>? defaultValue,
]) {
  if (educatorRegistration$PhoneKind == null) {
    return defaultValue ?? [];
  }

  return educatorRegistration$PhoneKind
      .map((e) => educatorRegistration$PhoneKindFromJson(e.toString()))
      .toList();
}

List<enums.EducatorRegistration$PhoneKind>?
    educatorRegistration$PhoneKindNullableListFromJson(
  List? educatorRegistration$PhoneKind, [
  List<enums.EducatorRegistration$PhoneKind>? defaultValue,
]) {
  if (educatorRegistration$PhoneKind == null) {
    return defaultValue;
  }

  return educatorRegistration$PhoneKind
      .map((e) => educatorRegistration$PhoneKindFromJson(e.toString()))
      .toList();
}

String? educatorRegistrationSexToJson(
    enums.EducatorRegistrationSex? educatorRegistrationSex) {
  return educatorRegistrationSex?.value;
}

enums.EducatorRegistrationSex educatorRegistrationSexFromJson(
  Object? educatorRegistrationSex, [
  enums.EducatorRegistrationSex? defaultValue,
]) {
  return enums.EducatorRegistrationSex.values
          .firstWhereOrNull((e) => e.value == educatorRegistrationSex) ??
      defaultValue ??
      enums.EducatorRegistrationSex.swaggerGeneratedUnknown;
}

List<String> educatorRegistrationSexListToJson(
    List<enums.EducatorRegistrationSex>? educatorRegistrationSex) {
  if (educatorRegistrationSex == null) {
    return [];
  }

  return educatorRegistrationSex.map((e) => e.value!).toList();
}

List<enums.EducatorRegistrationSex> educatorRegistrationSexListFromJson(
  List? educatorRegistrationSex, [
  List<enums.EducatorRegistrationSex>? defaultValue,
]) {
  if (educatorRegistrationSex == null) {
    return defaultValue ?? [];
  }

  return educatorRegistrationSex
      .map((e) => educatorRegistrationSexFromJson(e.toString()))
      .toList();
}

List<enums.EducatorRegistrationSex>?
    educatorRegistrationSexNullableListFromJson(
  List? educatorRegistrationSex, [
  List<enums.EducatorRegistrationSex>? defaultValue,
]) {
  if (educatorRegistrationSex == null) {
    return defaultValue;
  }

  return educatorRegistrationSex
      .map((e) => educatorRegistrationSexFromJson(e.toString()))
      .toList();
}

String? parentRegistration$PhoneKindToJson(
    enums.ParentRegistration$PhoneKind? parentRegistration$PhoneKind) {
  return parentRegistration$PhoneKind?.value;
}

enums.ParentRegistration$PhoneKind parentRegistration$PhoneKindFromJson(
  Object? parentRegistration$PhoneKind, [
  enums.ParentRegistration$PhoneKind? defaultValue,
]) {
  return enums.ParentRegistration$PhoneKind.values
          .firstWhereOrNull((e) => e.value == parentRegistration$PhoneKind) ??
      defaultValue ??
      enums.ParentRegistration$PhoneKind.swaggerGeneratedUnknown;
}

List<String> parentRegistration$PhoneKindListToJson(
    List<enums.ParentRegistration$PhoneKind>? parentRegistration$PhoneKind) {
  if (parentRegistration$PhoneKind == null) {
    return [];
  }

  return parentRegistration$PhoneKind.map((e) => e.value!).toList();
}

List<enums.ParentRegistration$PhoneKind>
    parentRegistration$PhoneKindListFromJson(
  List? parentRegistration$PhoneKind, [
  List<enums.ParentRegistration$PhoneKind>? defaultValue,
]) {
  if (parentRegistration$PhoneKind == null) {
    return defaultValue ?? [];
  }

  return parentRegistration$PhoneKind
      .map((e) => parentRegistration$PhoneKindFromJson(e.toString()))
      .toList();
}

List<enums.ParentRegistration$PhoneKind>?
    parentRegistration$PhoneKindNullableListFromJson(
  List? parentRegistration$PhoneKind, [
  List<enums.ParentRegistration$PhoneKind>? defaultValue,
]) {
  if (parentRegistration$PhoneKind == null) {
    return defaultValue;
  }

  return parentRegistration$PhoneKind
      .map((e) => parentRegistration$PhoneKindFromJson(e.toString()))
      .toList();
}

String? parentRegistrationSexToJson(
    enums.ParentRegistrationSex? parentRegistrationSex) {
  return parentRegistrationSex?.value;
}

enums.ParentRegistrationSex parentRegistrationSexFromJson(
  Object? parentRegistrationSex, [
  enums.ParentRegistrationSex? defaultValue,
]) {
  return enums.ParentRegistrationSex.values
          .firstWhereOrNull((e) => e.value == parentRegistrationSex) ??
      defaultValue ??
      enums.ParentRegistrationSex.swaggerGeneratedUnknown;
}

List<String> parentRegistrationSexListToJson(
    List<enums.ParentRegistrationSex>? parentRegistrationSex) {
  if (parentRegistrationSex == null) {
    return [];
  }

  return parentRegistrationSex.map((e) => e.value!).toList();
}

List<enums.ParentRegistrationSex> parentRegistrationSexListFromJson(
  List? parentRegistrationSex, [
  List<enums.ParentRegistrationSex>? defaultValue,
]) {
  if (parentRegistrationSex == null) {
    return defaultValue ?? [];
  }

  return parentRegistrationSex
      .map((e) => parentRegistrationSexFromJson(e.toString()))
      .toList();
}

List<enums.ParentRegistrationSex>? parentRegistrationSexNullableListFromJson(
  List? parentRegistrationSex, [
  List<enums.ParentRegistrationSex>? defaultValue,
]) {
  if (parentRegistrationSex == null) {
    return defaultValue;
  }

  return parentRegistrationSex
      .map((e) => parentRegistrationSexFromJson(e.toString()))
      .toList();
}

String? familyRegistrationPrimaryContactToJson(
    enums.FamilyRegistrationPrimaryContact? familyRegistrationPrimaryContact) {
  return familyRegistrationPrimaryContact?.value;
}

enums.FamilyRegistrationPrimaryContact familyRegistrationPrimaryContactFromJson(
  Object? familyRegistrationPrimaryContact, [
  enums.FamilyRegistrationPrimaryContact? defaultValue,
]) {
  return enums.FamilyRegistrationPrimaryContact.values.firstWhereOrNull(
          (e) => e.value == familyRegistrationPrimaryContact) ??
      defaultValue ??
      enums.FamilyRegistrationPrimaryContact.swaggerGeneratedUnknown;
}

List<String> familyRegistrationPrimaryContactListToJson(
    List<enums.FamilyRegistrationPrimaryContact>?
        familyRegistrationPrimaryContact) {
  if (familyRegistrationPrimaryContact == null) {
    return [];
  }

  return familyRegistrationPrimaryContact.map((e) => e.value!).toList();
}

List<enums.FamilyRegistrationPrimaryContact>
    familyRegistrationPrimaryContactListFromJson(
  List? familyRegistrationPrimaryContact, [
  List<enums.FamilyRegistrationPrimaryContact>? defaultValue,
]) {
  if (familyRegistrationPrimaryContact == null) {
    return defaultValue ?? [];
  }

  return familyRegistrationPrimaryContact
      .map((e) => familyRegistrationPrimaryContactFromJson(e.toString()))
      .toList();
}

List<enums.FamilyRegistrationPrimaryContact>?
    familyRegistrationPrimaryContactNullableListFromJson(
  List? familyRegistrationPrimaryContact, [
  List<enums.FamilyRegistrationPrimaryContact>? defaultValue,
]) {
  if (familyRegistrationPrimaryContact == null) {
    return defaultValue;
  }

  return familyRegistrationPrimaryContact
      .map((e) => familyRegistrationPrimaryContactFromJson(e.toString()))
      .toList();
}

String? kindergartenRegistration$PhoneKindToJson(
    enums.KindergartenRegistration$PhoneKind?
        kindergartenRegistration$PhoneKind) {
  return kindergartenRegistration$PhoneKind?.value;
}

enums.KindergartenRegistration$PhoneKind
    kindergartenRegistration$PhoneKindFromJson(
  Object? kindergartenRegistration$PhoneKind, [
  enums.KindergartenRegistration$PhoneKind? defaultValue,
]) {
  return enums.KindergartenRegistration$PhoneKind.values.firstWhereOrNull(
          (e) => e.value == kindergartenRegistration$PhoneKind) ??
      defaultValue ??
      enums.KindergartenRegistration$PhoneKind.swaggerGeneratedUnknown;
}

List<String> kindergartenRegistration$PhoneKindListToJson(
    List<enums.KindergartenRegistration$PhoneKind>?
        kindergartenRegistration$PhoneKind) {
  if (kindergartenRegistration$PhoneKind == null) {
    return [];
  }

  return kindergartenRegistration$PhoneKind.map((e) => e.value!).toList();
}

List<enums.KindergartenRegistration$PhoneKind>
    kindergartenRegistration$PhoneKindListFromJson(
  List? kindergartenRegistration$PhoneKind, [
  List<enums.KindergartenRegistration$PhoneKind>? defaultValue,
]) {
  if (kindergartenRegistration$PhoneKind == null) {
    return defaultValue ?? [];
  }

  return kindergartenRegistration$PhoneKind
      .map((e) => kindergartenRegistration$PhoneKindFromJson(e.toString()))
      .toList();
}

List<enums.KindergartenRegistration$PhoneKind>?
    kindergartenRegistration$PhoneKindNullableListFromJson(
  List? kindergartenRegistration$PhoneKind, [
  List<enums.KindergartenRegistration$PhoneKind>? defaultValue,
]) {
  if (kindergartenRegistration$PhoneKind == null) {
    return defaultValue;
  }

  return kindergartenRegistration$PhoneKind
      .map((e) => kindergartenRegistration$PhoneKindFromJson(e.toString()))
      .toList();
}

String? kindergartenRegistration$Phone1KindToJson(
    enums.KindergartenRegistration$Phone1Kind?
        kindergartenRegistration$Phone1Kind) {
  return kindergartenRegistration$Phone1Kind?.value;
}

enums.KindergartenRegistration$Phone1Kind
    kindergartenRegistration$Phone1KindFromJson(
  Object? kindergartenRegistration$Phone1Kind, [
  enums.KindergartenRegistration$Phone1Kind? defaultValue,
]) {
  return enums.KindergartenRegistration$Phone1Kind.values.firstWhereOrNull(
          (e) => e.value == kindergartenRegistration$Phone1Kind) ??
      defaultValue ??
      enums.KindergartenRegistration$Phone1Kind.swaggerGeneratedUnknown;
}

List<String> kindergartenRegistration$Phone1KindListToJson(
    List<enums.KindergartenRegistration$Phone1Kind>?
        kindergartenRegistration$Phone1Kind) {
  if (kindergartenRegistration$Phone1Kind == null) {
    return [];
  }

  return kindergartenRegistration$Phone1Kind.map((e) => e.value!).toList();
}

List<enums.KindergartenRegistration$Phone1Kind>
    kindergartenRegistration$Phone1KindListFromJson(
  List? kindergartenRegistration$Phone1Kind, [
  List<enums.KindergartenRegistration$Phone1Kind>? defaultValue,
]) {
  if (kindergartenRegistration$Phone1Kind == null) {
    return defaultValue ?? [];
  }

  return kindergartenRegistration$Phone1Kind
      .map((e) => kindergartenRegistration$Phone1KindFromJson(e.toString()))
      .toList();
}

List<enums.KindergartenRegistration$Phone1Kind>?
    kindergartenRegistration$Phone1KindNullableListFromJson(
  List? kindergartenRegistration$Phone1Kind, [
  List<enums.KindergartenRegistration$Phone1Kind>? defaultValue,
]) {
  if (kindergartenRegistration$Phone1Kind == null) {
    return defaultValue;
  }

  return kindergartenRegistration$Phone1Kind
      .map((e) => kindergartenRegistration$Phone1KindFromJson(e.toString()))
      .toList();
}

String? kindergartenRegistration$Phone2KindToJson(
    enums.KindergartenRegistration$Phone2Kind?
        kindergartenRegistration$Phone2Kind) {
  return kindergartenRegistration$Phone2Kind?.value;
}

enums.KindergartenRegistration$Phone2Kind
    kindergartenRegistration$Phone2KindFromJson(
  Object? kindergartenRegistration$Phone2Kind, [
  enums.KindergartenRegistration$Phone2Kind? defaultValue,
]) {
  return enums.KindergartenRegistration$Phone2Kind.values.firstWhereOrNull(
          (e) => e.value == kindergartenRegistration$Phone2Kind) ??
      defaultValue ??
      enums.KindergartenRegistration$Phone2Kind.swaggerGeneratedUnknown;
}

List<String> kindergartenRegistration$Phone2KindListToJson(
    List<enums.KindergartenRegistration$Phone2Kind>?
        kindergartenRegistration$Phone2Kind) {
  if (kindergartenRegistration$Phone2Kind == null) {
    return [];
  }

  return kindergartenRegistration$Phone2Kind.map((e) => e.value!).toList();
}

List<enums.KindergartenRegistration$Phone2Kind>
    kindergartenRegistration$Phone2KindListFromJson(
  List? kindergartenRegistration$Phone2Kind, [
  List<enums.KindergartenRegistration$Phone2Kind>? defaultValue,
]) {
  if (kindergartenRegistration$Phone2Kind == null) {
    return defaultValue ?? [];
  }

  return kindergartenRegistration$Phone2Kind
      .map((e) => kindergartenRegistration$Phone2KindFromJson(e.toString()))
      .toList();
}

List<enums.KindergartenRegistration$Phone2Kind>?
    kindergartenRegistration$Phone2KindNullableListFromJson(
  List? kindergartenRegistration$Phone2Kind, [
  List<enums.KindergartenRegistration$Phone2Kind>? defaultValue,
]) {
  if (kindergartenRegistration$Phone2Kind == null) {
    return defaultValue;
  }

  return kindergartenRegistration$Phone2Kind
      .map((e) => kindergartenRegistration$Phone2KindFromJson(e.toString()))
      .toList();
}

String? kindergartenRegistrationChildCareTypeToJson(
    enums.KindergartenRegistrationChildCareType?
        kindergartenRegistrationChildCareType) {
  return kindergartenRegistrationChildCareType?.value;
}

enums.KindergartenRegistrationChildCareType
    kindergartenRegistrationChildCareTypeFromJson(
  Object? kindergartenRegistrationChildCareType, [
  enums.KindergartenRegistrationChildCareType? defaultValue,
]) {
  return enums.KindergartenRegistrationChildCareType.values.firstWhereOrNull(
          (e) => e.value == kindergartenRegistrationChildCareType) ??
      defaultValue ??
      enums.KindergartenRegistrationChildCareType.swaggerGeneratedUnknown;
}

List<String> kindergartenRegistrationChildCareTypeListToJson(
    List<enums.KindergartenRegistrationChildCareType>?
        kindergartenRegistrationChildCareType) {
  if (kindergartenRegistrationChildCareType == null) {
    return [];
  }

  return kindergartenRegistrationChildCareType.map((e) => e.value!).toList();
}

List<enums.KindergartenRegistrationChildCareType>
    kindergartenRegistrationChildCareTypeListFromJson(
  List? kindergartenRegistrationChildCareType, [
  List<enums.KindergartenRegistrationChildCareType>? defaultValue,
]) {
  if (kindergartenRegistrationChildCareType == null) {
    return defaultValue ?? [];
  }

  return kindergartenRegistrationChildCareType
      .map((e) => kindergartenRegistrationChildCareTypeFromJson(e.toString()))
      .toList();
}

List<enums.KindergartenRegistrationChildCareType>?
    kindergartenRegistrationChildCareTypeNullableListFromJson(
  List? kindergartenRegistrationChildCareType, [
  List<enums.KindergartenRegistrationChildCareType>? defaultValue,
]) {
  if (kindergartenRegistrationChildCareType == null) {
    return defaultValue;
  }

  return kindergartenRegistrationChildCareType
      .map((e) => kindergartenRegistrationChildCareTypeFromJson(e.toString()))
      .toList();
}

String? educatorContractRegistrationEducator$PhoneKindToJson(
    enums.EducatorContractRegistrationEducator$PhoneKind?
        educatorContractRegistrationEducator$PhoneKind) {
  return educatorContractRegistrationEducator$PhoneKind?.value;
}

enums.EducatorContractRegistrationEducator$PhoneKind
    educatorContractRegistrationEducator$PhoneKindFromJson(
  Object? educatorContractRegistrationEducator$PhoneKind, [
  enums.EducatorContractRegistrationEducator$PhoneKind? defaultValue,
]) {
  return enums.EducatorContractRegistrationEducator$PhoneKind.values
          .firstWhereOrNull((e) =>
              e.value == educatorContractRegistrationEducator$PhoneKind) ??
      defaultValue ??
      enums.EducatorContractRegistrationEducator$PhoneKind
          .swaggerGeneratedUnknown;
}

List<String> educatorContractRegistrationEducator$PhoneKindListToJson(
    List<enums.EducatorContractRegistrationEducator$PhoneKind>?
        educatorContractRegistrationEducator$PhoneKind) {
  if (educatorContractRegistrationEducator$PhoneKind == null) {
    return [];
  }

  return educatorContractRegistrationEducator$PhoneKind
      .map((e) => e.value!)
      .toList();
}

List<enums.EducatorContractRegistrationEducator$PhoneKind>
    educatorContractRegistrationEducator$PhoneKindListFromJson(
  List? educatorContractRegistrationEducator$PhoneKind, [
  List<enums.EducatorContractRegistrationEducator$PhoneKind>? defaultValue,
]) {
  if (educatorContractRegistrationEducator$PhoneKind == null) {
    return defaultValue ?? [];
  }

  return educatorContractRegistrationEducator$PhoneKind
      .map((e) =>
          educatorContractRegistrationEducator$PhoneKindFromJson(e.toString()))
      .toList();
}

List<enums.EducatorContractRegistrationEducator$PhoneKind>?
    educatorContractRegistrationEducator$PhoneKindNullableListFromJson(
  List? educatorContractRegistrationEducator$PhoneKind, [
  List<enums.EducatorContractRegistrationEducator$PhoneKind>? defaultValue,
]) {
  if (educatorContractRegistrationEducator$PhoneKind == null) {
    return defaultValue;
  }

  return educatorContractRegistrationEducator$PhoneKind
      .map((e) =>
          educatorContractRegistrationEducator$PhoneKindFromJson(e.toString()))
      .toList();
}

String? educatorContractRegistrationEducatorSexToJson(
    enums.EducatorContractRegistrationEducatorSex?
        educatorContractRegistrationEducatorSex) {
  return educatorContractRegistrationEducatorSex?.value;
}

enums.EducatorContractRegistrationEducatorSex
    educatorContractRegistrationEducatorSexFromJson(
  Object? educatorContractRegistrationEducatorSex, [
  enums.EducatorContractRegistrationEducatorSex? defaultValue,
]) {
  return enums.EducatorContractRegistrationEducatorSex.values.firstWhereOrNull(
          (e) => e.value == educatorContractRegistrationEducatorSex) ??
      defaultValue ??
      enums.EducatorContractRegistrationEducatorSex.swaggerGeneratedUnknown;
}

List<String> educatorContractRegistrationEducatorSexListToJson(
    List<enums.EducatorContractRegistrationEducatorSex>?
        educatorContractRegistrationEducatorSex) {
  if (educatorContractRegistrationEducatorSex == null) {
    return [];
  }

  return educatorContractRegistrationEducatorSex.map((e) => e.value!).toList();
}

List<enums.EducatorContractRegistrationEducatorSex>
    educatorContractRegistrationEducatorSexListFromJson(
  List? educatorContractRegistrationEducatorSex, [
  List<enums.EducatorContractRegistrationEducatorSex>? defaultValue,
]) {
  if (educatorContractRegistrationEducatorSex == null) {
    return defaultValue ?? [];
  }

  return educatorContractRegistrationEducatorSex
      .map((e) => educatorContractRegistrationEducatorSexFromJson(e.toString()))
      .toList();
}

List<enums.EducatorContractRegistrationEducatorSex>?
    educatorContractRegistrationEducatorSexNullableListFromJson(
  List? educatorContractRegistrationEducatorSex, [
  List<enums.EducatorContractRegistrationEducatorSex>? defaultValue,
]) {
  if (educatorContractRegistrationEducatorSex == null) {
    return defaultValue;
  }

  return educatorContractRegistrationEducatorSex
      .map((e) => educatorContractRegistrationEducatorSexFromJson(e.toString()))
      .toList();
}

String? educatorContractRegistrationStatusActionToJson(
    enums.EducatorContractRegistrationStatusAction?
        educatorContractRegistrationStatusAction) {
  return educatorContractRegistrationStatusAction?.value;
}

enums.EducatorContractRegistrationStatusAction
    educatorContractRegistrationStatusActionFromJson(
  Object? educatorContractRegistrationStatusAction, [
  enums.EducatorContractRegistrationStatusAction? defaultValue,
]) {
  return enums.EducatorContractRegistrationStatusAction.values.firstWhereOrNull(
          (e) => e.value == educatorContractRegistrationStatusAction) ??
      defaultValue ??
      enums.EducatorContractRegistrationStatusAction.swaggerGeneratedUnknown;
}

List<String> educatorContractRegistrationStatusActionListToJson(
    List<enums.EducatorContractRegistrationStatusAction>?
        educatorContractRegistrationStatusAction) {
  if (educatorContractRegistrationStatusAction == null) {
    return [];
  }

  return educatorContractRegistrationStatusAction.map((e) => e.value!).toList();
}

List<enums.EducatorContractRegistrationStatusAction>
    educatorContractRegistrationStatusActionListFromJson(
  List? educatorContractRegistrationStatusAction, [
  List<enums.EducatorContractRegistrationStatusAction>? defaultValue,
]) {
  if (educatorContractRegistrationStatusAction == null) {
    return defaultValue ?? [];
  }

  return educatorContractRegistrationStatusAction
      .map(
          (e) => educatorContractRegistrationStatusActionFromJson(e.toString()))
      .toList();
}

List<enums.EducatorContractRegistrationStatusAction>?
    educatorContractRegistrationStatusActionNullableListFromJson(
  List? educatorContractRegistrationStatusAction, [
  List<enums.EducatorContractRegistrationStatusAction>? defaultValue,
]) {
  if (educatorContractRegistrationStatusAction == null) {
    return defaultValue;
  }

  return educatorContractRegistrationStatusAction
      .map(
          (e) => educatorContractRegistrationStatusActionFromJson(e.toString()))
      .toList();
}

String? inscriptionRegistrationParent$PhoneKindToJson(
    enums.InscriptionRegistrationParent$PhoneKind?
        inscriptionRegistrationParent$PhoneKind) {
  return inscriptionRegistrationParent$PhoneKind?.value;
}

enums.InscriptionRegistrationParent$PhoneKind
    inscriptionRegistrationParent$PhoneKindFromJson(
  Object? inscriptionRegistrationParent$PhoneKind, [
  enums.InscriptionRegistrationParent$PhoneKind? defaultValue,
]) {
  return enums.InscriptionRegistrationParent$PhoneKind.values.firstWhereOrNull(
          (e) => e.value == inscriptionRegistrationParent$PhoneKind) ??
      defaultValue ??
      enums.InscriptionRegistrationParent$PhoneKind.swaggerGeneratedUnknown;
}

List<String> inscriptionRegistrationParent$PhoneKindListToJson(
    List<enums.InscriptionRegistrationParent$PhoneKind>?
        inscriptionRegistrationParent$PhoneKind) {
  if (inscriptionRegistrationParent$PhoneKind == null) {
    return [];
  }

  return inscriptionRegistrationParent$PhoneKind.map((e) => e.value!).toList();
}

List<enums.InscriptionRegistrationParent$PhoneKind>
    inscriptionRegistrationParent$PhoneKindListFromJson(
  List? inscriptionRegistrationParent$PhoneKind, [
  List<enums.InscriptionRegistrationParent$PhoneKind>? defaultValue,
]) {
  if (inscriptionRegistrationParent$PhoneKind == null) {
    return defaultValue ?? [];
  }

  return inscriptionRegistrationParent$PhoneKind
      .map((e) => inscriptionRegistrationParent$PhoneKindFromJson(e.toString()))
      .toList();
}

List<enums.InscriptionRegistrationParent$PhoneKind>?
    inscriptionRegistrationParent$PhoneKindNullableListFromJson(
  List? inscriptionRegistrationParent$PhoneKind, [
  List<enums.InscriptionRegistrationParent$PhoneKind>? defaultValue,
]) {
  if (inscriptionRegistrationParent$PhoneKind == null) {
    return defaultValue;
  }

  return inscriptionRegistrationParent$PhoneKind
      .map((e) => inscriptionRegistrationParent$PhoneKindFromJson(e.toString()))
      .toList();
}

String? inscriptionRegistrationParentSexToJson(
    enums.InscriptionRegistrationParentSex? inscriptionRegistrationParentSex) {
  return inscriptionRegistrationParentSex?.value;
}

enums.InscriptionRegistrationParentSex inscriptionRegistrationParentSexFromJson(
  Object? inscriptionRegistrationParentSex, [
  enums.InscriptionRegistrationParentSex? defaultValue,
]) {
  return enums.InscriptionRegistrationParentSex.values.firstWhereOrNull(
          (e) => e.value == inscriptionRegistrationParentSex) ??
      defaultValue ??
      enums.InscriptionRegistrationParentSex.swaggerGeneratedUnknown;
}

List<String> inscriptionRegistrationParentSexListToJson(
    List<enums.InscriptionRegistrationParentSex>?
        inscriptionRegistrationParentSex) {
  if (inscriptionRegistrationParentSex == null) {
    return [];
  }

  return inscriptionRegistrationParentSex.map((e) => e.value!).toList();
}

List<enums.InscriptionRegistrationParentSex>
    inscriptionRegistrationParentSexListFromJson(
  List? inscriptionRegistrationParentSex, [
  List<enums.InscriptionRegistrationParentSex>? defaultValue,
]) {
  if (inscriptionRegistrationParentSex == null) {
    return defaultValue ?? [];
  }

  return inscriptionRegistrationParentSex
      .map((e) => inscriptionRegistrationParentSexFromJson(e.toString()))
      .toList();
}

List<enums.InscriptionRegistrationParentSex>?
    inscriptionRegistrationParentSexNullableListFromJson(
  List? inscriptionRegistrationParentSex, [
  List<enums.InscriptionRegistrationParentSex>? defaultValue,
]) {
  if (inscriptionRegistrationParentSex == null) {
    return defaultValue;
  }

  return inscriptionRegistrationParentSex
      .map((e) => inscriptionRegistrationParentSexFromJson(e.toString()))
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

String? inscriptionChildSexToJson(
    enums.InscriptionChildSex? inscriptionChildSex) {
  return inscriptionChildSex?.value;
}

enums.InscriptionChildSex inscriptionChildSexFromJson(
  Object? inscriptionChildSex, [
  enums.InscriptionChildSex? defaultValue,
]) {
  return enums.InscriptionChildSex.values
          .firstWhereOrNull((e) => e.value == inscriptionChildSex) ??
      defaultValue ??
      enums.InscriptionChildSex.swaggerGeneratedUnknown;
}

List<String> inscriptionChildSexListToJson(
    List<enums.InscriptionChildSex>? inscriptionChildSex) {
  if (inscriptionChildSex == null) {
    return [];
  }

  return inscriptionChildSex.map((e) => e.value!).toList();
}

List<enums.InscriptionChildSex> inscriptionChildSexListFromJson(
  List? inscriptionChildSex, [
  List<enums.InscriptionChildSex>? defaultValue,
]) {
  if (inscriptionChildSex == null) {
    return defaultValue ?? [];
  }

  return inscriptionChildSex
      .map((e) => inscriptionChildSexFromJson(e.toString()))
      .toList();
}

List<enums.InscriptionChildSex>? inscriptionChildSexNullableListFromJson(
  List? inscriptionChildSex, [
  List<enums.InscriptionChildSex>? defaultValue,
]) {
  if (inscriptionChildSex == null) {
    return defaultValue;
  }

  return inscriptionChildSex
      .map((e) => inscriptionChildSexFromJson(e.toString()))
      .toList();
}

String? inscriptionRegistrationStatusActionToJson(
    enums.InscriptionRegistrationStatusAction?
        inscriptionRegistrationStatusAction) {
  return inscriptionRegistrationStatusAction?.value;
}

enums.InscriptionRegistrationStatusAction
    inscriptionRegistrationStatusActionFromJson(
  Object? inscriptionRegistrationStatusAction, [
  enums.InscriptionRegistrationStatusAction? defaultValue,
]) {
  return enums.InscriptionRegistrationStatusAction.values.firstWhereOrNull(
          (e) => e.value == inscriptionRegistrationStatusAction) ??
      defaultValue ??
      enums.InscriptionRegistrationStatusAction.swaggerGeneratedUnknown;
}

List<String> inscriptionRegistrationStatusActionListToJson(
    List<enums.InscriptionRegistrationStatusAction>?
        inscriptionRegistrationStatusAction) {
  if (inscriptionRegistrationStatusAction == null) {
    return [];
  }

  return inscriptionRegistrationStatusAction.map((e) => e.value!).toList();
}

List<enums.InscriptionRegistrationStatusAction>
    inscriptionRegistrationStatusActionListFromJson(
  List? inscriptionRegistrationStatusAction, [
  List<enums.InscriptionRegistrationStatusAction>? defaultValue,
]) {
  if (inscriptionRegistrationStatusAction == null) {
    return defaultValue ?? [];
  }

  return inscriptionRegistrationStatusAction
      .map((e) => inscriptionRegistrationStatusActionFromJson(e.toString()))
      .toList();
}

List<enums.InscriptionRegistrationStatusAction>?
    inscriptionRegistrationStatusActionNullableListFromJson(
  List? inscriptionRegistrationStatusAction, [
  List<enums.InscriptionRegistrationStatusAction>? defaultValue,
]) {
  if (inscriptionRegistrationStatusAction == null) {
    return defaultValue;
  }

  return inscriptionRegistrationStatusAction
      .map((e) => inscriptionRegistrationStatusActionFromJson(e.toString()))
      .toList();
}

String? parentInvitationRegistration$PhoneKindToJson(
    enums.ParentInvitationRegistration$PhoneKind?
        parentInvitationRegistration$PhoneKind) {
  return parentInvitationRegistration$PhoneKind?.value;
}

enums.ParentInvitationRegistration$PhoneKind
    parentInvitationRegistration$PhoneKindFromJson(
  Object? parentInvitationRegistration$PhoneKind, [
  enums.ParentInvitationRegistration$PhoneKind? defaultValue,
]) {
  return enums.ParentInvitationRegistration$PhoneKind.values.firstWhereOrNull(
          (e) => e.value == parentInvitationRegistration$PhoneKind) ??
      defaultValue ??
      enums.ParentInvitationRegistration$PhoneKind.swaggerGeneratedUnknown;
}

List<String> parentInvitationRegistration$PhoneKindListToJson(
    List<enums.ParentInvitationRegistration$PhoneKind>?
        parentInvitationRegistration$PhoneKind) {
  if (parentInvitationRegistration$PhoneKind == null) {
    return [];
  }

  return parentInvitationRegistration$PhoneKind.map((e) => e.value!).toList();
}

List<enums.ParentInvitationRegistration$PhoneKind>
    parentInvitationRegistration$PhoneKindListFromJson(
  List? parentInvitationRegistration$PhoneKind, [
  List<enums.ParentInvitationRegistration$PhoneKind>? defaultValue,
]) {
  if (parentInvitationRegistration$PhoneKind == null) {
    return defaultValue ?? [];
  }

  return parentInvitationRegistration$PhoneKind
      .map((e) => parentInvitationRegistration$PhoneKindFromJson(e.toString()))
      .toList();
}

List<enums.ParentInvitationRegistration$PhoneKind>?
    parentInvitationRegistration$PhoneKindNullableListFromJson(
  List? parentInvitationRegistration$PhoneKind, [
  List<enums.ParentInvitationRegistration$PhoneKind>? defaultValue,
]) {
  if (parentInvitationRegistration$PhoneKind == null) {
    return defaultValue;
  }

  return parentInvitationRegistration$PhoneKind
      .map((e) => parentInvitationRegistration$PhoneKindFromJson(e.toString()))
      .toList();
}

String? parentInvitationRegistrationSexToJson(
    enums.ParentInvitationRegistrationSex? parentInvitationRegistrationSex) {
  return parentInvitationRegistrationSex?.value;
}

enums.ParentInvitationRegistrationSex parentInvitationRegistrationSexFromJson(
  Object? parentInvitationRegistrationSex, [
  enums.ParentInvitationRegistrationSex? defaultValue,
]) {
  return enums.ParentInvitationRegistrationSex.values.firstWhereOrNull(
          (e) => e.value == parentInvitationRegistrationSex) ??
      defaultValue ??
      enums.ParentInvitationRegistrationSex.swaggerGeneratedUnknown;
}

List<String> parentInvitationRegistrationSexListToJson(
    List<enums.ParentInvitationRegistrationSex>?
        parentInvitationRegistrationSex) {
  if (parentInvitationRegistrationSex == null) {
    return [];
  }

  return parentInvitationRegistrationSex.map((e) => e.value!).toList();
}

List<enums.ParentInvitationRegistrationSex>
    parentInvitationRegistrationSexListFromJson(
  List? parentInvitationRegistrationSex, [
  List<enums.ParentInvitationRegistrationSex>? defaultValue,
]) {
  if (parentInvitationRegistrationSex == null) {
    return defaultValue ?? [];
  }

  return parentInvitationRegistrationSex
      .map((e) => parentInvitationRegistrationSexFromJson(e.toString()))
      .toList();
}

List<enums.ParentInvitationRegistrationSex>?
    parentInvitationRegistrationSexNullableListFromJson(
  List? parentInvitationRegistrationSex, [
  List<enums.ParentInvitationRegistrationSex>? defaultValue,
]) {
  if (parentInvitationRegistrationSex == null) {
    return defaultValue;
  }

  return parentInvitationRegistrationSex
      .map((e) => parentInvitationRegistrationSexFromJson(e.toString()))
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

String? childMedicalFileDefaultAllergySeverityToJson(
    enums.ChildMedicalFileDefaultAllergySeverity?
        childMedicalFileDefaultAllergySeverity) {
  return childMedicalFileDefaultAllergySeverity?.value;
}

enums.ChildMedicalFileDefaultAllergySeverity
    childMedicalFileDefaultAllergySeverityFromJson(
  Object? childMedicalFileDefaultAllergySeverity, [
  enums.ChildMedicalFileDefaultAllergySeverity? defaultValue,
]) {
  return enums.ChildMedicalFileDefaultAllergySeverity.values.firstWhereOrNull(
          (e) => e.value == childMedicalFileDefaultAllergySeverity) ??
      defaultValue ??
      enums.ChildMedicalFileDefaultAllergySeverity.swaggerGeneratedUnknown;
}

List<String> childMedicalFileDefaultAllergySeverityListToJson(
    List<enums.ChildMedicalFileDefaultAllergySeverity>?
        childMedicalFileDefaultAllergySeverity) {
  if (childMedicalFileDefaultAllergySeverity == null) {
    return [];
  }

  return childMedicalFileDefaultAllergySeverity.map((e) => e.value!).toList();
}

List<enums.ChildMedicalFileDefaultAllergySeverity>
    childMedicalFileDefaultAllergySeverityListFromJson(
  List? childMedicalFileDefaultAllergySeverity, [
  List<enums.ChildMedicalFileDefaultAllergySeverity>? defaultValue,
]) {
  if (childMedicalFileDefaultAllergySeverity == null) {
    return defaultValue ?? [];
  }

  return childMedicalFileDefaultAllergySeverity
      .map((e) => childMedicalFileDefaultAllergySeverityFromJson(e.toString()))
      .toList();
}

List<enums.ChildMedicalFileDefaultAllergySeverity>?
    childMedicalFileDefaultAllergySeverityNullableListFromJson(
  List? childMedicalFileDefaultAllergySeverity, [
  List<enums.ChildMedicalFileDefaultAllergySeverity>? defaultValue,
]) {
  if (childMedicalFileDefaultAllergySeverity == null) {
    return defaultValue;
  }

  return childMedicalFileDefaultAllergySeverity
      .map((e) => childMedicalFileDefaultAllergySeverityFromJson(e.toString()))
      .toList();
}

String? childMedicalFileDefaultMedicalConditionSeverityToJson(
    enums.ChildMedicalFileDefaultMedicalConditionSeverity?
        childMedicalFileDefaultMedicalConditionSeverity) {
  return childMedicalFileDefaultMedicalConditionSeverity?.value;
}

enums.ChildMedicalFileDefaultMedicalConditionSeverity
    childMedicalFileDefaultMedicalConditionSeverityFromJson(
  Object? childMedicalFileDefaultMedicalConditionSeverity, [
  enums.ChildMedicalFileDefaultMedicalConditionSeverity? defaultValue,
]) {
  return enums.ChildMedicalFileDefaultMedicalConditionSeverity.values
          .firstWhereOrNull((e) =>
              e.value == childMedicalFileDefaultMedicalConditionSeverity) ??
      defaultValue ??
      enums.ChildMedicalFileDefaultMedicalConditionSeverity
          .swaggerGeneratedUnknown;
}

List<String> childMedicalFileDefaultMedicalConditionSeverityListToJson(
    List<enums.ChildMedicalFileDefaultMedicalConditionSeverity>?
        childMedicalFileDefaultMedicalConditionSeverity) {
  if (childMedicalFileDefaultMedicalConditionSeverity == null) {
    return [];
  }

  return childMedicalFileDefaultMedicalConditionSeverity
      .map((e) => e.value!)
      .toList();
}

List<enums.ChildMedicalFileDefaultMedicalConditionSeverity>
    childMedicalFileDefaultMedicalConditionSeverityListFromJson(
  List? childMedicalFileDefaultMedicalConditionSeverity, [
  List<enums.ChildMedicalFileDefaultMedicalConditionSeverity>? defaultValue,
]) {
  if (childMedicalFileDefaultMedicalConditionSeverity == null) {
    return defaultValue ?? [];
  }

  return childMedicalFileDefaultMedicalConditionSeverity
      .map((e) =>
          childMedicalFileDefaultMedicalConditionSeverityFromJson(e.toString()))
      .toList();
}

List<enums.ChildMedicalFileDefaultMedicalConditionSeverity>?
    childMedicalFileDefaultMedicalConditionSeverityNullableListFromJson(
  List? childMedicalFileDefaultMedicalConditionSeverity, [
  List<enums.ChildMedicalFileDefaultMedicalConditionSeverity>? defaultValue,
]) {
  if (childMedicalFileDefaultMedicalConditionSeverity == null) {
    return defaultValue;
  }

  return childMedicalFileDefaultMedicalConditionSeverity
      .map((e) =>
          childMedicalFileDefaultMedicalConditionSeverityFromJson(e.toString()))
      .toList();
}

String? inscriptionNewChildStatusActionToJson(
    enums.InscriptionNewChildStatusAction? inscriptionNewChildStatusAction) {
  return inscriptionNewChildStatusAction?.value;
}

enums.InscriptionNewChildStatusAction inscriptionNewChildStatusActionFromJson(
  Object? inscriptionNewChildStatusAction, [
  enums.InscriptionNewChildStatusAction? defaultValue,
]) {
  return enums.InscriptionNewChildStatusAction.values.firstWhereOrNull(
          (e) => e.value == inscriptionNewChildStatusAction) ??
      defaultValue ??
      enums.InscriptionNewChildStatusAction.swaggerGeneratedUnknown;
}

List<String> inscriptionNewChildStatusActionListToJson(
    List<enums.InscriptionNewChildStatusAction>?
        inscriptionNewChildStatusAction) {
  if (inscriptionNewChildStatusAction == null) {
    return [];
  }

  return inscriptionNewChildStatusAction.map((e) => e.value!).toList();
}

List<enums.InscriptionNewChildStatusAction>
    inscriptionNewChildStatusActionListFromJson(
  List? inscriptionNewChildStatusAction, [
  List<enums.InscriptionNewChildStatusAction>? defaultValue,
]) {
  if (inscriptionNewChildStatusAction == null) {
    return defaultValue ?? [];
  }

  return inscriptionNewChildStatusAction
      .map((e) => inscriptionNewChildStatusActionFromJson(e.toString()))
      .toList();
}

List<enums.InscriptionNewChildStatusAction>?
    inscriptionNewChildStatusActionNullableListFromJson(
  List? inscriptionNewChildStatusAction, [
  List<enums.InscriptionNewChildStatusAction>? defaultValue,
]) {
  if (inscriptionNewChildStatusAction == null) {
    return defaultValue;
  }

  return inscriptionNewChildStatusAction
      .map((e) => inscriptionNewChildStatusActionFromJson(e.toString()))
      .toList();
}

String? educatorContractStatusActionToJson(
    enums.EducatorContractStatusAction? educatorContractStatusAction) {
  return educatorContractStatusAction?.value;
}

enums.EducatorContractStatusAction educatorContractStatusActionFromJson(
  Object? educatorContractStatusAction, [
  enums.EducatorContractStatusAction? defaultValue,
]) {
  return enums.EducatorContractStatusAction.values
          .firstWhereOrNull((e) => e.value == educatorContractStatusAction) ??
      defaultValue ??
      enums.EducatorContractStatusAction.swaggerGeneratedUnknown;
}

List<String> educatorContractStatusActionListToJson(
    List<enums.EducatorContractStatusAction>? educatorContractStatusAction) {
  if (educatorContractStatusAction == null) {
    return [];
  }

  return educatorContractStatusAction.map((e) => e.value!).toList();
}

List<enums.EducatorContractStatusAction>
    educatorContractStatusActionListFromJson(
  List? educatorContractStatusAction, [
  List<enums.EducatorContractStatusAction>? defaultValue,
]) {
  if (educatorContractStatusAction == null) {
    return defaultValue ?? [];
  }

  return educatorContractStatusAction
      .map((e) => educatorContractStatusActionFromJson(e.toString()))
      .toList();
}

List<enums.EducatorContractStatusAction>?
    educatorContractStatusActionNullableListFromJson(
  List? educatorContractStatusAction, [
  List<enums.EducatorContractStatusAction>? defaultValue,
]) {
  if (educatorContractStatusAction == null) {
    return defaultValue;
  }

  return educatorContractStatusAction
      .map((e) => educatorContractStatusActionFromJson(e.toString()))
      .toList();
}

String? educatorContractUpdateStatusActionToJson(
    enums.EducatorContractUpdateStatusAction?
        educatorContractUpdateStatusAction) {
  return educatorContractUpdateStatusAction?.value;
}

enums.EducatorContractUpdateStatusAction
    educatorContractUpdateStatusActionFromJson(
  Object? educatorContractUpdateStatusAction, [
  enums.EducatorContractUpdateStatusAction? defaultValue,
]) {
  return enums.EducatorContractUpdateStatusAction.values.firstWhereOrNull(
          (e) => e.value == educatorContractUpdateStatusAction) ??
      defaultValue ??
      enums.EducatorContractUpdateStatusAction.swaggerGeneratedUnknown;
}

List<String> educatorContractUpdateStatusActionListToJson(
    List<enums.EducatorContractUpdateStatusAction>?
        educatorContractUpdateStatusAction) {
  if (educatorContractUpdateStatusAction == null) {
    return [];
  }

  return educatorContractUpdateStatusAction.map((e) => e.value!).toList();
}

List<enums.EducatorContractUpdateStatusAction>
    educatorContractUpdateStatusActionListFromJson(
  List? educatorContractUpdateStatusAction, [
  List<enums.EducatorContractUpdateStatusAction>? defaultValue,
]) {
  if (educatorContractUpdateStatusAction == null) {
    return defaultValue ?? [];
  }

  return educatorContractUpdateStatusAction
      .map((e) => educatorContractUpdateStatusActionFromJson(e.toString()))
      .toList();
}

List<enums.EducatorContractUpdateStatusAction>?
    educatorContractUpdateStatusActionNullableListFromJson(
  List? educatorContractUpdateStatusAction, [
  List<enums.EducatorContractUpdateStatusAction>? defaultValue,
]) {
  if (educatorContractUpdateStatusAction == null) {
    return defaultValue;
  }

  return educatorContractUpdateStatusAction
      .map((e) => educatorContractUpdateStatusActionFromJson(e.toString()))
      .toList();
}

String? inscriptionStatusActionToJson(
    enums.InscriptionStatusAction? inscriptionStatusAction) {
  return inscriptionStatusAction?.value;
}

enums.InscriptionStatusAction inscriptionStatusActionFromJson(
  Object? inscriptionStatusAction, [
  enums.InscriptionStatusAction? defaultValue,
]) {
  return enums.InscriptionStatusAction.values
          .firstWhereOrNull((e) => e.value == inscriptionStatusAction) ??
      defaultValue ??
      enums.InscriptionStatusAction.swaggerGeneratedUnknown;
}

List<String> inscriptionStatusActionListToJson(
    List<enums.InscriptionStatusAction>? inscriptionStatusAction) {
  if (inscriptionStatusAction == null) {
    return [];
  }

  return inscriptionStatusAction.map((e) => e.value!).toList();
}

List<enums.InscriptionStatusAction> inscriptionStatusActionListFromJson(
  List? inscriptionStatusAction, [
  List<enums.InscriptionStatusAction>? defaultValue,
]) {
  if (inscriptionStatusAction == null) {
    return defaultValue ?? [];
  }

  return inscriptionStatusAction
      .map((e) => inscriptionStatusActionFromJson(e.toString()))
      .toList();
}

List<enums.InscriptionStatusAction>?
    inscriptionStatusActionNullableListFromJson(
  List? inscriptionStatusAction, [
  List<enums.InscriptionStatusAction>? defaultValue,
]) {
  if (inscriptionStatusAction == null) {
    return defaultValue;
  }

  return inscriptionStatusAction
      .map((e) => inscriptionStatusActionFromJson(e.toString()))
      .toList();
}

String? inscriptionUpdateStatusActionToJson(
    enums.InscriptionUpdateStatusAction? inscriptionUpdateStatusAction) {
  return inscriptionUpdateStatusAction?.value;
}

enums.InscriptionUpdateStatusAction inscriptionUpdateStatusActionFromJson(
  Object? inscriptionUpdateStatusAction, [
  enums.InscriptionUpdateStatusAction? defaultValue,
]) {
  return enums.InscriptionUpdateStatusAction.values
          .firstWhereOrNull((e) => e.value == inscriptionUpdateStatusAction) ??
      defaultValue ??
      enums.InscriptionUpdateStatusAction.swaggerGeneratedUnknown;
}

List<String> inscriptionUpdateStatusActionListToJson(
    List<enums.InscriptionUpdateStatusAction>? inscriptionUpdateStatusAction) {
  if (inscriptionUpdateStatusAction == null) {
    return [];
  }

  return inscriptionUpdateStatusAction.map((e) => e.value!).toList();
}

List<enums.InscriptionUpdateStatusAction>
    inscriptionUpdateStatusActionListFromJson(
  List? inscriptionUpdateStatusAction, [
  List<enums.InscriptionUpdateStatusAction>? defaultValue,
]) {
  if (inscriptionUpdateStatusAction == null) {
    return defaultValue ?? [];
  }

  return inscriptionUpdateStatusAction
      .map((e) => inscriptionUpdateStatusActionFromJson(e.toString()))
      .toList();
}

List<enums.InscriptionUpdateStatusAction>?
    inscriptionUpdateStatusActionNullableListFromJson(
  List? inscriptionUpdateStatusAction, [
  List<enums.InscriptionUpdateStatusAction>? defaultValue,
]) {
  if (inscriptionUpdateStatusAction == null) {
    return defaultValue;
  }

  return inscriptionUpdateStatusAction
      .map((e) => inscriptionUpdateStatusActionFromJson(e.toString()))
      .toList();
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

String? generalUserSettingsChatNotificationsStatusToJson(
    enums.GeneralUserSettingsChatNotificationsStatus?
        generalUserSettingsChatNotificationsStatus) {
  return generalUserSettingsChatNotificationsStatus?.value;
}

enums.GeneralUserSettingsChatNotificationsStatus
    generalUserSettingsChatNotificationsStatusFromJson(
  Object? generalUserSettingsChatNotificationsStatus, [
  enums.GeneralUserSettingsChatNotificationsStatus? defaultValue,
]) {
  return enums.GeneralUserSettingsChatNotificationsStatus.values
          .firstWhereOrNull(
              (e) => e.value == generalUserSettingsChatNotificationsStatus) ??
      defaultValue ??
      enums.GeneralUserSettingsChatNotificationsStatus.swaggerGeneratedUnknown;
}

List<String> generalUserSettingsChatNotificationsStatusListToJson(
    List<enums.GeneralUserSettingsChatNotificationsStatus>?
        generalUserSettingsChatNotificationsStatus) {
  if (generalUserSettingsChatNotificationsStatus == null) {
    return [];
  }

  return generalUserSettingsChatNotificationsStatus
      .map((e) => e.value!)
      .toList();
}

List<enums.GeneralUserSettingsChatNotificationsStatus>
    generalUserSettingsChatNotificationsStatusListFromJson(
  List? generalUserSettingsChatNotificationsStatus, [
  List<enums.GeneralUserSettingsChatNotificationsStatus>? defaultValue,
]) {
  if (generalUserSettingsChatNotificationsStatus == null) {
    return defaultValue ?? [];
  }

  return generalUserSettingsChatNotificationsStatus
      .map((e) =>
          generalUserSettingsChatNotificationsStatusFromJson(e.toString()))
      .toList();
}

List<enums.GeneralUserSettingsChatNotificationsStatus>?
    generalUserSettingsChatNotificationsStatusNullableListFromJson(
  List? generalUserSettingsChatNotificationsStatus, [
  List<enums.GeneralUserSettingsChatNotificationsStatus>? defaultValue,
]) {
  if (generalUserSettingsChatNotificationsStatus == null) {
    return defaultValue;
  }

  return generalUserSettingsChatNotificationsStatus
      .map((e) =>
          generalUserSettingsChatNotificationsStatusFromJson(e.toString()))
      .toList();
}

String? generalUserSettingsSocialNotificationsStatusToJson(
    enums.GeneralUserSettingsSocialNotificationsStatus?
        generalUserSettingsSocialNotificationsStatus) {
  return generalUserSettingsSocialNotificationsStatus?.value;
}

enums.GeneralUserSettingsSocialNotificationsStatus
    generalUserSettingsSocialNotificationsStatusFromJson(
  Object? generalUserSettingsSocialNotificationsStatus, [
  enums.GeneralUserSettingsSocialNotificationsStatus? defaultValue,
]) {
  return enums.GeneralUserSettingsSocialNotificationsStatus.values
          .firstWhereOrNull(
              (e) => e.value == generalUserSettingsSocialNotificationsStatus) ??
      defaultValue ??
      enums
          .GeneralUserSettingsSocialNotificationsStatus.swaggerGeneratedUnknown;
}

List<String> generalUserSettingsSocialNotificationsStatusListToJson(
    List<enums.GeneralUserSettingsSocialNotificationsStatus>?
        generalUserSettingsSocialNotificationsStatus) {
  if (generalUserSettingsSocialNotificationsStatus == null) {
    return [];
  }

  return generalUserSettingsSocialNotificationsStatus
      .map((e) => e.value!)
      .toList();
}

List<enums.GeneralUserSettingsSocialNotificationsStatus>
    generalUserSettingsSocialNotificationsStatusListFromJson(
  List? generalUserSettingsSocialNotificationsStatus, [
  List<enums.GeneralUserSettingsSocialNotificationsStatus>? defaultValue,
]) {
  if (generalUserSettingsSocialNotificationsStatus == null) {
    return defaultValue ?? [];
  }

  return generalUserSettingsSocialNotificationsStatus
      .map((e) =>
          generalUserSettingsSocialNotificationsStatusFromJson(e.toString()))
      .toList();
}

List<enums.GeneralUserSettingsSocialNotificationsStatus>?
    generalUserSettingsSocialNotificationsStatusNullableListFromJson(
  List? generalUserSettingsSocialNotificationsStatus, [
  List<enums.GeneralUserSettingsSocialNotificationsStatus>? defaultValue,
]) {
  if (generalUserSettingsSocialNotificationsStatus == null) {
    return defaultValue;
  }

  return generalUserSettingsSocialNotificationsStatus
      .map((e) =>
          generalUserSettingsSocialNotificationsStatusFromJson(e.toString()))
      .toList();
}

String? generalUserSettingsGeneralNotificationsStatusToJson(
    enums.GeneralUserSettingsGeneralNotificationsStatus?
        generalUserSettingsGeneralNotificationsStatus) {
  return generalUserSettingsGeneralNotificationsStatus?.value;
}

enums.GeneralUserSettingsGeneralNotificationsStatus
    generalUserSettingsGeneralNotificationsStatusFromJson(
  Object? generalUserSettingsGeneralNotificationsStatus, [
  enums.GeneralUserSettingsGeneralNotificationsStatus? defaultValue,
]) {
  return enums.GeneralUserSettingsGeneralNotificationsStatus.values
          .firstWhereOrNull((e) =>
              e.value == generalUserSettingsGeneralNotificationsStatus) ??
      defaultValue ??
      enums.GeneralUserSettingsGeneralNotificationsStatus
          .swaggerGeneratedUnknown;
}

List<String> generalUserSettingsGeneralNotificationsStatusListToJson(
    List<enums.GeneralUserSettingsGeneralNotificationsStatus>?
        generalUserSettingsGeneralNotificationsStatus) {
  if (generalUserSettingsGeneralNotificationsStatus == null) {
    return [];
  }

  return generalUserSettingsGeneralNotificationsStatus
      .map((e) => e.value!)
      .toList();
}

List<enums.GeneralUserSettingsGeneralNotificationsStatus>
    generalUserSettingsGeneralNotificationsStatusListFromJson(
  List? generalUserSettingsGeneralNotificationsStatus, [
  List<enums.GeneralUserSettingsGeneralNotificationsStatus>? defaultValue,
]) {
  if (generalUserSettingsGeneralNotificationsStatus == null) {
    return defaultValue ?? [];
  }

  return generalUserSettingsGeneralNotificationsStatus
      .map((e) =>
          generalUserSettingsGeneralNotificationsStatusFromJson(e.toString()))
      .toList();
}

List<enums.GeneralUserSettingsGeneralNotificationsStatus>?
    generalUserSettingsGeneralNotificationsStatusNullableListFromJson(
  List? generalUserSettingsGeneralNotificationsStatus, [
  List<enums.GeneralUserSettingsGeneralNotificationsStatus>? defaultValue,
]) {
  if (generalUserSettingsGeneralNotificationsStatus == null) {
    return defaultValue;
  }

  return generalUserSettingsGeneralNotificationsStatus
      .map((e) =>
          generalUserSettingsGeneralNotificationsStatusFromJson(e.toString()))
      .toList();
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
