import 'package:aguchi_prueba1/src/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            // app bar
            titulo(),
            SizedBox(height: 10),
            //Cards
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.deepPurple[300],
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      blurRadius: 25,
                      spreadRadius: 10,
                    ),
                  ],
                ),
                width: 350,
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Agustín Sanchez',
                            style: GoogleFonts.coda(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Saldo actual',
                            style: GoogleFonts.coda(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '\$ 1.250,00',
                            style: GoogleFonts.coda(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 50),
                    Column(
                      children: [
                        Container(
                          height: 80,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 25,
                                spreadRadius: 10,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Center(
                              child: Image.asset(
                                'assets/enviar_saldo.png',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Enviar',
                          style: GoogleFonts.coda(
                            fontSize: 15,
                            //fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Text(
                    'Ingresar saldo',
                    style: GoogleFonts.coda(
                      fontSize: 22,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyButton(
                    iconImage: 'assets/ingreso.png',
                    buttonText: 'Efectivo',
                  ),
                  MyButton(
                    iconImage: 'assets/transfer.png',
                    buttonText: 'Transferencia',
                  ),
                  MyButton(
                    iconImage: 'assets/logo_mp.png',
                    buttonText: 'Mercado Pago',
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Row(
                children: [
                  Container(
                    height: 60,
                    child: Image.asset('assets/movimientos.png'),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text('Ultimos movimientos'),
                  SizedBox(
                    width: 50,
                  ),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding titulo() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 15.0,
      ),
      child: Row(
        children: [
          Text(
            'MI BILLETERA',
            textAlign: TextAlign.center,
            style: GoogleFonts.coda(
              color: Colors.black54,
              fontSize: 35,
              //fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 50),
          Image.asset(
            'assets/logo365.png',
            width: 40,
            height: 40,
          ),
        ],
      ),
    );
  }
}
