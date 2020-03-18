import 'package:firebase_database/firebase_database.dart';

class Comunidade{
  String key;
  String assunto;
  String mensagem;
  
  Comunidade(this.assunto,this.mensagem);

  Comunidade.fromSnapshot(DataSnapshot snapshot):
    key = snapshot.key,
    assunto = snapshot.value['assunto'],
    mensagem = snapshot.value['mensagem'];
  

  toJson(){
    return{
      "assunto":assunto,
      "mensagem": mensagem,
    };
  }
}