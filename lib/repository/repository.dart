import 'package:http/http.dart' as http;

  class Repository{
    String _baseUrl = ('http://faisal.eitechbd.com/ecom_api/api');

    httpGet(String api)async{
      return await http.get(_baseUrl + "/" + api);
    }

  }