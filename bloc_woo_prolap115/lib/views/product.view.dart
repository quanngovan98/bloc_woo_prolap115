import 'package:bloc_woo_prolap115/blocs/Product.bloc.dart';
import 'package:bloc_woo_prolap115/states/product.state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductBloc, ProductState>(
      listener: (BuildContext context, ProductState state) {},
      builder: (BuildContext context, state) {

        if(state is ProductNotSearched){
          return Text("abc");
        }
        if (state is LoadingProductState) {
          return CircularProgressIndicator();
        }
        if (state is ProductLoadedState) {
            var _state=state.wooProducts;
          for(var a in _state){
            print(a);
          return  Expanded(
              child: Container(
                width: 200,
                height: 400,
                child: new Text(
                    "ProductID: ${a.id}, productName: ${a.name}"),
              ),
            );
          }

        }
        if (state is ProductLoadErrorState) {
          return Text(
            state.message,
            style: TextStyle(color: Colors.red),
          );
        }
        //return ;
      },
    );
  }
}
