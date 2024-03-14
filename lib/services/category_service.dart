import "dart:convert";
import "package:http/http.dart" as http;
import 'package:dotenv/dotenv.dart';

import "../models/facts.dart";



final stringUrl = "https://api.chucknorris.io/jokes/categories";

final stringUrl2 = "https://api.chucknorris.io/jokes/random";

Future<List<String>> getCategories() async {

  final uri = Uri.parse(stringUrl);

  final res = await http.get(uri);
  final data = json.decode(res.body);
  //ora il json ritornato è una lista di stringhe
  return List<String>.from(data);

}
Future<Fact> getCategory(String category) async {
  

  final url = Uri.parse(stringUrl2);
  final uriWithCat = url.replace(queryParameters: {"category": category});
  final res = await http.get(uriWithCat);
 
  // final Map<String, dynamic> data = json.decode(res.body);
  
  // return Fact(id: data["id"], values: data["value"], created_at: data["created_at"]); 

  final fact = Fact.fromJson(res.body);
  return fact;
  
}

Future<Fact> getCategoryEnv() async {

  final url = Uri.parse(stringUrl2);
  var env = DotEnv()..load();
  
  final res = await http.get(url);
  await getCategory(env['categoria']!);
  
  final fact = Fact.fromJson(res.body);
  // final Map<String, dynamic> data = json.decode(res.body);
  
  // return Fact(id: data["id"], values: data["value"], created_at: data["created_at"]); 

  return fact;
  
}

