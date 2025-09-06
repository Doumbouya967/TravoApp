import 'package:flutter/material.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  final List<Map<String, dynamic>> reviews = const [
    {
      "name": "Alice",
      "rating": 5,
      "comment": "Hôtel magnifique, personnel très accueillant. Je recommande !",
      "date": "12 août 2025",
    },
    {
      "name": "Mamadou",
      "rating": 4,
      "comment": "Bonne expérience, chambres propres et confortables.",
      "date": "05 août 2025",
    },
    {
      "name": "Fatou",
      "rating": 3,
      "comment": "Correct mais un peu bruyant la nuit.",
      "date": "20 juillet 2025",
    },
  ];

  Widget _buildStars(int rating) {
    return Row(
      children: List.generate(
        5,
        (index) => Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: Colors.amber,
          size: 18,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double avgRating =
        reviews.map((e) => e["rating"]).reduce((a, b) => a + b) /
            reviews.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Reviews"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Moyenne
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "⭐ ${avgRating.toStringAsFixed(1)} / 5.0",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("${reviews.length} avis"),
              ],
            ),
            const SizedBox(height: 20),

            // Liste d’avis
            Expanded(
              child: ListView.builder(
                itemCount: reviews.length,
                itemBuilder: (context, index) {
                  final review = reviews[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Nom + Date
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                review["name"],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                review["date"],
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.black54),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),

                          // Stars
                          _buildStars(review["rating"]),
                          const SizedBox(height: 8),

                          // Commentaire
                          Text(
                            review["comment"],
                            style: const TextStyle(fontSize: 14),
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

      // Bouton flottant
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Ajout d’avis (à implémenter)")),
          );
        },
        child: const Icon(Icons.add_comment, color: Colors.white),
      ),
    );
  }
}
