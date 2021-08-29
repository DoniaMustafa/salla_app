import 'package:e_commerce/shared/components/constance/constants.dart';
import 'package:e_commerce/shared/components/default_button/material_but_widget.dart';
import 'package:e_commerce/shared/components/default_text_and_list/text_form.dart';
import 'package:e_commerce/shared/components/generale_components/components.dart';
import 'package:e_commerce/shared/cubit/order/order_cubit.dart';
import 'package:e_commerce/shared/cubit/order/order_state.dart';
import 'package:e_commerce/shared/di/dependency_injaction.dart';
import 'package:e_commerce/shared/stayle/stayles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_animations/loading_animations.dart';

class PayScreen extends StatelessWidget {
  final int id;
  PayScreen({required this.id});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: appCubit(context).textDirection,
      child: Scaffold(
        appBar: AppBar(
          title: Text('payment option',
              style: Theme.of(context).textTheme.headline6),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: BlocProvider(
            create: (context) => di<OrderCubit>(),
            child: BlocConsumer<OrderCubit, OrderState>(
              listener: (context, state) {
                if (state is AddOrderSuccessState) {
                  appCubit(context).productCartNumber = 0;
                  appCubit(context).getHomeData();
                  // appCubit(context).getProductFromCart();

                }

                if (state is PromoCodeErrorState) {
                  return showToast(
                      text: 'Failure Promo Code',
                      tColor: ToastColors.ERROR,
                      gravity: ToastGravity.CENTER);
                }
                if (state is PromoCodeSuccessState) {
                  return showToast(
                      text: 'Success Promo Code',
                      tColor: ToastColors.SUCCESS,
                      gravity: ToastGravity.CENTER);
                }
              },
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, i) {
                            return ListTile(
                              selected: orderCubit(context).selectItem[i],
                              selectedTileColor:
                                  orderCubit(context).selectItem[i] == true
                                      ? Colors.indigo
                                      : Colors.white,
                              onTap: () async {
                                orderCubit(context).selectOnClick(i);
                                print(orderCubit(context).select);
                                return await orderCubit(context).onClick(i + 1);
                              },
                              title: Text(
                                pay[i].title,
                                style: black20regular(),
                              ),
                              subtitle: Text(pay[i].subTitle, style: grey18()),
                              trailing: Icon(Icons.arrow_forward_ios),
                              leading: Icon(pay[i].icon, color: Colors.black54),
                            );
                          },
                          separatorBuilder: (context, i) => Divider(),
                          itemCount: pay.length),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Expanded(
                      child: defTextForm(
                          change: () {},
                          isEnableLine: true,
                          isFocusLine: true,
                          isContainer: true,
                          isIcon: false,
                          width: 350,
                          height: 60,
                          mx: 1,
                          heightCon: 60,
                          widthCon: 90,
                          txt: 'apply',
                          onPress: () => orderCubit(context)
                              .promoCode(code: orderCubit(context).code.text),
                          er: 0.0,
                          fr: 0.0,
                          validate: 'validate',
                          hint: 'Enter Your Code',
                          control: orderCubit(context).code),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    if (state is PromoCodeLoadingState)
                      LoadingBouncingLine.square(),
                    Spacer(
                      flex: 1,
                    ),
                    DefaultButton(
                      text: 'send',
                      height: 60,
                      width: double.infinity,
                      onPress: () {
                        // print(
                        // 'select : ${orderCubit(context).select} - order :  ${orderCubit(context).promoCodeModel!.data!.id} $id');
                        orderCubit(context).addOrder(
                            paymentMethod: orderCubit(context).select,
                            promoCodeId: orderCubit(context).promoCodeModel ==
                                    null
                                ? 0
                                : orderCubit(context).promoCodeModel!.data!.id!,
                            addressId: id,
                            context: context);
                      },
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
