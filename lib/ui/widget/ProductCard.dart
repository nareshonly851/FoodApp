import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sampleapp/internet/RestDatasource.dart';
import 'package:sampleapp/internet/model/ListProductModel.dart';
import 'package:sampleapp/ui/values/Styles.dart';

import 'DetailsPage.dart';

class ProductCard extends StatelessWidget {
  Products item_product;

  ProductCard(this.item_product);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailsPage(
                  heroTag: item_product.image,
                  foodName: item_product.name,
                  foodPrice: item_product.price)));
        },
        child: Padding(
          padding: EdgeInsets.only(left: 15),
          child: Container(
            width: 165,
            height: 240,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(left: 5, right: 5, bottom: 20),
                    child: Container(
                      width: 140,
                      height: 170,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(.1),
                                offset: Offset(0, 10),
                                blurRadius: 12)
                          ]),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Hero(
                      tag: item_product.image,
                      child: CachedNetworkImage(
                        width: 100,
                        height: 100,
                        fit: BoxFit.contain,
                        imageUrl:
                            RestDatasource.Imageuploads + item_product.image,
                        placeholder: (context, url) =>
                            new CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            new Icon(Icons.error),
                      )),
                ),
                Positioned(
                  left: 30,
                  bottom: 50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        item_product.name,
                        style: productTitleStyle,
                      ),
                      Text(
                        item_product.status,
                        style: productSubTitleStyle,
                      ),
                      SizedBox(height: 10,),
                      Container(
                         decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(colors: [
                            Colors.yellow,
                            Colors.orange
                          ])
                        ),
                        child: RaisedButton(

                          onPressed: null,
                          child:Text(
                            "Add To Cart",
                            style: splashspeackerdesStyle,
                          ) ,
                        ) ,
                      )

                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

}
