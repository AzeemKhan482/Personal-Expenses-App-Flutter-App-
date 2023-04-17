import 'package:flutter/material.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';
import './widgets/transaction_list.dart';



void main()=> runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.indigo,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
          headline6: TextStyle(
            fontFamily: 'Opensans',
            fontWeight: FontWeight.bold,
            fontSize: 18,
          )
        ),
        appBarTheme: AppBarTheme(textTheme: ThemeData.light().textTheme.copyWith(headline6: TextStyle(fontFamily: 'OpenSans',
        fontSize: 20, fontWeight: FontWeight.bold))),

      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Transaction> _userTransactions=[
   // Transaction(id: 't1', tittle: 'New shoes', amount: 69.99, Date: DateTime.now(),),
   // Transaction(id: 't2', tittle: 'Weekly Groceries', amount: 16.53, Date: DateTime.now(),
  //    ),

  ];

  @override



  void _addNewTransaction(String txTittle, double txAmount){
    final newtx= Transaction(id: DateTime.now().toString(), tittle: txTittle, amount: txAmount, Date:DateTime.now(),
    );
    setState(() {
      _userTransactions.add(newtx);
    });
  }

void _startAddNewTransaction(BuildContext ctx){
  showModalBottomSheet(context:ctx, builder: (_){
    return GestureDetector(
        onTap: (){},
        child: NewTransaction(_addNewTransaction),
    behavior: HitTestBehavior.opaque,
    );

  },);

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Personal Expenses',style: TextStyle(fontFamily: 'Open Sans'),),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed:() =>_startAddNewTransaction(context),)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
            Container(
              width: double.infinity,
              child: Card(color: Theme.of(context).primaryColor,child: Text('CHART!'),
              elevation: 5,
              ),
            ),
              TransactionList(_userTransactions),
            ],
          ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),
      onPressed: () =>_startAddNewTransaction(context), ),
    );
  }
}
