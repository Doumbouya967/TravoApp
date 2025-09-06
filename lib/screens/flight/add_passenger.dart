import 'package:flutter/material.dart';

class AddPassengerScreen extends StatefulWidget {
  const AddPassengerScreen({super.key});

  @override
  State<AddPassengerScreen> createState() => _AddPassengerScreenState();
}

class _AddPassengerScreenState extends State<AddPassengerScreen> {
  int adults = 1;
  int children = 0;
  int infants = 0;

  Widget _buildCounter(String label, int count, VoidCallback onAdd, VoidCallback onRemove) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            Row(
              children: [
                IconButton(
                  onPressed: onRemove,
                  icon: const Icon(Icons.remove_circle, color: Colors.red),
                ),
                Text(
                  "$count",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: onAdd,
                  icon: const Icon(Icons.add_circle, color: Colors.green),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Passengers"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildCounter(
              "Adults",
              adults,
              () => setState(() => adults++),
              () => setState(() {
                if (adults > 1) adults--;
              }),
            ),
            _buildCounter(
              "Children",
              children,
              () => setState(() => children++),
              () => setState(() {
                if (children > 0) children--;
              }),
            ),
            _buildCounter(
              "Infants",
              infants,
              () => setState(() => infants++),
              () => setState(() {
                if (infants > 0) infants--;
              }),
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/selectSeat', arguments: {
                  "adults": adults,
                  "children": children,
                  "infants": infants,
                });
              },
              child: const Center(
                child: Text(
                  "Next",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
