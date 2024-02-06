import 'package:flutter/material.dart';

class Alert{
  Future showAlert(BuildContext context, String title, String message) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          content: Text(
            message,
            style: const TextStyle(fontSize: 15),
          ),
          actions: [
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 50,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.brown, boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2), // Shadow color
                        spreadRadius: 2, // Spread radius of the shadow
                        blurRadius: 4, // Blur radius of the shadow
                        offset: Offset(0, 2), // Offset of the shadow
                      ),
                    ]),
                    child: const Center(
                      child:  Text(
                        "OK",
                        style:  TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
