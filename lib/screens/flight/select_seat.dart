import 'package:flutter/material.dart';

class SelectSeatScreen extends StatefulWidget {
  const SelectSeatScreen({super.key});

  @override
  State<SelectSeatScreen> createState() => _SelectSeatScreenState();
}

class _SelectSeatScreenState extends State<SelectSeatScreen> {
  final int rows = 8; // nombre de rangées
  final int cols = 4; // sièges par rangée
  final List<String> selectedSeats = [];
  final List<String> occupiedSeats = ["1B", "3C", "5A"]; // mock

  String seatId(int row, int col) {
    const letters = ["A", "B", "C", "D"];
    return "${row + 1}${letters[col]}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Seat"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          // Légende
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLegend(Colors.grey.shade300, "Libre"),
              const SizedBox(width: 15),
              _buildLegend(Colors.deepPurple, "Sélectionné"),
              const SizedBox(width: 15),
              _buildLegend(Colors.grey.shade600, "Occupé"),
            ],
          ),
          const SizedBox(height: 20),

          // Grille des sièges
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: cols,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
              ),
              itemCount: rows * cols,
              itemBuilder: (context, index) {
                int row = index ~/ cols;
                int col = index % cols;
                String id = seatId(row, col);

                bool isOccupied = occupiedSeats.contains(id);
                bool isSelected = selectedSeats.contains(id);

                Color color = Colors.grey.shade300;
                if (isOccupied) {
                  color = Colors.grey.shade600;
                } else if (isSelected) {
                  color = Colors.deepPurple;
                }

                return GestureDetector(
                  onTap: isOccupied
                      ? null
                      : () {
                          setState(() {
                            if (isSelected) {
                              selectedSeats.remove(id);
                            } else {
                              selectedSeats.add(id);
                            }
                          });
                        },
                  child: Container(
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        id,
                        style: TextStyle(
                          color: isOccupied
                              ? Colors.white
                              : isSelected
                                  ? Colors.white
                                  : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Sélection en bas
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
            ),
            child: Column(
              children: [
                Text(
                  selectedSeats.isEmpty
                      ? "Aucun siège sélectionné"
                      : "Sièges sélectionnés: ${selectedSeats.join(", ")}",
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: selectedSeats.isEmpty
                      ? null
                      : () {
                          Navigator.pushNamed(context, '/flightCheckout',
                              arguments: selectedSeats);
                        },
                  child: const Center(
                    child: Text(
                      "Continue",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegend(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 5),
        Text(label),
      ],
    );
  }
}
