import 'package:flutter/material.dart';

void main() {
  runApp(CarrinhoApp());
}

class Produto {
  final String nome;
  final double preco;
  final String imagemUrl;

  Produto(this.nome, this.preco, this.imagemUrl);
}

class CarrinhoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carrinho de Compras',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CarrinhoPage(),
    );
  }
}

class CarrinhoPage extends StatefulWidget {
  @override
  _CarrinhoPageState createState() => _CarrinhoPageState();
}

class _CarrinhoPageState extends State<CarrinhoPage> {
  List<Produto> produtos = [
    Produto("Camiseta", 49.99, "https://placehold.co/150x100/FF0000/FFFFFF/png"),
    Produto("Tênis", 149.90, "https://placehold.co/150x100/FFFF00/000000/png"),
    Produto("Calça", 89.50, "https://placehold.co/150x100/FFA500/FFFFFF/png"),
    Produto("Boné", 29.99, "https://placehold.co/150x100/F5DEB3/000000/png"),
    Produto("Jaqueta", 199.99, "https://placehold.co/150x100/FFFFFF/000000/png"),
    Produto("Bolsa", 120.00, "https://placehold.co/150x100/6F4E37/FFFFFF/png"),
  ];

  double total = 0.0;

  void adicionarAoCarrinho(double preco) {
    setState(() {
      total += preco;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Carrinho de Compras")),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  itemCount: produtos.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 3 / 4,
                  ),
                  itemBuilder: (context, index) {
                    final produto = produtos[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Image.network(produto.imagemUrl, height: 80),
                          SizedBox(height: 10),
                          Text(produto.nome, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          Text("R\$ ${produto.preco.toStringAsFixed(2)}"),
                          Spacer(),
                          ElevatedButton(
                            onPressed: () => adicionarAoCarrinho(produto.preco),
                            child: Text("Adicionar"),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              color: Colors.blue,
              width: double.infinity,
              padding: EdgeInsets.all(16),
              child: Text(
                "Total: R\$ ${total.toStringAsFixed(2)}",
                style: TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
