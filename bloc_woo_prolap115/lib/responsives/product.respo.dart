import 'package:woocommerce/woocommerce.dart';

class ProductRespo{
  // Initialize the API
  WooCommerce wooCommerceAPI = WooCommerce(
      baseUrl: "https://prolap115.com",
      consumerKey: "ck_4de88e66ed40b2ffdaf0c812d97cb63c4e2646ff",
      consumerSecret: "cs_26f894ea2a813e0939284fafe5713491c1933757");

  //fetch product new update from website
  Future<dynamic> getProductsNewest() async {
    // Get data using the "products" endpoint( show 6 new product post )
    var products = await wooCommerceAPI.getProducts(perPage: 2,);
    //print(products.length);
    return products;
  }

//fetch product by catelogy
//example: mainboard
  Future<dynamic> getProductsByCatelogyID( int count ,int cate) async{
    var productsByCatelogy=await wooCommerceAPI.getProducts(perPage: count, category: cate.toString());
    //print(productsByCatelogy.length);
    return productsByCatelogy;
  }

//fetch product by click from categories
  Future<dynamic> getProductbyCategoriesID(int categoryId) async{
    var productbyCatID = await wooCommerceAPI.getProducts(category: categoryId.toString());
    print("tổng: "+productbyCatID.length.toString());
    return productbyCatID;
  }

  Future<dynamic> cart_products(String itemID,String quantiny) async{
    var products=await wooCommerceAPI.addToMyCart(itemId: itemID, quantity: quantiny);
    //print(products.name);
    //print(products.id);
    return products;
  }

  Future<dynamic> getCategory() async{
    var categories = await wooCommerceAPI.getProductCategories(perPage: 100);
    //print("loại "+categories.length.toString());
    return categories;
  }
}