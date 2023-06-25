
import 'package:shared_preferences/shared_preferences.dart';
class CacheHelper
{
  static late SharedPreferences prefs;

  static init()async{
    prefs = await SharedPreferences.getInstance();
  }
  static Future<bool> saveCounter( int Count) async{
    return await prefs.setInt('counter', Count);
  }
  static int getCounter() {
    return prefs.getInt("counter") ?? 0;
  }
  static Future<bool> saveIfNotFirstTime() async{
    return await prefs.setBool("isFirstTime",  false);
  }
  static bool getIfFirstTime(){
    return prefs.getBool("isFirstTime") ?? true ;
  }
  static Future<bool> saveToken(String token) async{
    return await prefs.setString("token",  token);
  }
  static String getToken() {
    return  prefs.getString("token")?? "";
  }
  static Future<bool> saveImage(String imageUrl) async{
    return await prefs.setString("image",  imageUrl);
  }
  static String getImage() {
    return  prefs.getString("Image")?? "https://images.unsplash.com/photo-1663711935287-4a7323fea555?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1M3x8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60";
  }
  static Future<bool> saveName(String name) async{
    return await prefs.setString("image",  name);
  }
  static String getName() {
    return  prefs.getString("name")?? "ahmed nassim";
  }
  static Future<bool> saveFullName(String fullname) async{
    return await prefs.setString("full_name",fullname );
  }
  static String getFullName() {
    return  prefs.getString("full_name")?? "ahmed nassin behery";
  }
  static Future<bool> saveEmail(String email) async{
    return await prefs.setString("email",email );
  }
  static String getEmail() {
    return  prefs.getString("email")?? "ahmednassim@Gmail.com";
  }

  static Future<bool> Id(int id) async{
    return await prefs.setInt("id",id );
  }
  static int  getId() {
    return  prefs.getInt("id")?? 0;
  }
  static Future<bool> savePhone(String phone) async{
    return await prefs.setString("phone",phone );
  }
  static String getPhone() {
    return  prefs.getString("Phone")?? "01283412867";
  }
  static Future<bool>clear(){
    return prefs.clear();
  }
}