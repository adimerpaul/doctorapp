import 'package:doctorapp/model/carrusel_model.dart';
import 'package:get/get.dart';

import '../service/carrusel_service.dart';

class CarruselController extends GetxController{
  var carruseles = <Carrusel>[].obs;
  var loading = true.obs;

  @override
  void onInit() {
    getCarrusels();
    super.onInit();
  }
  void getCarrusels() async {
    try {
      loading(true);
      var result = await CarruselService.getCarrusels();
      if (result.isNotEmpty) {
        carruseles.assignAll(result);
      } else {
        carruseles.clear();
      }
    } catch(e) {
      // print("Error fetching carrusels: $e");
      carruseles.clear();
    }
    finally {
      loading(false);
    }
  }
}