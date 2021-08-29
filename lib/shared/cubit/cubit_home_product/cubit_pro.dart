import 'package:dio/dio.dart';
import 'package:e_commerce/model/catgory_pro.dart';
import 'package:e_commerce/model/search_model.dart';
import 'package:e_commerce/model/single_product_model.dart';
import 'package:e_commerce/shared/components/constance/constants.dart';
import 'package:e_commerce/shared/cubit/cubit_home_product/state_pro.dart';
import 'package:e_commerce/shared/network/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  Repository repository;
  ProductCubit(this.repository) : super(ProInitialState());
  static ProductCubit get(context) => BlocProvider.of(context);
  TextEditingController controller = TextEditingController();
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
final searchKay=GlobalKey<FormState>();
  SingleProductModel? singleProduct;
   CategoriesProductModel? categoryProduct;

   SearchModel? productSearch;

  Future<Response> loadSingleCategory(int id,context)async{
    await Future.delayed(Duration(microseconds: 200));
    return await getSingleCategory( id : id, context:context);

  }
  Future<Response?> loadSingleProd(int id,context)async{
    await Future.delayed(Duration(microseconds: 200));
    return await singleProd( id : id, context:context);

  }
 getSingleCategory({required int id,context}) async {
    emit(SingleCategoryProductLoadingStates());
   return await repository
        .singleCategory(id: id, token:'$myToken')
        .then((value) {
          categoryProduct = categoriesProductModelFromJson(value.toString());
      // List<DataSingleCategory?> v = categoryProduct.data.data;
      categoryProduct!.data!.data!.forEach((DataSingleCategory element) {
        if(!appCubit(context).favorite.containsKey(element.id)){
        appCubit(context).favorite.addAll({element.id!:element.inFavorites!});
          print(element.id);
        }
        if(!appCubit(context).carts.containsKey(element.id)){

          appCubit(context).carts.addAll({element.id!:element.inCart!});
        print(element.id);}

        if (element.inFavorites!) {
          appCubit(context).productFavNumber++;
        }
        if (element.inCart!) {
          appCubit(context).productCartNumber++;
        }
      });
      emit(SingleCategoryProductSuccessStates());
    }).catchError((onError) {
      print(onError.toString());
      emit(SingleCategoryProductErrorStates(onError.toString()));
    });
  }





  Future<Response?> singleProd({required int id,context}) async {
    emit(SingleProductLoadingStates());
    return await repository
        .singleProduct(id: id, token: '$myToken')
        .then((value) {
      singleProduct = singleProductModelFromJson(value.toString());
      print(singleProduct!.data.id);
        if(!appCubit(context).favorite.containsKey( singleProduct!.data.id)){
          appCubit(context).favorite.addAll({ singleProduct!.data.id!: singleProduct!.data.inFavorites!});
          print( singleProduct!.data.id);
        }
        if(!appCubit(context).carts.containsKey( singleProduct!.data.id)){

          appCubit(context).carts.addAll({ singleProduct!.data.id!: singleProduct!.data.inCart!});
          print( singleProduct!.data.id);}

        if ( singleProduct!.data.inFavorites!) {
          appCubit(context).productFavNumber++;
        }
        if ( singleProduct!.data.inCart!) {
          appCubit(context).productCartNumber++;
        }
    emit(SingleProductSuccessStates());
    }).catchError((error) {
      print('Error SingleProduct ${error.toString()}');
      emit(SingleProductErrorStates());
    });
  }

 Future<Response?> sinCat({int? id})async {
    emit(SingleProductLoadingStatess());
    return await Dio().get('https://student.valuxapps.com/api/categories/$id',
    queryParameters: {
      'Authorization': '$myToken',
      'Content-Type': 'application/json',
      'lang': appLangDirection,
    }).then((value) {
        print('single category data : ${value.data}');
        emit(SingleProductSuccessStatess());

    }).catchError((error){
      print('single category error: ${error.toString()}');

      emit(SingleProductErrorStatess());
    });

  }


  Future searchOfProduct({required String text,required BuildContext context}) async {
    emit(SearchProductLoadingStates());
    return await repository
        .search(text: text, token: '$myToken')
        .then((value) {
      productSearch = searchModelFromJson(value.toString());
      // productSearch.data.data.forEach((element) {
      //   search.addAll([element]);
      //   return search;
      // });
      print('dddddddddd${productSearch!.data!.toJson()}');

      // search =productSearch.data.data;
      print('ffffffffffff${productSearch!.data!.data![0].price}');

      print(value.data);
      productSearch!.data!.data!.forEach((element) {
        if(!appCubit(context).favorite.containsKey(element.id)){
          appCubit(context).favorite.addAll({element.id!:element.inFavorites!});
          print(element.id);
        }
        if(!appCubit(context).carts.containsKey(element.id)){

          appCubit(context).carts.addAll({element.id!:element.inCart!});
          print(element.id);}

        if (element.inFavorites!) {
          appCubit(context).productFavNumber++;
        }
        if (element.inCart!) {
          appCubit(context).productCartNumber++;
        }


    });
      emit(SearchProductSuccessStates());
    }).catchError((onError) {
      print(onError.toString());
      emit(SearchProductErrorStates());
    });
  }


}
