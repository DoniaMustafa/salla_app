import 'package:dio/dio.dart';
import 'package:e_commerce/model/cart_model.dart';
import 'package:e_commerce/model/category_model.dart';
import 'package:e_commerce/model/favo_model.dart';
import 'package:e_commerce/model/home_model.dart';
import 'package:e_commerce/model/notify_model.dart';
import 'package:e_commerce/model/user_profile_model.dart';
import 'package:e_commerce/modules/cart/cart_screen.dart';
import 'package:e_commerce/modules/category/category_screen.dart';
import 'package:e_commerce/modules/favoret/favorite_screen.dart';
import 'package:e_commerce/modules/home/home.dart';
import 'package:e_commerce/modules/settings/settings_screen.dart';
import 'package:e_commerce/shared/components/constance/constants.dart';
import 'package:e_commerce/shared/cubit/cubit_app/statet.dart';
import 'package:e_commerce/shared/localization/model_translate%20.dart';
import 'package:e_commerce/shared/network/end_path.dart';
import 'package:e_commerce/shared/network/remote/dio_helper.dart';
import 'package:e_commerce/shared/network/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState> {
  Repository repository;
  DioHelper dioHelper;
  AppCubit(this.repository,this.dioHelper) : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  TranslationModel? translationModel;
  NotifyModel? notify;
  int selection = 0;
  List<DataNotify> data=[];
   UserProfileModel? userProfile;
   HomeModel? homeModel;
   ProductData? productData;
  // CategoryModel? categories;
  CategoryModel? categoryModel ;
   List<DataOfCategory>? category;
  List<Product> dataOfProduct=[];
  Map<int, bool> favorite = {};
  Map<int, bool> carts = {};
  GetFavoriteModel? getFavorite;
  List<Datum>? favProduct ;
   GetCartModel? cart;
  List<CartItem> cartProduct = [];
  AddFavoriteModel? addFavorite;
  AddOrRemoveCartModel? addOrRemoveCart;
  int productCartNumber = 0;
  int productFavNumber = 0;
  int productNumber = 1;
  List<Product> productLength = [];
  List<Product> productLength1 = [];
  // final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
   RemoveOrderCartModel? removeCartModel;

  Future<Response?>getProfileInfo() async {
    emit(ProfileLoadingState());
    return await repository.userProfile(token: '$myToken').then((value) {
      userProfile = userProfileModelFromJson(value.toString());
      print(userProfile!.data!.name);

      emit(ProfileSuccessState());
    }).catchError((error) {
      print('getProfileInfoerror : ${error.toString()}');
      emit(ProfileErrorState());
    });
  }

  bool show = true;
  showBadge() {
    show = false;
    emit(ShowState());
  }

  TextDirection textDirection = TextDirection.ltr;

  final List<Widget> screen = [
    Home(),
    Category(),
    Favorite(),
    Setting(),
    Cart()
  ];

  String listTitle(context, i) {
       List<String>? myTitle = [
      transModel(context).appName!,
      transModel(context).category!,
      transModel(context).favorite!,
      transModel(context).settings!
    ];
    return myTitle[i];
  }
  List<bool> itemLang = [false, false];
   int? selectLanguageIndex;

  void changeSelectLanguage(int index) {
    selectLanguageIndex = index;
    for (int i = 0; i < itemLang.length; i++) {
      if (i == index) {
        itemLang[i] = true;
      } else {
        itemLang[i] = false;
      }
    }
    emit(AppSelectLanguageState());
  }

  Future<void> setLanguage({String? translateFileJson, String? code}) async {
     translationModel = translationModelFromJson(translateFileJson);
    textDirection = code == 'ar' ? TextDirection.rtl : TextDirection.ltr;
    emit(AppLoadLocalState());
  }

  onClickCurrentIndex(index) {
    selection = index;
    emit(LayoutChangeItemStates());
  }

  Future getNotify() async {
    emit(NotifyLoadingState());
    return await repository.notifications(token: '$myToken').then((value) {
      notify = notifyModelFromJson(value.toString());
      data = notify!.data!.data!;
      // print(notify.data.data);
      // print(myToken);
      emit(NotifySuccessState());
    }).catchError((onError) {
      // print('Notify ON Error${onError.toString()}');
      emit(NotifyErrorState());
    });
  }

  changeAppTheme() {
    isDark = !isDark;
    // print('value $value');
    saveAppTheme(isDark);

    print('isDark like:  $isDark');
    // getTheme();
    emit(AppChangeTheme());
  }

  getTheme() async {
    isDark = await getAppTheme();
    print('appATheme: $isDark');
    emit(GetAppThemeDataState());
  }

  // Future<Response?> getCategory() async {
  //   emit(CategoryLoadingStates());
  //  return await repository.categories().then((value) {
  //     // var i = value.data;
  //     // print (i);
  //     // print ('category name');
  //
  //     categoryModel = CategoryModel.fromJson(value.data);
  //     // category = categories!.data!.data;
  //     print('category name :${categoryModel!.data!.data![1].name}');
  //     print('category length: ${categoryModel!.data!.data!.length}');
  //     print('category :$categoryModel');
  //     emit(CategorySuccessStates());
  //   }).catchError((error) {
  //
  //     print('get Category : ${error.toString()}');
  //     emit(CategoryErrorStates());
  //   });
  // }


