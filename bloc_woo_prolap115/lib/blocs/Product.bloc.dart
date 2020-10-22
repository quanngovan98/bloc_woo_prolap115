import 'package:bloc/bloc.dart';
import 'package:bloc_woo_prolap115/events/product.event.dart';
import 'package:bloc_woo_prolap115/responsives/product.respo.dart';
import 'package:bloc_woo_prolap115/states/product.state.dart';
import 'package:woocommerce/models/products.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {

  ProductRespo productRespo = ProductRespo();

  ProductBloc() : super(ProductNotSearched());

//  @override
//  ProductState get initialState => ProductNotSearched();

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    ///
    /// nếu event thuột thằng LoadProductEvent thì nó sẽ làm những công việc sau:
    /// 1, kiểm tra điều kiện nếu không có sản phẩm trả về thì trả về không tìm thấy (kết hợp Respon )
    /// 2 ngược lại nếu có sản phẩm thi gọi thằng state ProductLoadedState(wooProduct)
    ///
    if (event is LoadProductEvent) {
      yield LoadingProductState();
      List<WooProduct> wooProduct = await productRespo.getProductsNewest();
      if (wooProduct == null) {
        yield ProductLoadErrorState("Product Không tìm thấy!");
      } else {
        yield ProductLoadedState(wooProduct);
      }
    }
  }
}
