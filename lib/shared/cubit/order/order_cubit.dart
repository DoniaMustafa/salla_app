// import 'package:flutter_braintree/flutter_braintree.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/model/address_model.dart';
import 'package:e_commerce/model/order_details_model.dart';
import 'package:e_commerce/model/order_model.dart';
import 'package:e_commerce/model/promr_model.dart';
import 'package:e_commerce/model/update_address_model.dart';
import 'package:e_commerce/modules/address/choose_address_screen.dart';
import 'package:e_commerce/shared/components/constance/constants.dart';
import 'package:e_commerce/shared/components/default_navigator/navigat.dart';
import 'package:e_commerce/shared/components/widget/alertdialog.dart';
import 'package:e_commerce/shared/components/widget/simple_dialog_widget.dart';
import 'package:e_commerce/shared/cubit/order/order_state.dart';
import 'package:e_commerce/shared/network/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class OrderCubit extends Cubit<OrderState> {
  Repository repository;
  OrderCubit(this.repository) : super(OrderInitialState());
  static OrderCubit get(context) => BlocProvider.of(context);
  AddressModel? addressModel;
  List<dynamic>? data =[];
   UpdateAddressModel? updateAddress;
  final addressKay = GlobalKey<FormState>();
  final updateAddressKay = GlobalKey<FormState>();

  TextEditingController code = TextEditingController();

  TextEditingController locationNameControl = TextEditingController();
  TextEditingController detailsControl = TextEditingController();
  TextEditingController specialMarkControl = TextEditingController();
  TextEditingController updateDetailsControl = TextEditingController();
  TextEditingController updateSpecialMarkControl = TextEditingController();
  String? city ;
  String? stateCity ;
  String? country ;
  String? locationValue ;
  String? updateStateCity;
  String? updateCity ;
  String? updateCountry;
  String? updateLocationValue;
  PromoCodeModel? promoCodeModel;
  List<String> itemLocation = ['Home', 'Business', 'other'];
  var latitudeData;
  var longitudeData;
  var updateLatitudeData;
  var updateLongitudeData;
   int? selectLocationIndex;
  bool focus = false;
  Position? position;
