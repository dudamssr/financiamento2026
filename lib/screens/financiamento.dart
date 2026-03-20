import 'package:flutter/material.dart';

class Financiamento extends StatefulWidget {
  const Financiamento({super.key});

  @override
  State<Financiamento> createState() => _FinanciamentoState();
}

class _FinanciamentoState extends State<Financiamento> {
  final valorController = TextEditingController();
  final taxaController = TextEditingController();
  final parcelasController = TextEditingController();
  final taxasController = TextEditingController();

  double total = 0;
  double parcela = 0;

  void calcular() {
    double valor = double.tryParse(valorController.text) ?? 0;
    double taxa = (double.tryParse(taxaController.text) ?? 0) / 100;
    int parcelas = int.tryParse(parcelasController.text) ?? 1;
    double taxas = double.tryParse(taxasController.text) ?? 0;

    total = valor + (valor * taxa * parcelas) + taxas;
    parcela = total / parcelas;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: const Text("Resultado"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Total: R\$ ${total.toStringAsFixed(2)}"),
            Text("Parcela: R\$ ${parcela.toStringAsFixed(2)}"),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFE6E1),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 320,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                const Text(
                  "Simulador de\nFinanciamento",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 20),

                campo("Valor do financiamento", valorController),
                campo("Taxa de juros (%)", taxaController),
                campo("Número de parcelas", parcelasController),
                campo("Taxas adicionais", taxasController),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: calcular,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4E342E),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Calcular",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                Text(
                  "Valor total: R\$ ${total.toStringAsFixed(2)}",
                  style: const TextStyle(fontSize: 14),
                ),
                Text(
                  "Parcela: R\$ ${parcela.toStringAsFixed(2)}",
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget campo(String label, controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: "Digite aqui",
          labelText: label,
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
