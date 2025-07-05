import 'package:doctorapp/model/doctor_model.dart';
import 'package:doctorapp/service/doctor_service.dart';
import 'package:get/get.dart';

class DoctorController extends GetxController{
  var doctores = <Doctor>[].obs;
  var loading = true.obs;

  @override
  void onInit() {
    getDoctores();
    super.onInit();
  }
  void getDoctores() async {
    try{
      loading(true);
      var result = await DoctorService.getDoctores();
      if(result.isNotEmpty){
        doctores.assignAll(result);
      }else{
        doctores.clear();
      }
    }catch(e){
      doctores.clear();
    } finally {
      loading(false);
    }
  }
}