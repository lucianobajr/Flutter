//Classe  Absatrata = classe genérica
//Interface = Funções comuns para Classes não relacionadas

abstract class Animal{
  void respirar();//método abstrato
}

class Pessoa implements Animal{
  @override
  void respirar() {
    print("Respirando");
    // TODO: implement respirar
  }
  
}

main(List<String> args) {
  var  pessoa = new Pessoa();
  pessoa.respirar();
}