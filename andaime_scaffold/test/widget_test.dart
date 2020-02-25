
// Este é um teste básico do widget Flutter.
//
// Para executar uma interação com um widget em seu teste, use o WidgetTester
// utilitário que o Flutter fornece. Por exemplo, você pode enviar toque e rolagem
// gestos. Você também pode usar o WidgetTester para encontrar widgets filhos no widget
// árvore, leia o texto e verifique se os valores das propriedades do widget estão corretos.

import  'pacote: flutter / material.dart' ;
import  'pacote: flutter_test / flutter_test.dart' ;

import  'pacote: introdução / main.dart' ;

void  main () {
  testWidgets ( 'Contador incrementa o teste de fumaça' , ( testador WidgetTester ) assíncrono {
  // Crie nosso aplicativo e ative um quadro.
  aguarde testador. pumpWidget ( MyApp ());

  // Verifique se nosso contador começa em 0.
  expect (find. text ( '0' ), findOneWidget);
  expect (encontrar. texto ( '1' ), encontraNada);

  // Toque no ícone '+' e ative um quadro.
  aguarde testador. toque (encontre. byIcon ( Icons .add));
  aguarde testador. bomba ();

  // Verifique se nosso contador foi incrementado.
  expect (encontrar. texto ( '0' ), encontraNada);
  expect (find. text ( '1' ), findOneWidget);
  });
}

Widget  MyApp () {
}