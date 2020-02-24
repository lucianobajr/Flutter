//string é um objeto
class Pessoa{
  String nome,apelido;
  int idade;

  void printNome(){
    print(this.nome);
  }
}

class Luciano extends Pessoa{  //herença
   @override //sobreescrever --> Ignora a outra função
   void printNome(){
     print("eh noix");
   }
}


//herança com construtores
class Localizacao{
  num lat,lon;
  Localizacao(this.lat, this.lon);

}

class Planalto extends Localizacao{
  num elevacao;
  Planalto(num lat, num lon,this.elevacao) : super(lat, lon);//
  //criar formatações
  @override
  String toString(){
    String resultado = "A elecação do planalto é ${this.elevacao}"
      "e latitude: ${this.lat} e longitude: ${this.lon}";
    return resultado;
  }
}



main(List<String> args) {
   var junim = new Luciano();
   junim.nome = "Luciano";
   //junim.printNome();

   var planalto = new Planalto(89.89, 135.13,84);
   print(planalto);
}