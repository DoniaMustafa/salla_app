import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:e_commerce/model/single_product_model.dart';
import 'package:e_commerce/shared/components/constance/constants.dart';
import 'package:e_commerce/shared/components/default_button/circal_but_widget.dart';
import 'package:e_commerce/shared/components/default_button/material_button.dart';
import 'package:e_commerce/shared/cubit/cubit_app/cubit.dart';
import 'package:e_commerce/shared/cubit/cubit_app/statet.dart';
import 'package:e_commerce/shared/cubit/cubit_home_product/cubit_pro.dart';
import 'package:e_commerce/shared/cubit/cubit_home_product/state_pro.dart';
import 'package:e_commerce/shared/di/dependency_injaction.dart';
import 'package:e_commerce/shared/stayle/default_color.dart';
import 'package:e_commerce/shared/stayle/stayles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:loading_animations/loading_animations.dart';

class SingleProduct extends StatelessWidget {
  final int? id;
  SingleProduct({this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<ProductCubit>()..singleProd(id: id!),
      child: BlocConsumer<ProductCubit, ProductState>(
          builder: (context, state) {
            // SingleProductModel singleProductData =
            //     productCubit(context).singleProduct!;

            return Directionality(
              textDirection: AppCubit.get(context).textDirection,
              child: Scaffold(
                  body: RefreshIndicator(
                onRefresh: () =>
                    productCubit(context).loadSingleProd(id!, context),
                child: Conditional.single(
                  context: context,
                  conditionBuilder: (BuildContext context) =>
                      productCubit(context).singleProduct != null,
                  fallbackBuilder: (BuildContext context) => Container(
                    alignment: Alignment.center,
                    child: LoadingBouncingLine.square(
                      backgroundColor: Colors.indigo,
                    ),
                  ),
                  widgetBuilder: (BuildContext context) => Column(
                      // mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        imageSlider(
                             productCubit(context).singleProduct!),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: ListView(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: AutoSizeText(
                                  productCubit(context)
                                      .singleProduct!
                                      .data
                                      .name!,
                                  style: Theme.of(context).textTheme.bodyText2,
                                  maxLines: null,

                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Row(
                                  children: [
                                    AutoSizeText(
                                      '${productCubit(context).singleProduct!.data.price}  EG',
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                    Spacer(
                                      flex: 1,
                                    ),
                                    BlocConsumer<AppCubit, AppState>(
                                        builder: (context, state) {
                                          return Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Row(
                                              children: [
                                                DefaultCircleButton(
                                                    fun: () {
                                                      return appCubit(context)
                                                          .changeInFavorite(
                                                        id: productCubit(
                                                                context)
                                                            .singleProduct!
                                                            .data
                                                            .id!,
                                                      );
                                                    },
                                                    isIcon: true,
                                                    icon: Icons
                                                        .favorite_border_rounded,
                                                    size: 20.0,
                                                    r: 20.0,
                                                    color: appCubit(context)
                                                                .favorite[
                                                            productCubit(
                                                                    context)
                                                                .singleProduct!
                                                                .data
                                                                .id]!
                                                        ? Colors.green
                                                        : indigo(),
                                                    ws: 40,
                                                    hs: 40),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                DefaultCircleButton(
                                                    fun: () => appCubit(context)
                                                        .changeInCart(
                                                            id: productCubit(
                                                                    context)
                                                                .singleProduct!
                                                                .data
                                                                .id!),
                                                    icon: Icons
                                                        .shopping_cart_outlined,
                                                    size: 20.0,
                                                    r: 20.0,
                                                    isIcon: true,
                                                    color: appCubit(context)
                                                            .carts[productCubit(
                                                                context)
                                                            .singleProduct!
                                                            .data
                                                            .id]!
                                                        ? Colors.green
                                                        : Colors.indigo,
                                                    ws: 40,
                                                    hs: 40),
                                              ],
                                            ),
                                          );
                                        },
                                        listener: (context, state) {}),
                                  ],
                                ),
                              ),
                              if (productCubit(context)
                                      .singleProduct!
                                      .data
                                      .discount! > 0)
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Row(
                                    children: [
                                      AutoSizeText(
                                        '${productCubit(context).singleProduct!.data.oldPrice} ',
                                        overflow: TextOverflow.ellipsis,
                                        // textAlign: TextAlign.start,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .copyWith(
                                                decoration:
                                                    TextDecoration.lineThrough),
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
                                      AutoSizeText(
                                        '${productCubit(context).singleProduct!.data.discount}%',
                                        style: black14bold().copyWith(
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              SizedBox(
                                height: 15,
                              ),
                              description(context,
                                  productCubit(context).singleProduct!.data),
                            ],
                          ),
                        )
                      ]),
                ),
              )),
            );
          },
          listener: (context, state) {}),
    );
  }

  Widget imageSlider(SingleProductModel cubit) => Container(
    height: 250,
    width: double.infinity,
    child: CarouselSlider.builder(
        autoSliderTransitionCurve: Curves.easeInOut ,
        unlimitedMode: true,
        slideBuilder: (index) {
          return Image.network(
              cubit.data.images![index],
            width: double.infinity,
            fit: BoxFit.fill ,
          );
          },
        slideTransform: CubeTransform(),
        slideIndicator: CircularSlideIndicator(
          padding: EdgeInsets.only(bottom: 32),
        ),
        itemCount: cubit.data.images!.length
    ),
  );

      // Carousel(
      //   images: List.generate(
      //       ProductCubit.get(context).singleProduct!.data!.images!.length,
      //       (c) => Container(
      //             child: Image.network(
      //               cubit.data!.images![c],
      //               fit: BoxFit.fill,
      //             ),
      //           )),
      //   dotSize: 5.0,
      //   dotSpacing: 15.0,
      //   // dotColor: Colors.lightGreenAccent,
      //   indicatorBgPadding: 5.0,
      //   autoplay: false,
      //   dotBgColor: Colors.indigo,
      //   // dotIncreasedColor: Colors.indigo,
      //
      //   // dotBgColor: Colors.purple.withOpacity(0.5),
      //   // borderRadius: true,
      // );

  Widget addCartBoard() => radiusButton(
        // ws: 50.0,
        hs: 40.0,
        r: 15.0,
        txet1: 'Add To Cart',
        txet2: '55',
        icon1: Icons.add,
        icon2: Icons.remove,
        r1: 50.0,
        r2: 50.0,
        hRadius1: 30.0,
        wRadius1: 30.0,
        hRadius2: 30.0,
        wRadius2: 30.0,
        backColor1: Colors.grey,
      );

  Widget description(context, Data data) => Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(left: 10.0, top: 6.0, right: 10.0),
        // height: MediaQuery.of(context).size.height/1.9,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 10,
            offset: Offset(0, 3),
          )
        ]),
        child: AutoSizeText(
          '${data.description}',
          style: Theme.of(context).textTheme.subtitle1,
          maxLines: null,
        ),
      );
}
