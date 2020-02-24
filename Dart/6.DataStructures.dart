main(List<String> args) {
  var lista = [1,2,3,4,5,6];
  for(var i = 0;i < lista.length;i++){
    print("${lista[i]}\n");
  }

  var soLista = List<int>();//Lista com objetos 
  soLista.add(12);
  print(soLista[0]);

  //mapas
  var jogadores = {
    "primeiro":"Guilherme",
    "segundo" :"Bordoni",
    "terceiro":"Luciano" 
  };

  print(jogadores["primeiro"]);

  jogadores.forEach((c,v)=>print(c));

  var chaves = jogadores.keys;
  var valores = jogadores.values;

  print(chaves);
  print(valores);

}