import 'package:flutter/material.dart';

void showPurchaseDetails(BuildContext context, Map<String, dynamic> purchaseData) {
  List<dynamic> names = purchaseData['names'];
  List<dynamic> descriptions = purchaseData['descriptions'];
  List<dynamic> imageUrls = purchaseData['imageUrls'];
  List<dynamic> points = purchaseData['points'];
  List<dynamic> prices = purchaseData['prices'];
  List<dynamic> quantities = purchaseData['quantities'];

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.black,
        title: const Text(
          "Purchase Details",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        content: SizedBox(
          width: double.maxFinite,
          height: 600,
          child: ListView.builder(
            itemCount: names.length,
            itemBuilder: (context, index) {
              return Card(
                color: const Color.fromARGB(38, 255, 255, 255),
                child: ListTile(
                  leading: Image.network(
                    imageUrls[index],
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(
                    names[index],
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(descriptions[index], style: const TextStyle(color: Colors.white)),
                      Text('Price: \$${prices[index]}', style: const TextStyle(color: Colors.white)),
                      Text('Points: ${points[index]}', style: const TextStyle(color: Colors.white)),
                      Text('Quantity: ${quantities[index]}', style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            style: TextButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: const Text(
              "Close",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      );
    },
  );
}