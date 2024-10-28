import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:production_app/controller/home_controller.dart';
import 'package:production_app/pages/dropdown.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
      Widget build(BuildContext context) {
    return  GetBuilder<HomeController>(builder:(ctrl){
   return  Scaffold(
      appBar: AppBar(
        title: Text('App Product'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Add New Product",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.indigoAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: ctrl.productNameCtrl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: Text('Product Name'),
                  hintText: 'Enter the product Name',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: ctrl.productDescriptionCtrl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: Text('Product Description'),
                  hintText: 'Enter the product Description',
                
                ),
                maxLines: 4,
              ),
              SizedBox(height: 10),
              TextField(
                controller: ctrl.productImgCtrl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: Text('Product Image'),
                  hintText: 'Enter the product Image',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: ctrl.productPriceCtrl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: Text('Product Price'),
                  hintText: 'Enter the product Price',
                ),
              ),
            
             Row(
               children: [
                 Flexible(child:
                  Dropdown(
                    items: ['cat1','cat2','cat3'],
                     selectedItemText: ctrl.category,
                     onSelected: (selectedValue) {
                       ctrl.category = selectedValue ?? "genral";
                       ctrl.update();
                     },
                     )),
                  Flexible(child:
                   Dropdown(
                    items: ['brand1','brand2','brand3'], 
                    selectedItemText: ctrl.brand,
                    onSelected: (selectedValue) {
                      ctrl.brand = selectedValue?? 'un branded';
                      ctrl.update();
                    },
                    )),
               ],
             ),
            SizedBox(height: 10,),
            Text('Offer Product ?'),
            Dropdown(
              items: ['true','false'],
              selectedItemText: ctrl.offers.toString(),
              onSelected: (selectedValue) {
                ctrl.offers = bool.tryParse(selectedValue ?? 'false') ?? false;
            ctrl.update();
              },
              ),
               SizedBox(height: 10,),
               ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigoAccent,
                  foregroundColor: Colors.white
                ),
                onPressed: () {
                ctrl.addProduct();

               }, child:Text('Add Product')),
            ],
          ),
        ),
      ));
      
    
    });
  
}
}
