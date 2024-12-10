import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payroll & Tax Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PayrollScreen(),
    );
  }
}

class PayrollScreen extends StatefulWidget {
  @override
  _PayrollScreenState createState() => _PayrollScreenState();
}

class _PayrollScreenState extends State<PayrollScreen> {
  double salary = 0;
  double taxRate = 10;
  double netSalary = 0;

  void calculateNetSalary() {
    setState(() {
      netSalary = salary - (salary * taxRate / 100);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payroll & Tax Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Gross Salary'),
              keyboardType: TextInputType.number,
              onChanged: (value) => salary = double.tryParse(value) ?? 0,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Tax Rate (%)'),
              keyboardType: TextInputType.number,
              onChanged: (value) => taxRate = double.tryParse(value) ?? 10,
            ),
            ElevatedButton(
              onPressed: calculateNetSalary,
              child: Text('Calculate'),
            ),
            Text('Net Salary: $netSalary'),
          ],
        ),
      ),
    );
  }
}