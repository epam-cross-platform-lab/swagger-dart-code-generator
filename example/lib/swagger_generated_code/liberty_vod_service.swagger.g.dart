// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liberty_vod_service.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Program _$ProgramFromJson(Map<String, dynamic> json) => Program(
      crid: json['crid'] as String? ?? '',
      type: programTypeFromJson(json['type']),
    );

Map<String, dynamic> _$ProgramToJson(Program instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('crid', instance.crid);
  writeNotNull('type', programTypeToJson(instance.type));
  return val;
}

Show _$ShowFromJson(Map<String, dynamic> json) => Show(
      crid: json['crid'] as String? ?? '',
      type: showTypeFromJson(json['type']),
    );

Map<String, dynamic> _$ShowToJson(Show instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('crid', instance.crid);
  writeNotNull('type', showTypeToJson(instance.type));
  return val;
}

Title _$TitleFromJson(Map<String, dynamic> json) => Title(
      crid: json['crid'] as String? ?? '',
      type: titleTypeFromJson(json['type']),
    );

Map<String, dynamic> _$TitleToJson(Title instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('crid', instance.crid);
  writeNotNull('type', titleTypeToJson(instance.type));
  return val;
}

FeedComposerResponse _$FeedComposerResponseFromJson(
        Map<String, dynamic> json) =>
    FeedComposerResponse(
      programs: (json['programs'] as List<dynamic>?)
              ?.map((e) => e as Object)
              .toList() ??
          [],
    );

Map<String, dynamic> _$FeedComposerResponseToJson(
    FeedComposerResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('programs', instance.programs);
  return val;
}

FeedComposerResponseWithTotalCount _$FeedComposerResponseWithTotalCountFromJson(
        Map<String, dynamic> json) =>
    FeedComposerResponseWithTotalCount(
      totalCount: json['totalCount'] as int?,
      programs: (json['programs'] as List<dynamic>?)
              ?.map((e) => e as Object)
              .toList() ??
          [],
    );

Map<String, dynamic> _$FeedComposerResponseWithTotalCountToJson(
    FeedComposerResponseWithTotalCount instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('totalCount', instance.totalCount);
  writeNotNull('programs', instance.programs);
  return val;
}

FeedComposerResponseWithSeedTitle _$FeedComposerResponseWithSeedTitleFromJson(
        Map<String, dynamic> json) =>
    FeedComposerResponseWithSeedTitle(
      seedTitleCrid: json['seedTitleCrid'] as String? ?? '',
      programs: (json['programs'] as List<dynamic>?)
              ?.map((e) => e as Object)
              .toList() ??
          [],
    );

Map<String, dynamic> _$FeedComposerResponseWithSeedTitleToJson(
    FeedComposerResponseWithSeedTitle instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('seedTitleCrid', instance.seedTitleCrid);
  writeNotNull('programs', instance.programs);
  return val;
}

FeedComposerResponseWithSeedTitleAndGenre
    _$FeedComposerResponseWithSeedTitleAndGenreFromJson(
            Map<String, dynamic> json) =>
        FeedComposerResponseWithSeedTitleAndGenre(
          seedContentGenreTermId:
              json['seedContentGenreTermId'] as String? ?? '',
          seedTitleCrid: json['seedTitleCrid'] as String? ?? '',
          programs: (json['programs'] as List<dynamic>?)
                  ?.map((e) => e as Object)
                  .toList() ??
              [],
        );

Map<String, dynamic> _$FeedComposerResponseWithSeedTitleAndGenreToJson(
    FeedComposerResponseWithSeedTitleAndGenre instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('seedContentGenreTermId', instance.seedContentGenreTermId);
  writeNotNull('seedTitleCrid', instance.seedTitleCrid);
  writeNotNull('programs', instance.programs);
  return val;
}

