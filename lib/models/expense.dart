import 'package:flutter/material.dart';

//Expense class, every expense will be an object of this class
class Expense {
  final int id; //unique id for every expense
  final String title; //title for every expense
  final int amount; //amt spent on every transaction
  final DateTime date; //date of the transaction
  final String category; //category of the transaction

  //constructor
  Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  });

  //MODEL to MAP
  Map<String, dynamic> toMap() => {
        //id will be generated automatically
        'title': title,
        'amount': amount.toString(),
        'date': date.toString(),
        'category': category,
      };

  //MAP to Expense MODEL
  factory Expense.fromString(Map<String, dynamic> value) => Expense(
        id: value['id'],
        title: value['title'],
        amount: int.parse(value['amount']),
        date: DateTime.parse(value['date']),
        category: value['category'],
      );
}
