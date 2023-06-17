//Generated code

part of 'devlesgenies.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$Devlesgenies extends Devlesgenies {
  _$Devlesgenies([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = Devlesgenies;

  @override
  Future<Response<CustomVerifyEmail>>
      _authenticationAccountConfirmEmailKeyPost({
    required CustomVerifyEmail? data,
    required String? key,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/authentication/account-confirm-email/${key}/');
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
    return client.send<CustomVerifyEmail, CustomVerifyEmail>($request);
  }

  @override
  Future<Response<Login>> _authenticationLoginPost({
    required Login? data,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/authentication/login/');
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
    return client.send<Login, Login>($request);
  }

  @override
  Future<Response<dynamic>> _authenticationLogoutGet({String? cacheControl}) {
    final Uri $url = Uri.parse('/authentication/logout/');
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
  Future<Response<dynamic>> _authenticationLogoutPost({String? cacheControl}) {
    final Uri $url = Uri.parse('/authentication/logout/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<PasswordChange>> _authenticationPasswordChangePost({
    required PasswordChange? data,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/authentication/password/change/');
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
    return client.send<PasswordChange, PasswordChange>($request);
  }

  @override
  Future<Response<CustomPasswordResetConfirm>>
      _authenticationPasswordResetConfirmUidb64TokenPost({
    required CustomPasswordResetConfirm? data,
    required String? token,
    required String? uidb64,
    String? cacheControl,
  }) {
    final Uri $url =
        Uri.parse('/authentication/password/reset-confirm/${uidb64}/${token}/');
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
        .send<CustomPasswordResetConfirm, CustomPasswordResetConfirm>($request);
  }

  @override
  Future<Response<PasswordReset>> _authenticationPasswordResetPost({
    required PasswordReset? data,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/authentication/password/reset/');
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
    return client.send<PasswordReset, PasswordReset>($request);
  }

  @override
  Future<Response<AuthenticationProfileEducatorGet$Response>>
      _authenticationProfileEducatorGet({
    String? userEmail,
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/authentication/profile/educator/');
    final Map<String, dynamic> $params = <String, dynamic>{
      'user__email': userEmail,
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
    return client.send<AuthenticationProfileEducatorGet$Response,
        AuthenticationProfileEducatorGet$Response>($request);
  }

  @override
  Future<Response<EducatorProfile>> _authenticationProfileEducatorUserGet({
    required String? user,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/authentication/profile/educator/${user}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<EducatorProfile, EducatorProfile>($request);
  }

  @override
  Future<Response<EducatorProfile>> _authenticationProfileEducatorUserPut({
    required EducatorProfile? data,
    required String? user,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/authentication/profile/educator/${user}/');
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
    return client.send<EducatorProfile, EducatorProfile>($request);
  }

  @override
  Future<Response<EducatorProfile>> _authenticationProfileEducatorUserPatch({
    required EducatorProfile? data,
    required String? user,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/authentication/profile/educator/${user}/');
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
    return client.send<EducatorProfile, EducatorProfile>($request);
  }

  @override
  Future<Response<AuthenticationProfileKindergartenGet$Response>>
      _authenticationProfileKindergartenGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/authentication/profile/kindergarten/');
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
    return client.send<AuthenticationProfileKindergartenGet$Response,
        AuthenticationProfileKindergartenGet$Response>($request);
  }

  @override
  Future<Response<KindergartenProfileSettings>>
      _authenticationProfileKindergartenPublicSettingsProfileUserGet({
    required String? profileUser,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse(
        '/authentication/profile/kindergarten/public_settings/${profileUser}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<KindergartenProfileSettings,
        KindergartenProfileSettings>($request);
  }

  @override
  Future<Response<KindergartenProfileSettings>>
      _authenticationProfileKindergartenPublicSettingsProfileUserPut({
    required KindergartenProfileSettings? data,
    required String? profileUser,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse(
        '/authentication/profile/kindergarten/public_settings/${profileUser}/');
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
    return client.send<KindergartenProfileSettings,
        KindergartenProfileSettings>($request);
  }

  @override
  Future<Response<KindergartenProfileSettings>>
      _authenticationProfileKindergartenPublicSettingsProfileUserPatch({
    required KindergartenProfileSettings? data,
    required String? profileUser,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse(
        '/authentication/profile/kindergarten/public_settings/${profileUser}/');
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
    return client.send<KindergartenProfileSettings,
        KindergartenProfileSettings>($request);
  }

  @override
  Future<Response<KindergartenProfileRead>>
      _authenticationProfileKindergartenUserGet({
    required String? user,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/authentication/profile/kindergarten/${user}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client
        .send<KindergartenProfileRead, KindergartenProfileRead>($request);
  }

  @override
  Future<Response<KindergartenProfile>>
      _authenticationProfileKindergartenUserPut({
    required KindergartenProfile? data,
    required String? user,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/authentication/profile/kindergarten/${user}/');
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
    return client.send<KindergartenProfile, KindergartenProfile>($request);
  }

  @override
  Future<Response<KindergartenProfile>>
      _authenticationProfileKindergartenUserPatch({
    required KindergartenProfile? data,
    required String? user,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/authentication/profile/kindergarten/${user}/');
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
    return client.send<KindergartenProfile, KindergartenProfile>($request);
  }

  @override
  Future<Response<AuthenticationProfileParentGet$Response>>
      _authenticationProfileParentGet({
    String? userEmail,
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/authentication/profile/parent/');
    final Map<String, dynamic> $params = <String, dynamic>{
      'user__email': userEmail,
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
    return client.send<AuthenticationProfileParentGet$Response,
        AuthenticationProfileParentGet$Response>($request);
  }

  @override
  Future<Response<ParentProfile>> _authenticationProfileParentIdGet({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/authentication/profile/parent/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<ParentProfile, ParentProfile>($request);
  }

  @override
  Future<Response<ParentProfile>> _authenticationProfileParentIdPut({
    required ParentProfile? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/authentication/profile/parent/${id}/');
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
    return client.send<ParentProfile, ParentProfile>($request);
  }

  @override
  Future<Response<ParentProfile>> _authenticationProfileParentIdPatch({
    required ParentProfile? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/authentication/profile/parent/${id}/');
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
    return client.send<ParentProfile, ParentProfile>($request);
  }

  @override
  Future<Response<dynamic>> _authenticationRegisterEducatorPost({
    required EducatorRegistration? data,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/authentication/register/educator/');
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
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _authenticationRegisterFamilyPost({
    required FamilyRegistration? data,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/authentication/register/family/');
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
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _authenticationRegisterFamilyInviteParent2Post({
    required FamilyRegistrationInviteSecondParent? data,
    String? cacheControl,
  }) {
    final Uri $url =
        Uri.parse('/authentication/register/family_invite_parent2/');
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
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<ParentInvitationInitiate>>
      _authenticationRegisterInviteParent2Post({
    required ParentInvitationInitiate? data,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/authentication/register/invite_parent2/');
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
        .send<ParentInvitationInitiate, ParentInvitationInitiate>($request);
  }

  @override
  Future<Response<AuthenticationRegisterInviteParent2InvitationsGet$Response>>
      _authenticationRegisterInviteParent2InvitationsGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    final Uri $url =
        Uri.parse('/authentication/register/invite_parent2/invitations');
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
    return client.send<
        AuthenticationRegisterInviteParent2InvitationsGet$Response,
        AuthenticationRegisterInviteParent2InvitationsGet$Response>($request);
  }

  @override
  Future<Response<ResendParentInvitation>>
      _authenticationRegisterInviteParent2ReinviteIdPut({
    required ResendParentInvitation? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url =
        Uri.parse('/authentication/register/invite_parent2/reinvite/${id}');
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
        .send<ResendParentInvitation, ResendParentInvitation>($request);
  }

  @override
  Future<Response<ResendParentInvitation>>
      _authenticationRegisterInviteParent2ReinviteIdPatch({
    required ResendParentInvitation? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url =
        Uri.parse('/authentication/register/invite_parent2/reinvite/${id}');
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
        .send<ResendParentInvitation, ResendParentInvitation>($request);
  }

  @override
  Future<Response<ConfirmParentInvitation>>
      _authenticationRegisterInviteParent2KeyConfirmedGet({
    required String? key,
    String? cacheControl,
  }) {
    final Uri $url =
        Uri.parse('/authentication/register/invite_parent2/${key}/confirmed');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client
        .send<ConfirmParentInvitation, ConfirmParentInvitation>($request);
  }

  @override
  Future<Response<dynamic>> _authenticationRegisterKindergartenPost({
    required KindergartenRegistration? data,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/authentication/register/kindergarten/');
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
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>>
      _authenticationRegisterKindergartenInitiatedEducatorPost({
    required EducatorContractRegistration? data,
    String? cacheControl,
  }) {
    final Uri $url =
        Uri.parse('/authentication/register/kindergarten_initiated/educator');
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
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<
          Response<
              AuthenticationRegisterKindergartenInitiatedEducatorInvitationsGet$Response>>
      _authenticationRegisterKindergartenInitiatedEducatorInvitationsGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse(
        '/authentication/register/kindergarten_initiated/educator/invitations/');
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
    return client.send<
            AuthenticationRegisterKindergartenInitiatedEducatorInvitationsGet$Response,
            AuthenticationRegisterKindergartenInitiatedEducatorInvitationsGet$Response>(
        $request);
  }

  @override
  Future<Response<ResendEducatorSignupByKindergartenEmailConfirmation>>
      _authenticationRegisterKindergartenInitiatedEducatorReinviteEducatorIdPatch({
    required ResendEducatorSignupByKindergartenEmailConfirmation? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse(
        '/authentication/register/kindergarten_initiated/educator/reinvite_educator/${id}');
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
    return client.send<ResendEducatorSignupByKindergartenEmailConfirmation,
        ResendEducatorSignupByKindergartenEmailConfirmation>($request);
  }

  @override
  Future<Response<ConfirmEducatorSignup>>
      _authenticationRegisterKindergartenInitiatedEducatorKeyConfirmedGet({
    required String? key,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse(
        '/authentication/register/kindergarten_initiated/educator/${key}/confirmed');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<ConfirmEducatorSignup, ConfirmEducatorSignup>($request);
  }

  @override
  Future<Response<dynamic>>
      _authenticationRegisterKindergartenInitiatedEducatorTokenPost({
    required FinalizeEducatorSignup? data,
    required String? token,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse(
        '/authentication/register/kindergarten_initiated/educator/${token}');
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
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>>
      _authenticationRegisterKindergartenInitiatedFamilyPost({
    required InscriptionRegistration? data,
    String? cacheControl,
  }) {
    final Uri $url =
        Uri.parse('/authentication/register/kindergarten_initiated/family');
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
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<
          Response<
              AuthenticationRegisterKindergartenInitiatedFamilyInvitationsGet$Response>>
      _authenticationRegisterKindergartenInitiatedFamilyInvitationsGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse(
        '/authentication/register/kindergarten_initiated/family/invitations/');
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
    return client.send<
            AuthenticationRegisterKindergartenInitiatedFamilyInvitationsGet$Response,
            AuthenticationRegisterKindergartenInitiatedFamilyInvitationsGet$Response>(
        $request);
  }

  @override
  Future<Response<ResendFamilySignupByKindergartenEmailConfirmation>>
      _authenticationRegisterKindergartenInitiatedFamilyReinviteFamilyInscriptionPatch({
    required ResendFamilySignupByKindergartenEmailConfirmation? data,
    required String? inscription,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse(
        '/authentication/register/kindergarten_initiated/family/reinvite_family/${inscription}');
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
    return client.send<ResendFamilySignupByKindergartenEmailConfirmation,
        ResendFamilySignupByKindergartenEmailConfirmation>($request);
  }

  @override
  Future<Response<ResendParentSignupByKindergartenEmailConfirmation>>
      _authenticationRegisterKindergartenInitiatedFamilyReinviteParentIdPatch({
    required ResendParentSignupByKindergartenEmailConfirmation? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse(
        '/authentication/register/kindergarten_initiated/family/reinvite_parent/${id}');
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
    return client.send<ResendParentSignupByKindergartenEmailConfirmation,
        ResendParentSignupByKindergartenEmailConfirmation>($request);
  }

  @override
  Future<Response<ConfirmParentSignup>>
      _authenticationRegisterKindergartenInitiatedFamilyKeyConfirmedGet({
    required String? key,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse(
        '/authentication/register/kindergarten_initiated/family/${key}/confirmed');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<ConfirmParentSignup, ConfirmParentSignup>($request);
  }

  @override
  Future<Response<dynamic>>
      _authenticationRegisterKindergartenInitiatedFamilyTokenPost({
    required FinalizeParentSignup? data,
    required String? token,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse(
        '/authentication/register/kindergarten_initiated/family/${token}');
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
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<ParentInvitationRegistration>>
      _authenticationRegisterParent2TokenPost({
    required ParentInvitationRegistration? data,
    required String? token,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/authentication/register/parent2/${token}/');
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
    return client.send<ParentInvitationRegistration,
        ParentInvitationRegistration>($request);
  }

  @override
  Future<Response<CustomResendEmailVerification>>
      _authenticationResendEmailConfirmationPost({
    required CustomResendEmailVerification? data,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/authentication/resend-email-confirmation/');
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
    return client.send<CustomResendEmailVerification,
        CustomResendEmailVerification>($request);
  }

  @override
  Future<Response<CookieTokenRefresh>> _authenticationTokenRefreshPost({
    required CookieTokenRefresh? data,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/authentication/token/refresh/');
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
    return client.send<CookieTokenRefresh, CookieTokenRefresh>($request);
  }

  @override
  Future<Response<TokenVerify>> _authenticationTokenVerifyPost({
    required TokenVerify? data,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/authentication/token/verify/');
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
    return client.send<TokenVerify, TokenVerify>($request);
  }

  @override
  Future<Response<ChildChildGet$Response>> _childChildGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/child/child/');
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
        .send<ChildChildGet$Response, ChildChildGet$Response>($request);
  }

  @override
  Future<Response<Child>> _childChildPost({
    required Child? data,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/child/child/');
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
    return client.send<Child, Child>($request);
  }

  @override
  Future<Response<Child>> _childChildIdGet({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/child/child/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<Child, Child>($request);
  }

  @override
  Future<Response<Child>> _childChildIdPut({
    required Child? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/child/child/${id}/');
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
    return client.send<Child, Child>($request);
  }

  @override
  Future<Response<Child>> _childChildIdPatch({
    required Child? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/child/child/${id}/');
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
    return client.send<Child, Child>($request);
  }

  @override
  Future<Response<dynamic>> _childChildIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/child/child/${id}/');
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
  Future<Response<ChildChildNotesGet$Response>> _childChildNotesGet({
    String? ordering,
    String? childId,
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/child/child_notes/');
    final Map<String, dynamic> $params = <String, dynamic>{
      'ordering': ordering,
      'child_id': childId,
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
    return client.send<ChildChildNotesGet$Response,
        ChildChildNotesGet$Response>($request);
  }

  @override
  Future<Response<ChildNotes>> _childChildNotesPost({
    required ChildNotes? data,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/child/child_notes/');
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
    return client.send<ChildNotes, ChildNotes>($request);
  }

  @override
  Future<Response<ChildNotes>> _childChildNotesIdGet({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/child/child_notes/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<ChildNotes, ChildNotes>($request);
  }

  @override
  Future<Response<ChildNotes>> _childChildNotesIdPut({
    required ChildNotes? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/child/child_notes/${id}/');
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
    return client.send<ChildNotes, ChildNotes>($request);
  }

  @override
  Future<Response<ChildNotes>> _childChildNotesIdPatch({
    required ChildNotes? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/child/child_notes/${id}/');
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
    return client.send<ChildNotes, ChildNotes>($request);
  }

  @override
  Future<Response<dynamic>> _childChildNotesIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/child/child_notes/${id}/');
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
  Future<Response<ChildMedicalFileGet$Response>> _childMedicalFileGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/child/medical_file/');
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
    return client.send<ChildMedicalFileGet$Response,
        ChildMedicalFileGet$Response>($request);
  }

  @override
  Future<Response<ChildMedicalFileAllergyGet$Response>>
      _childMedicalFileAllergyGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/child/medical_file/allergy/');
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
    return client.send<ChildMedicalFileAllergyGet$Response,
        ChildMedicalFileAllergyGet$Response>($request);
  }

  @override
  Future<Response<ChildMedicalFileAllergy>> _childMedicalFileAllergyPost({
    required ChildMedicalFileAllergy? data,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/child/medical_file/allergy/');
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
        .send<ChildMedicalFileAllergy, ChildMedicalFileAllergy>($request);
  }

  @override
  Future<Response<ChildMedicalFileAllergy>> _childMedicalFileAllergyIdGet({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/child/medical_file/allergy/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client
        .send<ChildMedicalFileAllergy, ChildMedicalFileAllergy>($request);
  }

  @override
  Future<Response<ChildMedicalFileAllergy>> _childMedicalFileAllergyIdPut({
    required ChildMedicalFileAllergy? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/child/medical_file/allergy/${id}/');
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
        .send<ChildMedicalFileAllergy, ChildMedicalFileAllergy>($request);
  }

  @override
  Future<Response<ChildMedicalFileAllergy>> _childMedicalFileAllergyIdPatch({
    required ChildMedicalFileAllergy? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/child/medical_file/allergy/${id}/');
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
        .send<ChildMedicalFileAllergy, ChildMedicalFileAllergy>($request);
  }

  @override
  Future<Response<dynamic>> _childMedicalFileAllergyIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/child/medical_file/allergy/${id}/');
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
  Future<Response<ChildMedicalFileDefaultAllergyGet$Response>>
      _childMedicalFileDefaultAllergyGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/child/medical_file/default_allergy/');
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
    return client.send<ChildMedicalFileDefaultAllergyGet$Response,
        ChildMedicalFileDefaultAllergyGet$Response>($request);
  }

  @override
  Future<Response<ChildMedicalFileDefaultAllergy>>
      _childMedicalFileDefaultAllergyIdGet({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/child/medical_file/default_allergy/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<ChildMedicalFileDefaultAllergy,
        ChildMedicalFileDefaultAllergy>($request);
  }

  @override
  Future<Response<ChildMedicalFileDefaultMedicalConditionGet$Response>>
      _childMedicalFileDefaultMedicalConditionGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    final Uri $url =
        Uri.parse('/child/medical_file/default_medical_condition/');
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
    return client.send<ChildMedicalFileDefaultMedicalConditionGet$Response,
        ChildMedicalFileDefaultMedicalConditionGet$Response>($request);
  }

  @override
  Future<Response<ChildMedicalFileDefaultMedicalCondition>>
      _childMedicalFileDefaultMedicalConditionIdGet({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url =
        Uri.parse('/child/medical_file/default_medical_condition/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<ChildMedicalFileDefaultMedicalCondition,
        ChildMedicalFileDefaultMedicalCondition>($request);
  }

  @override
  Future<Response<ChildMedicalFileDefaultMedicationGet$Response>>
      _childMedicalFileDefaultMedicationGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/child/medical_file/default_medication/');
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
    return client.send<ChildMedicalFileDefaultMedicationGet$Response,
        ChildMedicalFileDefaultMedicationGet$Response>($request);
  }

  @override
  Future<Response<ChildMedicalFileDefaultMedication>>
      _childMedicalFileDefaultMedicationIdGet({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/child/medical_file/default_medication/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<ChildMedicalFileDefaultMedication,
        ChildMedicalFileDefaultMedication>($request);
  }

  @override
  Future<Response<ChildMedicalFileMedicalConditionGet$Response>>
      _childMedicalFileMedicalConditionGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/child/medical_file/medical_condition/');
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
    return client.send<ChildMedicalFileMedicalConditionGet$Response,
        ChildMedicalFileMedicalConditionGet$Response>($request);
  }

  @override
  Future<Response<ChildMedicalFileMedicalCondition>>
      _childMedicalFileMedicalConditionPost({
    required ChildMedicalFileMedicalCondition? data,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/child/medical_file/medical_condition/');
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
    return client.send<ChildMedicalFileMedicalCondition,
        ChildMedicalFileMedicalCondition>($request);
  }

  @override
  Future<Response<ChildMedicalFileMedicalCondition>>
      _childMedicalFileMedicalConditionIdGet({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/child/medical_file/medical_condition/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<ChildMedicalFileMedicalCondition,
        ChildMedicalFileMedicalCondition>($request);
  }

  @override
  Future<Response<ChildMedicalFileMedicalCondition>>
      _childMedicalFileMedicalConditionIdPut({
    required ChildMedicalFileMedicalCondition? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/child/medical_file/medical_condition/${id}/');
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
    return client.send<ChildMedicalFileMedicalCondition,
        ChildMedicalFileMedicalCondition>($request);
  }

  @override
  Future<Response<ChildMedicalFileMedicalCondition>>
      _childMedicalFileMedicalConditionIdPatch({
    required ChildMedicalFileMedicalCondition? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/child/medical_file/medical_condition/${id}/');
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
    return client.send<ChildMedicalFileMedicalCondition,
        ChildMedicalFileMedicalCondition>($request);
  }

  @override
  Future<Response<dynamic>> _childMedicalFileMedicalConditionIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/child/medical_file/medical_condition/${id}/');
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
  Future<Response<ChildMedicalFileMedicationGet$Response>>
      _childMedicalFileMedicationGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/child/medical_file/medication/');
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
    return client.send<ChildMedicalFileMedicationGet$Response,
        ChildMedicalFileMedicationGet$Response>($request);
  }

  @override
  Future<Response<ChildMedicalFileMedication>> _childMedicalFileMedicationPost({
    required ChildMedicalFileMedication? data,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/child/medical_file/medication/');
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
        .send<ChildMedicalFileMedication, ChildMedicalFileMedication>($request);
  }

  @override
  Future<Response<ChildMedicalFileMedication>>
      _childMedicalFileMedicationIdGet({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/child/medical_file/medication/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client
        .send<ChildMedicalFileMedication, ChildMedicalFileMedication>($request);
  }

  @override
  Future<Response<ChildMedicalFileMedication>>
      _childMedicalFileMedicationIdPut({
    required ChildMedicalFileMedication? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/child/medical_file/medication/${id}/');
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
        .send<ChildMedicalFileMedication, ChildMedicalFileMedication>($request);
  }

  @override
  Future<Response<ChildMedicalFileMedication>>
      _childMedicalFileMedicationIdPatch({
    required ChildMedicalFileMedication? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/child/medical_file/medication/${id}/');
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
        .send<ChildMedicalFileMedication, ChildMedicalFileMedication>($request);
  }

  @override
  Future<Response<dynamic>> _childMedicalFileMedicationIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/child/medical_file/medication/${id}/');
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
  Future<Response<ChildMedicalFile>> _childMedicalFileChildGet({
    required String? child,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/child/medical_file/${child}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<ChildMedicalFile, ChildMedicalFile>($request);
  }

  @override
  Future<Response<InscriptionNewChild>>
      _contractsCreateInscriptionWithNewChildPost({
    required InscriptionNewChild? data,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/contracts/create_inscription_with_new_child/');
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
    return client.send<InscriptionNewChild, InscriptionNewChild>($request);
  }

  @override
  Future<Response<List<String>>> _contractsDefaultActionsGet(
      {String? cacheControl}) {
    final Uri $url = Uri.parse('/contracts/default_actions/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<List<String>, String>($request);
  }

  @override
  Future<Response<List<String>>> _contractsDefaultStatusesGet(
      {String? cacheControl}) {
    final Uri $url = Uri.parse('/contracts/default_statuses/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<List<String>, String>($request);
  }

  @override
  Future<Response<ContractsEducatorContractGet$Response>>
      _contractsEducatorContractGet({
    String? search,
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/contracts/educator_contract/');
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
    return client.send<ContractsEducatorContractGet$Response,
        ContractsEducatorContractGet$Response>($request);
  }

  @override
  Future<Response<EducatorContract>> _contractsEducatorContractPost({
    required EducatorContract? data,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/contracts/educator_contract/');
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
    return client.send<EducatorContract, EducatorContract>($request);
  }

  @override
  Future<Response<EducatorContract>> _contractsEducatorContractIdGet({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/contracts/educator_contract/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<EducatorContract, EducatorContract>($request);
  }

  @override
  Future<Response<EducatorContractUpdate>> _contractsEducatorContractIdPut({
    required EducatorContractUpdate? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/contracts/educator_contract/${id}/');
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
        .send<EducatorContractUpdate, EducatorContractUpdate>($request);
  }

  @override
  Future<Response<EducatorContractUpdate>> _contractsEducatorContractIdPatch({
    required EducatorContractUpdate? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/contracts/educator_contract/${id}/');
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
        .send<EducatorContractUpdate, EducatorContractUpdate>($request);
  }

  @override
  Future<Response<ContractsInscriptionGet$Response>> _contractsInscriptionGet({
    String? search,
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/contracts/inscription/');
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
    return client.send<ContractsInscriptionGet$Response,
        ContractsInscriptionGet$Response>($request);
  }

  @override
  Future<Response<Inscription>> _contractsInscriptionPost({
    required Inscription? data,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/contracts/inscription/');
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
    return client.send<Inscription, Inscription>($request);
  }

  @override
  Future<Response<Inscription>> _contractsInscriptionIdGet({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/contracts/inscription/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<Inscription, Inscription>($request);
  }

  @override
  Future<Response<InscriptionUpdate>> _contractsInscriptionIdPut({
    required InscriptionUpdate? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/contracts/inscription/${id}/');
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
    return client.send<InscriptionUpdate, InscriptionUpdate>($request);
  }

  @override
  Future<Response<InscriptionUpdate>> _contractsInscriptionIdPatch({
    required InscriptionUpdate? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/contracts/inscription/${id}/');
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
    return client.send<InscriptionUpdate, InscriptionUpdate>($request);
  }

  @override
  Future<Response<FamilyFamilyGet$Response>> _familyFamilyGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/family/family/');
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
        .send<FamilyFamilyGet$Response, FamilyFamilyGet$Response>($request);
  }

  @override
  Future<Response<Family>> _familyFamilyIdGet({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/family/family/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<Family, Family>($request);
  }

  @override
  Future<Response<FamilyTrustedPersonGet$Response>> _familyTrustedPersonGet({
    int? page,
    int? pageSize,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/family/trusted_person/');
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
    return client.send<FamilyTrustedPersonGet$Response,
        FamilyTrustedPersonGet$Response>($request);
  }

  @override
  Future<Response<TrustedPerson>> _familyTrustedPersonPost({
    required TrustedPerson? data,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/family/trusted_person/');
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
    return client.send<TrustedPerson, TrustedPerson>($request);
  }

  @override
  Future<Response<TrustedPerson>> _familyTrustedPersonIdGet({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/family/trusted_person/${id}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<TrustedPerson, TrustedPerson>($request);
  }

  @override
  Future<Response<TrustedPerson>> _familyTrustedPersonIdPut({
    required TrustedPerson? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/family/trusted_person/${id}/');
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
    return client.send<TrustedPerson, TrustedPerson>($request);
  }

  @override
  Future<Response<TrustedPerson>> _familyTrustedPersonIdPatch({
    required TrustedPerson? data,
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/family/trusted_person/${id}/');
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
    return client.send<TrustedPerson, TrustedPerson>($request);
  }

  @override
  Future<Response<dynamic>> _familyTrustedPersonIdDelete({
    required int? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/family/trusted_person/${id}/');
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
  Future<Response<GeneralUserSettings>> _settingsUserGet({
    required String? user,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/settings/${user}/');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<GeneralUserSettings, GeneralUserSettings>($request);
  }

  @override
  Future<Response<GeneralUserSettings>> _settingsUserPut({
    required GeneralUserSettings? data,
    required String? user,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/settings/${user}/');
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
    return client.send<GeneralUserSettings, GeneralUserSettings>($request);
  }

  @override
  Future<Response<GeneralUserSettings>> _settingsUserPatch({
    required GeneralUserSettings? data,
    required String? user,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/settings/${user}/');
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
    return client.send<GeneralUserSettings, GeneralUserSettings>($request);
  }
}
