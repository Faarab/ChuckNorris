import 'dart:io';
import 'package:chuck_norris/services/category_service.dart';
import 'package:chuck_norris/services/fact_services.dart';


void main(List<String> arguments) async {


  //1
  final randomFact = await getFact();
  print(randomFact);

  //2
  final catFact = await getCategory("animal");
  print(catFact);

  //3
  final envFact = await getCategoryEnv();
  print(envFact);
 
  //4
  print("Scegli una parola per filtrare le citazioni");
  final query = stdin.readLineSync();
  final getFacts = await getFactsByQueryV2(query!);
  print(getFacts);
  //5
  final listToString = getFacts.toString();
  await File("facts.txt").writeAsString(listToString);

//-----------------------------------------------------------------------------------------------------------
  //restituisce una lista di categorie di citazioni
  final cats = await getCategories();
  print("Scegli una categoria dalle seguenti:");
  //La lista di categorie viene stampata con un ciclo for, mostrando l'indice e il nome di ogni categoria
  for (var i =0; i<cats.length; i++){
    print("$i - ${cats[i]}");
  }
  //Viene letta da stdin la scelta dell'utente (l'indice della categoria)
  final catIndex = stdin.readLineSync();
  //La scelta viene convertita in intero
  final cat = int.parse(catIndex!);
  //richiama la funzione getCategory passando come parametro la categoria scelta dall'utente
  final quote = await getCategory(cats[cat]);
  print(quote);

  
}
