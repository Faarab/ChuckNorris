import "dart:convert";

class Fact {
  //properties
  String values;
  String created_at;
  String id;

//costruttore
  Fact({required this.id, 
        required this.values, 
        required this.created_at 
        });

  //FACTORY!!!
  //per controllare creazione istanze di una classe senza doverne creare una nuova ogni volta
  //in modo da avere tutto in un solo punto

//la differenza è che il primo accetta una stringa json e la converte in un map<String, dynamic>
  factory Fact.fromJson(String jsonString) {
    final Map<String, dynamic> data = jsonDecode(jsonString);
    return Fact.fromMap(data);
  }

//il secondo accetta direttamente un map<String, dynamic>. Da utilizzare quindi quando abbiamo i dati già in formato map
  factory Fact.fromMap(Map<String, dynamic> map) {
    final fact = Fact(
      id: map['id'],
      values: map['value'],
      created_at: map['created_at'],
    );
    return fact;
  }
  
//quando si chiama il metodo toString su un'istanza della classe Fact, si otterrà la stringa qui sotto
  @override
  String toString() {
    
    return "id: $id, values: $values, createdAt: $created_at";
    
  }



  
}

