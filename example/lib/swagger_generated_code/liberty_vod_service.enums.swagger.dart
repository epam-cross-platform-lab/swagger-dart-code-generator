import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';

enum ProgramType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Show')
  show('Show'),
  @JsonValue('Title')
  title('Title');

  final String? value;

  const ProgramType(this.value);
}

enum ShowType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Show')
  show('Show'),
  @JsonValue('Title')
  title('Title');

  final String? value;

  const ShowType(this.value);
}

enum TitleType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Show')
  show('Show'),
  @JsonValue('Title')
  title('Title');

  final String? value;

  const TitleType(this.value);
}

enum PurchasedProgramType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Show')
  show('Show'),
  @JsonValue('Title')
  title('Title');

  final String? value;

  const PurchasedProgramType(this.value);
}

enum ItemType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('ASSET')
  asset('ASSET'),
  @JsonValue('SERIES')
  series('SERIES'),
  @JsonValue('SEASON')
  season('SEASON'),
  @JsonValue('EPISODE')
  episode('EPISODE');

  final String? value;

  const ItemType(this.value);
}

enum ItemAssetType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('REGULAR')
  regular('REGULAR'),
  @JsonValue('REPLAY')
  replay('REPLAY'),
  @JsonValue('CATCHUP')
  catchup('CATCHUP');

  final String? value;

  const ItemAssetType(this.value);
}

enum ItemMinResolution {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('SD')
  sd('SD'),
  @JsonValue('HD')
  hd('HD'),
  @JsonValue('4K')
  value_4k('4K'),
  @JsonValue('5K')
  value_5k('5K'),
  @JsonValue('8K')
  value_8k('8K');

  final String? value;

  const ItemMinResolution(this.value);
}

enum DetailScreenType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('ASSET')
  asset('ASSET'),
  @JsonValue('SERIES')
  series('SERIES'),
  @JsonValue('SEASON')
  season('SEASON'),
  @JsonValue('EPISODE')
  episode('EPISODE');

  final String? value;

  const DetailScreenType(this.value);
}

enum DetailScreenAssetType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('REGULAR')
  regular('REGULAR'),
  @JsonValue('REPLAY')
  replay('REPLAY'),
  @JsonValue('CATCHUP')
  catchup('CATCHUP');

  final String? value;

  const DetailScreenAssetType(this.value);
}

enum DetailScreenMinResolution {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('SD')
  sd('SD'),
  @JsonValue('HD')
  hd('HD'),
  @JsonValue('4K')
  value_4k('4K'),
  @JsonValue('5K')
  value_5k('5K'),
  @JsonValue('8K')
  value_8k('8K');

  final String? value;

  const DetailScreenMinResolution(this.value);
}

enum SourceExtSourceType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('SourceOtt')
  sourceott('SourceOtt');

  final String? value;

  const SourceExtSourceType(this.value);
}

enum SourceOttSourceType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('SourceOtt')
  sourceott('SourceOtt');

  final String? value;

  const SourceOttSourceType(this.value);
}

enum FeedComposerV1MoreLikeWatchedFromFeedFeedCridGetEncoding {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('AVC')
  avc('AVC'),
  @JsonValue('HEVC')
  hevc('HEVC'),
  @JsonValue('OTT')
  ott('OTT');

  final String? value;

  const FeedComposerV1MoreLikeWatchedFromFeedFeedCridGetEncoding(this.value);
}

enum FeedComposerV1MoreLikeWatchedFromFeedFeedCridGetMaxRes {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('HD')
  hd('HD'),
  @JsonValue('4K')
  value_4k('4K');

  final String? value;

  const FeedComposerV1MoreLikeWatchedFromFeedFeedCridGetMaxRes(this.value);
}

enum FeedComposerV1PausedItemsGetEncoding {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('AVC')
  avc('AVC'),
  @JsonValue('HEVC')
  hevc('HEVC'),
  @JsonValue('OTT')
  ott('OTT');

  final String? value;

