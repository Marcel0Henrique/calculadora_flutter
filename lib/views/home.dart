import 'package:flutter/material.dart';

List<Color> gradientGreen = [
  const Color(0xff32a38b),
  const Color(0xff2ef2c4),
];

List<Color> gradientBlack = [
  const Color(0xff5e5e5e),
  const Color.fromARGB(255, 21, 22, 24),
];

Color backgroundColor = Color(0xff2fe0b7);

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          //* Container Gradiente verde
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: gradientGreen,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  8, MediaQuery.of(context).size.height * 0.14, 8, 12),
              child: Row(
                children: [
                  const Expanded(
                    child: SizedBox(),
                  ),

                  //* Simbolo de resultado
                  Text(
                    '=',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.1,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.09,
                  ),
                  Column(
                    children: [
                      //* calculo
                      Text(
                        '150 x 3',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                        ),
                      ),
                      //* Resultado
                      Text(
                        '450',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.2,
                        ),
                      ),
                    ],
                  ),
                ],
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
          ),
        ],
      ),
    );
  }
}
