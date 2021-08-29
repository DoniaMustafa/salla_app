import 'package:e_commerce/model/home_model.dart';
import 'package:e_commerce/modules/single_prod/single_product__screen.dart';
import 'package:e_commerce/shared/components/constance/constants.dart';
import 'package:e_commerce/shared/components/default_navigator/navigat.dart';
import 'package:e_commerce/shared/components/default_text_and_list/def_listviwe.dart';
import 'package:e_commerce/shared/cubit/cubit_app/cubit.dart';
import 'package:e_commerce/shared/cubit/cubit_app/statet.dart';
import 'package:e_commerce/shared/di/dependency_injaction.dart';
import 'package:e_commerce/shared/stayle/default_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:loading_animations/loading_animations.dart';

class BestOffer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => di<AppCubit>()..getHomeData(),
        child: BlocConsumer<AppCubit, AppState>(
            listener: (context, state) {},
            builder: (context, state) {
              List<Product> product = appCubit(context).dataOfProduct;
              return Directionality(
                textDirection: appCubit(context).textDirection,
                child: Scaffold(
                  appBar: AppBar(
                      title: Text(
                          // '${transModel(context).bestOffer!}'
                          appLangDirection == 'ar'
                              ? 'افضل العروض'
                              : 'Best Offers',
                          style: Theme.of(context).textTheme.headline6)),
                  body: RefreshIndicator(
                    color: indigo(),
                    backgroundColor: Colors.transparent,
                    onRefresh: () => di<AppCubit>().getHomeData(),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Conditional.single(
                        context: context,
                        conditionBuilder: (context) =>
                            AppCubit.get(context).dataOfProduct != null,
                        fallbackBuilder: (context) => Container(
                          alignment: Alignment.center,
                          // color: Colors.white,
                          child: LoadingBouncingLine.square(
                            backgroundColor: Colors.indigo,
                          ),
                        ),
                        widgetBuilder: (context) => ListView.separated(
                          itemCount: appCubit(context).dataOfProduct.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () => navigaTo(
                                  context: context,
                                  widget: SingleProduct(
                                    id: product[index].id,
                                  )),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: defaultListView(
                                    // fun: (){ print(categories.data.data[index].id,);
                                    //   return navigaTo(context: context, widget:SingleProduct(id: categories.data.data[index].id,));
                                    // },
                                    idfavColor: appCubit(context)
                                        .dataOfProduct[index]
                                        .id,
                                    idCartColor: appCubit(context)
                                        .dataOfProduct[index]
                                        .id,
                                    favId: appCubit(context)
                                        .dataOfProduct[index]
                                        .id,
                                    cartId: appCubit(context)
                                        .dataOfProduct[index]
                                        .id,
                                    image: appCubit(context)
                                        .dataOfProduct[index]
                                        .image!,
                                    name: appCubit(context)
                                        .dataOfProduct[index]
                                        .name!,
                                    price: appCubit(context)
                                        .dataOfProduct[index]
                                        .price,
                                    discount: appCubit(context)
                                        .dataOfProduct[index]
                                        .discount,
                                    oldPrice: appCubit(context)
                                        .dataOfProduct[index]
                                        .oldPrice,
                                    context: context,
                                    // cartItems:
                                    // appCubit(context).cartProduct[index],
                                    isFavoriteScreen: true),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => Divider(
                            indent: 15,
                            endIndent: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}
