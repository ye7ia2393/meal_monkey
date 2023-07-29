import 'package:meal_monkey/core/data/models/apis/meal_model.dart';

class CategoryModel {
  int? id;
  String? name;
  String? logo;
  List<MealModel>? mealsModel;

  CategoryModel({this.id, this.name, this.logo, this.mealsModel});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    if (json['meals_model'] != null) {
      mealsModel = <MealModel>[];
      json['meals_model'].forEach((v) {
        mealsModel!.add(new MealModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['logo'] = this.logo;
    if (this.mealsModel != null) {
      data['meals_model'] = this.mealsModel!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
