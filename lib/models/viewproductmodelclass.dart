import 'package:flutter/material.dart';

class Viewproductmodelclass{
String? image;
String? name;
String? description;
String? price;
String? quantity;
String? points;
Icon? cart;


Viewproductmodelclass({this.image,this.name,this.description,this.price,this.quantity,this.points,this.cart});

}



List<Viewproductmodelclass>pviewproductmodelclasslist=[

 Viewproductmodelclass(image: "assets/car1.jpg",name:"Formula Car 1",description: "Worlds no 1 cars",
 price: "\$15000",quantity:"1",points: "10",cart: Icon(Icons.add_circle_sharp)),


 
 Viewproductmodelclass(image: "assets/car2.jpeg",name:"Formula Car 2",description: "Worlds no 10 cars",
 price: "\$17000",quantity:"1",points: "10",cart: Icon(Icons.add_circle_sharp)),



 
 Viewproductmodelclass(image: "assets/car3.jpeg",name:"Formula Car 3",description: "Worlds no 5 cars",
 price: "\$19000",quantity:"1",points: "19",cart: Icon(Icons.add_circle_sharp)),



 
 Viewproductmodelclass(image: "assets/car1.jpg",name:"Formula Car 1",description: "Worlds no 1 cars",
 price: "\$15000",quantity:"1",points: "10",cart: Icon(Icons.add_circle_sharp)),


 Viewproductmodelclass(image: "assets/car2.jpeg",name:"Formula Car 2",description: "Worlds no 10 cars",
 price: "\$17000",quantity:"1",points: "10",cart: Icon(Icons.add_circle_sharp)),




 Viewproductmodelclass(image: "assets/car3.jpeg",name:"Formula Car 3",description: "Worlds no 5 cars",
 price: "\$19000",quantity:"1",points: "19",cart: Icon(Icons.add_circle_sharp)),


    
];








