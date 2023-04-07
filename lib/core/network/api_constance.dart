class ApiConstance {
  static const String baseUrl = "https://caphore.sy/wp-json/wc/v3";
  static const String consumer_key =
      "ck_91cf0556bc93906395a13037c2a179392cb49b58";
  static const String consumer_secret =
      "cs_3fe564c516e38ed51dcd7caef07c95baadc4f294";

  static String allCategoryProductsPath(int id, int page) =>
      "$baseUrl/products?category=$id&consumer_key=$consumer_key&consumer_secret=$consumer_secret&page=$page";

  static String oneProductsPath(int id) =>
      "$baseUrl/products/$id?consumer_key=$consumer_key&consumer_secret=$consumer_secret";

  static const String allCategoriesPath =
      "$baseUrl/products/categories?consumer_key=$consumer_key&consumer_secret=$consumer_secret";


}
