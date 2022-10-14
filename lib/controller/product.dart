import 'dart:convert';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:list_product/models/product.dart';
import 'package:list_product/services/endpoint.dart';
import 'package:list_product/services/request.dart';

class ProductController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<ProductModel> products = <ProductModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchAllProducts();
  }

  void fetchAllProducts() {
    Request request = Request(
      url: EndPoint.products,
    );
    request.get().then((result) {
      var response = jsonDecode(result.body);

      try {
        if (response.statusCode == 200) {
          isLoading.value = false;
          products.value = ProductModel.fromJsonToList(response);
        } else {
          isLoading.value = false;
        }
      } catch (e) {
        isLoading.value = false;
      }
    });
  }
}