FeedComposerResponseForPurchasedProgram
    _$FeedComposerResponseForPurchasedProgramFromJson(
            Map<String, dynamic> json) =>
        FeedComposerResponseForPurchasedProgram(
          programs: (json['programs'] as List<dynamic>?)
                  ?.map((e) =>
                      PurchasedProgram.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$FeedComposerResponseForPurchasedProgramToJson(
    FeedComposerResponseForPurchasedProgram instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('programs', instance.programs?.map((e) => e.toJson()).toList());
  return val;
}

PurchasedProgram _$PurchasedProgramFromJson(Map<String, dynamic> json) =>
    PurchasedProgram(
      crid: json['crid'] as String? ?? '',
      type: purchasedProgramTypeFromJson(json['type']),
      brandingProviderId: json['brandingProviderId'] as String? ?? '',
      productId: json['productId'] as String? ?? '',
    );

Map<String, dynamic> _$PurchasedProgramToJson(PurchasedProgram instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('crid', instance.crid);
  writeNotNull('type', purchasedProgramTypeToJson(instance.type));
  writeNotNull('brandingProviderId', instance.brandingProviderId);
  writeNotNull('productId', instance.productId);
  return val;
}

ASpot _$ASpotFromJson(Map<String, dynamic> json) => ASpot(
      id: json['id'] as String? ?? '',
      mergedId: json['mergedId'] as String? ?? '',
      title: json['title'] as String? ?? '',
      isAdult: json['isAdult'] as bool?,
      imageVersion: json['imageVersion'] as String? ?? '',
      screenLayout: json['screenLayout'] as String? ?? '',
      background: json['background'] as String? ?? '',
      treatment: json['treatment'] as String? ?? '',
      gridLink: json['gridLink'] == null
          ? null
          : GridLink.fromJson(json['gridLink'] as Map<String, dynamic>),
      synopsis: json['synopsis'] as String? ?? '',
      isBoxset: json['isBoxset'] as bool?,
    );

Map<String, dynamic> _$ASpotToJson(ASpot instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('mergedId', instance.mergedId);
  writeNotNull('title', instance.title);
  writeNotNull('isAdult', instance.isAdult);
  writeNotNull('imageVersion', instance.imageVersion);
  writeNotNull('screenLayout', instance.screenLayout);
  writeNotNull('background', instance.background);
  writeNotNull('treatment', instance.treatment);
  writeNotNull('gridLink', instance.gridLink?.toJson());
  writeNotNull('synopsis', instance.synopsis);
  writeNotNull('isBoxset', instance.isBoxset);
  return val;
}

Collection _$CollectionFromJson(Map<String, dynamic> json) => Collection(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      ordinal: json['ordinal'] as int?,
      type: json['type'] as String? ?? '',
      isAdult: json['isAdult'] as bool?,
      collectionLayout: json['collectionLayout'] as String? ?? '',
      contentType: json['contentType'] as String? ?? '',
      totalCount: json['totalCount'] as int?,
      gridLink: json['gridLink'] == null
          ? null
          : GridLink.fromJson(json['gridLink'] as Map<String, dynamic>),
      collectionTheme: json['collectionTheme'] == null
          ? null
          : CollectionTheme.fromJson(
              json['collectionTheme'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$CollectionToJson(Collection instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('title', instance.title);
  writeNotNull('ordinal', instance.ordinal);
  writeNotNull('type', instance.type);
  writeNotNull('isAdult', instance.isAdult);
  writeNotNull('collectionLayout', instance.collectionLayout);
  writeNotNull('contentType', instance.contentType);
  writeNotNull('totalCount', instance.totalCount);
  writeNotNull('gridLink', instance.gridLink?.toJson());
  writeNotNull('collectionTheme', instance.collectionTheme?.toJson());
  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  return val;
}

GridLink _$GridLinkFromJson(Map<String, dynamic> json) => GridLink(
      id: json['id'] as String? ?? '',
      type: json['type'] as String? ?? '',
      softLinkType: json['softLinkType'] as String? ?? '',
      title: json['title'] as String? ?? '',
      theme: json['theme'] == null
          ? null
          : Theme.fromJson(json['theme'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GridLinkToJson(GridLink instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('type', instance.type);
  writeNotNull('softLinkType', instance.softLinkType);
  writeNotNull('title', instance.title);
  writeNotNull('theme', instance.theme?.toJson());
  return val;
}

CollectionTheme _$CollectionThemeFromJson(Map<String, dynamic> json) =>
    CollectionTheme(
      backgroundColor: json['backgroundColor'] as String? ?? '',
      showProviderLogo: json['showProviderLogo'] as bool?,
    );

Map<String, dynamic> _$CollectionThemeToJson(CollectionTheme instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('backgroundColor', instance.backgroundColor);
  writeNotNull('showProviderLogo', instance.showProviderLogo);
  return val;
}

Hotlinks _$HotlinksFromJson(Map<String, dynamic> json) => Hotlinks(
      rentScreen: json['rentScreen'] == null
          ? null
          : Screen.fromJson(json['rentScreen'] as Map<String, dynamic>),
      adultRentScreen: json['adultRentScreen'] == null
          ? null
          : Screen.fromJson(json['adultRentScreen'] as Map<String, dynamic>),
      mainMenuPromo: json['mainMenuPromo'] == null
          ? null
          : Screen.fromJson(json['mainMenuPromo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HotlinksToJson(Hotlinks instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('rentScreen', instance.rentScreen?.toJson());
  writeNotNull('adultRentScreen', instance.adultRentScreen?.toJson());
  writeNotNull('mainMenuPromo', instance.mainMenuPromo?.toJson());
  return val;
}

HttpCall _$HttpCallFromJson(Map<String, dynamic> json) => HttpCall(
      method: json['method'] as String? ?? '',
      result: json['result'] as String? ?? '',
      time: json['time'] as String? ?? '',
    );

Map<String, dynamic> _$HttpCallToJson(HttpCall instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('method', instance.method);
  writeNotNull('result', instance.result);
  writeNotNull('time', instance.time);
  return val;
}

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      id: json['id'] as String? ?? '',
      mergedId: json['mergedId'] as String? ?? '',
      type: itemTypeFromJson(json['type']),
      assetType: itemAssetTypeFromJson(json['assetType']),
      title: json['title'] as String? ?? '',
      subTitle: json['subTitle'] as String? ?? '',
      ordinal: json['ordinal'] as int?,
      isAdult: json['isAdult'] as bool?,
      ageRating: json['ageRating'] as String? ?? '',
      duration: json['duration'] as int?,
      image: json['image'] as String? ?? '',
      price: json['price'] as String? ?? '',
      priceDisplay: json['priceDisplay'] as String? ?? '',
      minPrice: json['minPrice'] as String? ?? '',
      minPriceDisplay: json['minPriceDisplay'] as String? ?? '',
      seriesId: json['seriesId'] as String? ?? '',
      seriesTitle: json['seriesTitle'] as String? ?? '',
      seasonId: json['seasonId'] as String? ?? '',
      season: json['season'] as String? ?? '',
      seasonCount: json['seasonCount'] as int?,
      episode: json['episode'] as String? ?? '',
      gridLink: json['gridLink'] == null
          ? null
          : GridLink.fromJson(json['gridLink'] as Map<String, dynamic>),
      userInteractedWithSeries: json['userInteractedWithSeries'] as bool?,
      bookmark: json['bookmark'] as int?,
      tvodEntitlementEnd: json['tvodEntitlementEnd'] == null
          ? null
          : DateTime.parse(json['tvodEntitlementEnd'] as String),
      broadcastDate: json['broadcastDate'] == null
          ? null
          : DateTime.parse(json['broadcastDate'] as String),
      channelName: json['channelName'] as String? ?? '',
      screenLayout: json['screenLayout'] as String? ?? '',
      promoVideoUrl: json['promoVideoUrl'] as String? ?? '',
      promoVideoEndImage: json['promoVideoEndImage'] as String? ?? '',
      promoVideoEndText: json['promoVideoEndText'] as String? ?? '',
      isBoxset: json['isBoxset'] as bool?,
      goPlayable: json['goPlayable'] as bool?,
      brandingProviderId: json['brandingProviderId'] as String? ?? '',
      minResolution: itemMinResolutionFromJson(json['minResolution']),
      imageVersion: json['imageVersion'] as String? ?? '',
    );

Map<String, dynamic> _$ItemToJson(Item instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('mergedId', instance.mergedId);
  writeNotNull('type', itemTypeToJson(instance.type));
  writeNotNull('assetType', itemAssetTypeToJson(instance.assetType));
  writeNotNull('title', instance.title);
  writeNotNull('subTitle', instance.subTitle);
  writeNotNull('ordinal', instance.ordinal);
  writeNotNull('isAdult', instance.isAdult);
  writeNotNull('ageRating', instance.ageRating);
  writeNotNull('duration', instance.duration);
  writeNotNull('image', instance.image);
  writeNotNull('price', instance.price);
  writeNotNull('priceDisplay', instance.priceDisplay);
  writeNotNull('minPrice', instance.minPrice);
  writeNotNull('minPriceDisplay', instance.minPriceDisplay);
  writeNotNull('seriesId', instance.seriesId);
  writeNotNull('seriesTitle', instance.seriesTitle);
  writeNotNull('seasonId', instance.seasonId);
  writeNotNull('season', instance.season);
  writeNotNull('seasonCount', instance.seasonCount);
  writeNotNull('episode', instance.episode);
  writeNotNull('gridLink', instance.gridLink?.toJson());
  writeNotNull('userInteractedWithSeries', instance.userInteractedWithSeries);
  writeNotNull('bookmark', instance.bookmark);
  writeNotNull(
      'tvodEntitlementEnd', instance.tvodEntitlementEnd?.toIso8601String());
  writeNotNull('broadcastDate', instance.broadcastDate?.toIso8601String());
  writeNotNull('channelName', instance.channelName);
  writeNotNull('screenLayout', instance.screenLayout);
  writeNotNull('promoVideoUrl', instance.promoVideoUrl);
  writeNotNull('promoVideoEndImage', instance.promoVideoEndImage);
  writeNotNull('promoVideoEndText', instance.promoVideoEndText);
  writeNotNull('isBoxset', instance.isBoxset);
  writeNotNull('goPlayable', instance.goPlayable);
  writeNotNull('brandingProviderId', instance.brandingProviderId);
  writeNotNull(
      'minResolution', itemMinResolutionToJson(instance.minResolution));
  writeNotNull('imageVersion', instance.imageVersion);
  return val;
}

PerformanceData _$PerformanceDataFromJson(Map<String, dynamic> json) =>
    PerformanceData(
      totalTime: json['totalTime'] as String? ?? '',
      numberOfErrors: json['numberOfErrors'] as int?,
      traxis: (json['traxis'] as List<dynamic>?)
              ?.map((e) => HttpCall.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      reng: (json['reng'] as List<dynamic>?)
              ?.map((e) => HttpCall.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      unknown: (json['unknown'] as List<dynamic>?)
              ?.map((e) => HttpCall.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$PerformanceDataToJson(PerformanceData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('totalTime', instance.totalTime);
  writeNotNull('numberOfErrors', instance.numberOfErrors);
  writeNotNull('traxis', instance.traxis?.map((e) => e.toJson()).toList());
  writeNotNull('reng', instance.reng?.map((e) => e.toJson()).toList());
  writeNotNull('unknown', instance.unknown?.map((e) => e.toJson()).toList());
  return val;
}

Screen _$ScreenFromJson(Map<String, dynamic> json) => Screen(
      id: json['id'] as String? ?? '',
      structureId: json['structureId'] as String? ?? '',
      title: json['title'] as String? ?? '',
      ordinal: json['ordinal'] as int?,
      isAdult: json['isAdult'] as bool?,
      screenLayout: json['screenLayout'] as String? ?? '',
      theme: json['theme'] == null
          ? null
          : Theme.fromJson(json['theme'] as Map<String, dynamic>),
      image: json['image'] as String? ?? '',
      abTestGroup: json['abTestGroup'] as String? ?? '',
      brandingProviderId: json['brandingProviderId'] as String? ?? '',
      isBoxset: json['isBoxset'] as bool?,
      aspot: json['aspot'] == null
          ? null
          : ASpot.fromJson(json['aspot'] as Map<String, dynamic>),
      collections: (json['collections'] as List<dynamic>?)
              ?.map((e) => Collection.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      performanceData: json['_performanceData'] == null
          ? null
          : PerformanceData.fromJson(
              json['_performanceData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ScreenToJson(Screen instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('structureId', instance.structureId);
  writeNotNull('title', instance.title);
  writeNotNull('ordinal', instance.ordinal);
  writeNotNull('isAdult', instance.isAdult);
  writeNotNull('screenLayout', instance.screenLayout);
  writeNotNull('theme', instance.theme?.toJson());
  writeNotNull('image', instance.image);
  writeNotNull('abTestGroup', instance.abTestGroup);
  writeNotNull('brandingProviderId', instance.brandingProviderId);
  writeNotNull('isBoxset', instance.isBoxset);
  writeNotNull('aspot', instance.aspot?.toJson());
  writeNotNull(
      'collections', instance.collections?.map((e) => e.toJson()).toList());
  writeNotNull('_performanceData', instance.performanceData?.toJson());
  return val;
}

Structure _$StructureFromJson(Map<String, dynamic> json) => Structure(
      rootId: json['rootId'] as String? ?? '',
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      theme: json['theme'] == null
          ? null
          : Theme.fromJson(json['theme'] as Map<String, dynamic>),
      screens: (json['screens'] as List<dynamic>?)
              ?.map((e) => Screen.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      hotlinks: json['hotlinks'] == null
          ? null
          : Hotlinks.fromJson(json['hotlinks'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StructureToJson(Structure instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('rootId', instance.rootId);
  writeNotNull('id', instance.id);
  writeNotNull('title', instance.title);
  writeNotNull('theme', instance.theme?.toJson());
  writeNotNull('screens', instance.screens?.map((e) => e.toJson()).toList());
  writeNotNull('hotlinks', instance.hotlinks?.toJson());
  return val;
}

Theme _$ThemeFromJson(Map<String, dynamic> json) => Theme(
      name: json['name'] as String? ?? '',
      background: json['background'] as String? ?? '',
      aspotBackground: json['aspotBackground'] as String? ?? '',
      logoFocused: json['logoFocused'] as String? ?? '',
      logoNonfocused: json['logoNonfocused'] as String? ?? '',
      editorialImage: json['editorialImage'] as String? ?? '',
      brandLogoImage: json['brandLogoImage'] as String? ?? '',
    );

Map<String, dynamic> _$ThemeToJson(Theme instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('background', instance.background);
  writeNotNull('aspotBackground', instance.aspotBackground);
  writeNotNull('logoFocused', instance.logoFocused);
  writeNotNull('logoNonfocused', instance.logoNonfocused);
  writeNotNull('editorialImage', instance.editorialImage);
  writeNotNull('brandLogoImage', instance.brandLogoImage);
  return val;
}

RentalScreen _$RentalScreenFromJson(Map<String, dynamic> json) => RentalScreen(
      hasAdultRentals: json['hasAdultRentals'] as bool?,
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      screenLayout: json['screenLayout'] as String? ?? '',
      isAdult: json['isAdult'] as bool?,
      background: json['background'] as String? ?? '',
      logoThumbnail: json['logoThumbnail'] as String? ?? '',
      brandingProviderId: json['brandingProviderId'] as String? ?? '',
      indexStart: json['indexStart'] as int?,
      itemCount: json['itemCount'] as int?,
      totalCount: json['totalCount'] as int?,
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$RentalScreenToJson(RentalScreen instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('hasAdultRentals', instance.hasAdultRentals);
  writeNotNull('id', instance.id);
  writeNotNull('title', instance.title);
  writeNotNull('screenLayout', instance.screenLayout);
  writeNotNull('isAdult', instance.isAdult);
  writeNotNull('background', instance.background);
  writeNotNull('logoThumbnail', instance.logoThumbnail);
  writeNotNull('brandingProviderId', instance.brandingProviderId);
  writeNotNull('indexStart', instance.indexStart);
  writeNotNull('itemCount', instance.itemCount);
  writeNotNull('totalCount', instance.totalCount);
  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  return val;
}

CastAndCrew _$CastAndCrewFromJson(Map<String, dynamic> json) => CastAndCrew(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      role: json['role'] as String? ?? '',
      image: json['image'] as String? ?? '',
    );

Map<String, dynamic> _$CastAndCrewToJson(CastAndCrew instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('role', instance.role);
  writeNotNull('image', instance.image);
  return val;
}

TrailerInfo _$TrailerInfoFromJson(Map<String, dynamic> json) => TrailerInfo(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      duration: json['duration'] as int?,
      synopsis: json['synopsis'] as String? ?? '',
      parentTitleId: json['parentTitleId'] as String? ?? '',
      instances: (json['instances'] as List<dynamic>?)
              ?.map((e) => TrailerInstance.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$TrailerInfoToJson(TrailerInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('title', instance.title);
  writeNotNull('duration', instance.duration);
  writeNotNull('synopsis', instance.synopsis);
  writeNotNull('parentTitleId', instance.parentTitleId);
  writeNotNull(
      'instances', instance.instances?.map((e) => e.toJson()).toList());
  return val;
}

DetailScreen _$DetailScreenFromJson(Map<String, dynamic> json) => DetailScreen(
      id: json['id'] as String? ?? '',
      mergedId: json['mergedId'] as String? ?? '',
      imageVersion: json['imageVersion'] as String? ?? '',
      type: detailScreenTypeFromJson(json['type']),
      assetType: detailScreenAssetTypeFromJson(json['assetType']),
      title: json['title'] as String? ?? '',
      subTitle: json['subTitle'] as String? ?? '',
      ordinal: json['ordinal'] as int?,
      isPreview: json['isPreview'] as bool?,
      parentTitleId: json['parentTitleId'] as String? ?? '',
      isAdult: json['isAdult'] as bool?,
      ageRating: json['ageRating'] as String? ?? '',
      duration: json['duration'] as int?,
      image: json['image'] as String? ?? '',
      price: json['price'] as String? ?? '',
      priceDisplay: json['priceDisplay'] as String? ?? '',
      minPrice: json['minPrice'] as String? ?? '',
      minPriceDisplay: json['minPriceDisplay'] as String? ?? '',
      seriesId: json['seriesId'] as String? ?? '',
      seriesTitle: json['seriesTitle'] as String? ?? '',
      seasonId: json['seasonId'] as String? ?? '',
      season: json['season'] as String? ?? '',
      episode: json['episode'] as String? ?? '',
      gridLink: json['gridLink'] == null
          ? null
          : GridLink.fromJson(json['gridLink'] as Map<String, dynamic>),
      userInteractedWithSeries: json['userInteractedWithSeries'] as bool?,
      bookmark: json['bookmark'] as int?,
      tvodEntitlementEnd: json['tvodEntitlementEnd'] == null
          ? null
          : DateTime.parse(json['tvodEntitlementEnd'] as String),
      broadcastDate: json['broadcastDate'] == null
          ? null
          : DateTime.parse(json['broadcastDate'] as String),
      channelName: json['channelName'] as String? ?? '',
      screenLayout: json['screenLayout'] as String? ?? '',
      totalEpisodes: json['totalEpisodes'] as int?,
      parentalGuidanceText: json['parentalGuidanceText'] as String? ?? '',
      onWatchlist: json['onWatchlist'] as bool?,
      genres: (json['genres'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      synopsis: json['synopsis'] as String? ?? '',
      longSynopsis: json['longSynopsis'] as String? ?? '',
      audioLanguages: (json['audioLanguages'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      signLanguages: (json['signLanguages'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      country: (json['country'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      subtitles: (json['subtitles'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      supplementalAudioDescriptions:
          (json['supplementalAudioDescriptions'] as List<dynamic>?)
                  ?.map((e) => e as String)
                  .toList() ??
              [],
      icons:
          (json['icons'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
      trailers: (json['trailers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      trailerInfo: (json['trailerInfo'] as List<dynamic>?)
              ?.map((e) => TrailerInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      castAndCrew: (json['castAndCrew'] as List<dynamic>?)
              ?.map((e) => CastAndCrew.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      castCollection: (json['castCollection'] as List<dynamic>?)
              ?.map((e) => CastAndCrew.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      crewCollection: (json['crewCollection'] as List<dynamic>?)
              ?.map((e) => CastAndCrew.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      instances: (json['instances'] as List<dynamic>?)
              ?.map((e) => Instance.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      prodYear: json['prodYear'] as String? ?? '',
      seasonCount: json['seasonCount'] as int?,
      promoVideoUrl: json['promoVideoUrl'] as String? ?? '',
      promoVideoEndImage: json['promoVideoEndImage'] as String? ?? '',
      promoVideoEndText: json['promoVideoEndText'] as String? ?? '',
      minResolution: detailScreenMinResolutionFromJson(json['minResolution']),
      isBoxset: json['isBoxset'] as bool?,
      goPlayable: json['goPlayable'] as bool?,
      brandingProviderId: json['brandingProviderId'] as String? ?? '',
      sources: (json['sources'] as List<dynamic>?)
              ?.map((e) => SourceExt.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$DetailScreenToJson(DetailScreen instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('mergedId', instance.mergedId);
  writeNotNull('imageVersion', instance.imageVersion);
  writeNotNull('type', detailScreenTypeToJson(instance.type));
  writeNotNull('assetType', detailScreenAssetTypeToJson(instance.assetType));
  writeNotNull('title', instance.title);
  writeNotNull('subTitle', instance.subTitle);
  writeNotNull('ordinal', instance.ordinal);
  writeNotNull('isPreview', instance.isPreview);
  writeNotNull('parentTitleId', instance.parentTitleId);
  writeNotNull('isAdult', instance.isAdult);
  writeNotNull('ageRating', instance.ageRating);
  writeNotNull('duration', instance.duration);
  writeNotNull('image', instance.image);
  writeNotNull('price', instance.price);
  writeNotNull('priceDisplay', instance.priceDisplay);
  writeNotNull('minPrice', instance.minPrice);
  writeNotNull('minPriceDisplay', instance.minPriceDisplay);
  writeNotNull('seriesId', instance.seriesId);
  writeNotNull('seriesTitle', instance.seriesTitle);
  writeNotNull('seasonId', instance.seasonId);
  writeNotNull('season', instance.season);
  writeNotNull('episode', instance.episode);
  writeNotNull('gridLink', instance.gridLink?.toJson());
  writeNotNull('userInteractedWithSeries', instance.userInteractedWithSeries);
  writeNotNull('bookmark', instance.bookmark);
  writeNotNull(
      'tvodEntitlementEnd', instance.tvodEntitlementEnd?.toIso8601String());
  writeNotNull('broadcastDate', instance.broadcastDate?.toIso8601String());
  writeNotNull('channelName', instance.channelName);
  writeNotNull('screenLayout', instance.screenLayout);
  writeNotNull('totalEpisodes', instance.totalEpisodes);
  writeNotNull('parentalGuidanceText', instance.parentalGuidanceText);
  writeNotNull('onWatchlist', instance.onWatchlist);
  writeNotNull('genres', instance.genres);
  writeNotNull('synopsis', instance.synopsis);
  writeNotNull('longSynopsis', instance.longSynopsis);
  writeNotNull('audioLanguages', instance.audioLanguages);
  writeNotNull('signLanguages', instance.signLanguages);
  writeNotNull('country', instance.country);
  writeNotNull('subtitles', instance.subtitles);
  writeNotNull(
      'supplementalAudioDescriptions', instance.supplementalAudioDescriptions);
  writeNotNull('icons', instance.icons);
  writeNotNull('trailers', instance.trailers);
  writeNotNull(
      'trailerInfo', instance.trailerInfo?.map((e) => e.toJson()).toList());
  writeNotNull(
      'castAndCrew', instance.castAndCrew?.map((e) => e.toJson()).toList());
  writeNotNull('castCollection',
      instance.castCollection?.map((e) => e.toJson()).toList());
  writeNotNull('crewCollection',
      instance.crewCollection?.map((e) => e.toJson()).toList());
  writeNotNull(
      'instances', instance.instances?.map((e) => e.toJson()).toList());
  writeNotNull('prodYear', instance.prodYear);
  writeNotNull('seasonCount', instance.seasonCount);
  writeNotNull('promoVideoUrl', instance.promoVideoUrl);
  writeNotNull('promoVideoEndImage', instance.promoVideoEndImage);
  writeNotNull('promoVideoEndText', instance.promoVideoEndText);
  writeNotNull(
      'minResolution', detailScreenMinResolutionToJson(instance.minResolution));
  writeNotNull('isBoxset', instance.isBoxset);
  writeNotNull('goPlayable', instance.goPlayable);
  writeNotNull('brandingProviderId', instance.brandingProviderId);
  writeNotNull('sources', instance.sources?.map((e) => e.toJson()).toList());
  return val;
}

EstInstanceData _$EstInstanceDataFromJson(Map<String, dynamic> json) =>
    EstInstanceData(
      minPriceDisplay: json['minPriceDisplay'] as String? ?? '',
      currency: json['currency'] as String? ?? '',
      videoHost: json['videoHost'] as String? ?? '',
      videoUrl: json['videoUrl'] as String? ?? '',
    );

Map<String, dynamic> _$EstInstanceDataToJson(EstInstanceData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('minPriceDisplay', instance.minPriceDisplay);
  writeNotNull('currency', instance.currency);
  writeNotNull('videoHost', instance.videoHost);
  writeNotNull('videoUrl', instance.videoUrl);
  return val;
}

TrailerInstance _$TrailerInstanceFromJson(Map<String, dynamic> json) =>
    TrailerInstance(
      id: json['id'] as String? ?? '',
      resolution: json['resolution'] as String? ?? '',
      goPlayable: json['goPlayable'] as bool?,
      brandingProviderId: json['brandingProviderId'] as String? ?? '',
    );

Map<String, dynamic> _$TrailerInstanceToJson(TrailerInstance instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('resolution', instance.resolution);
  writeNotNull('goPlayable', instance.goPlayable);
  writeNotNull('brandingProviderId', instance.brandingProviderId);
  return val;
}

Instance _$InstanceFromJson(Map<String, dynamic> json) => Instance(
      id: json['id'] as String? ?? '',
      resolution: json['resolution'] as String? ?? '',
      isDolby: json['isDolby'] as bool?,
      audioLang: json['audioLang'] as String? ?? '',
      subtitles: json['subtitles'] as String? ?? '',
      supplementalAudioDescriptions:
          (json['supplementalAudioDescriptions'] as List<dynamic>?)
                  ?.map((e) => e as String)
                  .toList() ??
              [],
      signLanguages: (json['signLanguages'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      availabilityStart: json['availabilityStart'] == null
          ? null
          : DateTime.parse(json['availabilityStart'] as String),
      availabilityEnd: json['availabilityEnd'] == null
          ? null
          : DateTime.parse(json['availabilityEnd'] as String),
      startIntroTime: json['startIntroTime'] as int?,
      endIntroTime: json['endIntroTime'] as int?,
      est: json['est'] == null
          ? null
          : EstInstanceData.fromJson(json['est'] as Map<String, dynamic>),
      broadcastDate: json['broadcastDate'] == null
          ? null
          : DateTime.parse(json['broadcastDate'] as String),
      broadcaster: json['broadcaster'] as String? ?? '',
      brandingProviderId: json['brandingProviderId'] as String? ?? '',
      channelName: json['channelName'] as String? ?? '',
      endCreditsTimestamp: json['endCreditsTimestamp'] as int?,
      goPlayable: json['goPlayable'] as bool?,
      goDownloadable: json['goDownloadable'] as bool?,
      isAdEnabled: json['isAdEnabled'] as bool?,
      supportedExternalStreamingProtocols:
          (json['supportedExternalStreamingProtocols'] as List<dynamic>?)
                  ?.map((e) => e as String)
                  .toList() ??
              [],
      offers: (json['offers'] as List<dynamic>?)
              ?.map((e) => Offer.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      download: json['download'] == null
          ? null
          : Download.fromJson(json['download'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InstanceToJson(Instance instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('resolution', instance.resolution);
  writeNotNull('isDolby', instance.isDolby);
  writeNotNull('audioLang', instance.audioLang);
  writeNotNull('subtitles', instance.subtitles);
  writeNotNull(
      'supplementalAudioDescriptions', instance.supplementalAudioDescriptions);
  writeNotNull('signLanguages', instance.signLanguages);
  writeNotNull(
      'availabilityStart', instance.availabilityStart?.toIso8601String());
  writeNotNull('availabilityEnd', instance.availabilityEnd?.toIso8601String());
  writeNotNull('startIntroTime', instance.startIntroTime);
  writeNotNull('endIntroTime', instance.endIntroTime);
  writeNotNull('est', instance.est?.toJson());
  writeNotNull('broadcastDate', instance.broadcastDate?.toIso8601String());
  writeNotNull('broadcaster', instance.broadcaster);
  writeNotNull('brandingProviderId', instance.brandingProviderId);
  writeNotNull('channelName', instance.channelName);
  writeNotNull('endCreditsTimestamp', instance.endCreditsTimestamp);
  writeNotNull('goPlayable', instance.goPlayable);
  writeNotNull('goDownloadable', instance.goDownloadable);
  writeNotNull('isAdEnabled', instance.isAdEnabled);
  writeNotNull('supportedExternalStreamingProtocols',
      instance.supportedExternalStreamingProtocols);
  writeNotNull('offers', instance.offers?.map((e) => e.toJson()).toList());
  writeNotNull('download', instance.download?.toJson());
  return val;
}

Download _$DownloadFromJson(Map<String, dynamic> json) => Download(
      expirySecondsAfterDownload:
          (json['expirySecondsAfterDownload'] as num?)?.toDouble(),
      expirySecondsAfterPlay:
          (json['expirySecondsAfterPlay'] as num?)?.toDouble(),
      lastAvailabilty: json['lastAvailabilty'] == null
          ? null
          : DateTime.parse(json['lastAvailabilty'] as String),
      maxDownloads: (json['maxDownloads'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DownloadToJson(Download instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'expirySecondsAfterDownload', instance.expirySecondsAfterDownload);
  writeNotNull('expirySecondsAfterPlay', instance.expirySecondsAfterPlay);
  writeNotNull('lastAvailabilty', instance.lastAvailabilty?.toIso8601String());
  writeNotNull('maxDownloads', instance.maxDownloads);
  return val;
}

Offer _$OfferFromJson(Map<String, dynamic> json) => Offer(
      id: json['id'] as String? ?? '',
      entitled: json['entitled'] as bool?,
      offerId: json['offerId'] as String? ?? '',
      name: json['name'] as String? ?? '',
      type: json['type'] as String? ?? '',
      titleCount: json['titleCount'] as int?,
      price: json['price'] as String? ?? '',
      priceDisplay: json['priceDisplay'] as String? ?? '',
      currency: json['currency'] as String? ?? '',
      period: json['period'] as int?,
      entitlementEnd: json['entitlementEnd'] == null
          ? null
          : DateTime.parse(json['entitlementEnd'] as String),
      image: json['image'] as String? ?? '',
      edsProductId: json['edsProductId'] as String? ?? '',
      relationAvailabilityStart: json['relationAvailabilityStart'] == null
          ? null
          : DateTime.parse(json['relationAvailabilityStart'] as String),
      relationAvailabilityEnd: json['relationAvailabilityEnd'] == null
          ? null
          : DateTime.parse(json['relationAvailabilityEnd'] as String),
    );

Map<String, dynamic> _$OfferToJson(Offer instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('entitled', instance.entitled);
  writeNotNull('offerId', instance.offerId);
  writeNotNull('name', instance.name);
  writeNotNull('type', instance.type);
  writeNotNull('titleCount', instance.titleCount);
  writeNotNull('price', instance.price);
  writeNotNull('priceDisplay', instance.priceDisplay);
  writeNotNull('currency', instance.currency);
  writeNotNull('period', instance.period);
  writeNotNull('entitlementEnd', instance.entitlementEnd?.toIso8601String());
  writeNotNull('image', instance.image);
  writeNotNull('edsProductId', instance.edsProductId);
  writeNotNull('relationAvailabilityStart',
      instance.relationAvailabilityStart?.toIso8601String());
  writeNotNull('relationAvailabilityEnd',
      instance.relationAvailabilityEnd?.toIso8601String());
  return val;
}

OttSource _$OttSourceFromJson(Map<String, dynamic> json) => OttSource(
      id: json['id'] as String? ?? '',
      titleId: json['titleId'] as String? ?? '',
      minPriceDisplay: json['minPriceDisplay'] as String? ?? '',
      currency: json['currency'] as String? ?? '',
      videoHost: json['videoHost'] as String? ?? '',
      videoUrl: json['videoUrl'] as String? ?? '',
      isEST: json['isEST'] as bool?,
      brandingProviderId: json['brandingProviderId'] as String? ?? '',
      goPlayable: json['goPlayable'] as bool?,
      goDownloadable: json['goDownloadable'] as bool?,
    );

Map<String, dynamic> _$OttSourceToJson(OttSource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('titleId', instance.titleId);
  writeNotNull('minPriceDisplay', instance.minPriceDisplay);
  writeNotNull('currency', instance.currency);
  writeNotNull('videoHost', instance.videoHost);
  writeNotNull('videoUrl', instance.videoUrl);
  writeNotNull('isEST', instance.isEST);
  writeNotNull('brandingProviderId', instance.brandingProviderId);
  writeNotNull('goPlayable', instance.goPlayable);
  writeNotNull('goDownloadable', instance.goDownloadable);
  return val;
}

SourceExt _$SourceExtFromJson(Map<String, dynamic> json) => SourceExt(
      sourceType: sourceExtSourceTypeFromJson(json['sourceType']),
      source: json['source'] == null
          ? null
          : OttSource.fromJson(json['source'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SourceExtToJson(SourceExt instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('sourceType', sourceExtSourceTypeToJson(instance.sourceType));
  writeNotNull('source', instance.source?.toJson());
  return val;
}

SourceOtt _$SourceOttFromJson(Map<String, dynamic> json) => SourceOtt(
      source: json['source'] == null
          ? null
          : OttSource.fromJson(json['source'] as Map<String, dynamic>),
      sourceType: sourceOttSourceTypeFromJson(json['sourceType']),
    );

Map<String, dynamic> _$SourceOttToJson(SourceOtt instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('source', instance.source?.toJson());
  writeNotNull('sourceType', sourceOttSourceTypeToJson(instance.sourceType));
  return val;
}

GridFilterOption _$GridFilterOptionFromJson(Map<String, dynamic> json) =>
    GridFilterOption(
      name: json['name'] as String? ?? '',
      crid: json['crid'] as String? ?? '',
      titlesCount: json['titlesCount'] as int?,
      seriesCount: json['seriesCount'] as int?,
      isAdult: json['isAdult'] as bool?,
    );

Map<String, dynamic> _$GridFilterOptionToJson(GridFilterOption instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('crid', instance.crid);
  writeNotNull('titlesCount', instance.titlesCount);
  writeNotNull('seriesCount', instance.seriesCount);
  writeNotNull('isAdult', instance.isAdult);
  return val;
}

GridFilterOptions _$GridFilterOptionsFromJson(Map<String, dynamic> json) =>
    GridFilterOptions(
      newArrivals: json['newArrivals'] as bool?,
      lastChance: json['lastChance'] as bool?,
      goDownloadable: json['goDownloadable'] as bool?,
      genres: (json['genres'] as List<dynamic>?)
              ?.map((e) => GridFilterOption.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$GridFilterOptionsToJson(GridFilterOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('newArrivals', instance.newArrivals);
  writeNotNull('lastChance', instance.lastChance);
  writeNotNull('goDownloadable', instance.goDownloadable);
  writeNotNull('genres', instance.genres?.map((e) => e.toJson()).toList());
  return val;
}

GridOptions _$GridOptionsFromJson(Map<String, dynamic> json) => GridOptions(
      id: json['id'] as String? ?? '',
      titlesCount: json['titlesCount'] as int?,
      seriesCount: json['seriesCount'] as int?,
      isAdult: json['isAdult'] as bool?,
      filterOptions: json['filterOptions'] == null
          ? null
          : GridFilterOptions.fromJson(
              json['filterOptions'] as Map<String, dynamic>),
      sortOptions: json['sortOptions'] == null
          ? null
          : GridSortOptions.fromJson(
              json['sortOptions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GridOptionsToJson(GridOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('titlesCount', instance.titlesCount);
  writeNotNull('seriesCount', instance.seriesCount);
  writeNotNull('isAdult', instance.isAdult);
  writeNotNull('filterOptions', instance.filterOptions?.toJson());
  writeNotNull('sortOptions', instance.sortOptions?.toJson());
  return val;
}

GridSortOptions _$GridSortOptionsFromJson(Map<String, dynamic> json) =>
    GridSortOptions(
      broadcastDate: json['broadcastDate'] as bool?,
    );

Map<String, dynamic> _$GridSortOptionsToJson(GridSortOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('broadcastDate', instance.broadcastDate);
  return val;
}

GridScreen _$GridScreenFromJson(Map<String, dynamic> json) => GridScreen(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      screenLayout: json['screenLayout'] as String? ?? '',
      isAdult: json['isAdult'] as bool?,
      background: json['background'] as String? ?? '',
      brandLogoImage: json['brandLogoImage'] as String? ?? '',
      logoThumbnail: json['logoThumbnail'] as String? ?? '',
      brandingProviderId: json['brandingProviderId'] as String? ?? '',
      indexStart: json['indexStart'] as int?,
      itemCount: json['itemCount'] as int?,
      totalCount: json['totalCount'] as int?,
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$GridScreenToJson(GridScreen instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('title', instance.title);
  writeNotNull('screenLayout', instance.screenLayout);
  writeNotNull('isAdult', instance.isAdult);
  writeNotNull('background', instance.background);
  writeNotNull('brandLogoImage', instance.brandLogoImage);
  writeNotNull('logoThumbnail', instance.logoThumbnail);
  writeNotNull('brandingProviderId', instance.brandingProviderId);
  writeNotNull('indexStart', instance.indexStart);
  writeNotNull('itemCount', instance.itemCount);
  writeNotNull('totalCount', instance.totalCount);
  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  return val;
}

NextEpisode _$NextEpisodeFromJson(Map<String, dynamic> json) => NextEpisode(
      nextEpisode: json['nextEpisode'] as String? ?? '',
    );

Map<String, dynamic> _$NextEpisodeToJson(NextEpisode instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('nextEpisode', instance.nextEpisode);
  return val;
}

TileItem _$TileItemFromJson(Map<String, dynamic> json) => TileItem(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      image: json['image'] as String? ?? '',
      screenLayout: json['screenLayout'] as String? ?? '',
      contentType: json['contentType'] as String? ?? '',
      isAdult: json['isAdult'] as bool?,
      gridLink: json['gridLink'] == null
          ? null
          : GridLink.fromJson(json['gridLink'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TileItemToJson(TileItem instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('title', instance.title);
  writeNotNull('image', instance.image);
  writeNotNull('screenLayout', instance.screenLayout);
  writeNotNull('contentType', instance.contentType);
  writeNotNull('isAdult', instance.isAdult);
  writeNotNull('gridLink', instance.gridLink?.toJson());
  return val;
}

TileScreen _$TileScreenFromJson(Map<String, dynamic> json) => TileScreen(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      screenLayout: json['screenLayout'] as String? ?? '',
      isAdult: json['isAdult'] as bool?,
      background: json['background'] as String? ?? '',
      logoThumbnail: json['logoThumbnail'] as String? ?? '',
      brandingProviderId: json['brandingProviderId'] as String? ?? '',
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => TileItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$TileScreenToJson(TileScreen instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('title', instance.title);
  writeNotNull('screenLayout', instance.screenLayout);
  writeNotNull('isAdult', instance.isAdult);
  writeNotNull('background', instance.background);
  writeNotNull('logoThumbnail', instance.logoThumbnail);
  writeNotNull('brandingProviderId', instance.brandingProviderId);
  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  return val;
}

Messages _$MessagesFromJson(Map<String, dynamic> json) => Messages(
      messages: (json['messages'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$MessagesToJson(Messages instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('messages', instance.messages);
  return val;
}

PersonDetail _$PersonDetailFromJson(Map<String, dynamic> json) => PersonDetail(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      dateOfBirth: json['dateOfBirth'] as String? ?? '',
      placeOfBirth: json['placeOfBirth'] as String? ?? '',
      synopsis: json['synopsis'] as String? ?? '',
      image: json['image'] as String? ?? '',
    );

Map<String, dynamic> _$PersonDetailToJson(PersonDetail instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('dateOfBirth', instance.dateOfBirth);
  writeNotNull('placeOfBirth', instance.placeOfBirth);
  writeNotNull('synopsis', instance.synopsis);
  writeNotNull('image', instance.image);
  return val;
}

AZJump _$AZJumpFromJson(Map<String, dynamic> json) => AZJump(
      undefinedParameter: json['#'] as int?,
      a: json['A'] as int?,
      b: json['B'] as int?,
      c: json['C'] as int?,
      d: json['D'] as int?,
      e: json['E'] as int?,
      f: json['F'] as int?,
      g: json['G'] as int?,
      h: json['H'] as int?,
      i: json['I'] as int?,
      j: json['J'] as int?,
      k: json['K'] as int?,
      l: json['L'] as int?,
      m: json['M'] as int?,
      n: json['N'] as int?,
      o: json['O'] as int?,
      p: json['P'] as int?,
      q: json['Q'] as int?,
      r: json['R'] as int?,
      s: json['S'] as int?,
      t: json['T'] as int?,
      u: json['U'] as int?,
      v: json['V'] as int?,
      w: json['W'] as int?,
      x: json['X'] as int?,
      y: json['Y'] as int?,
      z: json['Z'] as int?,
    );

Map<String, dynamic> _$AZJumpToJson(AZJump instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('#', instance.undefinedParameter);
  writeNotNull('A', instance.a);
  writeNotNull('B', instance.b);
  writeNotNull('C', instance.c);
  writeNotNull('D', instance.d);
  writeNotNull('E', instance.e);
  writeNotNull('F', instance.f);
  writeNotNull('G', instance.g);
  writeNotNull('H', instance.h);
  writeNotNull('I', instance.i);
  writeNotNull('J', instance.j);
  writeNotNull('K', instance.k);
  writeNotNull('L', instance.l);
  writeNotNull('M', instance.m);
  writeNotNull('N', instance.n);
  writeNotNull('O', instance.o);
  writeNotNull('P', instance.p);
  writeNotNull('Q', instance.q);
  writeNotNull('R', instance.r);
  writeNotNull('S', instance.s);
  writeNotNull('T', instance.t);
  writeNotNull('U', instance.u);
  writeNotNull('V', instance.v);
  writeNotNull('W', instance.w);
  writeNotNull('X', instance.x);
  writeNotNull('Y', instance.y);
  writeNotNull('Z', instance.z);
  return val;
}

EditorialFeed _$EditorialFeedFromJson(Map<String, dynamic> json) =>
    EditorialFeed(
      id: json['id'] as String? ?? '',
      language: json['language'] as String? ?? '',
      indexStart: json['indexStart'] as int?,
      sortType: json['sortType'] as String? ?? '',
      sortDirection: json['sortDirection'] as String? ?? '',
      itemCount: json['itemCount'] as int?,
      totalCount: json['totalCount'] as int?,
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => FeedItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      azjump: json['azjump'] == null
          ? null
          : AZJump.fromJson(json['azjump'] as Map<String, dynamic>),
      filters: (json['filters'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$EditorialFeedToJson(EditorialFeed instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('language', instance.language);
  writeNotNull('indexStart', instance.indexStart);
  writeNotNull('sortType', instance.sortType);
  writeNotNull('sortDirection', instance.sortDirection);
  writeNotNull('itemCount', instance.itemCount);
  writeNotNull('totalCount', instance.totalCount);
  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  writeNotNull('azjump', instance.azjump?.toJson());
  writeNotNull('filters', instance.filters);
  return val;
}

FeedItem _$FeedItemFromJson(Map<String, dynamic> json) => FeedItem(
      id: json['id'] as String? ?? '',
    );

Map<String, dynamic> _$FeedItemToJson(FeedItem instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  return val;
}

Genre _$GenreFromJson(Map<String, dynamic> json) => Genre(
      name: json['name'] as String? ?? '',
      crid: json['crid'] as String? ?? '',
      titlesCount: json['titlesCount'] as int?,
      seriesCount: json['seriesCount'] as int?,
      isAdult: json['isAdult'] as bool?,
      image: json['image'] as String? ?? '',
    );

Map<String, dynamic> _$GenreToJson(Genre instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('crid', instance.crid);
  writeNotNull('titlesCount', instance.titlesCount);
  writeNotNull('seriesCount', instance.seriesCount);
  writeNotNull('isAdult', instance.isAdult);
  writeNotNull('image', instance.image);
  return val;
}

GenreListResponse _$GenreListResponseFromJson(Map<String, dynamic> json) =>
    GenreListResponse(
      id: json['id'] as String? ?? '',
      genres: (json['genres'] as List<dynamic>?)
              ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$GenreListResponseToJson(GenreListResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('genres', instance.genres?.map((e) => e.toJson()).toList());
  return val;
}
