// import 'package:conditional_builder/conditional_builder.dart';
import 'package:e_commerce/model/cart_model.dart';
import 'package:e_commerce/modules/address/choose_address_screen.dart';
import 'package:e_commerce/modules/single_prod/single_product__screen.dart';
import 'package:e_commerce/shared/components/constance/constants.dart';
import 'package:e_commerce/shared/components/default_button/circal_but_widget.dart';
import 'package:e_commerce/shared/components/default_navigator/navigat.dart';
import 'package:e_commerce/shared/components/default_text_and_list/def_listviwe.dart';
import 'package:e_commerce/shared/cubit/cubit_app/cubit.dart';
import 'package:e_commerce/shared/cubit/cubit_app/statet.dart';
import 'package:e_commerce/shared/stayle/default_color.dart';
import 'package:e_commerce/shared/stayle/stayles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:loading_animations/loading_animations.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: appCubit(context).textDirection,
      child: Scaffold(
          appBar: AppBar(
            title: Text(transModel(context).cart!,
                style: Theme.of(context).textTheme.headline6),
          ),
          body: RefreshIndicator(
            onRefresh:  ()=>appCubit(context).loadCart(),
            child: BlocConsumer<AppCubit, AppState>(
              listener: (context, state) {

              },
              builder: (context, state) {
                List<CartItem>? cartItems = appCubit(context).cart!.data.cartItems!;

                return Conditional.single(context: context,
                    conditionBuilder: (context)=>appCubit(context).cart !=null ,
                    widgetBuilder: (context)=> Conditional.single(context: context, conditionBuilder: (context)=>cartItems.isEmpty ,
                      widgetBuilder: (context)=> Container(
                        alignment: Alignment.center,
                        child: Text('The Cart Field is Empty',
                          style: Theme.of(context).textTheme.subtitle1,),
                      ),
                      fallbackBuilder: (context)=>   Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            if (state is RemoveSingleProCartLoadingStates||state is UpDateCartLoadingState || state is GetProductFromCartLoadingStates)
                              LinearProgressIndicator(
                                backgroundColor: indigo(),
                              ),
                            Expanded(
                              child: ListView.separated(
                                itemCount:
                                cartItems.length,
                                itemBuilder: (context, index) => Padding(
                                  padding:  EdgeInsets.all(10.0),
                                  child: defaultListView(
                                      onPress:()=> navigaTo(
                                          context: context,
                                          widget: SingleProduct(
                                            id: productCubit(context)
                                                .categoryProduct!
                                                .data!
                                                .data![index]
                                                .id,
                                          )) ,
                                      image: cartItems[index]
                                          .product!
                                          .image!,
                                      discount: cartItems[index]
                                          .product!
                                          .discount!,
                                      oldPrice: cartItems[index]
                                          .product!
                                          .oldPrice!
                                          .toDouble(),
                                      name: cartItems[index]
                                          .product!
                                          .name!,
                                      price: cartItems[index]
                                          .product!
                                          .price!
                                          .toDouble(),
                                      context: context,
                                      number: cartItems[index]
                                          .quantity,
                                      cartItems: appCubit(context).cart!.data.cartItems![index],
                                      isCartScreen: true,
                                      removeFun: ()=>appCubit(context).removeSingleProCart(id: appCubit(context).cart!.data.cartItems![index].id!,
                                          idLocalCart: appCubit(context).cart!.data.cartItems![index].product!.id!)
                                  ),
                                ),
                                separatorBuilder: (context, index) => Divider(),
                              ),
                            ),


                            Container(
                              height: 50,
                              // margin: EdgeInsets.symmetric(horizontal: 10),
                              alignment: Alignment.center,
                              // padding:  EdgeInsets.all(10.0),
                              child: Text('${transModel(context).total} ${appCubit(context).cart!.data.total}',
                                  style: black22bold()),
                              color:  Colors.grey[300],
                            ),

                            DefaultCircleButton(
                                fun: ()=>navigaTo(context: context, widget: ChooseAddress ()),
                                isIcon: false,
                                r: 0.0,
                                style: white20bold(),
                                ws: double.infinity,
                                hs: 50,
                                color: Colors.indigo,
                                text: '${transModel(context).proceed}')
                          ],
                        ),
                      )


                       ),
                  fallbackBuilder:(context)=> Container(
                    alignment: Alignment.center ,
                    child: LoadingBouncingLine.square(
                      backgroundColor: Colors.indigo,
                    ),
                  )
                );
              },
            ),
          )),
    );
  }
}
