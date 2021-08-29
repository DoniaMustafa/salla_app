import 'package:badges/badges.dart';
import 'package:e_commerce/modules/cart/cart_screen.dart';
import 'package:e_commerce/shared/components/constance/constants.dart';
import 'package:e_commerce/shared/components/default_navigator/navigat.dart';
import 'package:e_commerce/shared/cubit/cubit_app/cubit.dart';
import 'package:e_commerce/shared/cubit/cubit_app/statet.dart';
import 'package:e_commerce/shared/stayle/default_color.dart';
import 'package:e_commerce/shared/stayle/stayles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var index = appCubit(context);
          return ScreenTypeLayout(
            mobile:  Directionality(
              textDirection: index.textDirection,
              child: Scaffold(
                appBar: AppBar(
                  title: Text(
                    '${appCubit(context).listTitle(context , index.selection).toString()}',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  actions: [
                    Padding(
                      padding: appLangDirection == 'ar'
                          ? EdgeInsets.only(top: 10.0, bottom: 10, left: 25)
                          : EdgeInsets.only(top: 10.0, bottom: 10, right: 25),
                      child: Badge(
                          position: BadgePosition.bottomStart(
                              bottom: 12.5, start: 30),
                          showBadge: appCubit(context).cart != null,
                          badgeContent: index.productCartNumber != 0 &&
                              state is! HomeLoadingStates
                              ? Text(
                            index.productCartNumber >= 9
                                ? '9+'
                                : index.productCartNumber.toString(),
                            style: black14bold()
                                .copyWith(color: Colors.white),
                          )
                              : Container(),
                          child: IconButton(
                              icon: Icon(Icons.add_shopping_cart),
                              onPressed: () => navigaTo(
                                  context: context, widget: Cart()))),
                    ),

                  ],
                ),
                body: index.screen[index.selection],
                bottomNavigationBar: BottomNavigationBar(
                  items: [
                    new BottomNavigationBarItem(
                      backgroundColor: Colors.deepPurple,
                      icon: Icon(Icons.home),

                      label: transModel(context).home,
                    ),
                    new BottomNavigationBarItem(
                      backgroundColor: Colors.deepPurple,
                      icon: Icon(Icons.category_rounded),

                      label: transModel(context).category,
                    ),


                    new BottomNavigationBarItem(
                      icon: Badge(
                          showBadge: appCubit(context).getFavorite != null ,
                          position:
                          BadgePosition.bottomStart(bottom: 2, start: 15),
                          alignment: appLangDirection == "ar"
                              ? Alignment.topRight
                              : Alignment.topLeft,
                          child: Icon(Icons.favorite),

                          badgeContent:
                          index.productFavNumber != 0
                              ? Text(
                            index.productFavNumber >= 9
                                ? '9+'
                                : index.productFavNumber.toString(),
                            style:
                            black14bold().copyWith(color: Colors.white),
                          )
                              : null),
                        label: transModel(context).favorite,
                    ),
                    new BottomNavigationBarItem(
                      icon: Icon(Icons.settings),

                      label: transModel(context).settings,
                    ),
                  ],
                  type: BottomNavigationBarType.fixed,
                  onTap: (itm) => index.onClickCurrentIndex(itm),
                  currentIndex: index.selection,
                  fixedColor: indigo(),
                ),
              ),
            ),
          );

        });
  }
}


