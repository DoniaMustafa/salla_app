import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/layout/home_layout.dart';
import 'package:e_commerce/model/category_model.dart';
import 'package:e_commerce/model/home_model.dart';
import 'package:e_commerce/modules/category/single_category_screen.dart';
import 'package:e_commerce/modules/offer/best_offer_screen.dart';
import 'package:e_commerce/modules/search/search_screen.dart';
import 'package:e_commerce/modules/single_prod/single_product__screen.dart';
import 'package:e_commerce/shared/components/constance/constants.dart';
import 'package:e_commerce/shared/components/default_button/circal_but_widget.dart';
import 'package:e_commerce/shared/components/default_button/material_button.dart';
import 'package:e_commerce/shared/components/default_navigator/navigat.dart';
import 'package:e_commerce/shared/components/default_text_and_list/text_form.dart';
import 'package:e_commerce/shared/components/widget/extension_widget.dart';
import 'package:e_commerce/shared/cubit/cubit_app/cubit.dart';
import 'package:e_commerce/shared/cubit/cubit_app/statet.dart';
import 'package:e_commerce/shared/cubit/cubit_home_product/cubit_pro.dart';
import 'package:e_commerce/shared/cubit/cubit_home_product/state_pro.dart';
import 'package:e_commerce/shared/stayle/default_color.dart';
import 'package:e_commerce/shared/stayle/stayles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => appCubit(context).loadList(),
      child: BlocConsumer<AppCubit, AppState>(listener: (context, state) {
        if (state is SingleProductSuccessStates)
          navigaTo(context: context, widget: SingleProduct());
      }, builder: (context, state) {
        // List<Product?>? product = appCubit(context).dataOfProduct;
        return Directionality(
          textDirection: appCubit(context).textDirection,
          child: Scaffold(
            body: Conditional.single(
              context: context,
              conditionBuilder: (BuildContext context) =>
                  appCubit(context).homeModel != null &&
                  appCubit(context).categoryModel != null &&
                  appCubit(context).productData != null &&
                  appCubit(context).dataOfProduct != null,
              fallbackBuilder: (context) => Container(
                alignment: Alignment.center,
                child: LoadingBouncingLine.square(
                  backgroundColor: Colors.indigo,
                ),
              ),
              widgetBuilder: (BuildContext context) {
                // List<DataOfCategory?>? categoryCubit = appCubit(context).category;

                return Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 5.0),
                      alignment: Alignment.center,
                      constraints: BoxConstraints(maxHeight: 75.0),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical:5.0),
                      child: textSearch(context: context),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ConstrainedBox(
                          constraints: BoxConstraints(
                              maxHeight: MediaQuery.of(context).size.height),
                          child: SingleChildScrollView(
                            child: Column(
                              // shrinkWrap: true,
                              // mainAxisSize: MainAxisSize.max,
                              // direction: Axis.vertical,
                              // crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                slider(appCubit(context).homeModel!.data!),
                                SizedBox(
                                  height: 10,
                                ),
                                ExtensionWidget(
                                  onTap: () {
                                    AppCubit.get(context)
                                        .onClickCurrentIndex(1);
                                    navigateAndFinish(
                                        context: context, widget: Layout());
                                  },
                                  titleText: transModel(context).categories!,
                                  subtitle: transModel(context).see,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  constraints: BoxConstraints(maxHeight: 150),
                                  child: ListView.builder(
                                    physics: BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 5,
                                    // ProductCubit.get(context).category.length,
                                    itemBuilder: (context, int index) =>
                                        Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: category(
                                          context: context,
                                          category: appCubit(context)
                                              .categoryModel!
                                              .data!
                                              .data![index]),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  child: Divider(
                                    endIndent: 15,
                                    indent: 15,
                                    thickness: 2,
                                    color: indigo(),
                                  ),
                                ),
                                ExtensionWidget(
                                  onTap: () {
                                    navigaTo(
                                        context: context, widget: BestOffer());
                                  },
                                  titleText: transModel(context).disRecommend!,
                                  subtitle: transModel(context).seeMore,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  constraints: BoxConstraints(maxHeight: 220),
                                  child: GridView.count(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      physics: BouncingScrollPhysics(),
                                      childAspectRatio: 1.4 / 1.2,
                                      crossAxisCount: 1,
                                      children: List.generate(
                                          10,
                                          (index) => Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 5),
                                                child: gradViewItem(
                                                    context: context,
                                                    product: appCubit(context)
                                                        .dataOfProduct[index],
                                                    i: index),
                                              ))),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                ExtensionWidget(
                                  onTap: () {
                                    AppCubit.get(context)
                                        .onClickCurrentIndex(1);
                                    navigateAndFinish(
                                        context: context, widget: Layout());
                                  },
                                  titleText: transModel(context).arrival!,
                                  isShow: false,
                                ),
                                Container(
                                    constraints: BoxConstraints(),
                                    child: GridView.count(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        childAspectRatio: 0.9 / 1.2,
                                        crossAxisCount: 2,
                                        children: List.generate(
                                            appCubit(context)
                                                .productData!
                                                .products!
                                                .length,
                                            (index) => Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 10),
                                                  child: gradViewItem(
                                                      context: context,
                                                      product: appCubit(context)
                                                          .productData!
                                                          .products![index],
                                                      i: index),
                                                ))))
                              ],
                            ),
                          )),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      }),
    );
  }

  Widget textSearch({context}) {
    var cubit = ProductCubit.get(context);

    return Form(
      key: cubit.searchKay,
      child: defTextForm(
          isFocusLine: true,
          isEnableLine: true,
          hint: transModel(context).search,
          type: TextInputType.text,
          control: cubit.controller,
          validate: 'Enter What you want',
          isIcon: true,
          mx: 1,
          isContainer: true,
          suffix: Icons.search,
          suffixSize: 35.0,
          focus: false,
          onPress: () {
           if( cubit.searchKay.currentState!.validate()){
             return navigaTo(
                 context: context,
                 widget: Search(
                   text: cubit.controller.text,
                 ));
           }

          }),
    );
  }

  Widget category({DataOfCategory? category, required BuildContext context}) =>
      InkWell(
        onTap: () {
          print(category!.id);
          // ProductCubit.get(context).getSingleCategory(id:category[index].id );
          return navigaTo(
              context: context,
              widget: SingleCategory(
                id: category.id!,
                name: category.name!,
              ));
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            defaultImage(
                height: 180,
                r: 10.0,
                image: category!.image!,
                fit: BoxFit.fill,
                width: 150,
                color: Colors.white),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
              ),
              constraints: BoxConstraints(
                maxHeight: 40,
                maxWidth: 150,
              ),
              child: Text(
                category.name!,
                maxLines: 1,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ],
        ),
      );

  Widget slider(ProductData modelData) => CarouselSlider(
      options: CarouselOptions(
        height: 180,
        aspectRatio: 12 / 9,
        viewportFraction: 0.8,
        // initialPage: 0,
        enableInfiniteScroll: true,
        // reverse: false,

        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.easeInOut,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
      items: modelData.banners!
          .map((e) => Image(
                image: NetworkImage('${e.image}'),
                fit: BoxFit.fill,
                width: double.infinity,
              ))
          .toList());

  Widget gradViewItem(
      {required Product product,
      required BuildContext context,
      required int i,
      bool arrival = false}) {
    return GestureDetector(
      onTap: () {
        navigaTo(
            context: context,
            widget: SingleProduct(
              id: product.id,
            ));
      },
      child: Container(
        constraints: BoxConstraints(),
        decoration: BoxDecoration(
            color: Colors.grey[150],
            border: Border.all(color: Colors.grey, width: 0.2)),
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          // crossAxisAlignment:CrossAxisAlignment.stretch ,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    child: defaultImage(
                        height: 180,
                        r: 0.0,
                        image: product.image!,
                        fit: BoxFit.fill,
                        width: double.infinity,
                        color: Colors.white),
                    // Container(
                    //   constraints: ,
                    //   // height: MediaQuery.of(context).size.height * 0.14,
                    //   decoration: BoxDecoration(
                    //       image: DecorationImage(
                    //           image: NetworkImage('${product.image}'),
                    //           fit: BoxFit.fill)),
                    // ),
                  ),
                  if (product.discount != 0)
                    Positioned(
                      top: 0.0,
                      right: 0.0,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        width: 25,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.red,
                        ),
                        child: Text('${transModel(context).sale}',
                            textAlign: TextAlign.center,
                            style: appLangDirection == 'ar'
                                ? white12regular()
                                : white14regular()),
                      ),
                    ),
                ],
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: isDark ? 122 : 130),
              child: BlocConsumer<AppCubit, AppState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisSize:MainAxisSize.max ,
                    children: [
                      Padding(
                          padding: EdgeInsets.all(10.0),
                          child: MediaQuery(
                              data: MediaQueryData(
                                textScaleFactor: 1.0,
                              ),
                              child: AutoSizeText.rich(
                                TextSpan(text: product.name),
                                style: TextStyle(fontSize: 20),
                                maxLines: 1,
                                minFontSize: 20,
                                overflow: TextOverflow.ellipsis,
                              ))),
                      Padding(
                        padding: appLangDirection == 'ar'
                            ? EdgeInsets.only(
                                left: 10.0,
                                right: 5,
                              )
                            : EdgeInsets.only(right: 10.0, left: 10),
                        child: Row(
                          children: [
                            MediaQuery(
                              data: MediaQueryData(textScaleFactor: 1.0),
                              child: AutoSizeText(
                                '${product.price} ${transModel(context).currency}',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            ),
                            Spacer(
                              flex: 1,
                            ),
                            DefaultCircleButton(
                                fun: () => appCubit(context)
                                    .changeInCart(id: product.id!),
                                icon: Icons.shopping_cart_outlined,
                                size: 15.0,
                                r: 15.0,
                                isIcon: true,
                                color: appCubit(context).carts[product.id]!
                                    ? Colors.green
                                    : indigo(),
                                ws: 25,
                                hs: 25),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: appLangDirection == 'ar'
                            ? EdgeInsets.only(
                                left: 10.0,
                                right: 10,
                              )
                            : EdgeInsets.only(
                                right: 10.0,
                                left: 10,
                              ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (product.discount! > 0)
                              MediaQuery(
                                data: MediaQueryData(textScaleFactor: 1.0),
                                child: AutoSizeText(
                                  '${product.oldPrice}',
                                  // textAlign: TextAlign.end,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(
                                          decoration:
                                              TextDecoration.lineThrough),
                                ),
                              ),
                            Spacer(
                              flex: 1,
                            ),
                            DefaultCircleButton(
                              fun: () => appCubit(context).changeInFavorite(
                                id: product.id!,
                              ),
                              isIcon: true,
                              icon: Icons.favorite_border_rounded,
                              size: 15.0,
                              r: 15.0,
                              color: appCubit(context).favorite[product.id]!
                                  ? Colors.green
                                  : indigo(),
                              ws: 25,
                              hs: 25,
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                },
                listener: (context, state) {
                  // if (state
                  //         is AddAndDeleteProductForCartSuccessStates &&
                  //     appCubit(context).addOrRemoveCart!.message ==
                  //         'تم الحذف بنجاح') {
                  //   return showToast(
                  //       gravity: ToastGravity.CENTER,
                  //       text: 'Remove From To Car',
                  //       tColor: ToastColors.ERROR);
                  // }
                  // if (appCubit(context).addOrRemoveCart!.message ==
                  //     'تمت الإضافة بنجاح') {
                  //   return showToast(
                  //       gravity: ToastGravity.CENTER,
                  //       text: ' Add To Car ',
                  //       tColor: ToastColors.SUCCESS);
                  // }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