Future<Response?> setFSM(String token)async{
  emit(FCMLoadingStates());
    return await Dio().post('https://student.valuxapps.com/api/fcm-token',
        data: {
      "token" :token,
    }).then((value) { print(value.data);
    emit(FCMSuccessStates());
    }).catchError((onError){
      print(onError.toString());
      emit(FCMErrorStates());

    });
}




  Future <Response?> getCategory() async {
      emit(CategoryLoadingStatess());
    return await Dio().get('https://student.valuxapps.com/api/categories').then((value) {
      // var i = value.data;
      // print (i);
      // print ('category name');

      categoryModel = CategoryModel.fromJson(value.data);
      // category = categories!.data!.data;
      print('category name :${categoryModel!.data!.data![1].name}');
      print('category length: ${categoryModel!.data!.data!.length}');
      print('category :$categoryModel');
      emit(CategorySuccessStatess());
    }).catchError((error) {

      print('get Category : ${error.toString()}');
      emit(CategoryErrorStatess());
    });
  }

  Future changeInFavorite({required int id}) async {
    changeLocalFav(id);
    emit(AddProductToFromFavoriteLoadingStates());
    return await repository
        .addAndRemoveFavorite(token: '$myToken', id: id)
        .then((value) {
      addFavorite = addFavoriteModelFromJson(value.toString());
      print(value);
      if (addFavorite!.status == false) {
        changeLocalFav(id);
      }
      getProductFromFavorite();
      print('changeInFavorite : ${addFavorite!.data}');
      // print(productFavNumber);
      emit(AddProductToFromFavoriteSuccessStates());
    }).catchError((error) {
      changeLocalFav(id);
      print('changeInFavoriteError : ${error.toString()}');
      emit(AddProductToFromFavoriteErrorStates());
    });
  }

  Future<Response?> getProductFromFavorite() async {
    emit(GetProductFromFavoriteLoadingStates());
    return await repository
        .getFavorites(token: '${myToken.toString()}')
        .then((value) {
      getFavorite = getFavoriteModelFromJson(value.toString());
      favProduct = getFavorite!.data!.data!;
      print('get :${getFavorite.toString()}');
      emit(GetProductFromFavoriteSuccessStates());
    }).catchError((onError) {
      print('error favo${onError.toString()}');
      emit(GetProductFromFavoriteErrorStates());
    });
  }

  Future<Response?> getHomeData() async {
    emit(HomeLoadingStates());
    return await repository.homeProduct(token: '$myToken').then((value) {
      homeModel = homeModelFromJson(value.toString());
      productData = homeModel!.data!;

      productData!.products!.forEach((Product element) {
        if (element.discount != 0 && element.discount != null) {
          dataOfProduct.addAll([element]);
        }
        // return dataOfProduct!;
      });
      productData!.products!.forEach((Product element) {
        favorite.addAll({element.id!: element.inFavorites!});
        carts.addAll({element.id!: element.inCart!});

        if (element.inFavorites!) {
          productFavNumber++;
        }
        if (element.inCart!) {
          productCartNumber++;
        }
      });
      emit(HomeSuccessStates());
    }).catchError((onError) {
      // print('error home ${onError.toString()}');
      emit(HomeErrorStates());
    });
  }

 Future getProductFromCart() async {
    emit(GetProductFromCartLoadingStates());
    return await repository.getCart(token: '$myToken').then((value) {
      cart = getCartModelFromJson(value.toString());
      cartProduct = cart!.data.cartItems!;
      print('getProductFromCart  ${value.data}');
      emit(GetProductFromCartSuccessStates());
    }).catchError((onError) {
      print('error cartProduct  ${onError.toString()}');
      emit(GetProductFromCartErrorStates());
    });
  }

  Future<Response?> changeInCart({
    required int id,
  }) async {
    changeLocalCart(id);
    emit(AddAndDeleteProductForCartLoadingStates());
    return await repository
        .addAndRemoveCart(token: '$myToken', id: id)
        .then((value) {
      addOrRemoveCart = addOrRemoveCartFromModelFromJson(value.toString());

      if (addOrRemoveCart!.status == false) {
        changeLocalCart(id);
      }
      print('changeInCart :  ${value.data}');
      getProductFromCart();
      emit(AddAndDeleteProductForCartSuccessStates());
    }).catchError((onError) {
      if (addOrRemoveCart!.status == false) {
        changeLocalCart(id);
      }

      print('Error dio ${onError.toString()}');
      emit(AddAndDeleteProductForCartErrorStates());
    });
  }

  Future removeSingleProCart({required int id, required int idLocalCart}) async {
    emit(RemoveSingleProCartLoadingStates());
    changeLocalCart(idLocalCart);
    return await repository
        .removeSingleProInsideCart(
      token: '$myToken',
      id: id,
    )
        .then((value) {
      print('cart : ${value.data}');
      removeCartModel = removeOrderCartModelFromJson(value.toString());
      print('cart : $removeCartModel');

      if (removeCartModel!.status == false) {
        changeLocalCart(idLocalCart);
      }
      getProductFromCart();

      // emit(RemoveSingleProCartSuccessStates());
    }).catchError((error) {
      print('cart error: ${error.toString()}');
      {
        changeLocalCart(idLocalCart);
      }
      emit(RemoveSingleProCartErrorStates());
    });
  }

  Future updateCart({required int id, required int quantity})async {
    emit(UpDateCartLoadingState());
  return await repository
        .updateCart(token: '$myToken', id: id, quantity: quantity)
        .then((value) {
      print('updateCart ${value.data}');
      getProductFromCart();
    }).catchError((onError) {
      print('Error dio ${onError.toString()}');
      emit(UpDateCartErrorState());
    });
  }

  changeLocalCart(id) {
    carts[id] = !carts[id]!;
    if (carts[id]!) {
      productCartNumber++;
      print('number ++ $productCartNumber');
    } else {
      productCartNumber--;
    }
    print('number -- $productCartNumber');

    emit(ChangeNumberCart());
  }

  changeLocalFav(id) {
    favorite[id] = !favorite[id]!;
    if (favorite[id]!) {
      productFavNumber++;
    } else {
      productFavNumber--;
    }
    emit(ChangeNumberFav());
  }

  loadList() async {
    await Future.delayed(Duration(microseconds: 200));
    await getHomeData();
    await getCategory();
    await getProductFromFavorite();
    await getProductFromCart();
  }

  Future<Response> loadCart() async {
    await Future.delayed(Duration(microseconds: 200));
    return await getProductFromCart();
  }

  Future<Response?> loadFav() async {
    await Future.delayed(Duration(microseconds: 200));
    return await getProductFromFavorite();
  }

  Future<Response?> loadProfile() async {
    await Future.delayed(Duration(microseconds: 200));
    return await getProfileInfo();
  }
}
