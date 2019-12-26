import 'package:flutter/material.dart';
import 'package:hello_flutter/ui/homeDetail.dart';
import 'package:hello_flutter/entities/Products.dart';
import 'package:hello_flutter/bloc/homebloc.dart';

class  Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('First Route'),
//       ),
//       body: Center(
//         child: RaisedButton(
//           child: Text('Open'),
//           onPressed: () {
//             Navigator.push(context, MaterialPageRoute(builder: (context) => Homedetail()),);
//           },
//         ),
//       ),
//     );
//   }
// }

@override
  Widget build(BuildContext context) {
    //bloc = BlocProvider.of<NewHomeBloc>(context);
    return getScaffold();
  }

  Widget getScaffold() {
    return Scaffold(
      // appBar: getAppBar(),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      title: Text('data'),
      backgroundColor: Colors.amber,
    );
  }

  Widget getBody() {
    return getContent();
  }

  Widget getContent() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
         
          Container(
            child: getProducts(),
          )
        ],
      ),
    );
  }
Widget getVerticalProducts(HomeData data) {
    return Column(
      children: <Widget>[
        Container(
          height: 30.0,
          child: Text(
            'Online Shopping Festival',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 14.0,
                fontStyle: FontStyle.normal,
                color: Colors.black),
          ),
        ),
        GridView.builder(
          //scrollDirection: Axis.horizontal,
          itemCount: data.items.length,

          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.65),
          primary: false,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 5.0,
              child: new Column(
                children: <Widget>[
                  FadeInImage.assetNetwork(
                    placeholder: 'images/awokPlaceholder.png',
                    image: data.items[index].image.src,
                    //result.output.data.items[index].image.src,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        left: 5.0, right: 5.0, bottom: 5.0),
                    child: Text(
                      data.items[index].name,
                      maxLines: 2,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Text(data.items[index].prices.priceNew + 'AED'),
                      new Text(
                        data.items[index].prices.priceOld + 'AED',
                        style: TextStyle(
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        //Day.monday.toString().split('.')[1];
                        child: Text(data.items[index].cart.title.toString(),
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.white)),
                        color: Colors.orange,
                        onPressed: () {
                          // HomeBloc().postAddToCart(
                          //     data.items[index].cart.value.toString());
                          // showBottomSheet<void>(
                          //     context: context,
                          //     builder: (BuildContext context) {
                          //       return Container(
                          //           height: 100,
                          //           child: Padding(
                          //             padding: const EdgeInsets.all(32.0),
                          //             child: addToCart(),
                          //           ));
                          //     });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

Widget getProducts() {
    return StreamBuilder<Products>(
      stream: HomeBloc().myProducts,
      builder: (c, snapshoot) {
        if (snapshoot.hasData) {
          return getVerticalProducts(snapshoot.data.output.data);
          // getGridview(snapshoot.data.output.data, null);
        } else
          return Center(
            child: CircularProgressIndicator(),
          );
      },
    );
  }
}