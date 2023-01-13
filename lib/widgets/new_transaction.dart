import 'package:flutter/material.dart';

class newTransaction extends StatefulWidget {
  newTransaction(this.newTx);
  final Function newTx;

  @override
  State<newTransaction> createState() => _newTransactionState();
}

class _newTransactionState extends State<newTransaction> {
  final tittleController = TextEditingController();

  final amountController = TextEditingController();

  void dataSubmit() {
    final enteredTitle = tittleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.newTx(enteredTitle, enteredAmount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Tittle',
              ),
              controller: tittleController,
              onSubmitted: (_) => dataSubmit(),
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Amount',
              ),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => dataSubmit(),
            ),
            TextButton(
              onPressed: dataSubmit,
              child: const Text(
                'Add tracsaction',
                style: TextStyle(color: Colors.purple),
              ),
            )
          ],
        ),
      ),
    );
  }
}
