import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:list_product/assets/colors.dart';
import 'package:list_product/assets/fonts.dart';
import 'package:list_product/assets/size.dart';
import 'package:list_product/controller/product.dart';

import 'package:list_product/widgets/text_label.dart';
import 'package:list_product/widgets/list_product.dart';

final ProductController productController = Get.put(ProductController());

class ProductPage extends StatelessWidget {
  ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: ColorsApp.decoration,
        ),
        title: TextLabel(
          text: "Products",
          color: ColorsApp.white,
          size: SizeApp.LargelSize,
          font: FontsApp.interBold,
        ),
      ),
      body: Obx(() {
        return productController.isLoading.value == true
            ? Container(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  children:
                      List.generate(productController.products.length, (index) {
                    var data = productController.products[index];
                    return ListProduct(
                      product: data,
                    );
                  }),
                ),
              );
      }),
    );
  }
}
