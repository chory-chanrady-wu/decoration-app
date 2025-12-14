import 'package:flutter/material.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';
import 'product_detail_screen.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CartItem> cartItems = [];
  String selectedCategory = 'All';

  final List<Product> allProducts = [
    Product(
      id: 1,
      name: 'Modern Sofa',
      category: 'Furniture',
      price: 499.99,
      image: '🛋️',
      description: 'Comfortable modern sofa with premium fabric',
      rating: 4.5,
    ),
    Product(
      id: 2,
      name: 'Wooden Dining Table',
      category: 'Furniture',
      price: 349.99,
      image: '🪑',
      description: 'Elegant wooden dining table for 6 people',
      rating: 4.7,
    ),
    Product(
      id: 3,
      name: 'LED Wall Light',
      category: 'Decoration',
      price: 79.99,
      image: '💡',
      description: 'Modern LED wall light with adjustable brightness',
      rating: 4.3,
    ),
    Product(
      id: 4,
      name: 'Wooden Shelf',
      category: 'Furniture',
      price: 129.99,
      image: '📦',
      description: 'Floating wooden shelves for storage',
      rating: 4.6,
    ),
    Product(
      id: 5,
      name: 'Plant Pot',
      category: 'Decoration',
      price: 29.99,
      image: '🪴',
      description: 'Ceramic plant pot with drainage holes',
      rating: 4.2,
    ),
    Product(
      id: 6,
      name: 'Wall Mirror',
      category: 'Decoration',
      price: 89.99,
      image: '🪞',
      description: 'Decorative wall mirror with wooden frame',
      rating: 4.8,
    ),
    Product(
      id: 7,
      name: 'Coffee Table',
      category: 'Furniture',
      price: 199.99,
      image: '🛏️',
      description: 'Sleek coffee table with glass top',
      rating: 4.4,
    ),
    Product(
      id: 8,
      name: 'Picture Frame Set',
      category: 'Decoration',
      price: 49.99,
      image: '🖼️',
      description: 'Set of 3 decorative picture frames',
      rating: 4.1,
    ),
    Product(
      id: 9,
      name: 'Recliner Chair',
      category: 'Furniture',
      price: 599.99,
      image: '🪑',
      description: 'Comfortable recliner chair with massage feature',
      rating: 4.9,
    ),
    Product(
      id: 10,
      name: 'Desk Lamp',
      category: 'Decoration',
      price: 69.99,
      image: '🕯️',
      description: 'LED desk lamp with USB charging port',
      rating: 4.4,
    ),
    Product(
      id: 11,
      name: 'Bed Frame',
      category: 'Furniture',
      price: 799.99,
      image: '🛏️',
      description: 'King size bed frame with storage drawers',
      rating: 4.7,
    ),
    Product(
      id: 12,
      name: 'Wall Decor Canvas',
      category: 'Decoration',
      price: 59.99,
      image: '🎨',
      description: 'Modern abstract wall art canvas',
      rating: 4.5,
    ),
    Product(
      id: 13,
      name: 'Bookshelf',
      category: 'Furniture',
      price: 249.99,
      image: '📚',
      description: 'Tall wooden bookshelf with 5 shelves',
      rating: 4.6,
    ),
    Product(
      id: 14,
      name: 'Table Runner',
      category: 'Decoration',
      price: 34.99,
      image: '📋',
      description: 'Elegant linen table runner for dining',
      rating: 4.3,
    ),
    Product(
      id: 15,
      name: 'Office Desk',
      category: 'Furniture',
      price: 449.99,
      image: '🖥️',
      description: 'Spacious office desk with drawers',
      rating: 4.8,
    ),
    Product(
      id: 16,
      name: 'Throw Pillow',
      category: 'Decoration',
      price: 39.99,
      image: '🎀',
      description: 'Decorative throw pillow with premium filling',
      rating: 4.2,
    ),
    Product(
      id: 17,
      name: 'TV Stand',
      category: 'Furniture',
      price: 299.99,
      image: '📺',
      description: 'Modern TV stand with storage cabinet',
      rating: 4.7,
    ),
    Product(
      id: 18,
      name: 'Wall Clock',
      category: 'Decoration',
      price: 44.99,
      image: '⏰',
      description: 'Minimalist wall clock with silent movement',
      rating: 4.4,
    ),
  ];

  List<Product> get filteredProducts {
    if (selectedCategory == 'All') {
      return allProducts;
    }
    return allProducts
        .where((product) => product.category == selectedCategory)
        .toList();
  }

  void addToCart(Product product) {
    _showQuantityDialog(product);
  }

  void addToCartWithQuantity(Product product, int quantity) {
    setState(() {
      final existingItem = cartItems.firstWhere(
        (item) => item.product.id == product.id,
        orElse: () => CartItem(product: product, quantity: quantity),
      );
      if (cartItems.contains(existingItem)) {
        existingItem.quantity += quantity;
      } else {
        cartItems.add(existingItem);
      }
    });
  }

  void _showQuantityDialog(Product product) {
    int quantity = 1;
    final TextEditingController quantityController = TextEditingController(
      text: '1',
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: Text(product.name),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Enter quantity:',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: quantityController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      hintText: '1',
                      prefixIcon: const Icon(Icons.shopping_bag),
                    ),
                    onChanged: (value) {
                      setDialogState(() {
                        quantity = int.tryParse(value) ?? 1;
                        if (quantity < 1) quantity = 1;
                      });
                    },
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Price per item: \$${product.price.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Total: \$${(product.price * quantity).toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (quantity > 0) {
                      setState(() {
                        final existingItem = cartItems.firstWhere(
                          (item) => item.product.id == product.id,
                          orElse: () =>
                              CartItem(product: product, quantity: quantity),
                        );
                        if (cartItems.contains(existingItem)) {
                          existingItem.quantity += quantity;
                        } else {
                          cartItems.add(existingItem);
                        }
                      });
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Added $quantity ${product.name}(s) to cart!',
                          ),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  child: const Text('Add to Cart'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Furniture & Decoration'),
        centerTitle: true,
        elevation: 0,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(
                        cartItems: cartItems,
                        onUpdate: () {
                          setState(() {});
                        },
                      ),
                    ),
                  );
                },
              ),
              if (cartItems.isNotEmpty)
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '${cartItems.length}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // Category Filter
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildCategoryChip('All'),
                  const SizedBox(width: 8),
                  _buildCategoryChip('Furniture'),
                  const SizedBox(width: 8),
                  _buildCategoryChip('Decoration'),
                ],
              ),
            ),
          ),
          // Product Grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  product: filteredProducts[index],
                  onAddToCart: () => addToCart(filteredProducts[index]),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(
                          product: filteredProducts[index],
                          onAddToCart: addToCartWithQuantity,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String category) {
    return FilterChip(
      label: Text(category),
      selected: selectedCategory == category,
      onSelected: (selected) {
        setState(() {
          selectedCategory = category;
        });
      },
    );
  }
}
