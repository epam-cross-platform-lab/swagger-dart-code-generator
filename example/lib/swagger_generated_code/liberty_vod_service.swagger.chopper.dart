//Generated code

part of 'liberty_vod_service.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$LibertyVodService extends LibertyVodService {
  _$LibertyVodService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = LibertyVodService;

  @override
  Future<Response<FeedComposerResponseWithSeedTitle>>
      _feedComposerV1MoreLikeWatchedFromFeedFeedCridGet({
    required String? feedCrid,
    required String? profileId,
    required bool? isSharedProfile,
    String? encoding,
    String? maxRes,
    String? excludeExternalProviders,
    required int? count,
    String? xRengClienttype,
    String? xClaimsSet,
    String? cacheControl,
  }) {
    final Uri $url =
        Uri.parse('/feed-composer/v1/more-like-watched-from-feed/${feedCrid}');
    final Map<String, dynamic> $params = <String, dynamic>{
      'profileId': profileId,
      'isSharedProfile': isSharedProfile,
      'encoding': encoding,
      'maxRes': maxRes,
      'excludeExternalProviders': excludeExternalProviders,
      'count': count,
    };
    final Map<String, String> $headers = {
      if (xRengClienttype != null) 'x-reng-clienttype': xRengClienttype,
      if (xClaimsSet != null) 'x-Claims-Set': xClaimsSet,
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<FeedComposerResponseWithSeedTitle,
        FeedComposerResponseWithSeedTitle>($request);
  }

  @override
  Future<Response<FeedComposerResponse>> _feedComposerV1PausedItemsGet({
    required String? profileId,
    String? encoding,
    String? maxRes,
    required int? count,
    required String? filter,
    String? xCus = 'X-Cus',
    String? xClaimsSet,
    String? xDev,
    String? xEntitlementsToken = 'X-Entitlements-Token',
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/feed-composer/v1/paused-items');
    final Map<String, dynamic> $params = <String, dynamic>{
      'profileId': profileId,
      'encoding': encoding,
      'maxRes': maxRes,
      'count': count,
      'filter': filter,
    };
    final Map<String, String> $headers = {
      if (xCus != null) 'x-cus': xCus,
      if (xClaimsSet != null) 'x-Claims-Set': xClaimsSet,
      if (xDev != null) 'x-dev': xDev,
      if (xEntitlementsToken != null)
        'x-entitlements-token': xEntitlementsToken,
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<FeedComposerResponse, FeedComposerResponse>($request);
  }

  @override
  Future<Response<FeedComposerResponseForPurchasedProgram>>
      _feedComposerV1PurchasedItemsGet({
    String? brandingProviderId,
    String? encoding,
    String? maxRes,
    required int? count,
    String? filter,
    String? xCus = 'X-Cus',
    String? xDev,
    String? xEntitlementsToken = 'X-Entitlements-Token',
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/feed-composer/v1/purchased-items');
    final Map<String, dynamic> $params = <String, dynamic>{
      'brandingProviderId': brandingProviderId,
      'encoding': encoding,
      'maxRes': maxRes,
      'count': count,
      'filter': filter,
    };
    final Map<String, String> $headers = {
      if (xCus != null) 'x-cus': xCus,
      if (xDev != null) 'x-dev': xDev,
      if (xEntitlementsToken != null)
        'x-entitlements-token': xEntitlementsToken,
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<FeedComposerResponseForPurchasedProgram,
        FeedComposerResponseForPurchasedProgram>($request);
  }

  @override
  Future<Response<FeedComposerResponse>>
      _feedComposerV1SuggestedFromContentAreaAreaCridGet({
    required String? areaCrid,
    required String? profileId,
    required bool? isSharedProfile,
    String? encoding,
    String? maxRes,
    String? excludeExternalProviders,
    required int? count,
    String? xRengClienttype,
    String? xClaimsSet,
    String? cacheControl,
  }) {
    final Uri $url =
        Uri.parse('/feed-composer/v1/suggested-from-content-area/${areaCrid}');
    final Map<String, dynamic> $params = <String, dynamic>{
      'profileId': profileId,
      'isSharedProfile': isSharedProfile,
      'encoding': encoding,
      'maxRes': maxRes,
      'excludeExternalProviders': excludeExternalProviders,
      'count': count,
    };
    final Map<String, String> $headers = {
      if (xRengClienttype != null) 'x-reng-clienttype': xRengClienttype,
      if (xClaimsSet != null) 'x-Claims-Set': xClaimsSet,
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<FeedComposerResponse, FeedComposerResponse>($request);
  }

  @override
  Future<Response<FeedComposerResponseWithSeedTitleAndGenre>>
      _feedComposerV1SuggestedFromContentAreaByWatchedGenreAreaCridGet({
    required String? areaCrid,
    required String? profileId,
    required bool? isSharedProfile,
    String? encoding,
    String? maxRes,
    String? excludeExternalProviders,
    required int? count,
    String? xRengClienttype,
    String? xClaimsSet,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse(
        '/feed-composer/v1/suggested-from-content-area-by-watched-genre/${areaCrid}');
    final Map<String, dynamic> $params = <String, dynamic>{
      'profileId': profileId,
      'isSharedProfile': isSharedProfile,
      'encoding': encoding,
      'maxRes': maxRes,
      'excludeExternalProviders': excludeExternalProviders,
      'count': count,
    };
    final Map<String, String> $headers = {
      if (xRengClienttype != null) 'x-reng-clienttype': xRengClienttype,
      if (xClaimsSet != null) 'x-Claims-Set': xClaimsSet,
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<FeedComposerResponseWithSeedTitleAndGenre,
        FeedComposerResponseWithSeedTitleAndGenre>($request);
  }

  @override
  Future<Response<FeedComposerResponse>> _feedComposerV1TopListTopListIdGet({
    required String? topListId,
    String? profileId,
    bool? isSharedProfile,
    String? brandingProviderId,
    String? encoding,
    String? maxRes,
    String? excludeExternalProviders,
    String? cityId,
    required int? count,
    String? xRengClienttype,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/feed-composer/v1/top-list/${topListId}');
    final Map<String, dynamic> $params = <String, dynamic>{
      'profileId': profileId,
      'isSharedProfile': isSharedProfile,
      'brandingProviderId': brandingProviderId,
      'encoding': encoding,
      'maxRes': maxRes,
      'excludeExternalProviders': excludeExternalProviders,
      'cityId': cityId,
      'count': count,
    };
    final Map<String, String> $headers = {
      if (xRengClienttype != null) 'x-reng-clienttype': xRengClienttype,
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<FeedComposerResponse, FeedComposerResponse>($request);
  }

  @override
  Future<Response<FeedComposerResponse>> _feedComposerV1UserRecommendedGet({
    required String? profileId,
    required bool? isSharedProfile,
    String? encoding,
    String? maxRes,
    String? excludeExternalProviders,
    required int? count,
    String? xRengClienttype,
    String? xClaimsSet,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/feed-composer/v1/user-recommended');
    final Map<String, dynamic> $params = <String, dynamic>{
      'profileId': profileId,
      'isSharedProfile': isSharedProfile,
      'encoding': encoding,
      'maxRes': maxRes,
      'excludeExternalProviders': excludeExternalProviders,
      'count': count,
    };
    final Map<String, String> $headers = {
      if (xRengClienttype != null) 'x-reng-clienttype': xRengClienttype,
      if (xClaimsSet != null) 'x-Claims-Set': xClaimsSet,
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<FeedComposerResponse, FeedComposerResponse>($request);
  }

  @override
  Future<Response<FeedComposerResponseWithSeedTitleAndGenre>>
      _feedComposerV1UserRecommendedByWatchedGenreGet({
    required String? profileId,
    required bool? isSharedProfile,
    String? encoding,
    String? maxRes,
    String? excludeExternalProviders,
    required int? count,
    String? xRengClienttype,
    String? xClaimsSet,
    String? cacheControl,
  }) {
    final Uri $url =
        Uri.parse('/feed-composer/v1/user-recommended-by-watched-genre');
    final Map<String, dynamic> $params = <String, dynamic>{
      'profileId': profileId,
      'isSharedProfile': isSharedProfile,
      'encoding': encoding,
      'maxRes': maxRes,
      'excludeExternalProviders': excludeExternalProviders,
      'count': count,
    };
    final Map<String, String> $headers = {
      if (xRengClienttype != null) 'x-reng-clienttype': xRengClienttype,
      if (xClaimsSet != null) 'x-Claims-Set': xClaimsSet,
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<FeedComposerResponseWithSeedTitleAndGenre,
        FeedComposerResponseWithSeedTitleAndGenre>($request);
  }

  @override
  Future<Response<FeedComposerResponse>> _feedComposerV1WatchlistGet({
    required String? profileId,
    String? encoding,
    String? maxRes,
    String? excludeExternalProviders,
    required int? count,
    required String? filter,
    String? xCus = 'X-Cus',
    String? xClaimsSet,
    String? xDev,
    String? xEntitlementsToken = 'X-Entitlements-Token',
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/feed-composer/v1/watchlist');
    final Map<String, dynamic> $params = <String, dynamic>{
      'profileId': profileId,
      'encoding': encoding,
      'maxRes': maxRes,
      'excludeExternalProviders': excludeExternalProviders,
      'count': count,
      'filter': filter,
    };
    final Map<String, String> $headers = {
      if (xCus != null) 'x-cus': xCus,
      if (xClaimsSet != null) 'x-Claims-Set': xClaimsSet,
      if (xDev != null) 'x-dev': xDev,
      if (xEntitlementsToken != null)
        'x-entitlements-token': xEntitlementsToken,
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<FeedComposerResponse, FeedComposerResponse>($request);
  }

  @override
  Future<Response<FeedComposerResponse>> _feedComposerV1ContinueWatchingGet({
    required String? profileId,
    String? encoding,
    String? maxRes,
    required int? count,
    required String? filter,
    String? xCus = 'X-Cus',
    String? xClaimsSet,
    String? xDev,
    String? xEntitlementsToken = 'X-Entitlements-Token',
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/feed-composer/v1/continue-watching');
    final Map<String, dynamic> $params = <String, dynamic>{
      'profileId': profileId,
      'encoding': encoding,
      'maxRes': maxRes,
      'count': count,
      'filter': filter,
    };
    final Map<String, String> $headers = {
      if (xCus != null) 'x-cus': xCus,
      if (xClaimsSet != null) 'x-Claims-Set': xClaimsSet,
      if (xDev != null) 'x-dev': xDev,
      if (xEntitlementsToken != null)
        'x-entitlements-token': xEntitlementsToken,
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<FeedComposerResponse, FeedComposerResponse>($request);
  }

  @override
  Future<Response<FeedComposerResponseWithTotalCount>>
      _feedComposerV1EditorialFeedFeedCridGet({
    required String? feedCrid,
    String? filter,
    String? brandingProviderId,
    String? encoding,
    String? maxRes,
    String? excludeExternalProviders,
    String? cityId,
    required int? count,
    String? language,
    String? sorting,
    int? page,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/feed-composer/v1/editorial-feed/${feedCrid}');
    final Map<String, dynamic> $params = <String, dynamic>{
      'filter': filter,
      'brandingProviderId': brandingProviderId,
      'encoding': encoding,
      'maxRes': maxRes,
      'excludeExternalProviders': excludeExternalProviders,
      'cityId': cityId,
      'count': count,
      'language': language,
      'sorting': sorting,
      'page': page,
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
    return client.send<FeedComposerResponseWithTotalCount,
        FeedComposerResponseWithTotalCount>($request);
  }

  @override
  Future<Response<FeedComposerResponseWithSeedTitle>>
      _feedComposerV1MoreLikeWatchedGet({
    required String? profileId,
    required bool? isSharedProfile,
    String? encoding,
    String? maxRes,
    String? excludeExternalProviders,
    required int? count,
    String? xRengClienttype,
    String? xClaimsSet,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/feed-composer/v1/more-like-watched');
    final Map<String, dynamic> $params = <String, dynamic>{
      'profileId': profileId,
      'isSharedProfile': isSharedProfile,
      'encoding': encoding,
      'maxRes': maxRes,
      'excludeExternalProviders': excludeExternalProviders,
      'count': count,
    };
    final Map<String, String> $headers = {
      if (xRengClienttype != null) 'x-reng-clienttype': xRengClienttype,
      if (xClaimsSet != null) 'x-Claims-Set': xClaimsSet,
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<FeedComposerResponseWithSeedTitle,
        FeedComposerResponseWithSeedTitle>($request);
  }

  @override
  Future<Response<FeedComposerResponseWithSeedTitleAndGenre>>
      _feedComposerV1MoreLikeWatchedGenreGet({
    required String? profileId,
    required bool? isSharedProfile,
    String? encoding,
    String? maxRes,
    String? excludeExternalProviders,
    required int? count,
    String? xRengClienttype,
    String? xClaimsSet,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/feed-composer/v1/more-like-watched-genre');
    final Map<String, dynamic> $params = <String, dynamic>{
      'profileId': profileId,
      'isSharedProfile': isSharedProfile,
      'encoding': encoding,
      'maxRes': maxRes,
      'excludeExternalProviders': excludeExternalProviders,
      'count': count,
    };
    final Map<String, String> $headers = {
      if (xRengClienttype != null) 'x-reng-clienttype': xRengClienttype,
      if (xClaimsSet != null) 'x-Claims-Set': xClaimsSet,
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<FeedComposerResponseWithSeedTitleAndGenre,
        FeedComposerResponseWithSeedTitleAndGenre>($request);
  }

  @override
  Future<Response<FeedComposerResponseWithSeedTitle>>
      _feedComposerV1CollaborativeRecommendationsGet({
    required String? profileId,
    required String? isSharedProfile,
    String? encoding,
    String? maxRes,
    String? excludeExternalProviders,
    required int? count,
    String? xRengClienttype,
    String? xClaimsSet,
    String? cacheControl,
  }) {
    final Uri $url =
        Uri.parse('/feed-composer/v1/collaborative-recommendations');
    final Map<String, dynamic> $params = <String, dynamic>{
      'profileId': profileId,
      'isSharedProfile': isSharedProfile,
      'encoding': encoding,
      'maxRes': maxRes,
      'excludeExternalProviders': excludeExternalProviders,
      'count': count,
    };
    final Map<String, String> $headers = {
      if (xRengClienttype != null) 'x-reng-clienttype': xRengClienttype,
      if (xClaimsSet != null) 'x-Claims-Set': xClaimsSet,
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<FeedComposerResponseWithSeedTitle,
        FeedComposerResponseWithSeedTitle>($request);
  }

  @override
  Future<Response<Structure>> _v2VodstructureRootIdGet({
    required String? rootId,
    required String? language,
    String? fallbackRootId,
    String? encoding,
    String? maxRes,
    bool? excludeAdult,
    String? featureFlags,
    String? xCus = 'X-Cus',
    String? xDev,
    String? xEntitlementsToken = 'X-Entitlements-Token',
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/v2/vodstructure/${rootId}');
    final Map<String, dynamic> $params = <String, dynamic>{
      'language': language,
      'fallbackRootId': fallbackRootId,
      'encoding': encoding,
      'maxRes': maxRes,
      'excludeAdult': excludeAdult,
      'featureFlags': featureFlags,
    };
    final Map<String, String> $headers = {
      if (xCus != null) 'x-cus': xCus,
      if (xDev != null) 'x-dev': xDev,
      if (xEntitlementsToken != null)
        'x-entitlements-token': xEntitlementsToken,
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<Structure, Structure>($request);
  }

  @override
  Future<Response<Screen>> _v2ContextualvodRootIdGet({
    required String? rootId,
    required String? language,
    String? profileId,
    bool? optIn,
    bool? sharedProfile,
    String? encoding,
    String? maxRes,
    String? cityId,
    String? includeExternalProvider,
    int? replayOptedInTime,
    bool? mergingOn,
    bool? excludeAdult,
    String? featureFlags,
    String? xCus = 'X-Cus',
    String? xDev,
    String? xEntitlementsToken = 'X-Entitlements-Token',
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/v2/contextualvod/${rootId}');
    final Map<String, dynamic> $params = <String, dynamic>{
      'language': language,
      'profileId': profileId,
      'optIn': optIn,
      'sharedProfile': sharedProfile,
      'encoding': encoding,
      'maxRes': maxRes,
      'cityId': cityId,
      'includeExternalProvider': includeExternalProvider,
      'replayOptedInTime': replayOptedInTime,
      'mergingOn': mergingOn,
      'excludeAdult': excludeAdult,
      'featureFlags': featureFlags,
    };
    final Map<String, String> $headers = {
      if (xCus != null) 'x-cus': xCus,
      if (xDev != null) 'x-dev': xDev,
      if (xEntitlementsToken != null)
        'x-entitlements-token': xEntitlementsToken,
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<Screen, Screen>($request);
  }

  @override
  Future<Response<RentalScreen>> _v2RentalsGet({
    required String? language,
    String? pagingOffset,
    String? pagingSize,
    String? profileId,
    bool? isAdult,
    String? encoding,
    String? maxRes,
    int? replayOptedInTime,
    bool? mergingOn,
    String? xCus = 'X-Cus',
    String? xDev,
    String? xEntitlementsToken = 'X-Entitlements-Token',
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/v2/rentals');
    final Map<String, dynamic> $params = <String, dynamic>{
      'language': language,
      'pagingOffset': pagingOffset,
      'pagingSize': pagingSize,
      'profileId': profileId,
      'isAdult': isAdult,
      'encoding': encoding,
      'maxRes': maxRes,
      'replayOptedInTime': replayOptedInTime,
      'mergingOn': mergingOn,
    };
    final Map<String, String> $headers = {
      if (xCus != null) 'x-cus': xCus,
      if (xDev != null) 'x-dev': xDev,
      if (xEntitlementsToken != null)
        'x-entitlements-token': xEntitlementsToken,
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<RentalScreen, RentalScreen>($request);
  }

  @override
  Future<Response<Map<String, dynamic>>> _v2DetailscreenCridGet({
    required String? crid,
    required String? language,
    String? profileId,
    String? encoding,
    String? maxRes,
    String? cityId,
    String? includeExternalProvider,
    String? brandingProviderId,
    String? xCus = 'X-Cus',
    String? xDev,
    String? xEntitlementsToken = 'X-Entitlements-Token',
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/v2/detailscreen/${crid}');
    final Map<String, dynamic> $params = <String, dynamic>{
      'language': language,
      'profileId': profileId,
      'encoding': encoding,
      'maxRes': maxRes,
      'cityId': cityId,
      'includeExternalProvider': includeExternalProvider,
      'brandingProviderId': brandingProviderId,
    };
    final Map<String, String> $headers = {
      if (xCus != null) 'x-cus': xCus,
      if (xDev != null) 'x-dev': xDev,
      if (xEntitlementsToken != null)
        'x-entitlements-token': xEntitlementsToken,
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }

  @override
  Future<Response<TrailerInfo>> _v2TrailerDetailsTrailerCridGet({
    required String? trailerCrid,
    required String? language,
    String? profileId,
    String? encoding,
    String? maxRes,
    String? cityId,
    String? includeExternalProvider,
    String? xCus = 'X-Cus',
    String? xDev,
    String? xEntitlementsToken = 'X-Entitlements-Token',
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/v2/trailerDetails/${trailerCrid}');
    final Map<String, dynamic> $params = <String, dynamic>{
      'language': language,
      'profileId': profileId,
      'encoding': encoding,
      'maxRes': maxRes,
      'cityId': cityId,
      'includeExternalProvider': includeExternalProvider,
    };
    final Map<String, String> $headers = {
      if (xCus != null) 'x-cus': xCus,
      if (xDev != null) 'x-dev': xDev,
      if (xEntitlementsToken != null)
        'x-entitlements-token': xEntitlementsToken,
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<TrailerInfo, TrailerInfo>($request);
  }

  @override
  Future<Response<GridOptions>> _v2GridoptionsCridGet({
    required String? crid,
    required String? language,
    bool? genreCrid,
    String? encoding,
    String? maxRes,
    String? cityId,
    bool? onlyGoPlayable,
    String? xCus = 'X-Cus',
    String? xDev,
    String? xEntitlementsToken = 'X-Entitlements-Token',
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/v2/gridoptions/${crid}');
    final Map<String, dynamic> $params = <String, dynamic>{
      'language': language,
      'genreCrid': genreCrid,
      'encoding': encoding,
      'maxRes': maxRes,
      'cityId': cityId,
      'onlyGoPlayable': onlyGoPlayable,
    };
    final Map<String, String> $headers = {
      if (xCus != null) 'x-cus': xCus,
      if (xDev != null) 'x-dev': xDev,
      if (xEntitlementsToken != null)
        'x-entitlements-token': xEntitlementsToken,
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<GridOptions, GridOptions>($request);
  }

  @override
  Future<Response<GridScreen>> _v2GridscreenRootIdCridGet({
    required String? rootId,
    required String? crid,
    required String? language,
    String? profileId,
    String? sortType,
    String? sortDirection,
    String? filterType,
    String? pagingOffset,
    String? encoding,
    String? maxRes,
    String? cityId,
    String? includeExternalProvider,
    bool? goDownloadable,
    bool? onlyGoPlayable,
    int? replayOptedInTime,
    bool? mergingOn,
    bool? excludeAdult,
    String? xCus = 'X-Cus',
    String? xDev,
    String? xEntitlementsToken = 'X-Entitlements-Token',
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/v2/gridscreen/${rootId}/${crid}');
    final Map<String, dynamic> $params = <String, dynamic>{
      'language': language,
      'profileId': profileId,
      'sortType': sortType,
      'sortDirection': sortDirection,
      'filterType': filterType,
      'pagingOffset': pagingOffset,
      'encoding': encoding,
      'maxRes': maxRes,
      'cityId': cityId,
      'includeExternalProvider': includeExternalProvider,
      'goDownloadable': goDownloadable,
      'onlyGoPlayable': onlyGoPlayable,
      'replayOptedInTime': replayOptedInTime,
      'mergingOn': mergingOn,
      'excludeAdult': excludeAdult,
    };
    final Map<String, String> $headers = {
      if (xCus != null) 'x-cus': xCus,
      if (xDev != null) 'x-dev': xDev,
      if (xEntitlementsToken != null)
        'x-entitlements-token': xEntitlementsToken,
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<GridScreen, GridScreen>($request);
  }

  @override
  Future<Response<NextEpisode>> _v2NextepisodeGet({
    required String? language,
    required String? episodeId,
    String? encoding,
    String? maxRes,
    String? includeExternalProvider,
    String? brandingProviderId,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/v2/nextepisode');
    final Map<String, dynamic> $params = <String, dynamic>{
      'language': language,
      'episodeId': episodeId,
      'encoding': encoding,
      'maxRes': maxRes,
      'includeExternalProvider': includeExternalProvider,
      'brandingProviderId': brandingProviderId,
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
    return client.send<NextEpisode, NextEpisode>($request);
  }

  @override
  Future<Response<TileScreen>> _v2TilescreenRootIdCridGet({
    required String? rootId,
    required String? crid,
    required String? language,
    String? encoding,
    String? maxRes,
    bool? excludeAdult,
    String? featureFlags,
    String? xCus = 'X-Cus',
    String? xDev,
    String? xEntitlementsToken = 'X-Entitlements-Token',
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/v2/tilescreen/${rootId}/${crid}');
    final Map<String, dynamic> $params = <String, dynamic>{
      'language': language,
      'encoding': encoding,
      'maxRes': maxRes,
      'excludeAdult': excludeAdult,
      'featureFlags': featureFlags,
    };
    final Map<String, String> $headers = {
      if (xCus != null) 'x-cus': xCus,
      if (xDev != null) 'x-dev': xDev,
      if (xEntitlementsToken != null)
        'x-entitlements-token': xEntitlementsToken,
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<TileScreen, TileScreen>($request);
  }

  @override
  Future<Response<Screen>> _v2VodscreenRootIdCridGet({
    required String? rootId,
    required String? crid,
    required String? language,
    String? profileId,
    bool? optIn,
    bool? sharedProfile,
    String? encoding,
    String? maxRes,
    String? cityId,
    String? includeExternalProvider,
    int? replayOptedInTime,
    bool? mergingOn,
    bool? excludeAdult,
    String? featureFlags,
    String? xCus = 'X-Cus',
    String? xDev,
    String? xEntitlementsToken = 'X-Entitlements-Token',
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/v2/vodscreen/${rootId}/${crid}');
    final Map<String, dynamic> $params = <String, dynamic>{
      'language': language,
      'profileId': profileId,
      'optIn': optIn,
      'sharedProfile': sharedProfile,
      'encoding': encoding,
      'maxRes': maxRes,
      'cityId': cityId,
      'includeExternalProvider': includeExternalProvider,
      'replayOptedInTime': replayOptedInTime,
      'mergingOn': mergingOn,
      'excludeAdult': excludeAdult,
      'featureFlags': featureFlags,
    };
    final Map<String, String> $headers = {
      if (xCus != null) 'x-cus': xCus,
      if (xDev != null) 'x-dev': xDev,
      if (xEntitlementsToken != null)
        'x-entitlements-token': xEntitlementsToken,
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<Screen, Screen>($request);
  }

  @override
  Future<Response<Messages>> _v2VodstructureRootIdValidationReportGet({
    required String? rootId,
    required String? language,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/v2/vodstructure/${rootId}/validation-report');
    final Map<String, dynamic> $params = <String, dynamic>{
      'language': language
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
    return client.send<Messages, Messages>($request);
  }

  @override
  Future<Response<Structure>> _v2VodstructureRootIdCridGet({
    required String? rootId,
    required String? crid,
    required String? language,
    String? encoding,
    String? maxRes,
    bool? excludeAdult,
    String? featureFlags,
    String? xCus = 'X-Cus',
    String? xDev,
    String? xEntitlementsToken = 'X-Entitlements-Token',
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/v2/vodstructure/${rootId}/${crid}');
    final Map<String, dynamic> $params = <String, dynamic>{
      'language': language,
      'encoding': encoding,
      'maxRes': maxRes,
      'excludeAdult': excludeAdult,
      'featureFlags': featureFlags,
    };
    final Map<String, String> $headers = {
      if (xCus != null) 'x-cus': xCus,
      if (xDev != null) 'x-dev': xDev,
      if (xEntitlementsToken != null)
        'x-entitlements-token': xEntitlementsToken,
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<Structure, Structure>($request);
  }

  @override
  Future<Response<PersonDetail>> _v2PersondetailPersonIdGet({
    required String? personId,
    required String? language,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/v2/persondetail/${personId}');
    final Map<String, dynamic> $params = <String, dynamic>{
      'language': language
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
    return client.send<PersonDetail, PersonDetail>($request);
  }

  @override
  Future<Response<EditorialFeed>> _hzngoV1EditorialFeedCategoryIdGet({
    required String? categoryId,
    required String? language,
    required String? sortType,
    required String? sortDirection,
    String? pagingOffset,
    String? pagingSize,
    String? filters,
    String? maxRes,
    bool? onlyGoPlayable,
    String? cityId,
    String? includeExternalProvider,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/hzngo/v1/editorialFeed/${categoryId}');
    final Map<String, dynamic> $params = <String, dynamic>{
      'language': language,
      'sortType': sortType,
      'sortDirection': sortDirection,
      'pagingOffset': pagingOffset,
      'pagingSize': pagingSize,
      'filters': filters,
      'maxRes': maxRes,
      'onlyGoPlayable': onlyGoPlayable,
      'cityId': cityId,
      'includeExternalProvider': includeExternalProvider,
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
    return client.send<EditorialFeed, EditorialFeed>($request);
  }

  @override
  Future<Response<GenreListResponse>> _hzngoV1FeedGenreListCridGet({
    required String? crid,
    required String? language,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/hzngo/v1/feedGenreList/${crid}');
    final Map<String, dynamic> $params = <String, dynamic>{
      'language': language
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
    return client.send<GenreListResponse, GenreListResponse>($request);
  }
}
