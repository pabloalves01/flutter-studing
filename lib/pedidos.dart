import 'package:flutter/material.dart';

class Pedidos extends StatefulWidget {
  const Pedidos({super.key});

  @override
  State<Pedidos> createState() => _PedidosPageState();
}

class _PedidosPageState extends State<Pedidos> {
  final pedidos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pedidos',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: pedidos.isEmpty
            ? const Center(
                child: Text(
                  'Nenhum pedido encontrado.',
                  style: TextStyle(fontSize: 18),
                ),
              )
            : Column(
                children: [
                  Container(color: Colors.blue, height: 100, width: 400),
                  // aqui você pode adicionar outros widgets de pedidos
                ],
              ),
      ),
    );
  }
}
