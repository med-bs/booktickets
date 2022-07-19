import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppLayout{
  static getSize(BuildContext context){
    return MediaQuery.of(context).size;
  }
  static getScreenHeight(){
    return Get.height;
  }
  static getScreenWidth(){
    return Get.width;
  }
  static getHeight(double pixels){
   return (getScreenHeight()*pixels)/getScreenHeight();
  }
  static getWidth(double pixels){
    return (getScreenWidth()*pixels)/getScreenWidth();
  }
}