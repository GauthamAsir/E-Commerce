import 'package:flutter/material.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/providers/product_provider.dart';
import 'package:shop_app/utils/size_config.dart';

import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Products", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        FutureBuilder(
            future: ProductProvider().getAllProducts(),
            builder: (_, snap) {
              if (snap.hasData && snap.data != null) {
                if (snap.data!.isEmpty) {
                  return Center(
                    child: Text('Empty List'),
                  );
                }

                return AspectRatio(
                  aspectRatio: 1,
                  child: ListView.builder(
                      itemCount: snap.data!.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (__, index) {
                        return ProductCard(product: snap.data![index]);
                      }),
                );
              }

              return Center(
                child: CircularProgressIndicator(),
              );
            })
      ],
    );
  }
}
