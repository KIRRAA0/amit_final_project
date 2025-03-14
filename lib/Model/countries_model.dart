class Country {
  final Name name;
  final List<String> tld;
  final String cca2;
  final String ccn3;
  final String cca3;
  final String cioc;
  final bool independent;
  final String status;
  final bool unMember;
  final Map<String, Currency> currencies;
  final Idd idd;
  final List<String> capital;
  final List<String> altSpellings;
  final String region;
  final String subregion;
  final Map<String, String> languages;
  final Map<String, Translation> translations;
  final List<double> latlng;
  final bool landlocked;
  final int area;
  final Map<String, Demonym> demonyms;
  final String flag;
  final Maps maps;
  final int population;
  final Map<String, double> gini;
  final String fifa;
  final Car car;
  final List<String> timezones;
  final List<String> continents;
  final Flags flags;
  final CoatOfArms coatOfArms;
  final String startOfWeek;
  final CapitalInfo capitalInfo;
  final PostalCode postalCode;

  Country({
    required this.name,
    required this.tld,
    required this.cca2,
    required this.ccn3,
    required this.cca3,
    required this.cioc,
    required this.independent,
    required this.status,
    required this.unMember,
    required this.currencies,
    required this.idd,
    required this.capital,
    required this.altSpellings,
    required this.region,
    required this.subregion,
    required this.languages,
    required this.translations,
    required this.latlng,
    required this.landlocked,
    required this.area,
    required this.demonyms,
    required this.flag,
    required this.maps,
    required this.population,
    required this.gini,
    required this.fifa,
    required this.car,
    required this.timezones,
    required this.continents,
    required this.flags,
    required this.coatOfArms,
    required this.startOfWeek,
    required this.capitalInfo,
    required this.postalCode,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: Name.fromJson(json['name'] ?? {}),
      tld: List<String>.from(json['tld'] ?? []),
      cca2: json['cca2'] ?? '',
      ccn3: json['ccn3'] ?? '',
      cca3: json['cca3'] ?? '',
      cioc: json['cioc'] ?? '',
      independent: json['independent'] ?? false,
      status: json['status'] ?? '',
      unMember: json['unMember'] ?? false,
      currencies: (json['currencies'] == null
          ? {}
          : (json['currencies'] as Map<String, dynamic>).map(
            (key, value) => MapEntry(key, Currency.fromJson(value ?? {})),
      )),
      idd: Idd.fromJson(json['idd'] ?? {}),
      capital: List<String>.from(json['capital'] ?? []),
      altSpellings: List<String>.from(json['altSpellings'] ?? []),
      region: json['region'] ?? '',
      subregion: json['subregion'] ?? '',
      languages: (json['languages'] == null
          ? {}
          : (json['languages'] as Map<String, dynamic>).map(
            (key, value) => MapEntry(key, value as String),
      )),
      translations: (json['translations'] == null
          ? {}
          : (json['translations'] as Map<String, dynamic>).map(
            (key, value) => MapEntry(key, Translation.fromJson(value ?? {})),
      )),
      latlng: List<double>.from(json['latlng']?.map((x) => x.toDouble()) ?? []),
      landlocked: json['landlocked'] ?? false,
      area: (json['area'] as num?)?.toInt() ?? 0,
      demonyms: (json['demonyms'] == null
          ? {}
          : (json['demonyms'] as Map<String, dynamic>).map(
            (key, value) => MapEntry(key, Demonym.fromJson(value ?? {})),
      )),
      flag: json['flag'] ?? '',
      maps: Maps.fromJson(json['maps'] ?? {}),
      population: (json['population'] as num?)?.toInt() ?? 0,
      gini: (json['gini'] == null
          ? {}
          : (json['gini'] as Map<String, dynamic>).map(
            (key, value) => MapEntry(key, value.toDouble()),
      )),
      fifa: json['fifa'] ?? '',
      car: Car.fromJson(json['car'] ?? {}),
      timezones: List<String>.from(json['timezones'] ?? []),
      continents: List<String>.from(json['continents'] ?? []),
      flags: Flags.fromJson(json['flags'] ?? {}),
      coatOfArms: CoatOfArms.fromJson(json['coatOfArms'] ?? {}),
      startOfWeek: json['startOfWeek'] ?? '',
      capitalInfo: CapitalInfo.fromJson(json['capitalInfo'] ?? {}),
      postalCode: PostalCode.fromJson(json['postalCode'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name.toJson(),
      'tld': tld,
      'cca2': cca2,
      'ccn3': ccn3,
      'cca3': cca3,
      'cioc': cioc,
      'independent': independent,
      'status': status,
      'unMember': unMember,
      'currencies':
          currencies.map((key, value) => MapEntry(key, value.toJson())),
      'idd': idd.toJson(),
      'capital': capital,
      'altSpellings': altSpellings,
      'region': region,
      'subregion': subregion,
      'languages': languages,
      'translations':
          translations.map((key, value) => MapEntry(key, value.toJson())),
      'latlng': latlng,
      'landlocked': landlocked,
      'area': area,
      'demonyms': demonyms.map((key, value) => MapEntry(key, value.toJson())),
      'flag': flag,
      'maps': maps.toJson(),
      'population': population,
      'gini': gini,
      'fifa': fifa,
      'car': car.toJson(),
      'timezones': timezones,
      'continents': continents,
      'flags': flags.toJson(),
      'coatOfArms': coatOfArms.toJson(),
      'startOfWeek': startOfWeek,
      'capitalInfo': capitalInfo.toJson(),
      'postalCode': postalCode.toJson(),
    };
  }
}

class Name {
  final String common;
  final String official;
  final Map<String, NativeName> nativeName;

  Name({required this.common, required this.official, required this.nativeName});

  factory Name.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return Name(common: '', official: '', nativeName: {});
    }
    return Name(
      common: json['common'] ?? '',
      official: json['official'] ?? '',
      nativeName: (json['nativeName'] as Map<String, dynamic>?)?.map(
            (key, value) => MapEntry(key, NativeName.fromJson(value)),
      ) ?? {},
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'common': common,
      'official': official,
      'nativeName': nativeName.map((key, value) => MapEntry(key, value.toJson())),
    };
  }
}

