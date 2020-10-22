import 'package:bloc_woo_prolap115/blocs/Product.bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainBloc {
  static List<BlocProvider> allBlocs() {
    return [
      BlocProvider<ProductBloc>(create: (BuildContext context) => ProductBloc())
    ];
  }
}
