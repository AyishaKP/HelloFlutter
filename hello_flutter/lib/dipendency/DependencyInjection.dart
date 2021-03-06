

import 'package:hello_flutter/repository/ApiRepository.dart';
import 'package:hello_flutter/repository/BaseRepository.dart';
import 'package:hello_flutter/repository/MockRepository.dart';

enum Flavor {
  MOCK,
  Network
}

class Injector {
  static final Injector _singleton = Injector._internal();
  static Flavor _flavor;

  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  BaseRepository get getRepository {
    switch(_flavor) {
      case Flavor.MOCK: return MockRepository();
      case Flavor.Network:   return ApiRepository();
    }
      return null;

  }
}
