import 'package:meal_monkey/core/data/network/network_config.dart';

class UserEndpoints {
  static String login = NetworkConfig.getFullApiRoute('user/login');
  static String register = NetworkConfig.getFullApiRoute('user/register');
}
