import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_toybox/features/google_map/models/response/shop/shop.dart';
import 'package:riverpod/riverpod.dart';

final shopRepoProvider = Provider((ref) {
  final apiKey = DotEnv().env['HOTPEPPER_API_KEY'];
  return ShopRepository(apiKey);
});

abstract class BaseShopRepository {
  Future<List<Shop>> searchByKeyword(String keyword);
  Future<List<Shop>> searchByPreferences();
}

class ShopRepository extends BaseShopRepository {
  ShopRepository(this.apiKey);

  static String baseUrl =
      'http://webservice.recruit.co.jp/hotpepper/gourmet/v1/';
  final String? apiKey;

  @override
  Future<List<Shop>> searchByKeyword(String keyword) async {
    return [];
  }

  @override
  Future<List<Shop>> searchByPreferences() async {
    return [];
  }
}
