//expense category class
//every expemse will have a category that it belongs to

import 'dart:math';

import 'package:flutter/material.dart';

class ExpenseCategory {
  final String title; //name of category
  int entries = 0; //number of entries
  int totalAmount = 0; //total amount in this category
  final IconData icon;

  //constructor
  ExpenseCategory({
    required this.title,
    required this.entries,
    required this.totalAmount,
    required this.icon,
  });

  //we need a method to convert this MODEL to a MAP so that it can be inserted into a database
  Map<String, dynamic> toMap() => {
        'title': title,
        'entries': entries,
        'totalAmount': totalAmount.toString(), //db doesnot store string
        //not storing icons in database
      };

  //we need a method to convert this MAP to a MODEL so that it can be inserted into a database
  factory ExpenseCategory.fromString(Map<String, dynamic> value) => ExpenseCategory(title: value['title'], entries: value['entries'], totalAmount: int.parse(value['totalAmount']), icon: icon)
  };
}