  const FeedComposerV1PausedItemsGetEncoding(this.value);
}

enum FeedComposerV1PausedItemsGetMaxRes {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('HD')
  hd('HD'),
  @JsonValue('4K')
  value_4k('4K');

  final String? value;

  const FeedComposerV1PausedItemsGetMaxRes(this.value);
}

enum FeedComposerV1PurchasedItemsGetEncoding {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('AVC')
  avc('AVC'),
  @JsonValue('HEVC')
  hevc('HEVC'),
  @JsonValue('OTT')
  ott('OTT');

  final String? value;

  const FeedComposerV1PurchasedItemsGetEncoding(this.value);
}

enum FeedComposerV1PurchasedItemsGetMaxRes {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('HD')
  hd('HD'),
  @JsonValue('4K')
  value_4k('4K');

  final String? value;

  const FeedComposerV1PurchasedItemsGetMaxRes(this.value);
}

enum FeedComposerV1SuggestedFromContentAreaAreaCridGetEncoding {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('AVC')
  avc('AVC'),
  @JsonValue('HEVC')
  hevc('HEVC'),
  @JsonValue('OTT')
  ott('OTT');

  final String? value;

  const FeedComposerV1SuggestedFromContentAreaAreaCridGetEncoding(this.value);
}

enum FeedComposerV1SuggestedFromContentAreaAreaCridGetMaxRes {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('HD')
  hd('HD'),
  @JsonValue('4K')
  value_4k('4K');

  final String? value;

  const FeedComposerV1SuggestedFromContentAreaAreaCridGetMaxRes(this.value);
}

enum FeedComposerV1SuggestedFromContentAreaByWatchedGenreAreaCridGetEncoding {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('AVC')
  avc('AVC'),
  @JsonValue('HEVC')
  hevc('HEVC'),
  @JsonValue('OTT')
  ott('OTT');

  final String? value;

  const FeedComposerV1SuggestedFromContentAreaByWatchedGenreAreaCridGetEncoding(
      this.value);
}

enum FeedComposerV1SuggestedFromContentAreaByWatchedGenreAreaCridGetMaxRes {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('HD')
  hd('HD'),
  @JsonValue('4K')
  value_4k('4K');

  final String? value;

  const FeedComposerV1SuggestedFromContentAreaByWatchedGenreAreaCridGetMaxRes(
      this.value);
}

enum FeedComposerV1TopListTopListIdGetEncoding {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('AVC')
  avc('AVC'),
  @JsonValue('HEVC')
  hevc('HEVC'),
  @JsonValue('OTT')
  ott('OTT');

  final String? value;

  const FeedComposerV1TopListTopListIdGetEncoding(this.value);
}

enum FeedComposerV1TopListTopListIdGetMaxRes {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('HD')
  hd('HD'),
  @JsonValue('4K')
  value_4k('4K');

  final String? value;

  const FeedComposerV1TopListTopListIdGetMaxRes(this.value);
}

enum FeedComposerV1UserRecommendedGetEncoding {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('AVC')
  avc('AVC'),
  @JsonValue('HEVC')
  hevc('HEVC'),
  @JsonValue('OTT')
  ott('OTT');

  final String? value;

  const FeedComposerV1UserRecommendedGetEncoding(this.value);
}

enum FeedComposerV1UserRecommendedGetMaxRes {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('HD')
  hd('HD'),
  @JsonValue('4K')
  value_4k('4K');

  final String? value;

  const FeedComposerV1UserRecommendedGetMaxRes(this.value);
}

enum FeedComposerV1UserRecommendedByWatchedGenreGetEncoding {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('AVC')
  avc('AVC'),
  @JsonValue('HEVC')
  hevc('HEVC'),
  @JsonValue('OTT')
  ott('OTT');

  final String? value;

  const FeedComposerV1UserRecommendedByWatchedGenreGetEncoding(this.value);
}

enum FeedComposerV1UserRecommendedByWatchedGenreGetMaxRes {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('HD')
  hd('HD'),
  @JsonValue('4K')
  value_4k('4K');

