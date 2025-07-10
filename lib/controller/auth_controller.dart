import 'package:get/get.dart';
import '../service/databasehelper.dart';
import '../model/user_model.dart';

class AuthController extends GetxController {
  var isLoggedIn = false.obs;
  var currentUser = Rxn<UserModel>();

  @override
  void onInit() {
    super.onInit();
    verificarLogin();
  }

  Future<void> verificarLogin() async {
    final db = Databasehelper();
    final user = await db.getCurrentUser();
    if (user != null) {
      currentUser.value = user;
      isLoggedIn.value = true;
    } else {
      isLoggedIn.value = false;
    }
  }

  void setUser(UserModel user) {
    currentUser.value = user;
    isLoggedIn.value = true;
  }

  Future<void> logout() async {
    final db = Databasehelper();
    await db.deleteUser();
    currentUser.value = null;
    isLoggedIn.value = false;
  }
}
