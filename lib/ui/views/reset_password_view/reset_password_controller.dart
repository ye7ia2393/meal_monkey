import 'package:flutter/material.dart';
import 'package:meal_monkey/core/services/base_controller.dart';

class ResetPasswordController extends BaseController {
  TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
}
