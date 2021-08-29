import 'package:e_commerce/shared/components/constance/constants.dart';
import 'package:e_commerce/shared/components/default_text_and_list/def_listviwe.dart';
import 'package:e_commerce/shared/components/default_text_and_list/text_form.dart';
import 'package:e_commerce/shared/cubit/cubit_app/cubit.dart';
import 'package:e_commerce/shared/cubit/cubit_home_product/cubit_pro.dart';
import 'package:e_commerce/shared/cubit/cubit_home_product/state_pro.dart';
import 'package:e_commerce/shared/di/dependency_injaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:loading_animations/loading_animations.dart';

class Search extends StatelessWidget {
  final String text;
  Search({required this.text});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => productCubit(context)
        ..searchOfProduct(text: text.toString(), context: context),
      child: BlocConsumer<ProductCubit, ProductState>(
          builder: (context, state) {
            var productSearch = productCubit(context).productSearch;
            // List<SearchProduct> d = ProductCubit.get(context).productSearch.data.data;
            var cubit = AppCubit.get(context);
            return Directionality(
                textDirection: cubit.textDirection,
                child: Scaffold(
                    appBar: AppBar(
                      title: Text(
                        '${transModel(context).search}',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    body: Padding(
                      padding: EdgeInsets.all(20),
                      child: Conditional.single(
                        context: context,
                        conditionBuilder: (context) => productSearch != null,
                        fallbackBuilder: (context) => Container(
                          alignment: Alignment.center,
                          child: LoadingBouncingLine.square(
                            backgroundColor: Colors.indigo,
                          ),
                        ),
                        widgetBuilder: (context) => Column(
                          children: [
                            textSearch(context: context),
                            SizedBox(
                              height: 20,
                            ),
                            Expanded(
                              child: ListView.separated(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: ProductCubit.get(context)
                                    .productSearch!
                                    .data!
                                    .data!
                                    .length,
                                separatorBuilder: (context, index) => Divider(),
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: defaultListView(
                                    image: ProductCubit.get(context)
                                        .productSearch!
                                        .data!
                                        .data![index]
                                        .image!,
                                    name: ProductCubit.get(context)
                                        .productSearch!
                                        .data!
                                        .data![index]
                                        .name!,
                                    price: ProductCubit.get(context)
                                        .productSearch!
                                        .data!
                                        .data![index]
                                        .price,
                                    discount: 0,
                                    isFavoriteScreen: true,
                                    idCartColor: ProductCubit.get(context)
                                        .productSearch!
                                        .data!
                                        .data![index]
                                        .id,
                                    idfavColor:
                                        productSearch!.data!.data![index].id,
                                    favId: productSearch.data!.data![index].id,
                                    cartId: productSearch.data!.data![index].id,
                                    context: context,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )));
          },
          listener: (context, state) {}),
    );
  }
  // Widget textSearch({context}) {
  //   var cubit = ProductCubit.get(context);
  //
  //   return Padding(
  //     padding: EdgeInsets.all(5.0),
  //     child: defTextForm(
  //         isFocusLine: true,
  //         isEnableLine: true,
  //         hint: transModel(context).search,
  //         type: TextInputType.text,
  //         control: cubit.controller1,
  //         validate: 'Enter What you want',
  //         height: 60.0,
  //         isIcon: true,
  //         mx: 1,
  //         suffix: Icons.search,
  //         suffixSize: 35.0,
  //         focus: false,
  //         fun: () {
  //           return productCubit(context).searchOfProduct(text: text.toString(),context: context);
  //         }),
  //   );
  // }

  Widget textSearch({context}) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: defTextForm(
          isFocusLine: true,
          isEnableLine: true,
          // hint: transModel(context).search,
          type: TextInputType.text,
          control: productCubit(context).controller,
          validate: 'Enter What you want',
          isIcon: true,
          mx: 1,
          // isContainer: true,
          // suffix: Icons.search,
          // suffixSize: 35.0,
          focus: false,
          change: (i) => productCubit(context).searchOfProduct(
              text: productCubit(context).controller.text, context: context),
          i: productCubit(context).controller.text),
    );
  }
}
