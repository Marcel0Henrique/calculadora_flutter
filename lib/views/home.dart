import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

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
String calc = '0';
String result = '0';

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
                child: Row(
                  children: [
                    const Expanded(
                      child: SizedBox(),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        //* calculo
                        Text(
                          '$calc',
                          //textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                          ),
                        ),

                        Row(
                          children: [
                            //* Sinal do resultado
                            Text(
                              '=',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.1,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.09,
                            ),

                            //* Resultado
                            Text(
                              '$result',
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.2,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
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
                        onPressed: () {},
                        child: Text(
                          '%',
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
                        onPressed: () {},
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
                        onPressed: () {},
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
                        onPressed: () {},
                        child: Text(
                          ',',
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
      calc = calc + num;
    });
  }

  void allClean() {
    setState(() {
      calc = '0';
      result = '0';
    });
  }

  void calcResult() {
    setState(() {
      Expression exp = p.parse(calc);
      result = exp.evaluate(EvaluationType.REAL, ContextModel()).toString();
    });
  }
}
