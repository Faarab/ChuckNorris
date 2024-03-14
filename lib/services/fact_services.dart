import "dart:convert";
import "../models/facts.dart";
import "package:http/http.dart" as http;


final stringQueryUrl = "https://api.chucknorris.io/jokes/search";
final stringRandomUrl = "https://api.chucknorris.io/jokes/random";


Future<Fact> getFact() async {

  final url = Uri.parse(stringRandomUrl);
  final res = await http.get(url);
  final Map<String, dynamic> data = json.decode(res.body);
  return Fact(id: data["id"], values: data["value"], created_at: data["created_at"]); 
  
}

//versione con factory
Future<Fact> getFactV2() async {

  final url = Uri.parse(stringRandomUrl);
  final res = await http.get(url);
  //utilizza factory per crerare istanza di Fact
  final fact = Fact.fromJson(res.body);
  return fact;
  
}

Future<List<Fact>> getFactsByQuery(String query) async {

  final url = Uri.parse(stringQueryUrl);
  final uriWithCatQuery = url.replace(queryParameters: {"query": query});
  final res = await http.get(uriWithCatQuery);
  final Map<String, dynamic> data = json.decode(res.body);
  final list = data['result'] as List;
  final List<Fact> facts = list.map((e) => Fact.fromMap(e)).toList();

  return facts;
}

//versione prof
Future<List<Fact>> getFactsByQueryV2(String query) async {

  final url = Uri.parse(stringQueryUrl);
  final uriWithCatQuery = url.replace(queryParameters: {"query": query});
  final res = await http.get(uriWithCatQuery);
  final Map<String, dynamic> data = json.decode(res.body);
  print(data);
 //Estrae dal map di dati l'el result e lo converte in una lista
  final list = data['result'] as List;
  //Utilizza map per trasformare ogni elemento della lista in un ogg Fact
  //map restituisce un oggetto di tipo Iterable<Fact> -> ossia la sequenza di ogg Fact ottenuti trasformando gli elementi di list
  //gli oggetti iterable sono provvisti netodi per iterare ex forEach, map
  final cfs = list
      .map((e) =>
          Fact(id: e["id"], values: e["value"], created_at: e["created_at"]));
  //Una lista di chuck norris facts
  return cfs.toList();
}





