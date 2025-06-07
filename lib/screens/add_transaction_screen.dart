import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import '../providers/transaction_provider.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final _formKey = GlobalKey<FormState>();

  double? _amount;
  bool _isIncome = false;
  String _category = 'Food';
  String _note = '';
  DateTime _selectedDate = DateTime.now();

  final List<String> _categories = [
    'Food',
    'Bills',
    'Transport',
    'Salary',
    'Other',
  ];

  Future<void> _pickDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final newTransaction = Transaction(
        id: DateTime.now().toString(),
        amount: _amount!,
        isIncome: _isIncome,
        category: _category,
        note: _note,
        date: _selectedDate,
      );

      Provider.of<TransactionProvider>(context, listen: false)
          .addTransaction(newTransaction);

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateFormatted = DateFormat.yMd().format(_selectedDate);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Transaction'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Amount input
              TextFormField(
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: 'Amount',
                  prefixText: '\Rs ',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an amount.';
                  }
                  final amount = double.tryParse(value);
                  if (amount == null || amount <= 0) {
                    return 'Enter a valid amount greater than zero.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _amount = double.parse(value!);
                },
              ),
              const SizedBox(height: 16),

              // Type toggle
              Row(
                children: [
                  const Text('Type:'),
                  const SizedBox(width: 16),
                  ChoiceChip(
                    label: const Text('Income'),
                    selected: _isIncome,
                    onSelected: (selected) {
                      setState(() {
                        _isIncome = selected;
                      });
                    },
                  ),
                  const SizedBox(width: 8),
                  ChoiceChip(
                    label: const Text('Expense'),
                    selected: !_isIncome,
                    onSelected: (selected) {
                      setState(() {
                        _isIncome = !selected;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Category dropdown
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(),
                ),
                value: _category,
                items: _categories
                    .map((cat) => DropdownMenuItem(
                          value: cat,
                          child: Text(cat),
                        ))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    _category = val!;
                  });
                },
              ),
              const SizedBox(height: 16),

              // Note input
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Note',
                  border: OutlineInputBorder(),
                ),
                maxLines: 2,
                onSaved: (val) {
                  _note = val ?? '';
                },
              ),
              const SizedBox(height: 16),

              // Date picker
              Row(
                children: [
                  const Text('Date:'),
                  const SizedBox(width: 16),
                  Text(dateFormatted),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: _pickDate,
                    child: const Text('Select Date'),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              ElevatedButton(
                onPressed: _saveForm,
                child: const Text('Save Transaction'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
