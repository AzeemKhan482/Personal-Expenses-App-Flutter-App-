import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function  addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final tittleController=TextEditingController();

  final amountController=TextEditingController();

  void submitData(){
    final enteredTitle= tittleController.text;
    final enteredAmount=double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0){
      return;
    }
    widget.addTx(enteredTitle,enteredAmount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation:5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(decoration: InputDecoration(labelText:'Tittle' ),
              //  onChanged: (val){titleInput=val;},
              controller: tittleController,
              onSubmitted: (_)=> submitData(),
            ),
            TextField(decoration: InputDecoration(labelText:'Amount' ),

              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_)=> submitData(),
            ),
            TextButton
              (child: Text('Add Transaction'),

              onPressed: submitData,
            ),
          ],),
      ),
    );
  }
}