  final String? value;

  const FeedComposerV1UserRecommendedByWatchedGenreGetMaxRes(this.value);
}

enum FeedComposerV1WatchlistGetEncoding {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('AVC')
  avc('AVC'),
  @JsonValue('HEVC')
  hevc('HEVC'),
  @JsonValue('OTT')
  ott('OTT');

  final String? value;

  const FeedComposerV1WatchlistGetEncoding(this.value);
}

enum FeedComposerV1WatchlistGetMaxRes {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('HD')
  hd('HD'),
  @JsonValue('4K')
  value_4k('4K');

  final String? value;

  const FeedComposerV1WatchlistGetMaxRes(this.value);
}

enum FeedComposerV1ContinueWatchingGetEncoding {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('AVC')
  avc('AVC'),
  @JsonValue('HEVC')
  hevc('HEVC'),
  @JsonValue('OTT')
  ott('OTT');

  final String? value;

  const FeedComposerV1ContinueWatchingGetEncoding(this.value);
}

enum FeedComposerV1ContinueWatchingGetMaxRes {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('HD')
  hd('HD'),
  @JsonValue('4K')
  value_4k('4K');

  final String? value;

  const FeedComposerV1ContinueWatchingGetMaxRes(this.value);
}

enum FeedComposerV1EditorialFeedFeedCridGetEncoding {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('AVC')
  avc('AVC'),
  @JsonValue('HEVC')
  hevc('HEVC'),
  @JsonValue('OTT')
  ott('OTT');

  final String? value;

  const FeedComposerV1EditorialFeedFeedCridGetEncoding(this.value);
}

enum FeedComposerV1EditorialFeedFeedCridGetMaxRes {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('HD')
  hd('HD'),
  @JsonValue('4K')
  value_4k('4K');

  final String? value;

  const FeedComposerV1EditorialFeedFeedCridGetMaxRes(this.value);
}

enum FeedComposerV1EditorialFeedFeedCridGetSorting {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('editorial')
  editorial('editorial'),
  @JsonValue('popularity')
  popularity('popularity'),
  @JsonValue('nameAZ')
  nameaz('nameAZ'),
  @JsonValue('nameZA')
  nameza('nameZA'),
  @JsonValue('newestFirst')
  newestfirst('newestFirst'),
  @JsonValue('oldestFirst')
  oldestfirst('oldestFirst'),
  @JsonValue('newlyAddedFirst')
  newlyaddedfirst('newlyAddedFirst'),
  @JsonValue('lastChanceFirst')
  lastchancefirst('lastChanceFirst'),
  @JsonValue('recentBroadcastsFirst')
  recentbroadcastsfirst('recentBroadcastsFirst');

  final String? value;

  const FeedComposerV1EditorialFeedFeedCridGetSorting(this.value);
}

enum FeedComposerV1MoreLikeWatchedGetEncoding {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('AVC')
  avc('AVC'),
  @JsonValue('HEVC')
  hevc('HEVC'),
  @JsonValue('OTT')
  ott('OTT');

  final String? value;

  const FeedComposerV1MoreLikeWatchedGetEncoding(this.value);
}

enum FeedComposerV1MoreLikeWatchedGetMaxRes {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('HD')
  hd('HD'),
  @JsonValue('4K')
  value_4k('4K');

  final String? value;

  const FeedComposerV1MoreLikeWatchedGetMaxRes(this.value);
}

enum FeedComposerV1MoreLikeWatchedGenreGetEncoding {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('AVC')
  avc('AVC'),
  @JsonValue('HEVC')
  hevc('HEVC'),
  @JsonValue('OTT')
  ott('OTT');

  final String? value;

  const FeedComposerV1MoreLikeWatchedGenreGetEncoding(this.value);
}

enum FeedComposerV1MoreLikeWatchedGenreGetMaxRes {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('HD')
  hd('HD'),
  @JsonValue('4K')
  value_4k('4K');

  final String? value;

