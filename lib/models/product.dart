class Product {
  Product({
    required this.id,
    required this.img,
    required this.title,
    required this.price,
    this.quantity = 1,
  });

  final int id;
  final String img;
  final String title;
  final double price;
  int quantity;

}

final products = [
  Product(
    id: 1,
    img: 'assets/airpods_pro.jpeg',
    title: 'Airpods Pro',
    price: 249.99,
    
  ),
  Product(
    id: 2,
    img: 'assets/ip15.jpg',
    title: 'iPhone 15 pro',
    price: 999.99,
    
  ),
  Product(
    id: 3,
    img: 'assets/macbook_pro.jpeg',
    title: 'MacBook Pro 14 2024',
    price: 1538.99,
    
  ),
  Product(
    id: 4,
    img: 'assets/series9.jpg',
    title: 'Apple Watch Series 9',
    price: 449.99,
    
  ),
  Product(
    id: 5,
    img: 'assets/imac.jpg',
    title: 'iMac',
    price: 1089.99,
    
  ),
  Product(
    id: 6,
    img: 'assets/airpodsmax.webp',
    title: 'Airpods Max',
    price: 649.99,
    
  ),
];
