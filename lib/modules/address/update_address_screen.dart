import 'package:csc_picker/csc_picker.dart';
import 'package:e_commerce/shared/components/constance/constants.dart';
import 'package:e_commerce/shared/components/default_button/circal_but_widget.dart';
import 'package:e_commerce/shared/components/default_text_and_list/text_form.dart';
import 'package:e_commerce/shared/cubit/order/order_cubit.dart';
import 'package:e_commerce/shared/cubit/order/order_state.dart';
import 'package:e_commerce/shared/di/dependency_injaction.dart';
import 'package:e_commerce/shared/stayle/default_color.dart';
import 'package:e_commerce/shared/stayle/stayles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateAddress extends StatelessWidget {
  final dynamic id;
  UpdateAddress(this.id);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => di<OrderCubit>(),
        child: BlocConsumer<OrderCubit, OrderState>(
            listener: (context, state) {
              if(state is UpdateAddressSuccessState){
                print('fvf');
                return Navigator.pop(context);
              }
            },
            builder: (context, state) {
              return Directionality(
                textDirection: appCubit(context).textDirection,
                child: Scaffold(
                  appBar: AppBar(title: Text('Update Address',
                      style: Theme.of(context).textTheme.headline6),),
                  body: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 40,horizontal: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CSCPicker(
                              onStateChanged: (val) =>
                                  orderCubit(context).updateOfStateCity(val),
                              onCityChanged: (val) =>
                                  orderCubit(context).updateOfCity(val),
                              onCountryChanged: (val) =>
                                  orderCubit(context).updateOfCountry(val),
                              layout: Layout.vertical,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Form(
                              key: orderCubit(context).updateAddressKay,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  defTextForm(
                                    focus: orderCubit(context).focus,
                                    height: 60,
                                    er: 5.0,
                                    fr: 5.0,
                                    validate: 'null',
                                    text: 'Street',
                                    control: orderCubit(context).updateDetailsControl,
                                    mx: 1,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  defTextForm(
                                    mx: 1,
                                    focus: false,
                                    height: 60,
                                    validate: '',
                                    text: 'Nearest LandMark',
                                    er: 5.0,
                                    fr: 5.0,
                                    control: orderCubit(context).updateSpecialMarkControl,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),
                            ),
                            DropdownButtonHideUnderline(
                                child: Container(
                                    height: 50,
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5.0),
                                        border: Border.all(
                                            color: Colors.grey,
                                            width: 0.0,
                                            style: BorderStyle.solid)),
                                    child: DropdownButton(
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_outlined,
                                          color: Colors.black38,
                                        ),
                                        style: black18regular(),
                                                hint: Text('upDate',
                                                    style: grey16(),
                                                maxLines: 1,),
                                        value:  orderCubit(context).updateLocationValue,
                                        onChanged:(val)=> orderCubit(context).updateLocation(val),
                                        items: orderCubit(context)
                                            .itemLocation
                                            .map(
                                                ( item) {
                                              return DropdownMenuItem<String>(
                                                value: item.toString(),
                                                child: Text('$item'),
                                              );
                                            }).toList()))),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Text('lat'),
                                SizedBox(width: 10,),
                                Container(width: 100,
                                    height:50,child: defTextForm(validate: 'validate', control: orderCubit(context).latitudeDataController,mx: 1)),
                                SizedBox(width: 20,),
                                Text('long'),
                                SizedBox(width: 10,),
                                Container(width: 100, height:50,child: defTextForm(validate: 'validate', control: orderCubit(context).longitudeDataController,mx: 1)),
                                Spacer(flex: 1,),
                                DefaultCircleButton(fun:  () => orderCubit(context).getGeolocator(), hs: 40.0,
                                  ws: 40.0,r: 20.0,
                                  isIcon: true,
                                  color: indigo(),
                                  icon: Icons.location_pin,
                                  iconColor: Colors.white,)

                                // onPressed: () => orderCubit(context).getGeolocator(),
                                // child: Icon(
                                //
                                //   Icons.location_pin,
                                //   color: Colors.grey,
                                //   size: 35,
                                // ),
                                // ),
                                // SizedBox(
                                //   width: 10,
                                // ),
                                // Text(
                                //   'current location ',
                                //   style:
                                //       black18bold().copyWith(color: Colors.black54),
                                // ),


                              ],
                            ),
                            SizedBox(
                              height: 150,
                            ),
                            DefaultCircleButton(
                                color: Colors.indigo,
                                r: 5.0,
                                hs: 50,
                                text: 'Update',
                                style: white20bold(),
                                isIcon: false,
                                fun: () {
                                  print('updateAddress ${orderCubit(context).updateAddress}');
                                  print('updateDetailsControl ${orderCubit(context).updateDetailsControl.text}');
                                  print('updateCity ${orderCubit(context).updateCity}');
                                  print('updateLocationValue ${orderCubit(context).updateLocationValue}');
                                  print('updateLatitudeData ${orderCubit(context).updateLatitudeData}');
                                  print('updateLongitudeData ${orderCubit(context).updateLongitudeData}');

                                  print('id ${id}');
                                  print('updateStateCity ${orderCubit(context).updateStateCity}');

                                  print('updateSpecialMarkControl ${orderCubit(context).updateSpecialMarkControl.text}');

                                  return orderCubit(context).upDateAddress( name: orderCubit(context).updateLocationValue!,
                                    id: id,
                                    details: orderCubit(context).updateDetailsControl.text,
                                    city: orderCubit(context).updateCity!,
                                    region: orderCubit(context).updateStateCity!,
                                    notes: orderCubit(context).updateSpecialMarkControl.text,
                                    latitude: orderCubit(context).updateLatitudeData,
                                    longitude: orderCubit(context).updateLongitudeData,
                                      context: context);

                                }
                                ),
                          ],
                        ),
                      )),
                ),
              );
            }));
  }

}