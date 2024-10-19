import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:apnifasaladmin/menubar/profile.dart';
import 'package:apnifasaladmin/menubar/retailers.dart';
import 'package:apnifasaladmin/menubar/my_orders.dart';
import 'package:apnifasaladmin/menubar/payment_dashboard.dart';
import 'package:apnifasaladmin/menubar/kisaan_community.dart';
import 'package:apnifasaladmin/menubar/notifications.dart';
import 'package:apnifasaladmin/menubar/help.dart';
import 'package:apnifasaladmin/login/loginpage.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Product Dashboard'),
            actions: [
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyApp(),
                    ),
                  );
                },
              ),
            ],
          ),
          body: ProductListScreen(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddEditProductScreen(),
                ),
              );
            },
            child: Icon(Icons.add),
            backgroundColor: Colors.green,
          ),
        ),
      ),
    );
  }
}

// Model class for Product
class Product {
  String name;
  int quantity;
  double price;

  Product({required this.name, required this.quantity, required this.price});
}

// Provider class for Product management
class ProductProvider extends ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }

  void editProduct(int index, Product product) {
    _products[index] = product;
    notifyListeners();
  }

  void deleteProduct(int index) {
    _products.removeAt(index);
    notifyListeners();
  }
}

// Screen showing the list of products
class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Namaste 🙏',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              SizedBox(height: 20),
              Text(
                '',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: productProvider.products.isEmpty
              ? Center(child: Text('No products added yet.'))
              : ListView.builder(
                  itemCount: productProvider.products.length,
                  itemBuilder: (context, index) {
                    final product = productProvider.products[index];
                    return Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 4,
                      child: ListTile(
                        leading: Icon(Icons.account_circle,
                            size: 40, color: Colors.teal),
                        title: Text(
                          product.name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            '${product.quantity}kg available | ${product.price} ₹/kg'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit, color: Colors.blue),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddEditProductScreen(
                                      product: product,
                                      index: index,
                                    ),
                                  ),
                                );
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                _showDeleteConfirmationDialog(context, index);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Product'),
        content: Text('Are you sure you want to delete this product?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('NO'),
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<ProductProvider>(context, listen: false)
                  .deleteProduct(index);
              Navigator.of(context).pop();
            },
            child: Text('YES'),
          ),
        ],
      ),
    );
  }
}

// Screen for adding and editing products
class AddEditProductScreen extends StatefulWidget {
  final Product? product;
  final int? index;

  AddEditProductScreen({this.product, this.index});

  @override
  _AddEditProductScreenState createState() => _AddEditProductScreenState();
}

class _AddEditProductScreenState extends State<AddEditProductScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late int _quantity;
  late double _price;

  @override
  void initState() {
    super.initState();
    if (widget.product != null) {
      _name = widget.product!.name;
      _quantity = widget.product!.quantity;
      _price = widget.product!.price;
    } else {
      _name = '';
      _quantity = 0;
      _price = 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product == null ? 'Add Product' : 'Edit Product'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _name,
                decoration: InputDecoration(labelText: 'Product Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter product name';
                  }
                  return null;
                },
                onSaved: (value) => _name = value!,
              ),
              TextFormField(
                initialValue: _quantity.toString(),
                decoration:
                    InputDecoration(labelText: 'Available quantity in Kg'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter quantity';
                  }
                  return null;
                },
                onSaved: (value) => _quantity = int.parse(value!),
              ),
              TextFormField(
                initialValue: _price.toString(),
                decoration: InputDecoration(labelText: 'Price/kg'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter price';
                  }
                  return null;
                },
                onSaved: (value) => _price = double.parse(value!),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (widget.product == null) {
                      Provider.of<ProductProvider>(context, listen: false)
                          .addProduct(
                        Product(
                            name: _name, quantity: _quantity, price: _price),
                      );
                      Navigator.pop(context);
                    } else {
                      Provider.of<ProductProvider>(context, listen: false)
                          .editProduct(
                        widget.index!,
                        Product(
                            name: _name, quantity: _quantity, price: _price),
                      );
                      Navigator.pop(context);
                    }
                  }
                },
                child: Text(widget.product == null ? 'Add' : 'Edit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Menu Screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ApniFasal App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/profile': (context) => UserProfilePage(),
        '/retailers': (context) => RetailersPage(),
        '/my_orders': (context) => MyOrdersPage(),
        '/payment_dashboard': (context) => PaymentDashboardPage(),
        '/kisaan_community': (context) => KisaanCommunityPage(),
        '/notifications': (context) => NotificationsPage(),
        '/help': (context) => HelpPage(),
        '/login': (context) => LoginScreen(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ApniFasal'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          ListTile(
            leading: Icon(Icons.store),
            title: Text('Retailers'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/retailers');
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('My Orders'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/my_orders');
            },
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Payment Dashboard'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/payment_dashboard');
            },
          ),
          ListTile(
            leading: Icon(Icons.group),
            title: Text('Kisaan Community'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/kisaan_community');
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/notifications');
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Help'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/help');
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
              icon: Icon(Icons.logout),
              label: Text('Log Out'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.green,
                backgroundColor: Colors.green[100],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
