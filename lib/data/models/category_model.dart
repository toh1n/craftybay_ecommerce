
import 'package:flutter/cupertino.dart';

class CategoryModel {
  final String categoryName;
  final VoidCallback onTap;
  final IconData iconData;

   CategoryModel( this.iconData,this.categoryName,this.onTap,);

}