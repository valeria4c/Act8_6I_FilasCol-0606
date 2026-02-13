import 'package:flutter/material.dart';

void main() => runApp(const AppEstudioFotografico());

class AppEstudioFotografico extends StatelessWidget {
  const AppEstudioFotografico({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PantallaFotografia(),
    );
  }
}

class PantallaFotografia extends StatelessWidget {
  // Definición de colores personalizados para el estilo "Azul Rata"
  final Color azulRataFuerte = const Color(0xFF2C3E50);
  final Color azulRataClaro = const Color(0xFF4CA1AF);
  final Color grisOscuro = const Color(0xFF3E4144);

  PantallaFotografia({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Estudio Fotografico Herrera",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        // Aplicamos el degradado al AppBar mediante un FlexibleSpace
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [azulRataFuerte, const Color(0xFF1a2a3a)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.photo_library, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.people, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Primera Fila
            Expanded(
              child: Row(
                children: [
                  _crearCaja(
                      degradado: [Colors.grey, Colors.blueGrey],
                      icono: Icons.camera_alt,
                      texto: "Sesión de Fotos"),
                  const SizedBox(width: 10),
                  _crearCaja(
                      colorSolido: azulRataFuerte,
                      icono: Icons.photo_album,
                      texto: "Álbumes"),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Segunda Fila
            Expanded(
              child: Row(
                children: [
                  _crearCaja(
                      degradado: [grisOscuro, Colors.black87],
                      icono: Icons.event,
                      texto: "Eventos"),
                  const SizedBox(width: 10),
                  _crearCaja(
                      degradado: [
                        Colors.grey.shade400,
                        Colors.grey.shade700
                      ],
                      icono: Icons.person,
                      texto: "Retratos"),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Tercera Fila
            Expanded(
              child: Row(
                children: [
                  _crearCaja(
                      colorSolido: const Color.fromARGB(255, 47, 82, 122),
                      icono: Icons.landscape,
                      texto: "Paisajes"),
                  const SizedBox(width: 10),
                  _crearCaja(
                      colorSolido: Colors.grey,
                      icono: Icons.info,
                      texto: "Información"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Función auxiliar para no repetir código de los Containers
  Widget _crearCaja(
      {List<Color>? degradado,
      Color? colorSolido,
      required IconData icono,
      required String texto}) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: colorSolido,
          borderRadius: BorderRadius.circular(12),
          gradient: degradado != null
              ? LinearGradient(
                  colors: degradado,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icono, size: 40, color: Colors.white),
            const SizedBox(height: 8),
            Text(
              texto,
              style: const TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}