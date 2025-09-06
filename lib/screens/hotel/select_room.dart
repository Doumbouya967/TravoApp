import 'package:flutter/material.dart';

class SelectRoomScreen extends StatelessWidget {
  const SelectRoomScreen({super.key});

  final List<Map<String, dynamic>> rooms = const [
    {
      "name": "Deluxe Room",
      "details": "Lit Queen • 25 m² • Petit-déjeuner inclus",
      "price": 245,
    },
    {
      "name": "Executive Suite",
      "details": "Lit King • 40 m² • Vue mer",
      "price": 289,
    },
    {
      "name": "King Bed Only Room",
      "details": "Lit King • 22 m² • Salle de bain privée",
      "price": 214,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Room"),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: rooms.length,
        itemBuilder: (context, index) {
          final room = rooms[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Infos chambre
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          room["name"],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          room["details"],
                          style: const TextStyle(color: Colors.black54),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "\$${room["price"]}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Bouton Choose
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/hotelCheckout',
                          arguments: room);
                    },
                    child: const Text("Choose"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
