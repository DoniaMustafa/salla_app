// import 'package:conditional_builder/conditional_builder.dart';
import 'package:e_commerce/model/catgory_pro.dart';
import 'package:e_commerce/modules/single_prod/single_product__screen.dart';
import 'package:e_commerce/shared/components/constance/constants.dart';
import 'package:e_commerce/shared/components/default_navigator/navigat.dart';
import 'package:e_commerce/shared/components/default_text_and_list/def_listviwe.dart';
import 'package:e_commerce/shared/cubit/cubit_home_product/cubit_pro.dart';
import 'package:e_commerce/shared/cubit/cubit_home_product/state_pro.dart';
import 'package:e_commerce/shared/di/dependency_injaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:loading_animations/loading_animations.dart';

class SingleCategory extends StatelessWidget {
  final int id;
  final String name;
  SingleCategory({required this.id, required this.name});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          di<ProductCubit>()..getSingleCategory(id: id, context: context),
      child: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {
          // if (state is SingleCategoryProductErrorStates)
          //   showToast(text: state.error, tColor: ToastColors.ERROR);
        },
        builder: (context, state) {
          // CategoriesProductModel categories =
          //     productCubit(context).categoryProduct!;
          // List<DataSingleCategory> singleCategoryData= productCubit(context).categoryProduct.data.data;
          return RefreshIndicator(
              onRefresh: () =>
                  productCubit(context).loadSingleCategory(id, context),
              child: Directionality(
                textDirection: appCubit(context).textDirection,
                child: Scaffold(
                  appBar: AppBar(
                      title: Text(
                    '$name',
                    style: Theme.of(context).textTheme.headline6,
                  )),
                  body: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Conditional.single(
                        context: context,
                        conditionBuilder: (context) =>
                            productCubit(context).categoryProduct != null,
                        widgetBuilder: (context) => Container(
                              child: productCubit(context)
                                      .categoryProduct!
                                      .data!
                                      .data!
                                      .isEmpty
                                  ? Center(
                                      child: Text(
                                        '${transModel(context).pageEmpty}',
                                        style:
                                            Theme.of(context).textTheme.subtitle1,
                                      ),
                                    )
                                  : ListView.separated(
                                      itemCount: productCubit(context)
                                          .categoryProduct!
                                          .data!
                                          .data!
                                          .length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: defaultListView(
                                              onPress: () {
                                                // print(
                                                //   productCubit(context).categoryProduct!
                                                //       .data!.data![index].id,
                                                // );
                                                navigaTo(
                                                    context: context,
                                                    widget: SingleProduct(
                                                      id: productCubit(context)
                                                          .categoryProduct!
                                                          .data!
                                                          .data![index]
                                                          .id,
                                                    ));
                                              },
                                              idfavColor: productCubit(context)
                                                  .categoryProduct!
                                                  .data!
                                                  .data![index]
                                                  .id,
                                              idCartColor: productCubit(context)
                                                  .categoryProduct!
                                                  .data!
                                                  .data![index]
                                                  .id,
                                              favId: productCubit(context)
                                                  .categoryProduct!
                                                  .data!
                                                  .data![index]
                                                  .id,
                                              cartId: productCubit(context)
                                                  .categoryProduct!
                                                  .data!
                                                  .data![index]
                                                  .id,
                                              image: productCubit(context)
                                                  .categoryProduct!
                                                  .data!
                                                  .data![index]
                                                  .image!,
                                              name: productCubit(context)
                                                  .categoryProduct!
                                                  .data!
                                                  .data![index]
                                                  .name!,
                                              price: productCubit(context)
                                                  .categoryProduct!
                                                  .data!
                                                  .data![index]
                                                  .price,
                                              discount: productCubit(context)
                                                  .categoryProduct!
                                                  .data!
                                                  .data![index]
                                                  .discount,
                                              oldPrice: productCubit(context)
                                                  .categoryProduct!
                                                  .data!
                                                  .data![index]
                                                  .oldPrice,
                                              context: context,
                                              isFavoriteScreen: true),
                                        );
                                      },
                                      separatorBuilder: (context, index) =>
                                          Divider(
                                        indent: 15,
                                        endIndent: 15,
                                      ),
                                    ),
                            ),
                        fallbackBuilder: (context) => Container(
                              alignment: Alignment.center,
                              child: LoadingBouncingLine.square(
                                backgroundColor: Colors.indigo,
                              ),
                            )),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
