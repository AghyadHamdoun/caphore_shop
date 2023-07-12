class ApiConstance {
  static const String baseUrl = "https://caphore.sy/wp-json/wc/v3";
  static const String consumer_key =
      "ck_91cf0556bc93906395a13037c2a179392cb49b58";
  static const String consumer_secret =
      "cs_3fe564c516e38ed51dcd7caef07c95baadc4f294";

  static String allCategoryProductsPath(int id, int page, int perPage) =>
      "$baseUrl/products?category=$id&consumer_key=$consumer_key&consumer_secret=$consumer_secret&page=$page&per_page=$perPage";

  static String allAttributeTermProductsPath(
          String attribute, int termId, int page, int perPage) =>
      "$baseUrl/products?attribute=pa_$attribute&attribute_term=$termId&consumer_key=$consumer_key&consumer_secret=$consumer_secret&page=$page&per_page=$perPage";

  static String searchProductsPath(String search, int page, int perPage) =>
      "$baseUrl/products?search=$search&consumer_key=$consumer_key&consumer_secret=$consumer_secret&page=$page&per_page=$perPage";

  static String attributeTermsPath(int id, int page, int perPage) =>
      "$baseUrl/products/attributes/$id/terms?consumer_key=$consumer_key&consumer_secret=$consumer_secret&page=$page&per_page=$perPage";

  static String lastProductsPath(int page, int perPage) =>
      "$baseUrl/products?consumer_key=$consumer_key&consumer_secret=$consumer_secret&page=$page&per_page=$perPage";

  static String brandsProductsPath() =>
      "$baseUrl/tags?consumer_key=$consumer_key&consumer_secret=$consumer_secret";

  static String oneProductsPath(int id) =>
      "$baseUrl/products/$id?consumer_key=$consumer_key&consumer_secret=$consumer_secret";

  static String allCategoriesPath(int page) =>
      "$baseUrl/products/categories?consumer_key=$consumer_key&consumer_secret=$consumer_secret&per_page=100&page=$page";

  static String categoriesByParentPath(int parent) =>
      "$baseUrl/products/categories?consumer_key=$consumer_key&consumer_secret=$consumer_secret&per_page=100&parent=$parent";

  static const String allTagsPath =
      "$baseUrl/products/tags?consumer_key=$consumer_key&consumer_secret=$consumer_secret&per page=100&page=1";
}
