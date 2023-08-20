import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Menu')),
      ),
      body: WillPopScope(
        onWillPop: () async => false,
        child: SingleChildScrollView(
          child: SizedBox(
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const SizedBox(height: 40,),
                GestureDetector(
                  child: Container(
                    width: size.width * 0.8,
                    height: size.height * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const <Widget>[
                        Hero(
                          tag: 'nit',
                          child: Icon(Icons.password, color: Colors.white, size: 100)
                        ),
                        Text(
                          'Validar NIT', 
                          style: TextStyle(color: Colors.white, fontSize: 30)
                        ),
                      ],
                    ),
                  ),
                  onTap: () => Navigator.pushNamed(context, 'form_nit'),
                ),
                const SizedBox(height: 40,),
                GestureDetector(
                  child: Container(
                    width: size.width * 0.8,
                    height: size.height * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const <Widget>[
                        Hero(
                          tag: 'dpi',
                          child: Icon(Icons.person, color: Colors.white, size: 100)
                        ),
                        Text(
                          'Validar DPI', 
                          style: TextStyle(color: Colors.white, fontSize: 30)
                        ),
                      ],
                    ),
                  ),
                  onTap: () => Navigator.pushNamed(context, 'form_dpi'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}