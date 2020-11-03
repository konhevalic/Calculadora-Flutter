import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Meu primeiro app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage > {
  String value = "";

  static const String subtracao = "-";
  static const String adicao = "+";
  static const String porcent = "%";
  static const String divisao = "/";
  static const String multi = "x";
  static const String igual = "=";
  static const String alteraSinal = "+/-";

  int result = 0;
  int primeiroNumero = 0;
  int segundoNumero = 0;
  double valorPorcentual = 0;
  String operador = "";
  String concatenado = "";

  void limparValor() {
    result = null;
    primeiroNumero = null;
    segundoNumero = null;
    operador = "";

    setState(() {
      value = '';
    });
  }
  void operacoes(String operador) {
    this.operador = operador;

  }

  void alteraSinalValue() {
    setState(() {
      int valueInt = (int.parse(value));
      if (valueInt >= 0){
        value = (valueInt*(-1)).toString();
        print((value));
      } else {
        value = (valueInt*(-1)).toString();
        print((value));
      }


    });
  }

  void pegarValor(int primeiroNumero, int segundoNumero){
    setState((){
      this.primeiroNumero = primeiroNumero;
      if (primeiroNumero != 0){
        this.segundoNumero = segundoNumero;
      }

      value = primeiroNumero.toString() + segundoNumero.toString();
      }
    );
  }

  //concatena em uma única variavel e mostra no display valores clicados
  void add(String val) {
    setState(() {
      value += val;
    });
  }



  //separa os valores e joga em um array
  void resultadoCal() {

   List<String> stringValue = value.split('').map((String text) => text).toList();
    //List<String> stringValue = value.split('');
    print('valores no display: ' + '$stringValue');



   //value = (valNum1 / valNum2).toString().replaceAll(".0", "");

   String primeiroNum = "";
   String segundoNum = "";
   String operacaoFeita = "";

   bool passouOperador = false;

   bool calculou = false;



   //passa por cada elemento do array e verifica os valores
    //testa cada elemento do array até reconhecer uma operação em um determinado elemento do array
    //caso o elemento do array seja subtração, no caso, a variavel subtração = -, atribui o valor para a variavel operacaoFeita
    stringValue.forEach((element) {
      switch(element) {
        case subtracao:
          passouOperador = true;
          operacaoFeita = subtracao;
          print(operacaoFeita);
          break;
        case adicao:
          passouOperador = true;
          calculou = true;
          operacaoFeita = adicao;
          print(operacaoFeita);
          break;
        case porcent:
          passouOperador = true;
          operacaoFeita = porcent;
          print(operacaoFeita);
          break;
        case divisao:
          passouOperador = true;
          operacaoFeita = divisao;
          print(operacaoFeita);
          break;
        case multi:
          passouOperador = true;
          operacaoFeita = multi;
          print(operacaoFeita);
          break;
        case alteraSinal:
          passouOperador = false;
          operacaoFeita = alteraSinal;
          break;
        default:
          if (stringValue[0] == "-" || stringValue[0] == "+"){
              concatenado += element;
              primeiroNum = stringValue[0] + concatenado;
              print("valor primeiroNum: " + primeiroNum);

            // concatenado = (stringValue[0] + stringValue[1]);
            // print( "valor do concatenado:" + concatenado);
            // primeiroNum = concatenado;
            // segundoNum = stringValue[stringValue.length-1];
            // print('valor segundoNum: ' + segundoNum);
          }
          if (!passouOperador) {
            primeiroNum += element;
            print(primeiroNum);
          } else {
            segundoNum += element;
            print("valor do segundoNum:" + segundoNum);
          }
          break;
      }
    });

    //atribui os valores para inteiros nas variaveis
   var valNum1 = int.parse(primeiroNum);
   print("valor do valnum1: " '$primeiroNum');
   var valNum2 = int.parse(segundoNum);

    //testa a variável operaçaoFeita e caso seja igual À uma variável, vai executar a operação
   switch(operacaoFeita) {
     case subtracao:
       primeiroNum = "";
       segundoNum = "";
       operacaoFeita = "";
       //passouOperador = false;
       setState(() {
          value = (valNum1 - valNum2).toString();
          print('valor do value na subtracao: ' + value);
       });
       break;
     case adicao:
       primeiroNum = "";
       segundoNum = "";
       operacaoFeita = "";
       passouOperador = false;
       calculou = false;
       setState(() {
         value = (valNum1 + valNum2).toString();
         print('valor da soma: ' + value);
       });
       break;
     case porcent:
       primeiroNum = "";
       segundoNum = "";
       operacaoFeita = "";
       passouOperador = false;
       setState(() {
         var val = valNum1 * valNum2 / 100;
         value = (val).toString();
       });
       break;
     case multi:
       primeiroNum = "";
       segundoNum = "";
       operacaoFeita = "";
       passouOperador = false;
       setState(() {
         value = (valNum1 * valNum2).toString();
       });
       break;
     case divisao:
       try {
         primeiroNum = "";
         segundoNum = "";
         operacaoFeita = "";
         passouOperador = false;
         setState(() {
           value = (valNum1 / valNum2).toString().replaceAll(".0", "");
         });
       } catch (e, s) {
         value = 0.toString();
       }
       break;
   }
  }

  Widget criarBotao({
    String texto = "",
    Color botaoColor = Colors.grey,
    Color corDoTexto = Colors.white,
    int flex = 1,
    Function onTap,
  }) {
    return Expanded(
      flex: flex,
      child: InkWell(
        onTap: onTap,
        child: Container(
            height: 85,
            decoration: BoxDecoration(
              color: botaoColor,
              shape:  flex !=1 ? BoxShape.rectangle : BoxShape.circle,
              borderRadius: flex != 1 ? BorderRadius.all(Radius.circular(50)) : null,
            ),
            child: Center(
              child: Text(
                texto,
                style: TextStyle(
                  fontSize: 32,
                  color: corDoTexto,
                ),
              ),
            )
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  child: Center(
                    child: Container(
                      width: double.infinity,
                      child: Container(
                          child: Text(
                            value,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 70,
                            ),
                          )
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                          children: [
                            criarBotao(texto: "AC", botaoColor: Colors.grey, corDoTexto: Colors.black, onTap: () => limparValor()),
                            criarBotao(texto: "+/-", botaoColor: Colors.grey, corDoTexto: Colors.black, onTap: () => alteraSinalValue()),
                            criarBotao(texto: "%", botaoColor: Colors.grey, corDoTexto: Colors.black, onTap: () => add("%")),
                            criarBotao(texto: "/", botaoColor: Colors.orange, corDoTexto: Colors.black, onTap: () => add("/")),
                          ]
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          criarBotao(texto: "7", botaoColor: Colors.white12, onTap: () => add(7.toString())),
                          criarBotao(texto: "8", botaoColor: Colors.white12, onTap: () => add(8.toString())),
                          criarBotao(texto: "9", botaoColor: Colors.white12, onTap: () => add(9.toString())),
                          criarBotao(texto: "x", botaoColor: Colors.orange, corDoTexto: Colors.black, onTap: () => add("x")),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          criarBotao(texto: "4", botaoColor: Colors.white12, onTap: () => add(4.toString())),
                          criarBotao(texto: "5", botaoColor: Colors.white12, onTap: () => add(5.toString())),
                          criarBotao(texto: "6", botaoColor: Colors.white12, onTap: () => add(6.toString())),
                          criarBotao(texto: "-", botaoColor: Colors.orange, corDoTexto: Colors.black, onTap: () => add("-")),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          criarBotao(texto: "1", botaoColor: Colors.white12, onTap: () => add(1.toString())),
                          criarBotao(texto: "2", botaoColor: Colors.white12, onTap: () => add(2.toString())),
                          criarBotao(texto: "3", botaoColor: Colors.white12, onTap: () => add(3.toString())),
                          criarBotao(texto: "+", botaoColor: Colors.orange, corDoTexto: Colors.black, onTap: () => add("+"))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          criarBotao(texto: "0", botaoColor: Colors.white12, flex: 2, onTap: () => add(0.toString())),
                          criarBotao(texto: ",", botaoColor: Colors.white12, onTap: () => add(",")),
                          criarBotao(texto: "=", botaoColor: Colors.white12, onTap: () => resultadoCal()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
