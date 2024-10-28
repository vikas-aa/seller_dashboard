import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:production_app/model/product.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference productCollection;

  TextEditingController productNameCtrl = TextEditingController();
  TextEditingController productDescriptionCtrl = TextEditingController();
  TextEditingController productImgCtrl = TextEditingController();
  TextEditingController productPriceCtrl = TextEditingController();

  String category = 'general';
  String brand = 'unbranded';
  bool offers = false;

  List<Product> products = [];

  @override
  Future<void> onInit() async {
    productCollection = firestore.collection('products');
    await fetchProducts();
    super.onInit();
  }
addProduct() {
  try {
    DocumentReference doc = productCollection.doc();
    Product product = Product(
      id: doc.id,
      name: productNameCtrl.text,
      category: category,
      description: productDescriptionCtrl.text,
      price: double.tryParse(productPriceCtrl.text) ?? 0.0,
      brand: brand,
      image: productImgCtrl.text,
      offers: offers,
    );

 final productionJson = product.toJson();
 doc.set(productionJson);
 Get.snackbar('Success','Product added Sucessfully',
 colorText: Colors.greenAccent);
 setValusDefault();
  } 

    catch (e) {
    Get.snackbar('Error', e.toString(), colorText: Colors.red);
    print(e);
  }
}


  fetchProducts() async {
    try {
      QuerySnapshot productSnapshot = await productCollection.get();
         final List<Product> retrieveProducts = productSnapshot.docs.map((doc) =>
         Product.fromJson(doc.data() as Map<String ,dynamic>)).toList();

  

      products.clear();
      products.assignAll(retrieveProducts);
      Get.snackbar('Success', 'Products fetched successfully',
          colorText: Colors.green);
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.redAccent);
      print(e);
    } finally {
      update();
    }
  }

  deleteProduct(String id) async {
    try {
      await productCollection.doc(id).delete();
      await fetchProducts(); // Await the fetchProducts call
      update();
        Get.snackbar('Success','Product Deleted Successfully',  colorText: Colors.redAccent); // Ensure the UI is updated
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.redAccent);
      print(e);
    }
  }

  setValusDefault() {
    productNameCtrl.clear();
    productDescriptionCtrl.clear();
    productImgCtrl.clear();
    productPriceCtrl.clear();

    category = 'general';
    brand = 'unbranded';
    offers = false;
    update();
  }
}
