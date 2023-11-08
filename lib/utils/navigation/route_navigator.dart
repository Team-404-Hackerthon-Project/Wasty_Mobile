import 'package:flutter/material.dart';
import 'package:get/get.dart';

void routeNavigator (Widget widget,Map<String,String>? argument){
  Get.to(widget,
  arguments:  argument,
                      duration: const Duration(seconds: 1),
                      transition: Transition.native);

//  Navigator.push(context, MaterialPageRoute(builder: (context) => object));
}


