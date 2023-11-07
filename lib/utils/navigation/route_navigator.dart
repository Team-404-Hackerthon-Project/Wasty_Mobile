import 'package:flutter/material.dart';

void routeNavigator (context , Widget object){
  Navigator.push(context, MaterialPageRoute(builder: (context) => object));
}
