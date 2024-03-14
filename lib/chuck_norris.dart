// import "dart:io";
// import "dart:convert";
// import "models/facts.dart";
// import "package:http/http.dart" as http;
// import 'package:dotenv/dotenv.dart';

// final stringQueryUrl = "https://api.chucknorris.io/jokes/search";

// final stringUrl = "https://api.chucknorris.io/jokes/random";




// Future<Fact> getFact() async {

//   final url = Uri.parse(stringUrl);

//   final res = await http.get(url);
 
//   final Map<String, dynamic> data = json.decode(res.body);
  
//   return Fact(id: data["id"], values: data["value"], created_at: data["created_at"]); 
  
// }

// Future<Fact> getCategory(String category) async {

//   final url = Uri.parse(stringUrl);
//   final uriWithCat = url.replace(queryParameters: {"category": category});
//   final res = await http.get(uriWithCat);
 
//   final Map<String, dynamic> data = json.decode(res.body);
  
//   return Fact(id: data["id"], values: data["value"], created_at: data["created_at"]); 
  
// }

// Future<Fact> getCategoryEnv() async {

//   final url = Uri.parse(stringUrl);
//   var env = DotEnv()..load();
  
//   final res = await http.get(url);
//   final fact = await getCategory(env['categoria']!);
  
 
//   final Map<String, dynamic> data = json.decode(res.body);
  
//   return Fact(id: data["id"], values: data["value"], created_at: data["created_at"]); 
  
// }

// Future<List<Fact>> getQuery(String searchPara) async {
//   final url = Uri.parse(stringQueryUrl);
  
//   final uriWithCatQuery = url.replace(queryParameters: {"query": searchPara});

//   final res = await http.get(uriWithCatQuery);
//   final Map<String, dynamic> data = json.decode(res.body);
//   final list = data['result'] as List;

//   final cfs = list
//       .map((e) =>
//           Fact(id: e["id"], values: e["value"], created_at: e["created_at"]))
//       ;
//   //Una lista di chuck norris facts
//   return cfs.toList();
// }
