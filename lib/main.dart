import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  int _imageIndex = 0;
  List<String> _images = [
    'packages/imagenes/1.png',
    'packages/imagenes/2.png',
    'packages/imagenes/3.png',
  ];

  PageController _pageController = PageController(initialPage: 0);

  // Función para cambiar la imagen
  void changeImage(int newIndex) {
    setState(() {
      _imageIndex = newIndex;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Easy Outfit"),
        backgroundColor: Color(0xFFC6D8D8), // Color del menú
      ),
      // Cuerpo de la aplicación
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          Column(
            children: [
              Text(
                "¿Qué vas a usar hoy?",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () =>
                              changeImage((_imageIndex - 1) % _images.length),
                          child: Icon(Icons.arrow_back),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF568281), // Color izquierdo
                          ),
                        ),
                        Image.asset(
                          _images[_imageIndex],
                          width: MediaQuery.of(context).size.width * 0.6,
                          height: MediaQuery.of(context).size.height * 0.6,
                        ),
                        ElevatedButton(
                          onPressed: () =>
                              changeImage((_imageIndex + 1) % _images.length),
                          child: Icon(Icons.arrow_forward),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF568281), // Color derecho
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Lógica para el botón "Ponerme"
                          },
                          child: Text("Ponerme"),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF2F3E45), // Color "Ponerme"
                          ),
                        ),
                        SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: () {
                            // Lógica para el botón "Descartar"
                          },
                          child: Text("Descartar"),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF2F3E45), // Color "Descartar"
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Iniciar Sesión",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Correo',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true, // Oculta la contraseña
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Lógica para el botón "Iniciar Sesión"
                },
                child: Text("Iniciar Sesión"),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF2F3E45), // Color del botón "Iniciar Sesión"
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Lógica para el botón "Iniciar con Google"
                },
                child: Text("Iniciar con Google"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // Color del botón "Iniciar con Google"
                ),
              ),
            ],
          ),
        ],
      ),
      // Menú inferior
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 500), curve: Curves.ease);
          });
        },
        backgroundColor: Color(0xFFC6D8D8), // Color del menú
        items: [
          // Opción de Inicio
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Inicio",
          ),
          // Opción de Agregar
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Agregar",
          ),
          // Opción de Usuario
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Usuario",
          ),
        ],
      ),
    );
  }
}