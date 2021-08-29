import 'package:e_commerce/modules/order/order_details_screen.dart';
import 'package:e_commerce/shared/components/constance/constants.dart';
import 'package:e_commerce/shared/components/default_navigator/navigat.dart';
import 'package:e_commerce/shared/cubit/order/order_cubit.dart';
import 'package:e_commerce/shared/cubit/order/order_state.dart';
import 'package:e_commerce/shared/di/dependency_injaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:loading_animations/loading_animations.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<OrderCubit>()..getOrder(),
      child: BlocConsumer<OrderCubit, OrderState>(
        listener: (context, state) {},
        builder: (context, state) {
          // orderCubit(context).getOrder();
          return Directionality(
            textDirection: appCubit(context).textDirection,
            child: RefreshIndicator(
              onRefresh: () => orderCubit(context).loadingOrders(),
              child: Scaffold(
                  appBar: AppBar(
                    title: Text('${transModel(context).order}',
                        style: Theme.of(context).textTheme.headline6),
                  ),
                  body: Conditional.single(
                      context: context,
                      conditionBuilder: (context) =>
                          orderCubit(context).ordersModel != null,
                      fallbackBuilder: (context) => Container(
                            // color: Colors.white,
                        alignment: Alignment.center,
                            child: LoadingBouncingLine.square(
                              backgroundColor: Colors.indigo,
                            ),
                          ),
                      widgetBuilder: (context) => ListView.separated(
                          itemBuilder: (context, i) {
                            return GestureDetector(
                              onTap: () {
                                print(orderCubit(context)
                                    .ordersModel!
                                    .data!
                                    .data![i]
                                    .status
                                    .toString());
                                return navigaTo(
                                    context: context,
                                    widget: OrderDetailsScreen(
                                      id: orderCubit(context)
                                          .ordersModel!
                                          .data!
                                          .data![i]
                                          .id!,
                                    ));
                              },
                              child: Padding(
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '${transModel(context).status} ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                        Text(
                                          ' ${orderCubit(context).ordersModel!.data!.data![i].status}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '${transModel(context).date} ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                        Text(
                                          '${orderCubit(context).ordersModel!.data!.data![i].date}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '${transModel(context).total1}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                        Text(
                                          ' ${orderCubit(context).ordersModel!.data!.data![i].total}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, i) => Divider(),
                          itemCount: orderCubit(context)
                              .ordersModel!
                              .data!
                              .data!
                              .length))),
            ),
          );
        },
      ),
    );
  }
}