  const FeedComposerV1MoreLikeWatchedGenreGetMaxRes(this.value);
}

enum FeedComposerV1CollaborativeRecommendationsGetIsSharedProfile {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('true')
  $true('true'),
  @JsonValue('false')
  $false('false');

  final String? value;

  const FeedComposerV1CollaborativeRecommendationsGetIsSharedProfile(
      this.value);
}

enum FeedComposerV1CollaborativeRecommendationsGetEncoding {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('AVC')
  avc('AVC'),
  @JsonValue('HEVC')
  hevc('HEVC'),
  @JsonValue('OTT')
  ott('OTT');

  final String? value;

  const FeedComposerV1CollaborativeRecommendationsGetEncoding(this.value);
}

enum FeedComposerV1CollaborativeRecommendationsGetMaxRes {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('HD')
  hd('HD'),
  @JsonValue('4K')
  value_4k('4K');

  final String? value;

  const FeedComposerV1CollaborativeRecommendationsGetMaxRes(this.value);
}

enum V2VodstructureRootIdGetEncoding {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('AVC')
  avc('AVC'),
  @JsonValue('HEVC')
  hevc('HEVC');

  final String? value;

  const V2VodstructureRootIdGetEncoding(this.value);
}

enum V2VodstructureRootIdGetMaxRes {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('HD')
  hd('HD'),
  @JsonValue('4K')
  value_4k('4K');

  final String? value;

  const V2VodstructureRootIdGetMaxRes(this.value);
}

enum V2ContextualvodRootIdGetEncoding {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('AVC')
  avc('AVC'),
  @JsonValue('HEVC')
  hevc('HEVC');

  final String? value;

  const V2ContextualvodRootIdGetEncoding(this.value);
}

enum V2ContextualvodRootIdGetMaxRes {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('HD')
  hd('HD'),
  @JsonValue('4K')
  value_4k('4K');

  final String? value;

  const V2ContextualvodRootIdGetMaxRes(this.value);
}

enum V2RentalsGetEncoding {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('AVC')
  avc('AVC'),
  @JsonValue('HEVC')
  hevc('HEVC');

  final String? value;

  const V2RentalsGetEncoding(this.value);
}

enum V2RentalsGetMaxRes {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('HD')
  hd('HD'),
  @JsonValue('4K')
  value_4k('4K');

  final String? value;

  const V2RentalsGetMaxRes(this.value);
}

enum V2DetailscreenCridGetEncoding {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('AVC')
  avc('AVC'),
  @JsonValue('HEVC')
  hevc('HEVC');

  final String? value;

  const V2DetailscreenCridGetEncoding(this.value);
}

enum V2DetailscreenCridGetMaxRes {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('HD')
  hd('HD'),
  @JsonValue('4K')
  value_4k('4K');

  final String? value;

  const V2DetailscreenCridGetMaxRes(this.value);
}

enum V2TrailerDetailsTrailerCridGetEncoding {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('AVC')
  avc('AVC'),
  @JsonValue('HEVC')
  hevc('HEVC');

  final String? value;

  const V2TrailerDetailsTrailerCridGetEncoding(this.value);
}

enum V2TrailerDetailsTrailerCridGetMaxRes {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('HD')
  hd('HD'),
  @JsonValue('4K')
  value_4k('4K');

  final String? value;

  const V2TrailerDetailsTrailerCridGetMaxRes(this.value);
}

enum V2GridoptionsCridGetEncoding {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('AVC')
  avc('AVC'),
  @JsonValue('HEVC')
  hevc('HEVC');

  final String? value;

  const V2GridoptionsCridGetEncoding(this.value);
}

enum V2GridoptionsCridGetMaxRes {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('HD')
  hd('HD'),
  @JsonValue('4K')
  value_4k('4K');

  final String? value;

  const V2GridoptionsCridGetMaxRes(this.value);
}

