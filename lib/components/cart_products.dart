import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Cart_products extends StatefulWidget {
  const Cart_products({super.key});

  @override
  State<Cart_products> createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var Products_on_the_cart = [
    {
      "name": "Blaser",
      "picture": "images/products/b1.jpeg",
      "price": 60,
      "size": "M",
      "color": "Black",
      "quantity": 1,
    },
    {
      "name": "Shoes",
      "picture": "images/products/s2.jpeg",
      "price": 50,
      "size": "7",
      "color": "Gray",
      "quantity": 1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: Products_on_the_cart.length,
        itemBuilder: (context, index) {
          return Single_cart_product(
            cart_prod_name: Products_on_the_cart[index]["name"],
            cart_color: Products_on_the_cart[index]["color"],
            cart_prod_quantity: Products_on_the_cart[index]["quantity"],
            cart_size: Products_on_the_cart[index]["size"],
            cart_prod_price: Products_on_the_cart[index]["price"],
            cart_prod_picture: Products_on_the_cart[index]["picture"],
          );
        });
  }
}

class Single_cart_product extends StatelessWidget {
  const Single_cart_product(
      {this.cart_prod_name,
      this.cart_prod_picture,
      this.cart_prod_price,
      this.cart_size,
      this.cart_color,
      this.cart_prod_quantity});

  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_size;
  final cart_color;
  final cart_prod_quantity;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        //===== leading section =====
        leading: new Image.asset(
          cart_prod_picture,
          width: 100.0,
          height: 100.0,
        ),
        // =====Ttle section =====
        title: new Text(cart_prod_name),
        //====== Subtitle section =====
        subtitle: new Column(
          children: <Widget>[
            //Row inside colunm
            new Row(
              children: <Widget>[
                // this section size product
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: new Text("Size:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: new Text(
                    cart_size,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                //              ========= This section of for prod color ====
                new Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 4.0, 4.0, 4.0),
                  child: new Text("Color:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child:
                      new Text(cart_color, style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
            //===== this section for prod price ====
            new Container(
              alignment: Alignment.topLeft,
              child: new Text(
                "\$${cart_prod_price}",
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            )
          ],
        ),

        trailing: new Column(
          children: <Widget>[
            new IconButton(
              onPressed: null,
              icon: Icon(
                Icons.arrow_drop_up,
              ),
            ),
            new Text('1'),
            new IconButton(onPressed: null, icon: Icon(Icons.arrow_drop_down))
          ],
        ),
      ),
    );
  }
}
