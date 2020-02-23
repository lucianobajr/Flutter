
main(List<String> args) {
  int x = 10;
  int y= 12;

  //estrutura de if else
  /*OPERADORES LÓGICOS*/

  //! = NEGATIVO ,INVERSO
  // || = OU/OR
  // &&  = E/AND

  if(!(x==y)){ //negação da negativa ---> true
    print("maior que 10");
  }
  else if(x == 10){
    print("igual a 10");
  }
  else{
    print("menor que 10");
  }

  //laços de repetição -->identico ao C
  for (var i = 0; i < 3; i++) {
      print(i);
  }

  num i = 0;
  while (i<5) {
      print(i);
      i++;
  }
  print(CalculeWeightinTheMoon(peso: 80));//parametro nomeado
}

//equivale ao return
//parametro nomeado
//parametros exigidos devemos utilizar @required  e importar package meta
//parametros opcionais utilizar [ tipo nome_variavel]
double CalculeWeightinTheMoon({double peso}) => ((peso/9.81)*1.622); 
