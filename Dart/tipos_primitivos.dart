import 'dart:ffi';

main(List<String> args) {
  String balde;
  balde = "ceveja";
  print(balde);
  num idade = 20; //num constitui numeros inteiros e decimais
  int teste = 19;
  double preco = 39.6456;
  print("preço = ${preco.toStringAsPrecision(3)}");//exibe até a primeira casa decimal
  bool facul = true;//binário =  true or false(1 or 0)
  if(facul){
    print("E a provinha?\n");
  }
}