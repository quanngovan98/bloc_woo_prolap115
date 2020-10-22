import 'package:woocommerce/models/products.dart';

class ProductState {}

class ProductNotSearched extends ProductState{

}

///return loading state product
class LoadingProductState extends ProductState{}

///return trang thái đã hoàn thành load product
class ProductLoadedState extends ProductState{
  final List<WooProduct> wooProducts;

  ProductLoadedState(this.wooProducts);

}//load done

///return trạng thái lỗi
class ProductLoadErrorState extends ProductState{
  final String message;

  ProductLoadErrorState(this.message);
}