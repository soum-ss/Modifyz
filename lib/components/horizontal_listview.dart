import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image_location: 'images/icons8-comb-100.png',
            image_caption: 'Hair cut',
          ),

          Category(
            image_location: 'images/icons8-massage-96.png',
            image_caption: 'massge',
          ),

          Category(
            image_location: 'images/icons8-short-beard-80.png',
            image_caption: 'shave',
          ),

          Category(
            image_location: 'images/icons8-spray-200.png',
            image_caption: 'hair colour',
          ),

          Category(
            image_location: 'images/cats/informal.png',
            image_caption: 'formal',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({this.image_location, this.image_caption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 80.0,
          child: ListTile(
              title: Image.asset(
                image_location,
                width: 40.0,
                height: 40.0,
              ),
              subtitle: Container(
                alignment: Alignment.topCenter,
                child: Text(image_caption, style: new TextStyle(fontSize: 12.0),),
              )
          ),
        ),
      ),
    );
  }
}