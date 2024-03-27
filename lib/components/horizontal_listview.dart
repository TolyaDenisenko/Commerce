import "package:flutter/material.dart";

class HorizontalList extends StatelessWidget {
  const HorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(image_location: 'images/cats/c1.png', image_caption: 'c1'),
          Category(image_location: 'images/cats/c2.png', image_caption: 'c2'),
          Category(image_location: 'images/cats/c3.png', image_caption: 'c3'),
          Category(image_location: 'images/cats/c4.png', image_caption: 'c4'),
          Category(image_location: 'images/cats/c5.png', image_caption: 'c5'),
          Category(image_location: 'images/cats/c6.png', image_caption: 'c6'),
          Category(image_location: 'images/cats/c7.png', image_caption: 'c7'),
          Category(image_location: 'images/cats/c8.png', image_caption: 'c8'),
          Category(image_location: 'images/cats/c9.png', image_caption: 'c9'),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  const Category(
      {super.key, required this.image_location, required this.image_caption});

  final String image_location;
  final String image_caption;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100.0,
          child: ListTile(
            title: Image.asset(
              image_location,
              width: 50.0,
              height: 50.0,
            ),
            subtitle: Container(
                alignment: Alignment.topCenter, child: Text(image_caption)),
          ),
        ),
      ),
    );
  }
}
