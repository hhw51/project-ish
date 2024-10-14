import 'package:flutter/material.dart';
import 'package:red_coprative/account.dart';
import 'package:red_coprative/login.dart';
import 'package:red_coprative/models/viewproductmodelclass.dart';

class ViewproductScreen extends StatefulWidget {
  const ViewproductScreen({super.key});

  @override
  State<ViewproductScreen> createState() => _ViewproductScreenState();
}

class _ViewproductScreenState extends State<ViewproductScreen> {
  // Map to keep track of the count for each product
  Map<int, int> itemCounts = {};

  @override
  void initState() {
    super.initState();
    // Initialize the counter for each product as 1 (or 0)
    for (int i = 0; i < viewproductmodelclasslist.length; i++) {
      itemCounts[i] = 1; // You can start with 1, or change it to 0 if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            // Top section with back and logout icons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white, size: 32),
                    onPressed: () {
                      // Navigate back to the Account screen
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Accountscreen()),
                      );
                    },
                  ),
                  IconButton(
                    icon: Image.asset("assets/profilelogout.png"),
                    onPressed: () async {
                      // Handle logout
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            // Expanded widget to allow the ListView to take available space
            Expanded(
              child: ListView.builder(
                itemCount: viewproductmodelclasslist.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey[900], // Background color for each item
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: SizedBox(
                        height: 100,
                        width: 80,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: AssetImage("${viewproductmodelclasslist[index].image}"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${viewproductmodelclasslist[index].name}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "${viewproductmodelclasslist[index].description}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            children: [
                              Text(
                                "\$${viewproductmodelclasslist[index].price}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Icon(
                                Icons.blur_circular_rounded,
                                size: 16,
                                color: const Color.fromARGB(255, 165, 6, 13),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                "${viewproductmodelclasslist[index].points} pts",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // Trailing: Add to cart button
                      trailing: Image.asset(
                        "assets/Add to cart.png",
                        width: 40,
                        height: 40,
                        color: Colors.amber,
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.start, // Align the buttons to the right
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove_circle_outline, color: Colors.red, size: 20),
                            onPressed: () {
                              setState(() {
                                if (itemCounts[index]! > 1) {
                                  itemCounts[index] = itemCounts[index]! - 1;
                                }
                              });
                            },
                          ),
                          Text(
                            "${itemCounts[index]}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add_circle_outline, color: Colors.green, size: 20),
                            onPressed: () {
                              setState(() {
                                itemCounts[index] = itemCounts[index]! + 1;
                              });
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
        ),
      ),
    );
  }
}
