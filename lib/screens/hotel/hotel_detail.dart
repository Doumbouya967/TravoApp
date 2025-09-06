import 'package:flutter/material.dart';

class HotelDetailScreen extends StatelessWidget {
  const HotelDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final hotel =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          // IMAGE + prix
          Stack(
            children: [
              Image.network(
                hotel["image"],
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "\$${hotel["price"]} / nuit",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 10,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),

          // INFOS SCROLLABLE
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nom + localisation
                  Text(
                    hotel["name"],
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.location_on,
                          color: Colors.deepPurple, size: 18),
                      const SizedBox(width: 5),
                      Text(
                        hotel["location"],
                        style: const TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Note étoiles (mock)
                  Row(
                    children: List.generate(
                      5,
                      (index) => const Icon(Icons.star,
                          color: Colors.amber, size: 20),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Description
                  const Text(
                    "Informations",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Situé en plein centre-ville, cet hôtel de luxe offre une vue magnifique sur la mer et propose des chambres spacieuses avec toutes les commodités modernes. Idéal pour vos voyages d'affaires ou vos vacances.",
                    style: TextStyle(color: Colors.black87, height: 1.4),
                  ),
                  const SizedBox(height: 20),

                  // Carte (mock image google maps)
                  const Text(
                    "Localisation",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      "https://maps.googleapis.com/maps/api/staticmap?center=Paris&zoom=13&size=600x300&maptype=roadmap&key=AIzaSyD-ExempleFakeAPIKey",
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Bouton voir les avis
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/reviews');
                    },
                    child: const Text("Voir les avis"),
                  ),

                  const SizedBox(height: 100), // espace avant bouton Select Room
                ],
              ),
            ),
          ),
        ],
      ),

      // Bouton flottant en bas
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            backgroundColor: Colors.deepPurple,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/selectRoom');
          },
          child: const Text(
            "Select Room",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
