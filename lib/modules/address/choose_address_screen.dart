// import 'package:conditional_builder/conditional_builder.dart';
import 'package:e_commerce/modules/address/add_address_screen.dart';
import 'package:e_commerce/modules/address/update_address_screen.dart';
import 'package:e_commerce/modules/order/payment_screen.dart';
import 'package:e_commerce/shared/components/constance/constants.dart';
import 'package:e_commerce/shared/components/default_navigator/navigat.dart';
import 'package:e_commerce/shared/cubit/order/order_cubit.dart';
import 'package:e_commerce/shared/cubit/order/order_state.dart';
import 'package:e_commerce/shared/di/dependency_injaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:loading_animations/loading_animations.dart';

class ChooseAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<OrderCubit>()..getNewAddress(),
      child: BlocConsumer<OrderCubit, OrderState>(listener: (context, state) {

      }, builder: (context, state) {
        // AddressModel data = orderCubit(context).addressModel;
        // Data ddata = orderCubit(context).addressModel.data;
        // List<dynamic>datum=ddata?.data;
        return Directionality(
          textDirection: appCubit(context).textDirection,
          child: Scaffold(
            appBar: AppBar(
              title: Text('ChooseAddress',
                  style: Theme.of(context).textTheme.headline6),
            ),
            body: Conditional.single(context: context,
              conditionBuilder: (context)=>orderCubit(context).addressModel != null,
              widgetBuilder: (context)=>Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          if (state is DeleteAddressLoadingState||
          state is GetAddressLoadingState||
          state is AddAddressLoadingState||
          state is UpdateAddressLoadingState
          )
          LinearProgressIndicator(),
          // if (state is AddAddressLoadingState) LinearProgressIndicator(),
          Expanded(
          child: ListView.separated(
          physics: BouncingScrollPhysics(),
          // shrinkWrap: true,
          itemCount: orderCubit(context).addressModel!.data!.data!.length,
          itemBuilder: (context, index) => InkWell(
          focusColor: Colors.blue,
          onTap: (){
          return navigaTo(context: context, widget: PayScreen(id: orderCubit(context).addressModel!.data!.data![index].id,));
          },
          child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
          children: [
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(
          orderCubit(context).addressModel!.data!.data![index].name,
          style:Theme.of(context).textTheme.bodyText2,
          ),
          Text(
          '${ orderCubit(context).addressModel!.data!.data![index].city} , ${ orderCubit(context).addressModel!.data!.data![index].region}',
          style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
          '${ orderCubit(context).addressModel!.data!.data![index].details} ,${ orderCubit(context).addressModel!.data!.data![index].notes} ',
          style: Theme.of(context).textTheme.subtitle1,
          maxLines:null,
          ),
          ],
          ),
          Spacer(
          flex: 1,
          ),
          IconButton(
          onPressed: () =>navigaTo(context: context, widget:UpdateAddress( orderCubit(context).addressModel!.data!.data![index].id) ),
          icon: Icon(Icons.edit, color: Colors.green),
          ),
          IconButton(
          onPressed: () {
          print( orderCubit(context).addressModel!.data!.data![index].id);
          orderCubit(context)
              .deleteNewAddress( orderCubit(context).addressModel!.data!.data![index].id);
          orderCubit(context).addressModel!.data!.data!.removeAt(index);
          },
          icon: Icon(
          Icons.delete,
          color: Colors.red,
          ),
          ),
          ],
          ),
          ),
          ),
          separatorBuilder: (context, index) => Divider(
          thickness: 0.5,
          ),
          ),
          ),

          ],

            ),
            fallbackBuilder: (context)=>Container(
            alignment: Alignment.center ,
            child: LoadingBouncingLine.square(
              backgroundColor: Colors.indigo,
            ),
          ),),


            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => navigaTo(context: context, widget: AddAddress()),
            ),
          ),
        );
      }),
    );
  }
}
