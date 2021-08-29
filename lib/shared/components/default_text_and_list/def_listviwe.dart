import 'package:e_commerce/model/cart_model.dart';
import 'package:e_commerce/model/favo_model.dart';
import 'package:e_commerce/shared/components/constance/constants.dart';
import 'package:e_commerce/shared/components/default_button/circal_but_widget.dart';
import 'package:e_commerce/shared/components/default_button/material_button.dart';
import 'package:e_commerce/shared/components/generale_components/components.dart';
import 'package:e_commerce/shared/cubit/cubit_app/cubit.dart';
import 'package:e_commerce/shared/cubit/cubit_app/statet.dart';
import 'package:e_commerce/shared/cubit/cubit_home_product/cubit_pro.dart';
import 'package:e_commerce/shared/stayle/default_color.dart';
import 'package:e_commerce/shared/stayle/stayles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget defaultListView(
        {required String image,
        required String name,
        required dynamic price,
        required BuildContext context,
        required dynamic discount,
        dynamic oldPrice,
        Function? onPress,
        CartItem? cartItems,
        Function? addFun,
        Function? removeFun,
        bool? isCart,
        bool? isCartScreen = false,
        bool? isFavoriteScreen = false,
        int? number,
        int? favId,
        int? cartId,
        int? idCartColor,
        int? idfavColor}) =>
    GestureDetector(
      onTap: () {
        return onPress!();
      },
      child: Container(
        // padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.stretch,

          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            Stack(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                        image: NetworkImage(image), fit: BoxFit.fill),
                  ),
                ),
                if (discount > 0)
                  Positioned(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      width: 25,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.red,
                      ),
                      child: Text(
                        appLangDirection =='ar'?'خصم':'sale',
                        style: appLangDirection =='ar'
                            ? white12regular()
                            : white14regular(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                else
                  Container()
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    name,
                    maxLines: 1,
                    // style: Theme.of(context).textTheme.bodyText2,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 5.0,
                            ),
                            child: Text(
                              '$price EG',
                              style: indigo16bold(),
                            ),
                          ),
                          if (discount > 0 && isFavoriteScreen!)
                            Row(
                              children: [
                                Container(
                                  child: Text(
                                    '$oldPrice ',
                                    textAlign: TextAlign.end,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(
                                            decoration:
                                                TextDecoration.lineThrough),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 5.0,
                                  ),
                                  child: Container(
                                    width: 1.0,
                                    height: 10.0,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  '$discount %',
                                  style: black14bold().copyWith(
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            )
                          else
                            Container()
                        ],
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          isFavoriteScreen!
                              ? BlocConsumer<AppCubit, AppState>(
                                  listener: (context, state) {
                                    // if (state
                                    //         is AddAndDeleteProductForCartSuccessStates &&
                                    //     appCubit(context)
                                    //             .addOrRemoveCart!
                                    //             .message ==
                                    //         'تم الحذف بنجاح') {
                                    //   return showToast(
                                    //       gravity: ToastGravity.CENTER,
                                    //       text: 'Remove From To Car',
                                    //       tColor: ToastColors.ERROR);
                                    // }
                                    // if (appCubit(context)
                                    //         .addOrRemoveCart!
                                    //         .message ==
                                    //     'تمت الإضافة بنجاح') {
                                    //   return showToast(
                                    //       gravity: ToastGravity.CENTER,
                                    //       text: ' Add To Car ',
                                    //       tColor: ToastColors.SUCCESS);
                                    // }
                                    //
                                    // if (state
                                    //         is AddProductToFromFavoriteSuccessStates &&
                                    //     appCubit(context).addFavorite!.message ==
                                    //         'تم الحذف بنجاح') {
                                    //   return showToast(
                                    //       gravity: ToastGravity.CENTER,
                                    //       text: 'Remove From Favorite',
                                    //       tColor: ToastColors.ERROR);
                                    // }
                                    //
                                    // if (appCubit(context)
                                    //             .addOrRemoveCart!
                                    //             .message ==
                                    //         'تمت الإضافة بنجاح' &&
                                    //     state
                                    //         is AddAndDeleteProductForCartSuccessStates) {
                                    //   return showToast(
                                    //       gravity: ToastGravity.CENTER,
                                    //       text: 'Add To Car',
                                    //       tColor: ToastColors.SUCCESS);
                                    // }
                                  },
                                  builder: (context, state) {
                                    return Row(
                                      // mainAxisSize: MainAxisSize.min,
                                      children: [

                                        DefaultCircleButton(
                                            fun: () =>
                                                appCubit(context).changeInCart(
                                                  id: cartId!,
                                                ),
                                            icon: Icons.shopping_cart_outlined,
                                            ws: 30.0,
                                            hs: 30.0,
                                            isIcon: true,
                                            color: appCubit(context)
                                                    .carts[idCartColor]!
                                                ? Colors.green

                                                : indigo(),
                                            r: 15.0,
                                            size: 20),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        DefaultCircleButton(
                                            fun: () => appCubit(context)
                                                .changeInFavorite(id: favId!),
                                            icon: Icons.favorite_border_rounded,
                                            ws: 30.0,
                                            isIcon: true,
                                            hs:30.0,
                                            r: 15.0,
                                            color: appCubit(context)
                                                .favorite[idfavColor]!
                                                ? Colors.green
                                                : indigo(),
                                            size: 20)
                                      ],
                                    );
                                  },
                                )
                              : Row(
                                  children: [
                                    DefaultCircleButton(
                                      color: indigo(),
                                      ws: 30,
                                      hs: 30,
                                      r: 15,
                                      isIcon: true,
                                      icon: Icons.add,
                                      fun: () {
                                        print(cartItems!.id);
                                        print(cartItems.quantity);
                                        appCubit(context).updateCart(
                                            id: cartItems.id!,
                                            quantity: ++cartItems.quantity);
                                      },
                                    ),


                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '$number',
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    DefaultCircleButton(
                                      color: indigo(),
                                      ws: 30,
                                      hs: 30,
                                      r: 15,
                                      icon: Icons.remove,
                                      fun: () {
                                        print(cartItems!.id);
                                        print(cartItems.quantity);
                                        if (cartItems.quantity != 1)
                                          return appCubit(context).updateCart(
                                              id: cartItems.id!,
                                              quantity: --cartItems.quantity);
                                      },
                                      isIcon: true,
                                    ),
                                  ],
                                ),
                          SizedBox(
                            height: 10,
                          ),
                          isCartScreen!
                              ? Container(
                                  // alignment: Alignment.centerRight,
                                  child: DefaultCircleButton(
                                    fun: removeFun!,
                                    icon: Icons.delete,
                                    iconColor: Colors.white,
                                    ws: 30.0,
                                    hs: 30.0,
                                    color: Colors.red,
                                    r: 17.0,
                                    size: 20,
                                    isIcon: true,
                                    text: '',
                                  ),
                                )
                              : Container()
                        ],
                      )
                    ],
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // //
                ],
              ),
            )
          ],
        ),
      ),
    );
