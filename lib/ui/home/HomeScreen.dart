import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sampleapp/animation/FadeAnimation.dart';
import 'package:sampleapp/internet/model/HeadPhoneModel.dart';
import 'package:sampleapp/internet/model/ListProductModel.dart';
import 'package:sampleapp/internet/presenter/getproductlist_screen_presenter.dart';
import 'package:sampleapp/ui/values/Styles.dart';
import 'package:sampleapp/ui/widget/ProductCard.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() {
    // TODO: implement createState
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> implements ProductListContract {
  GetProductList _presenter;
  bool isLoading = true;
  GetListProductModel model;

  int _currentIndex;

  HomeScreenState() {
    _presenter = GetProductList(this);
  }

  void changePage(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _presenter.doGetProductList(1, 10, 4);
    setState(() {
      _currentIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      backgroundColor: Color(0xFFf3f6fb),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding:
                  EdgeInsets.only(left: 16, right: 16, top: 30, bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(icon: Icon(Icons.menu), onPressed: null),
                  IconButton(icon: Icon(Icons.shopping_cart), onPressed: null)
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                "Restaurant",
                style: headingStyle,
              ),
            ),
            SizedBox(
              height: 22,
            ),
            Container(
              width: double.infinity,
              height: 60,
              margin: EdgeInsets.symmetric(horizontal: 22),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.12),
                        offset: Offset(0, 10),
                        blurRadius: 30),
                  ]),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 18, right: 12),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search...",
                        hintStyle: searchBarStyle,
                        suffixIcon: Icon(Icons.search)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                "Menu",
                style: headingStyle,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 240,
              child: isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : FadeAnimation(
                      1,
                      ListView.builder(
                          itemCount: model.products.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            Products product = model.products[index];
                            return ProductCard(product);
                          })),
            ),
            Container(
              width: double.infinity,
              height: 160,
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 12),
        child: BubbleBottomBar(
          backgroundColor: Colors.transparent,
          opacity: 1,
          elevation: 0,
          onTap: changePage,
          currentIndex: _currentIndex,
          items: <BubbleBottomBarItem>[
            BubbleBottomBarItem(
                backgroundColor: Colors.black,
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                title: Text(
                  "Home",
                  style: bottomBarStyle,
                )),
            BubbleBottomBarItem(
                backgroundColor: Colors.black,
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                title: Text(
                  "Search",
                  style: bottomBarStyle,
                )),
            BubbleBottomBarItem(
                backgroundColor: Colors.black,
                icon: Icon(
                  Icons.notifications,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
                title: Text(
                  "Notification",
                  style: bottomBarStyle,
                )),
            BubbleBottomBarItem(
                backgroundColor: Colors.black,
                icon: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                title: Text(
                  "Profile",
                  style: bottomBarStyle,
                ))
          ],
        ),
      ),
    );
  }

  @override
  void onError(String errorTxt) {
    print("error resonse: " + errorTxt);
    // TODO: implement onLoginError
  }

  @override
  void onSuccess(GetListProductModel model) {
    print("onLoginSuccess " + model.status);
    setState(() {
      isLoading = false;
      this.model = model;
    });

    // TODO: implement onLoginSuccess
  }
}
