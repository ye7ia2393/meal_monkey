import 'package:flutter/material.dart';
import 'package:meal_monkey/core/services/base_controller.dart';

class NewPasswordController extends BaseController {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
}
