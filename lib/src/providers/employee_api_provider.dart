import 'package:api_to_sqlite/src/models/employee_model.dart';
import 'package:api_to_sqlite/src/providers/db_provider.dart';
import 'package:dio/dio.dart';

class EmployeeApiProvider {
  Future<List<Employee?>> getAllEmployees() async {
    var url = "https://63ea7dcd3363c870036a5ae3.mockapi.io/startrek/species";
    Response response = await Dio().get(url);

    return (response.data as List).map((employee) {
      // ignore: avoid_print
      print('Inserting $employee');
      DBProvider.db.createEmployee(Employee.fromJson(employee));
    }).toList();
  }
}
