import 'package:apartment_tow/core/SERVER/root_link_api.dart';

class ApartMentApiLink {
  static String baseUrl = "$rootLink/apartment";
  static String add = "$baseUrl/add.php";
  static String addOrder = "$rootLink/orders/add_order.php";
  static String view = "$baseUrl/view.php";
  static String viewByType = "$baseUrl/view_by_type.php";
  static String delete = "$baseUrl/delete.php";
  static String shearch = "$baseUrl/search.php";
  static String update = "$baseUrl/update.php";
}
