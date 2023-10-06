class RowItem {
  final String imagePath;
  final String name;
  final String accountNumber;
  String expiryDate; // Change expiryDate to a non-final variable
  final String cvvNumber;

  RowItem({
    this.imagePath = "assets/images/cards.jpg",
    required this.cvvNumber,
    required this.name,
    required this.accountNumber,
    String? expiryDate, // Make expiryDate optional
  }) : expiryDate = expiryDate ?? "12/03/2023";
}
