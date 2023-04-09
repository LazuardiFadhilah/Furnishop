class Cart {
  final String id;
  int qty;
  bool isSelected = false;

  Cart({
    required this.id,
    required this.qty,
    required this.isSelected,
  });
}
