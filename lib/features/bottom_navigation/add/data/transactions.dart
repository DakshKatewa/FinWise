class Transaction {
  final String name; // Name of the category (e.g., Shopping, Rent)
  final double value; // Amount for the transaction
  final bool isExpense; // Whether it's an expense or income
  final String iconPath;

  Transaction({
    required this.name,
    required this.value,
    required this.isExpense,
    required this.iconPath,
  });
}
