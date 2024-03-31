import 'package:flutter/material.dart';
import 'package:commerce/pages/product_details.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "name": "Blaser",
      "picture": "images/products/b1.jpeg",
      "old_price": 120,
      "price": 60,
    },
    {
      "name": "red Dress",
      "picture": "images/products/d2.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "red Dress",
      "picture": "images/products/d2.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "red Dress",
      "picture": "images/products/d2.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "red Dress",
      "picture": "images/cats/c1.png",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "red Dress",
      "picture": "images/cats/c2.png",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "red Dress",
      "picture": "images/cats/c9.png",
      "old_price": 100,
      "price": 50,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: product_list.length,
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return Single_prod(
          prod_name: product_list[index]["name"],
          prod_picture: product_list[index]["picture"],
          prod_old_price: product_list[index]["old_price"],
          prod_price: product_list[index]["price"],
        );
      },
    );
  }
}

class Single_prod extends StatelessWidget {
  Single_prod(
      {Key? key,
      required this.prod_name,
      required this.prod_picture,
      required this.prod_old_price,
      required this.prod_price})
      : super(key: key);
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Hero(
            tag: Text('$prod_name'),
            child: Material(
              child: InkWell(
                onTap: () => Navigator.of(context).push(
                  new MaterialPageRoute(
                      //here we are passing the value of the product to the producr datail page
                      builder: (context) => new ProductDetails(
                            product_detail_name: prod_name,
                            product_detail_new_price: prod_price,
                            product_detail_old_price: prod_old_price,
                            product_detail_picture: prod_picture,
                          )),
                ),
                child: GridTile(
                  footer: Container(
                      color: Colors.white,
                      child: new Row(
                        children: [
                          Expanded(
                            child: new Text(
                              prod_name,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          new Text(
                            "\$$prod_old_price",
                            style: TextStyle(color: Colors.red),
                          )
                        ],
                      )),
                  child: Image.asset(
                    prod_picture,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )));
  }
}
