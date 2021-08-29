import 'package:e_commerce/modules/single_prod/single_product__screen.dart';
import 'package:e_commerce/shared/components/constance/constants.dart';
import 'package:e_commerce/shared/components/default_navigator/navigat.dart';
import 'package:e_commerce/shared/components/default_text_and_list/def_listviwe.dart';
import 'package:e_commerce/shared/cubit/cubit_app/cubit.dart';
import 'package:e_commerce/shared/cubit/cubit_app/statet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:loading_animations/loading_animations.dart';

class Favorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        // List<Datum> favProduct = appCubit(context).getFavorite.data.data;
        return Directionality(
          textDirection: appCubit(context).textDirection,
          child: Scaffold(
            body: RefreshIndicator(
              onRefresh: () => appCubit(context).loadFav(),
              child: Container(
                  // margin: EdgeInsets.all(20),
                  // color: Colors.white,
                  padding: EdgeInsets.all(20),
                  child: Conditional.single(
                      context: context,
                      conditionBuilder: (context) => appCubit(context).getFavorite != null,
                      widgetBuilder: (context) => Conditional.single(
                          context: context,
                          conditionBuilder: (context) =>
                              appCubit(context).getFavorite!.data!.data!.isEmpty,
                          widgetBuilder: (context) => Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'The Favorite Field is Empty',
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              ),
                          fallbackBuilder: (context) => ListView.separated(
                                itemCount: appCubit(context)
                                    .getFavorite!
                                    .data!
                                    .data!
                                    .length,
                                itemBuilder: (context, index) {
                                  return defaultListView(
                                    onPress: () {
                                      print("ok");
                                      return navigaTo(
                                          context: context,
                                          widget: SingleProduct(
                                            id: appCubit(context)
                                                .getFavorite!
                                                .data!
                                                .data![index]
                                                .product!
                                                .id,
                                          ));
                                    },
                                    image: appCubit(context)
                                        .getFavorite!
                                        .data!
                                        .data![index]
                                        .product!
                                        .image!,
                                    name: appCubit(context)
                                        .getFavorite!
                                        .data!
                                        .data![index]
                                        .product!
                                        .name!,
                                    price: appCubit(context)
                                        .getFavorite!
                                        .data!
                                        .data![index]
                                        .product!
                                        .price,
                                    oldPrice: appCubit(context)
                                        .getFavorite!
                                        .data!
                                        .data![index]
                                        .product!
                                        .oldPrice,
                                    discount: appCubit(context)
                                        .getFavorite!
                                        .data!
                                        .data![index]
                                        .product!
                                        .discount,
                                    context: context,
                                    isFavoriteScreen: true,
                                    idfavColor: appCubit(context)
                                        .getFavorite!
                                        .data!
                                        .data![index]
                                        .product!
                                        .id,
                                    idCartColor: appCubit(context)
                                        .getFavorite!
                                        .data!
                                        .data![index]
                                        .product!
                                        .id,
                                    favId: appCubit(context)
                                        .getFavorite!
                                        .data!
                                        .data![index]
                                        .product!
                                        .id,
                                    cartId: appCubit(context)
                                        .getFavorite!
                                        .data!
                                        .data![index]
                                        .product!
                                        .id,
                                    isCartScreen: false,
                                  );
                                },
                                separatorBuilder: (context, index) => Divider(
                                  indent: 15,
                                  endIndent: 15,
                                ),
                              )),
                      fallbackBuilder: (context) => Container(
                            alignment: Alignment.center,
                            child: LoadingBouncingLine.square(
                              backgroundColor: Colors.indigo,
                            ),
                          ))),
            ),
          ),
        );
      },
    );
  }
}
