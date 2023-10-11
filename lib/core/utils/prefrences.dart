import 'package:shared_preferences/shared_preferences.dart';
class Preferences {
  static SharedPreferences? preferences;

  static const String KEY_IS_First_Time = 'key_is_first_time';
  static const String KEY_Brands = 'key_Brands';
  static const String KEY_Clothing = 'key_Clothing';
  static const String KEY_ShoesAndBags = 'key_ShoesAndBags';
  static const String KEY_ElectronicEquipment = 'key_ElectronicEquipment';
  static const String KEY_HouseAndKitchen = 'key_Brands';
  static const String KEY_MakeUp = 'key_MakeUp';
  static const String KEY_WatchesAndAccessories = 'key_WatchesAndAccessories';
  static const String KEY_Perfumes = 'key_Perfumes';
  static const String KEY_HandMade = 'key_HandMade';
  static const String KEY_Pets = 'key_Pets';
  static const String KEY_Toys = 'key_Toys';
  static const String KEY_FastFood = 'key_FastFood';
  static const String KEY_ArabFood = 'key_ArabFood';
  static const String KEY_Sweet = 'key_Sweet';
  static const String KEY_Coffee = 'key_Coffee';


  static init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static void saveIsFirstTime(bool isFirstTime) async {
    preferences?.setBool(KEY_IS_First_Time, isFirstTime);

  }

  static bool? getIsFirstTime() {
    bool? first = preferences!.getBool(KEY_IS_First_Time);
    if(first==null)
    {
      return true;
    }
    else
      return first;
  }

  static void saveBrands(String userName) async {
    preferences!.setString(KEY_Brands, userName);
  }

  static String? getBrands() {
    String? userName = preferences!.getString(KEY_Brands);
    if (userName == null) {
      return '';
    }
    else {
      return userName;
    }
  }

  static void saveClothing(String userName) async {
    preferences!.setString(KEY_Clothing, userName);
  }

  static String? getClothing() {
    String? userName = preferences!.getString(KEY_Clothing);
    if (userName == null) {
      return '';
    }
    else {
      return userName;
    }
  }

  static void saveShoesAndBags(String userName) async {
    preferences!.setString(KEY_ShoesAndBags, userName);
  }

  static String? getShoesAndBags() {
    String? userName = preferences!.getString(KEY_ShoesAndBags);
    if (userName == null) {
      return '';
    }
    else {
      return userName;
    }
  }

  static void saveElectronicEquipment(String userName) async {
    preferences!.setString(KEY_ElectronicEquipment, userName);
  }

  static String? getElectronicEquipment() {
    String? userName = preferences!.getString(KEY_ElectronicEquipment);
    if (userName == null) {
      return '';
    }
    else {
      return userName;
    }
  }

  static void saveHouseAndKitchen(String userName) async {
    preferences!.setString(KEY_HouseAndKitchen, userName);
  }

  static String? getHouseAndKitchen() {
    String? userName = preferences!.getString(KEY_HouseAndKitchen);
    if (userName == null) {
      return '';
    }
    else {
      return userName;
    }
  }

  static void saveMakeUp(String userName) async {
    preferences!.setString(KEY_MakeUp, userName);
  }

  static String? getMakeUp() {
    String? userName = preferences!.getString(KEY_MakeUp);
    if (userName == null) {
      return '';
    }
    else {
      return userName;
    }
  }

  static void saveWatchesAndAccessories(String userName) async {
    preferences!.setString(KEY_WatchesAndAccessories, userName);
  }

  static String? getWatchesAndAccessories() {
    String? userName = preferences!.getString(KEY_WatchesAndAccessories);
    if (userName == null) {
      return '';
    }
    else {
      return userName;
    }
  }

  static void savePerfumes (String userName) async {
    preferences!.setString(KEY_Perfumes , userName);
  }

  static String? getPerfumes () {
    String? userName = preferences!.getString(KEY_Perfumes );
    if (userName == null) {
      return '';
    }
    else {
      return userName;
    }
  }

  static void saveHandMade(String userName) async {
    preferences!.setString(KEY_HandMade, userName);
  }

  static String? getHandMade() {
    String? userName = preferences!.getString(KEY_HandMade);
    if (userName == null) {
      return '';
    }
    else {
      return userName;
    }
  }

  static void savePets(String userName) async {
    preferences!.setString(KEY_Pets, userName);
  }

  static String? getPets() {
    String? userName = preferences!.getString(KEY_Pets);
    if (userName == null) {
      return '';
    }
    else {
      return userName;
    }
  }

  static void saveToys(String userName) async {
    preferences!.setString(KEY_Toys, userName);
  }

  static String? getToys() {
    String? userName = preferences!.getString(KEY_Toys);
    if (userName == null) {
      return '';
    }
    else {
      return userName;
    }
  }

  static void saveFastFood(String userName) async {
    preferences!.setString(KEY_FastFood, userName);
  }

  static String? getFastFood() {
    String? userName = preferences!.getString(KEY_FastFood);
    if (userName == null) {
      return '';
    }
    else {
      return userName;
    }
  }

  static void saveArabFood(String userName) async {
    preferences!.setString(KEY_ArabFood, userName);
  }

  static String? getArabFood() {
    String? userName = preferences!.getString(KEY_ArabFood);
    if (userName == null) {
      return '';
    }
    else {
      return userName;
    }
  }

  static void saveSweet(String userName) async {
    preferences!.setString(KEY_Sweet, userName);
  }

  static String? getSweet() {
    String? userName = preferences!.getString(KEY_Sweet);
    if (userName == null) {
      return '';
    }
    else {
      return userName;
    }
  }

  static void saveCoffee(String userName) async {
    preferences!.setString(KEY_Coffee, userName);
  }

  static String? getCoffee() {
    String? userName = preferences!.getString(KEY_Coffee);
    if (userName == null) {
      return '';
    }
    else {
      return userName;
    }
  }
}