enum V2GridscreenRootIdCridGetSortType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('ordinal')
  ordinal('ordinal'),
  @JsonValue('name')
  name('name'),
  @JsonValue('broadcastDate')
  broadcastdate('broadcastDate'),
  @JsonValue('popularity')
  popularity('popularity'),
  @JsonValue('prodYear')
  prodyear('prodYear');

  final String? value;

  const V2GridscreenRootIdCridGetSortType(this.value);
}

enum V2GridscreenRootIdCridGetSortDirection {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('ascending')
  ascending('ascending'),
  @JsonValue('descending')
  descending('descending');

  final String? value;

  const V2GridscreenRootIdCridGetSortDirection(this.value);
}

enum V2GridscreenRootIdCridGetFilterType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('new')
  $new('new'),
  @JsonValue('last')
  last('last');

  final String? value;

  const V2GridscreenRootIdCridGetFilterType(this.value);
}

enum V2GridscreenRootIdCridGetEncoding {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('AVC')
  avc('AVC'),
  @JsonValue('HEVC')
  hevc('HEVC');

  final String? value;

  const V2GridscreenRootIdCridGetEncoding(this.value);
}

enum V2GridscreenRootIdCridGetMaxRes {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('HD')
  hd('HD'),
  @JsonValue('4K')
  value_4k('4K');

  final String? value;

  const V2GridscreenRootIdCridGetMaxRes(this.value);
}

enum V2NextepisodeGetEncoding {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('AVC')
  avc('AVC'),
  @JsonValue('HEVC')
  hevc('HEVC');

  final String? value;

  const V2NextepisodeGetEncoding(this.value);
}

enum V2NextepisodeGetMaxRes {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('HD')
  hd('HD'),
  @JsonValue('4K')
  value_4k('4K');

  final String? value;

  const V2NextepisodeGetMaxRes(this.value);
}

enum V2TilescreenRootIdCridGetEncoding {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('AVC')
  avc('AVC'),
  @JsonValue('HEVC')
  hevc('HEVC');

  final String? value;

  const V2TilescreenRootIdCridGetEncoding(this.value);
}

enum V2TilescreenRootIdCridGetMaxRes {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('HD')
  hd('HD'),
  @JsonValue('4K')
  value_4k('4K');

  final String? value;

  const V2TilescreenRootIdCridGetMaxRes(this.value);
}

enum V2VodscreenRootIdCridGetEncoding {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('AVC')
  avc('AVC'),
  @JsonValue('HEVC')
  hevc('HEVC');

  final String? value;

  const V2VodscreenRootIdCridGetEncoding(this.value);
}

enum V2VodscreenRootIdCridGetMaxRes {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('HD')
  hd('HD'),
  @JsonValue('4K')
  value_4k('4K');

  final String? value;

  const V2VodscreenRootIdCridGetMaxRes(this.value);
}

enum V2VodstructureRootIdCridGetEncoding {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('AVC')
  avc('AVC'),
  @JsonValue('HEVC')
  hevc('HEVC');

  final String? value;

  const V2VodstructureRootIdCridGetEncoding(this.value);
}

enum V2VodstructureRootIdCridGetMaxRes {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('HD')
  hd('HD'),
  @JsonValue('4K')
  value_4k('4K');

  final String? value;

  const V2VodstructureRootIdCridGetMaxRes(this.value);
}

enum HzngoV1EditorialFeedCategoryIdGetSortType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('ordinal')
  ordinal('ordinal'),
  @JsonValue('name')
  name('name'),
  @JsonValue('broadcastDate')
  broadcastdate('broadcastDate'),
  @JsonValue('popularity')
  popularity('popularity'),
  @JsonValue('prodYear')
  prodyear('prodYear');

  final String? value;

  const HzngoV1EditorialFeedCategoryIdGetSortType(this.value);
}

enum HzngoV1EditorialFeedCategoryIdGetSortDirection {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('ascending')
  ascending('ascending'),
  @JsonValue('descending')
  descending('descending');

  final String? value;

  const HzngoV1EditorialFeedCategoryIdGetSortDirection(this.value);
}
