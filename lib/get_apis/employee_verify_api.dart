// import 'package:ezwage_screens_demo/json_model/employee_verfi_model.dart';
// import 'package:flat_management/model/bill_model.dart';
// import 'package:http/http.dart' as http;
// class Get_Bills {
//   static Future<List<EmployeeVerificationModel>> getBillList() async {
//     String url = "http://59.152.103.142:2001/api/TblBills";
//
//     try {
//       final response = await http.get(Uri.parse(url));
//       // print(response.body);
//       print(response.statusCode);
//       if (200 == response.statusCode) {
//         final String data = employeeVerificationModelFromMap(response.body);
//
//
//
//       } else {
//         return List<EmployeeVerificationModel>.empty(growable: true);
//       }
//     } catch (e) {
//       print(e);
//       return List<EmployeeVerificationModel>.empty(growable: true);
//     }
//   }
// }