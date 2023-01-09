class Items {
  final String id;
  final String title;
  final String desc;
  final int price;
  final String catId;
  final List img;
  bool isFavorite = false;

  Items({
    required this.id,
    required this.title,
    required this.desc,
    required this.price,
    required this.catId,
    required this.img,
    required this.isFavorite,
  });
}
