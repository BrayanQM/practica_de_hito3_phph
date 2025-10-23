import 'package:flutter/material.dart';

class Exercise3 extends StatefulWidget {
  const Exercise3({super.key});

  @override
  State<Exercise3> createState() => _Exercise3State();
}

class _Exercise3State extends State<Exercise3> {
  Color _colorFondo = Colors.white;
  bool _esMorado = false;

  void _cambiarColor() {
    setState(() {
      _esMorado = !_esMorado;
      _colorFondo = _esMorado ? Colors.purple : Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 3: Cambiar color de fondo'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      backgroundColor: _colorFondo,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: _esMorado
                    ? Colors.white.withOpacity(0.9)
                    : Colors.purple.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: _esMorado ? Colors.white : Colors.purple,
                  width: 2,
                ),
              ),
              child: Text(
                _esMorado ? 'Fondo MORADO' : 'Fondo BLANCO',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: _esMorado ? Colors.white : Colors.purple.shade800,
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _cambiarColor,
              style: ElevatedButton.styleFrom(
                backgroundColor: _esMorado ? Colors.white : Colors.purple,
                foregroundColor: _esMorado ? Colors.purple : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                _esMorado ? 'Cambiar a Blanco' : 'Cambiar a Morado',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
