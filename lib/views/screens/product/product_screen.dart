import 'package:dars6/services/products_http_service.dart';
import 'package:dars6/views/screens/categories/category_screen.dart';
import 'package:dars6/views/screens/users/user_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product_detail.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Products',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.blueGrey[900],
              padding: const EdgeInsets.only(top: 40, bottom: 20),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage("assets/images/person.jpg"),
                    ),
                  ),
                  const Text(
                    'User Name',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '@username',
                    style: TextStyle(color: Colors.grey[400], fontSize: 14),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.shopping_basket,
                color: Colors.blueGrey[800],
              ),
              title: const Text('Products'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading:
                  Icon(Icons.category_rounded, color: Colors.blueGrey[800]),
              title: const Text('Categories'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.group, color: Colors.blueGrey[800]),
              title: const Text('Users'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserListScreen(),
                  ),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.person, color: Colors.blueGrey[800]),
              title: const Text('Contacts'),
              onTap: () {
                // Handle the onTap
              },
            ),
            ListTile(
              leading: Icon(Icons.phone, color: Colors.blueGrey[800]),
              title: Text('Calls'),
              onTap: () {
                // Handle the onTap
              },
            ),
            ListTile(
              leading: Icon(Icons.bookmark_border, color: Colors.blueGrey[800]),
              title: Text('Saved Messages'),
              onTap: () {
                // Handle the onTap
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.blueGrey[800]),
              title: Text('Settings'),
              onTap: () {
                // Handle the onTap
              },
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ListTile(
                  leading: Icon(Icons.exit_to_app, color: Colors.red),
                  title: Text('Logout'),
                  onTap: () {
                    // Handle the onTap
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      body: FutureBuilder(
        future: Provider.of<ProductViewModel>(context, listen: false)
            .fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Consumer<ProductViewModel>(
              builder: (context, productViewModel, child) {
                return ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: productViewModel.products.length - 10,
                  itemBuilder: (context, index) {
                    final product = productViewModel.products[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProductDetail(product: product),
                              ),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                                child: FadeInImage(
                                  imageErrorBuilder: (context, error,
                                          stackTrace) =>
                                      Image.asset("assets/images/black.png"),
                                  placeholder: const AssetImage(
                                    "assets/gif/loading.gif",
                                  ),
                                  image: NetworkImage(
                                    product.images,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.title,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      '\$${product.price}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.green,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      product.description,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
