import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ConfirmPayment extends StatelessWidget {
  const ConfirmPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.blueAccent[700],
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Column(
                children: [
                  const Icon(
                    Icons.check,
                    size: 100.0,
                    color: Colors.white,
                  ),
                  Text(
                    "Payment Successful".toUpperCase(),
                    style: const TextStyle(color: Colors.white, fontSize: 24.0),
                  ),
                ],
              ),
            ),
            Text(
              "Thank you for your purchase \n enjoy your pristine life",
              style: TextStyle(
                  color: Colors.white.withOpacity(0.5), fontSize: 16.0),
            ),
            const Divider(),
            const SizedBox(
              height: 20.0,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Transaction Number: ",
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                    Text("123456789",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold))
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text(
                      "Paid: ",
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                    Text("\$10.00",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text(
                      "Gateway: ",
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                    Text("Google Pay",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold))
                  ],
                ),
              ],
            ),
            const SizedBox(height: 80.0),
            SizedBox(
              height: 80.0,
              width: 200.0,
              child: ElevatedButton(
                  onPressed: () => context.pop(),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      )),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 99, 135, 255))),
                  child: const Text(
                    "Done",
                    style: TextStyle(color: Colors.white,fontSize: 24.0),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