TextEditingController latitudeDataController = TextEditingController();
  TextEditingController longitudeDataController = TextEditingController();

  Future getGeolocator() async {
    emit(GetLocationAddressLoadingState());
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      latitudeData = value.latitude;
      longitudeData = value.longitude;
      latitudeDataController.text=latitudeData.toString();
      longitudeDataController.text=longitudeData.toString();
      print('latitudeData : $latitudeData');
      print('longitudeData : $longitudeData');

      emit(GetLocationAddressSuccessState());
    }).catchError((error) {
      print('error Geolocator : ${error.toString()}');
      emit(GetLocationAddressErrorState());
    });

  }

  Future<void> updateGeolocator() async {
    emit(UpdateLocationAddressLoadingState());
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      updateLatitudeData = value.latitude;
      updateLongitudeData = value.longitude;
      print('latitudeData : $updateLatitudeData');
      print('longitudeData : $updateLongitudeData');

      emit(UpdateLocationAddressSuccessState());
    }).catchError((error) {
      print('error Geolocator : ${error.toString()}');
      emit(UpdateLocationAddressErrorState());
    });
  }


  changeCity(val) {
    city = val;
    emit(ChangeCityState());
  }

  changeStateCity(val) {
    stateCity = val;
    emit(ChangeRegionState());
  }

  changeCountry(val) {
    country = val;
    emit(ChangeCountryState());
  }

  updateOfCountry(val) {
    updateCountry = val;
    emit(UpdateCountryState());
  }

  updateOfCity(val) {
    updateCity = val;
    emit(UpdateCityState());
  }

  updateOfStateCity(val) {
    updateStateCity = val;
    emit(UpdateRegionState());
  }

  onClickItem(val) {
    locationValue = val;
    emit(OnClickLocationState());
  }

  updateLocation(val) {
    updateLocationValue = val;
    emit(UpdateOnClickLocationState());
  }

 addNewAddress(
      {required String name,
      required String details,
      required String city,
      required String region,
      required String notes,
      required dynamic latitude,
      required dynamic longitude,
      context}) async {
    emit(AddAddressLoadingState());
    return await repository
        .addAddress(
            token: '$myToken',
            name: '$name',
            city: '$city',
            region: '$region',
            details: '$details',
            latitude: latitude,
            longitude: longitude,
            notes: '$notes')
        .then((value) {
      print(value.data);
      navigaTo(context: context, widget: ChooseAddress());
      getNewAddress();
      emit(AddAddressSuccessState());
    }).catchError((error) {
      print('error AddAddress :${error.toString()}');
      emit(AddAddressErrorState());
    });
  }


  getNewAddress() async {
    emit(GetAddressLoadingState());
    return await repository
        .getAddress(
      token: '$myToken',
    )
        .then((value) {
      addressModel = addressModelFromJson(value.toString());
      // addressModel.data.data!=null
      // data = addressModel?.data.data;
      print('addressModel ${addressModel!.data!.data}');
      emit(GetAddressSuccessState());
    }).catchError((error) {
      print('get address : ${error.toString()}');
      emit(GetAddressErrorState());
    });
  }

 upDateAddress(
      {required String name,
        required String details,
        required String city,
        required String region,
        required String notes,
      dynamic latitude,
      dynamic longitude,
        required int id,
      context}) async {
    emit(UpdateAddressLoadingState());
    return await repository
        .upDateAddress(
            id: id,
            token: '$myToken',
            name: name,
            city: city,
            region: region,
            details: details,
            latitude: latitude,
            longitude: longitude,
            notes: notes)
        .then((value) {
      updateAddress = updateAddressModelFromJson(value.toString());
      print(value.data);
      getNewAddress();
      emit(UpdateAddressSuccessState());
    }).catchError((error) {
      print(error.toString());

      emit(UpdateAddressErrorState());
    });
  }

 deleteNewAddress(int id) async {
    emit(DeleteAddressLoadingState());

    return await repository
        .deleteAddress(token: '$myToken', id: id)
        .then((value) {
      print(value.data);
      emit(DeleteAddressSuccessState());
    }).catchError((error) {
      emit(DeleteAddressErrorState());
    });
  }

 addOrder(
      {required int addressId,   required int promoCodeId  ,required int paymentMethod, context}) async {
    emit(AddOrderLoadingState());
    return await repository
        .addOrder(
            token:'$myToken',
            addressId: addressId,
            promoCodeId: promoCodeId  ,
            paymentMethod: paymentMethod)
        .then((value) {
      print(promoCodeId);

      print(value.data);
      appCubit(context).getProductFromCart();
      orderCubit(context).simpleDialog(context);

      emit(AddOrderSuccessState());
    }).catchError((onError) {
      emit(AddOrderErrorState());
    });
  }

  int select = 1;

  onClick(v) {
    select = v;
    print('v $v');
    print('select $select');
    emit(SelectState());
  }

  List<bool> selectItem = [false, false];
  int selected = 0;

  selectOnClick(index) {
    selected = index;
    for (int i = 0; i < selectItem.length; i++) {
      if (i == index) {
        selectItem[i] = true;
      } else {
        selectItem[i] = false;
      }
    }
    print('index $index');
    print('select $selectItem');
    emit(SelectState());
  }

 promoCode({required String code}) async {
    emit(PromoCodeLoadingState());
    return await repository.promoCode(token: '$myToken', code: code).then((value) {
      promoCodeModel = promoCodeModelFromJson(value.toString());
      print(value.data);
      emit(PromoCodeSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(PromoCodeErrorState());
    });
  }

   OrdersModel? ordersModel;
   OrdersInfo? info;
  Future <Response?>getOrder() async {
    // emit(GetOrderLoadingState());
    return await repository.getOrder(token:  '$myToken').then((value) {
      ordersModel = ordersModelFromJson(value.toString());
      info = ordersModel!.data!.data![1];
      print(value.data);
      print(info);

      emit(GetOrderSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetOrderErrorState());
    });
  }

   OrderDetailsModel? orderDetailsModel;

  detailsOrder(int id) async {
    emit(OrderDetailsLoadingState());
    return await repository.orderDetails(token:  '$myToken', id: id).then((value) {
      orderDetailsModel = orderDetailsModelFromJson(value.toString());
      print(value.data);
      emit(OrderDetailsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(OrderDetailsErrorState());
    });
  }

  removeOrder(int id, int i) async {
    emit(CancelOrderLoadingState());
    return await repository.cancelOrder(token:  '$myToken', id: id).then((value) {
      // orderDetailsModel = orderDetailsModelFromJson(value.toString());
      print(value.data);
      detailsOrder(i);
      getOrder();
      emit(CancelOrderSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(CancelOrderErrorState());
    });
  }

  Future<void> cancelshowDialog({context,Function? onPress}) async {
     showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return MyStatelessWidget(onPress:(){
          return onPress!();
        });
      },
    );
  }

  Future<void>simpleDialog(context) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialogWidget();
        });
  }
  Future<Response?>loadingOrders()async{
    await Future.delayed(Duration(milliseconds : 200));
   return await getOrder();
}
}
