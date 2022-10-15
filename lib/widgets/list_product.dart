import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:list_product/assets/colors.dart';
import 'package:list_product/assets/fonts.dart';
import 'package:list_product/assets/size.dart';
import 'package:list_product/models/product.dart';
import 'package:list_product/views/photo.dart';
import 'package:list_product/widgets/rich_text_label.dart';
import 'package:list_product/widgets/text_label.dart';

class ListProduct extends StatelessWidget {
  ProductModel product;
  ListProduct({super.key, required this.product});
  var currencyFormat = new NumberFormat.currency(locale: "en_US", symbol: "\$");

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 5),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          width: SizeApp.width,
          height: SizeApp.height / 4 - 20,
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Get.to(PhotoPage(
                    photo: product.image.toString(),
                  ));
                },
                child: Container(
                  height: SizeApp.height / 4 - 20,
                  width: SizeApp.width / 2 - 40,
                  decoration: BoxDecoration(
                    color: ColorsApp.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.2), BlendMode.dstATop),
                      image: new NetworkImage(product.image.toString()),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: TextLabel(
                      text: "${currencyFormat.format(product.rating!.count)}",
                      font: FontsApp.interSemibold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: SizeApp.height / 4 - 20,
                  width: double.maxFinite,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichTextLabel(
                              text: product.title,
                              font: FontsApp.interBold,
                              size: SizeApp.LargelSize,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            RichTextLabel(
                              text: product.description,
                              font: FontsApp.interLight,
                              size: SizeApp.smallSize,
                              maxline: 4,
                            )
                          ],
                        ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  size: 15,
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                TextLabel(text: product.rating!.rate.toString())
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
