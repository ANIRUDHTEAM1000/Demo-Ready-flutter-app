// To parse this JSON data, do
//
//     final Transactions = TransactionsFromJson(jsonString);

import 'dart:convert';

Transactions TransactionsFromJson(String str) =>
    Transactions.fromJson(json.decode(str));

String TransactionsToJson(Transactions data) => json.encode(data.toJson());

class Transactions {
  Transactions({
    required this.status,
    required this.totalPages,
    required this.transactions,
  });

  int status;
  int totalPages;
  List<Transaction> transactions;

  factory Transactions.fromJson(Map<String, dynamic> json) => Transactions(
        status: json["status"],
        totalPages: json["total_pages"],
        transactions: List<Transaction>.from(
            json["transactions"].map((x) => Transaction.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "total_pages": totalPages,
        "transactions": List<dynamic>.from(transactions.map((x) => x.toJson())),
      };
}

class Transaction {
  Transaction({
    required this.name,
    required this.amount,
    required this.date,
    required this.transactionNumber,
  });

  String name;
  int amount;
  DateTime date;
  String transactionNumber;

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        name: json["name"],
        amount: json["amount"],
        date: DateTime.parse(json["date"]),
        transactionNumber: json["transaction_number"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "amount": amount,
        "date": date.toIso8601String(),
        "transaction_number": transactionNumber,
      };
}