class NativeName {
  final String official;
  final String common;

  NativeName({required this.official, required this.common});

  factory NativeName.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return NativeName(official: '', common: '');
    }
    return NativeName(
      official: json['official'] ?? '',
      common: json['common'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'official': official,
      'common': common,
    };
  }
}

class Currency {
  final String name;
  final String symbol;

  Currency({required this.name, required this.symbol});

  factory Currency.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return Currency(name: '', symbol: '');
    }
    return Currency(
      name: json['name'] ?? '',
      symbol: json['symbol'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'symbol': symbol,
    };
  }
}

class Idd {
  final String root;
  final List<String> suffixes;

  Idd({required this.root, required this.suffixes});

  factory Idd.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return Idd(root: '', suffixes: []);
    }
    return Idd(
      root: json['root'] ?? '',
      suffixes: List<String>.from(json['suffixes'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'root': root,
      'suffixes': suffixes,
    };
  }
}

class Translation {
  final String official;
  final String common;

  Translation({required this.official, required this.common});

  factory Translation.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return Translation(official: '', common: '');
    }
    return Translation(
      official: json['official'] ?? '',
      common: json['common'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'official': official,
      'common': common,
    };
  }
}

class Demonym {
  final String f;
  final String m;

  Demonym({required this.f, required this.m});

  factory Demonym.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return Demonym(f: '', m: '');
    }
    return Demonym(
      f: json['f'] ?? '',
      m: json['m'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'f': f,
      'm': m,
    };
  }
}

class Maps {
  final String googleMaps;
  final String openStreetMaps;

  Maps({required this.googleMaps, required this.openStreetMaps});

  factory Maps.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return Maps(googleMaps: '', openStreetMaps: '');
    }
    return Maps(
      googleMaps: json['googleMaps'] ?? '',
      openStreetMaps: json['openStreetMaps'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'googleMaps': googleMaps,
      'openStreetMaps': openStreetMaps,
    };
  }
}

class Car {
  final List<String> signs;
  final String side;

  Car({required this.signs, required this.side});

  factory Car.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return Car(signs: [], side: '');
    }
    return Car(
      signs: List<String>.from(json['signs'] ?? []),
      side: json['side'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'signs': signs,
      'side': side,
    };
  }
}

class Flags {
  final String png;
  final String svg;
  final String alt;

  Flags({required this.png, required this.svg, required this.alt});

  factory Flags.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return Flags(png: '', svg: '', alt: '');
    }
    return Flags(
      png: json['png'] ?? '',
      svg: json['svg'] ?? '',
      alt: json['alt'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'png': png,
      'svg': svg,
      'alt': alt,
    };
  }
}

class CoatOfArms {
  final String png;
  final String svg;

  CoatOfArms({required this.png, required this.svg});

  factory CoatOfArms.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return CoatOfArms(png: '', svg: '');
    }
    return CoatOfArms(
      png: json['png'] ?? '',
      svg: json['svg'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'png': png,
      'svg': svg,
    };
  }
}

class CapitalInfo {
  final List<num> latlng;

  CapitalInfo({required this.latlng});

  factory CapitalInfo.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return CapitalInfo(latlng: []);
    }
    List<dynamic> latlngDynamic = json['latlng'] ?? [];
    List<num> latlng = latlngDynamic.map((e) => e as num).toList();
    return CapitalInfo(latlng: latlng);
  }

  Map<String, dynamic> toJson() {
    return {
      'latlng': latlng,
    };
  }
}

class PostalCode {
  final String format;
  final String regex;

  PostalCode({required this.format, required this.regex});

  factory PostalCode.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return PostalCode(format: '', regex: '');
    }
    return PostalCode(
      format: json['format'] ?? '',
      regex: json['regex'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'format': format,
      'regex': regex,
    };
  }
}
