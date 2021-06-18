import 'package:background_app_bar/background_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:sazashopping/models/basket.dart';
import 'package:sazashopping/models/mainItem.dart';
import 'package:sazashopping/screens/secondPage/shared/detailDisplay.dart';
import 'package:sazashopping/screens/secondPage/shared/dropDownBotton.dart';
import 'package:sazashopping/screens/secondPage/shared/imageDisplay.dart';
import 'package:sazashopping/screens/secondPage/shared/itemCountSelection.dart';
import 'package:sazashopping/shared/constant.dart';
import 'package:sazashopping/shared/string.dart';
import 'package:sazashopping/shared/testStyles.dart';
// import 'package:sazashopping/screens/home/menus/constants.dart';
// import 'package:sazashopping/screens/secondPage/shared/imageDisplay.dart';

class BodySubScreen extends StatelessWidget {
  final MainItems mainItems;
  final bool navResult;
  final Basket basketFromNav;
  final bool stockNotAvilabe;
  final Function funtion;
  const BodySubScreen({
    @required this.mainItems,
    this.funtion,
    this.navResult,
    this.basketFromNav,
    this.stockNotAvilabe,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.white,
          pinned: true,
          snap: true, // - display full background
          floating: true,
          expandedHeight: 160.0,
          flexibleSpace: new BackgroundFlexibleSpaceBar(
              title: new Text(this.mainItems.name),
              centerTitle: false,
              titlePadding: const EdgeInsets.only(left: 5.0, bottom: 5.0),
              background: ItemImageDisplay(
                mainItems: this.mainItems,
                stockNotAvilabe: this.stockNotAvilabe,
              )),
        ),

        // const SliverToBoxAdapter(
        //   child: SizedBox(
        //     height: 20,
        //     child: Center(
        //       child: Text('Scroll to see the SliverAppBar in effect.'),
        //     ),
        //   ),
        // ),

        SliverList(
          delegate: SliverChildListDelegate([
            // Text(
            //   mainItems.name,
            //   style: itemnameStyle,
            // ),
            Row(
              children: <Widget>[
                Text(
                  mainItems.quantity.toString(),
                  style: itemdefaultStyle.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  ' avalible',
                  style: itemdefaultStyle,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Price',
                  style: itemdefaultStyle,
                ),
                Text(
                  srilankaRuppes + '  ' + mainItems.price,
                  style: itemPriceStyle,
                ),
              ],
            ),
            SizedBox(
              height: 7,
            ),
            mainItems.offer != 0.0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'offer',
                        style: itemdefaultStyle,
                      ),
                      Text(
                        '-' + mainItems.offer.toString() + '%',
                        style: offerTestStyle,
                      ),
                    ],
                  )
                : SizedBox(),
            SizedBox(
              height: 7,
            ),
            mainItems.offer != 0.0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Actual Price',
                        style: itemdefaultStyle,
                      ),
                      Text(
                        srilankaRuppes + '  '
                        // + actualPrice.toString()
                        ,
                        style: itemPriceStyle,
                      )
                    ],
                  )
                : SizedBox(),
            SizedBox(
              height: 10,
            ),
            SelectionDropDown(
              name: 'Color',
              items: mainItems.color,
              selecteSize: navResult ? basketFromNav.color : null,
              function: (val) => this.funtion(val),
            ),
            SizedBox(
              height: 10,
            ),
            SelectionDropDown(
              name: 'Size',
              items: mainItems.size,
              selecteSize: navResult ? basketFromNav.size : null,
              function: (val) => this.funtion(val),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Quantity',
                  style: itemdefaultStyle,
                ),
                ItemContselect(
                  size: mainItems.quantity,
                  count: 2,
                  incress: () => this.funtion,
                  descrise: () => this.funtion,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ItemDetailDisplaty(
              tag: material,
              value: mainItems.material,
            ),
            SizedBox(
              height: 10,
            ),
            ItemDetailDisplaty(
              tag: 'Gender',
              value: mainItems.gender,
            ),
            SizedBox(
              height: 10,
            ),
            ItemDetailDisplaty(
              tag: 'Made in',
              value: mainItems.country,
            ),
            SizedBox(
              height: 10,
            ),
            ItemDetailDisplaty(
              tag: 'Brand name',
              value: mainItems.brand,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.teal[200],
                ),
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Text(
                mainItems.description,
                style: itemdefaultStyle,
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
