abstract class ProductState {}

class ProInitialState extends ProductState {}


class GetUserTokenFromShared extends ProductState {}

class SingleCategoryProductLoadingStates extends ProductState {}

class SingleCategoryProductSuccessStates extends ProductState {}

class SingleCategoryProductErrorStates extends ProductState {
  final String error;

  SingleCategoryProductErrorStates(this.error);
}

class SearchProductLoadingStates extends ProductState {}

class SearchProductSuccessStates extends ProductState {}

class SearchProductErrorStates extends ProductState {}

class SingleProductLoadingStates extends ProductState {}

class SingleProductSuccessStates extends ProductState {}

class SingleProductErrorStates extends ProductState {}
class SingleProductLoadingStatess extends ProductState {}

class SingleProductSuccessStatess extends ProductState {}

class SingleProductErrorStatess extends ProductState {}

class SingledProduct extends ProductState {}

class SingledC extends ProductState {}


