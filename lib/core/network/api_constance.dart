class ApiConstance {
  static const String baseUrl = "https://caphore.sy/wp-json/wc/v3";
  static const String consumer_key =
      "ck_91cf0556bc93906395a13037c2a179392cb49b58";
  static const String consumer_secret =
      "cs_3fe564c516e38ed51dcd7caef07c95baadc4f294";

  static String allCategoryProductsPath(int id, int page,int perPage) =>
      "$baseUrl/products?category=$id&consumer_key=$consumer_key&consumer_secret=$consumer_secret&page=$page&per_page=$perPage";

  static String attributeTermsPath(int id, int page,int perPage) =>
      "$baseUrl/products/attributes/$id/terms?consumer_key=$consumer_key&consumer_secret=$consumer_secret&page=$page&per_page=$perPage";

  static String lastProductsPath(int page,int perPage) =>
      "$baseUrl/products?consumer_key=$consumer_key&consumer_secret=$consumer_secret&page=$page&per_page=$perPage";

  static String brandsProductsPath() =>
      "$baseUrl/tags?consumer_key=$consumer_key&consumer_secret=$consumer_secret";

  static String oneProductsPath(int id) =>
      "$baseUrl/products/$id?consumer_key=$consumer_key&consumer_secret=$consumer_secret";

  static const String allCategoriesPath =
      "$baseUrl/products/categories?consumer_key=$consumer_key&consumer_secret=$consumer_secret&per page=100&page=1";

  static const String allTagsPath =
      "$baseUrl/products/tags?consumer_key=$consumer_key&consumer_secret=$consumer_secret&per page=100&page=1";


}
