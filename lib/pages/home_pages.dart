import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:production_app/controller/home_controller.dart';
import 'package:production_app/pages/add_product_page.dart';
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder:(ctrl)=>
       Scaffold(
        appBar: AppBar(title:Text("Footware Admin"),),
        body: ListView.builder(
          itemCount: ctrl.products.length,
          itemBuilder: (context ,index){
            return ListTile(title: Text(ctrl.products[index].name ?? '' ),
            subtitle: Text((ctrl.products[index].price ?? 0).toString()),
            trailing: IconButton(
               icon: Icon(Icons.delete),
               onPressed: () {
              ctrl.deleteProduct(ctrl.products[index].id ?? '');
               },
               ),
             ) ;
          }
          
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () { 
           Get.to(AddProductPage());
      
            },
            child: Icon(Icons.add),
            ),
      ),
    
    );
  }
}