import 'package:flutter/material.dart';
import 'package:lake/provider/product_provider.dart';
import 'package:provider/provider.dart';
class ProductListPage extends StatelessWidget {
  const ProductListPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);
    productProvider.getList();
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
          mainAxisSpacing: 20,   // khoảng cách giữa 2 nhóm
          crossAxisSpacing: 20, // khoảng cách giữa 2 cột
        children: [
          ...productProvider.list.map((e) {
            return Column(
              children: [
                Image.network(e.image??"", width: 100, height: 100),
                Text(e.title?? ""),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.price_change_outlined,),
                    Text(e.price.toString()??"",),
                  ],
                )
              ],
            ); // Text(e.title ?? "Title is null");
          }).toList()
        ],
      ),
    );
  }
}


