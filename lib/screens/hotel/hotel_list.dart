import 'package:flutter/material.dart';

class HotelListScreen extends StatelessWidget {
  const HotelListScreen({super.key});

  // Données fictives (mock)
  final List<Map<String, dynamic>> hotels = const [
    {
      "name": "Hotel Riviera",
      "location": "Conakry, Guinée",
      "price": 90,
      "image": "https://picsum.photos/400/250?random=1",
    },
    {
      "name": "Pullman Dakar",
      "location": "Dakar, Sénégal",
      "price": 120,
      "image": "https://picsum.photos/400/250?random=2",
    },
    {
      "name": "Radisson Blu",
      "location": "Abidjan, Côte d’Ivoire",
      "price": 140,
      "image": "https://picsum.photos/400/250?random=3",
    },
    {
      "name": "Novotel Paris",
      "location": "Paris, France",
      "price": 200,
      "image": "https://picsum.photos/400/250?random=4",
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Récupération de l'argument (destination cliquée depuis Home)
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    String destination = args?["destination"] ?? "Destination";
    int? budget = args?["price"];

    // Filtrer les hôtels par destination (exemple simple : si le nom contient la ville)
    final filteredHotels = hotels
        .where((hotel) =>
            hotel["location"].toString().toLowerCase().contains(destination.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Hôtels à $destination"),
        backgroundColor: Colors.deepPurple,
      ),
      body: filteredHotels.isEmpty
          ? Center(
              child: Text(
                "Aucun hôtel trouvé pour $destination",
                style: const TextStyle(fontSize: 16, color: Colors.black54),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: filteredHotels.length,
              itemBuilder: (context, index) {
                final hotel = filteredHotels[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  margin: const EdgeInsets.only(bottom: 16),
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image
                      Image.network(
                        hotel["image"],
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Nom de l’hôtel
                            Text(
                              hotel["name"],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),

                            // Localisation
                            Row(
                              children: [
                                const Icon(Icons.location_on,
                                    size: 16, color: Colors.grey),
                                const SizedBox(width: 5),
                                Text(
                                  hotel["location"],
                                  style:
                                      const TextStyle(color: Colors.black54),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),

                            // Prix + bouton
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "\$${hotel["price"]} / nuit",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.deepPurple,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/hotelDetail',
                                      arguments: hotel,
                                    );
                                  },
                                  child: const Text("Book Now"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
