// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:red_coprative/account.dart';

class CashWithdrawScreen extends StatefulWidget {
  const CashWithdrawScreen({super.key});

  @override
  State<CashWithdrawScreen> createState() => _CashWithdrawScreenState();
}

class _CashWithdrawScreenState extends State<CashWithdrawScreen> {
  final TextEditingController _accountTitleController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  String? _accountType; // To track selected account type

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 94, 156, 70),
      body: Container(
        child: Column(
          children: [
            // Top section with app name and QR code icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white, size: 32),
                  onPressed: () {
                    // Navigate to the Account screen
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Accountscreen()),
                    );
                  },
                ),
                Icon(
                  Icons.qr_code_scanner_sharp,
                  size: 28,
                  color: Colors.white,
                ),
              ],
            ),

            // Wallet balance section
            Container(
              width: double.infinity,
              height: 210,
              decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(14)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 19, vertical: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Cash Wallet",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    Row(
                      children: [
                        Text(
                          "Rs",
                          style: TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 2),
                        Text(
                          "1599",
                          style: TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 58), // Reduced height for better spacing
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildSmallButton(
                          icon: Icons.send,
                          label: "Send",
                          onPressed: () {
                            print('Sending cash...');
                          },
                        ),
                        _buildSmallButton(
                          icon: Icons.branding_watermark_sharp,
                          label: "Withdraw",
                          onPressed: () {
                            print('Cash Withdraw...');
                          },
                        ),
                        _buildSmallButton(
                          icon: Icons.history,
                          label: "View History",
                          onPressed: () {
                            print('Viewing account history...');
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20), // Added spacing before "Withdraw Cash" text
            Text(
              "Withdraw Cash",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
            ),

            // Account Title TextField
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Account Title",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextField(
                    controller: _accountTitleController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10), // Set radius here
                        borderSide: BorderSide.none,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always, // Make label float above
                    ),
                  ),
                ],
              ),
            ),

            // Mobile Number TextField
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mobile Number",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextField(
                    controller: _mobileNumberController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10), // Set radius here
                        borderSide: BorderSide.none,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always, // Make label float above
                    ),
                    keyboardType: TextInputType.phone, // Phone keyboard for mobile number
                  ),
                ],
              ),
            ),

            // Account Type Row with Easypaisa and JazzCash options
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _accountType = "Easypaisa";
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: _accountType == "Easypaisa" ? Colors.red : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.red),
                      ),
                      child: Text("Easypaisa", style: TextStyle(color: Colors.red)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _accountType = "JazzCash";
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: _accountType == "JazzCash" ? Colors.red : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.red),
                      ),
                      child: Text("JazzCash", style: TextStyle(color: Colors.red)),
                    ),
                  ),
                ],
              ),
            ),

            // Amount TextField
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Amount",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextField(
                    controller: _amountController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10), // Set radius here
                        borderSide: BorderSide.none,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always, // Make label float above
                    ),
                    keyboardType: TextInputType.number, // Numeric keyboard for amount
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to create smaller buttons
  Widget _buildSmallButton({required IconData icon, required String label, required VoidCallback onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10), // Smaller padding
        backgroundColor: Colors.white, // Button background color
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.red, size: 18), // Smaller icon
          SizedBox(width: 10),
          Text(
            label,
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold), // Smaller text size
          ),
        ],
      ),
    );
  }
}
