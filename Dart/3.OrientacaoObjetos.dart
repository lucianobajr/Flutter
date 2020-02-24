//  O plano, o ideal para criação =====>Clase
//O próprio 'paupável','real' =========>Objeto

class Microfone {
  //atributos
  String nome; 
  String cor;
  String marca;
  int modelo;

  //metodos
  void aumentaVolume(){
    print("Solta a batida!!");
  }

  //construtor
  Microfone(this.nome,this.cor,this.marca,this.modelo);
}

main(List<String> args) {
  Microfone novo = new Microfone("Razer","preto","razer",12);
  //se não utilizamos contrutores a função 'new' cria crostutores vazios 
  print(novo.cor);
}