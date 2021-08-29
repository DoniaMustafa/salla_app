import 'package:e_commerce/model/order_details_model.dart';
import 'package:e_commerce/shared/components/constance/constants.dart';
import 'package:e_commerce/shared/components/default_button/material_but_widget.dart';
import 'package:e_commerce/shared/cubit/order/order_cubit.dart';
import 'package:e_commerce/shared/cubit/order/order_state.dart';
import 'package:e_commerce/shared/di/dependency_injaction.dart';
import 'package:e_commerce/shared/stayle/stayles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:loading_animations/loading_animations.dart';

class OrderDetailsScreen extends StatelessWidget {
  final int id;
  OrderDetailsScreen({required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<OrderCubit>()..detailsOrder(id),
      child: BlocConsumer<OrderCubit, OrderState>(
        listener: (context, state) {
          if (state is CancelOrderSuccessState) {
           Navigator.pop(context);
          }
        },
        builder: (context, state) {
          // Data data = orderCubit(context).orderDetailsModel.data;
          // orderCubit(context).detailsOrder(id);
          return Directionality(
            textDirection: appCubit(context).textDirection,
            child: Scaffold(
              appBar: AppBar(
                title: Text('Order Details',
                    style: Theme.of(context).textTheme.headline6),
              ),
              body:Conditional.single(
              context: context,
          conditionBuilder: (context) =>
          orderCubit(context).orderDetailsModel != null,
          fallbackBuilder: (context) => Container(
          // color: Colors.white,
            alignment: Alignment.center,
          child: LoadingBouncingLine.square(
          backgroundColor: Colors.indigo,
          ),
          ),
          widgetBuilder: (context) =>Stack(
            children: [
              Column(
                children: [
                  if (state is CancelOrderLoadingState)
                    LinearProgressIndicator(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              // mainAxisSize: MainAxisSize.max,
                              children: [

                                Row(
                                  children: [
                                    Text('تم الطلب في  :  '),
                                    Text('${orderCubit(context).orderDetailsModel!.data.date}'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('الحالة  :  '),
                                    Text('${orderCubit(context).orderDetailsModel!.data.status}'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('عدد المنتجات : '),
                                    Text(' ${orderCubit(context).orderDetailsModel!.data.products.length}'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('المبلغ الكلي : '),
                                    Text(' ${orderCubit(context).orderDetailsModel!.data.total}'),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: double.infinity,
                                  color: Colors.grey,
                                  child: Text('معلومات الدفع'),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('طريقة الدفع'),
                                Text(' ${orderCubit(context).orderDetailsModel!.data.paymentMethod}'),
                                SizedBox(
                                  height: 10,
                                ),
                                Divider(
                                  color: Colors.grey,
                                  indent: 10,
                                  endIndent: 10,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('تفاصيل الدفع'),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(' اجمالي المنتجات : '),
                                    Text(' ${orderCubit(context).orderDetailsModel!.data.cost} جنية'),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text(' قيمة الخصم : '),
                                    Text(' ${orderCubit(context).orderDetailsModel!.data.discount} جنيه '),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text('القيمة المصافة : '),
                                    Text('${orderCubit(context).orderDetailsModel!.data.vat} جنيه'),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text('المبلغ الكلي : '),
                                    Text(' ${orderCubit(context).orderDetailsModel!.data.total} جنية'),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: double.infinity,
                                  color: Colors.grey,
                                  child: Text('معلومات التوصيل'),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('عنوان الشحن'),
                                Text(' ${orderCubit(context).orderDetailsModel!.data.address.name} \n'
                                    ' ${orderCubit(context).orderDetailsModel!.data.address.region} \n'
                                    ' ${orderCubit(context).orderDetailsModel!.data.address.details}  ${orderCubit(context).orderDetailsModel!.data.address.notes} '),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: double.infinity,
                                  color: Colors.grey,
                                  child: Text(
                                      ' المنتجات الموجوده في طلبك '),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                // if (data.status == 'ملغي')
                                //   Container(
                                //     width: 100,
                                //     color: Colors.black38,
                                //     child: Text(
                                //       'اوردر ملغي',
                                //       textAlign: TextAlign.center,
                                //     ),
                                //   ),
                                // SizedBox(
                                //   height: 10,
                                // ),
                                ListView.separated(
                                    shrinkWrap: true,
                                    physics:
                                    NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, i) {
                                      return Row(
                                        // crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      orderCubit(context).orderDetailsModel!.data.products[i]
                                                          .image),
                                                  fit: BoxFit.fill),
                                            ),
                                            width: 100,
                                            height: 100,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Container(
                                                  child: Text(
                                                    '${orderCubit(context).orderDetailsModel!.data.products[i].name}',
                                                    maxLines: 2,
                                                  ),
                                                  // width: ,
                                                ),
                                                Text(
                                                    ' ${transModel(context).quantity} : ${orderCubit(context).orderDetailsModel!.data.products[i].quantity}'),
                                                Row(
                                                  children: [
                                                    Text(
                                                        '${orderCubit(context).orderDetailsModel!.data.products[i].price}'),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      );
                                    },
                                    separatorBuilder: (context, i) =>
                                        Divider(),
                                    itemCount: orderCubit(context).orderDetailsModel!.data.products.length),
                              ],
                            ),
                            // if (state is CancelOrderLoadingState)
                            //   LoadingBouncingLine.square()
                          ],
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(height: 50,),
                  orderCubit(context).orderDetailsModel!.data.status == '${transModel(context).orderState}'
                      ? DefaultButton(
                    width: double.infinity,
                    height: 60,
                    text: '${transModel(context).cancelOrder}',
                    onPress: () {
                      print('ok');
                      return orderCubit(context).cancelshowDialog(
                          context: context,
                          onPress: () => orderCubit(context)
                              .removeOrder(orderCubit(context).orderDetailsModel!.data.id, orderCubit(context).orderDetailsModel!.data.id));
                    },
                    style: white18regular(),
                  )
                      : Container()
                ],
              ),
              // if ( orderCubit(context).show ==true)
              //
            ],
          ))

              ),
            );
        },
      ),
    );
  }
  // Widget dialog(){
  //   return Containet(
  //     h
  //   );
  // }
}
