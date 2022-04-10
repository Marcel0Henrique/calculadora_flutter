import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:auto_size_text/auto_size_text.dart';

//* Cores do gradiente
List<Color> gradientGreen = [
  const Color(0xff32a38b),
  const Color(0xff2ef2c4),
];

List<Color> gradientBlack = [
  const Color(0xff5e5e5e),
  const Color.fromARGB(255, 21, 22, 24),
];

Color backgroundColor = const Color(0xff2fe0b7);
Color fontColor = Colors.white;

//* Variaveis para calculo
bool firstOperation = true;
String result = '0.0';

//* Criando objeto para realizar o calculo
Parser p = Parser();

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    //* Tamanho dos BTNs
    Size btnSize = Size(
      MediaQuery.of(context).size.width * 0.2,
      MediaQuery.of(context).size.height * 0.1,
    );
    double fontsSize = MediaQuery.of(context).size.width * 0.075;
    double widthSizedBox = MediaQuery.of(context).size.width * 0.03;
    double heightSizedBox = MediaQuery.of(context).size.height * 0.02;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          //* Container Gradiente verde
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.35,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: gradientGreen,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  8,
                  12,
                  8,
                  12,
                ),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    //mainAxisSize: MainAxisSize.min,
                    children: [
                      //* Resultado
                      AutoSizeText(
                        result,
                        maxLines: 3,
                        minFontSize: 13,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          //*Container Gradiente Preto
          Container(
            height: MediaQuery.of(context).size.height * 0.65,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(50),
              ),
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: gradientBlack,
              ),
              boxShadow: const <BoxShadow>[
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(0.0, 5.0),
                  blurRadius: 20.0,
                  spreadRadius: 4.0,
                ),
              ],
            ),

            //* Botoes
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Column(
                children: [
                  //* 1º Fileira
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //? btn Limpar Tudo
                      TextButton(
                        onPressed: allClean,
                        child: Text(
                          'AC',
                          style: TextStyle(
                            fontSize: fontsSize,
                            color: gradientGreen[1],
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: gradientGreen[1],
                          fixedSize: btnSize,
                        ),
                      ),
                      SizedBox(
                        width: widthSizedBox,
                      ),

                      //? btn porcentagem
                      TextButton(
                        onPressed: () {
                          addNum('^');
                        },
                        child: Text(
                          '^',
                          style: TextStyle(
                            fontSize: fontsSize,
                            color: gradientGreen[1],
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: gradientGreen[1],
                          fixedSize: btnSize,
                        ),
                      ),
                      SizedBox(
                        width: widthSizedBox,
                      ),

                      //? btn apagar
                      TextButton(
                        onPressed: () {
                          clean();
                        },
                        child: Icon(
                          Icons.backspace_outlined,
                          size: fontsSize,
                          color: gradientGreen[1],
                        ),
                        style: TextButton.styleFrom(
                          primary: gradientGreen[1],
                          fixedSize: btnSize,
                        ),
                      ),
                      SizedBox(
                        width: widthSizedBox,
                      ),

                      //? btn dividir
                      TextButton(
                        onPressed: () {
                          addNum('/');
                        },
                        child: Text(
                          '÷',
                          style: TextStyle(
                            fontSize: fontsSize,
                            color: gradientGreen[1],
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: gradientGreen[1],
                          fixedSize: btnSize,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: heightSizedBox,
                  ),

                  //* 2° Fileira
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //? btn Limpar Tudo
                      TextButton(
                        onPressed: () {
                          addNum('7');
                        },
                        child: Text(
                          '7',
                          style: TextStyle(
                            fontSize: fontsSize,
                            color: fontColor,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: gradientGreen[1],
                          fixedSize: btnSize,
                        ),
                      ),
                      SizedBox(
                        width: widthSizedBox,
                      ),

                      //? btn porcentagem
                      TextButton(
                        onPressed: () {
                          addNum('8');
                        },
                        child: Text(
                          '8',
                          style: TextStyle(
                            fontSize: fontsSize,
                            color: fontColor,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: gradientGreen[1],
                          fixedSize: btnSize,
                        ),
                      ),
                      SizedBox(
                        width: widthSizedBox,
                      ),

                      //? btn apagar
                      TextButton(
                        onPressed: () {
                          addNum('9');
                        },
                        child: Text(
                          '9',
                          style: TextStyle(
                            fontSize: fontsSize,
                            color: fontColor,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: gradientGreen[1],
                          fixedSize: btnSize,
                        ),
                      ),
                      SizedBox(
                        width: widthSizedBox,
                      ),

                      //? btn dividir
                      TextButton(
                        onPressed: () {
                          addNum('*');
                        },
                        child: Text(
                          'x',
                          style: TextStyle(
                            fontSize: fontsSize,
                            color: gradientGreen[1],
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: gradientGreen[1],
                          fixedSize: btnSize,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: heightSizedBox,
                  ),

                  //* 3° Fileira
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //? btn Limpar Tudo
                      TextButton(
                        onPressed: () {
                          addNum('4');
                        },
                        child: Text(
                          '4',
                          style: TextStyle(
                            fontSize: fontsSize,
                            color: fontColor,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: gradientGreen[1],
                          fixedSize: btnSize,
                        ),
                      ),
                      SizedBox(
                        width: widthSizedBox,
                      ),

                      //? btn porcentagem
                      TextButton(
                        onPressed: () {
                          addNum('5');
                        },
                        child: Text(
                          '5',
                          style: TextStyle(
                            fontSize: fontsSize,
                            color: fontColor,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: gradientGreen[1],
                          fixedSize: btnSize,
                        ),
                      ),
                      SizedBox(
                        width: widthSizedBox,
                      ),

                      //? btn apagar
                      TextButton(
                        onPressed: () {
                          addNum('6');
                        },
                        child: Text(
                          '6',
                          style: TextStyle(
                            fontSize: fontsSize,
                            color: fontColor,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: gradientGreen[1],
                          fixedSize: btnSize,
                        ),
                      ),
                      SizedBox(
                        width: widthSizedBox,
                      ),

                      //? btn dividir
                      TextButton(
                        onPressed: () {
                          addNum('-');
                        },
                        child: Text(
                          '-',
                          style: TextStyle(
                            fontSize: fontsSize,
                            color: gradientGreen[1],
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: gradientGreen[1],
                          fixedSize: btnSize,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: heightSizedBox,
                  ),

                  //* 4° Fileira
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //? btn Limpar Tudo
                      TextButton(
                        onPressed: () {
                          addNum('1');
                        },
                        child: Text(
                          '1',
                          style: TextStyle(
                            fontSize: fontsSize,
                            color: fontColor,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: gradientGreen[1],
                          fixedSize: btnSize,
                        ),
                      ),
                      SizedBox(
                        width: widthSizedBox,
                      ),

                      //? btn porcentagem
                      TextButton(
                        onPressed: () {
                          addNum('2');
                        },
                        child: Text(
                          '2',
                          style: TextStyle(
                            fontSize: fontsSize,
                            color: fontColor,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: gradientGreen[1],
                          fixedSize: btnSize,
                        ),
                      ),
                      SizedBox(
                        width: widthSizedBox,
                      ),

                      //? btn apagar
                      TextButton(
                        onPressed: () {
                          addNum('3');
                        },
                        child: Text(
                          '3',
                          style: TextStyle(
                            fontSize: fontsSize,
                            color: fontColor,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: gradientGreen[1],
                          fixedSize: btnSize,
                        ),
                      ),
                      SizedBox(
                        width: widthSizedBox,
                      ),

                      //? btn dividir
                      TextButton(
                        onPressed: () {
                          addNum('+');
                        },
                        child: Text(
                          '+',
                          style: TextStyle(
                            fontSize: fontsSize,
                            color: gradientGreen[1],
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: gradientGreen[1],
                          fixedSize: btnSize,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: heightSizedBox,
                  ),

                  //* 5° Fileira
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //? btn Limpar Tudo
                      TextButton(
                        onPressed: () {
                          addNum('00');
                        },
                        child: Text(
                          '00',
                          style: TextStyle(
                            fontSize: fontsSize,
                            color: fontColor,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: gradientGreen[1],
                          fixedSize: btnSize,
                        ),
                      ),
                      SizedBox(
                        width: widthSizedBox,
                      ),

                      //? btn porcentagem
                      TextButton(
                        onPressed: () {
                          addNum('0');
                        },
                        child: Text(
                          '0',
                          style: TextStyle(
                            fontSize: fontsSize,
                            color: fontColor,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: gradientGreen[1],
                          fixedSize: btnSize,
                        ),
                      ),
                      SizedBox(
                        width: widthSizedBox,
                      ),

                      //? btn apagar
                      TextButton(
                        onPressed: () {
                          addNum('.');
                        },
                        child: Text(
                          '.',
                          style: TextStyle(
                            fontSize: fontsSize,
                            color: fontColor,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: gradientGreen[1],
                          fixedSize: btnSize,
                        ),
                      ),
                      SizedBox(
                        width: widthSizedBox,
                      ),

                      //? btn dividir
                      TextButton(
                        onPressed: () {
                          calcResult();
                        },
                        child: Text(
                          '=',
                          style: TextStyle(
                            fontSize: fontsSize,
                            color: gradientGreen[1],
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: gradientGreen[1],
                          fixedSize: btnSize,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void addNum(String num) {
    setState(() {
      if (firstOperation == true) {
        result = num;
        firstOperation = false;
      } else if (result == 'ERRO') {
        allClean();
        firstOperation = false;
        result = num;
      } else {
        result = result + num;
      }
    });
  }

  void allClean() {
    setState(() {
      result = '0.0';
      firstOperation = true;
    });
  }

  void clean() {
    setState(() {
      if (firstOperation == false && result.isNotEmpty) {
        result = result.substring(0, result.length - 1);
        if (result.isEmpty) {
          allClean();
        }
      }
    });
  }

  void calcResult() {
    setState(() {
      try {
        Expression exp = p.parse(result);
        result = exp.evaluate(EvaluationType.REAL, ContextModel()).toString();
      } catch (e) {
        result = 'ERRO';
      }
    });
  }
}
