import 'package:flutter/material.dart';

class Pedidos extends StatefulWidget {
  const Pedidos({super.key});

  @override
  State<Pedidos> createState() => _PedidosPageState();
}

class _PedidosPageState extends State<Pedidos> {
  // final List<Map<String, dynamic>> pedidos = [
  //   {'nome': 'João da Silva', 'produto': 'Notebook Gamer', 'valor': 4599.99},
  //   {
  //     'nome': 'Maria Oliveira',
  //     'produto': 'Cadeira Escritório',
  //     'valor': 849.90,
  //   },
  //   {'nome': 'Pablo Alves', 'produto': 'Macbook Pro M1 Pro', 'valor': 7499.90},
  // ];
  final List<Map<String, dynamic>> pedidos = [];
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
        child: Column(
          children: [
            Expanded(
              child: pedidos.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Nenhum pedido encontrado.',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            width: 200,
                            child: ElevatedButton(
                              onPressed: () {
                                print('Adicionar Novo Pedido');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text(
                                'Novo Pedido',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: pedidos.length,
                      itemBuilder: (context, index) => Container(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nome: ${pedidos[index]['nome']}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Produto: ${pedidos[index]['produto']}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Valor: R\$ ${pedidos[index]['valor'].toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  print('Adicionar Novo Pedido');
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                child: const Text(
                  'Adicionar Novo Pedido',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
