import 'package:flutter/material.dart';

class FlightBookingScreen extends StatefulWidget {
  const FlightBookingScreen({super.key});

  @override
  State<FlightBookingScreen> createState() => _FlightBookingScreenState();
}

class _FlightBookingScreenState extends State<FlightBookingScreen> {
  int selectedTripType = 0; // 0=One way, 1=Round Trip, 2=Multi-city
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  DateTime? startDate;
  DateTime? returnDate;
  int passengers = 1;

  Future<void> _pickDate(bool isStart) async {
    DateTime now = DateTime.now();
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(now.year + 2),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          startDate = picked;
        } else {
          returnDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Your Flight"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Onglets One way / Round Trip / Multi-city
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildTripTypeButton("One Way", 0),
                _buildTripTypeButton("Round Trip", 1),
                _buildTripTypeButton("Multi-city", 2),
              ],
            ),
            const SizedBox(height: 20),

            // Champ From
            TextField(
              controller: fromController,
              decoration: InputDecoration(
                labelText: "From",
                prefixIcon: const Icon(Icons.flight_takeoff),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Champ To
            TextField(
              controller: toController,
              decoration: InputDecoration(
                labelText: "To",
                prefixIcon: const Icon(Icons.flight_land),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Dates
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => _pickDate(true),
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        startDate == null
                            ? "Start Date"
                            : "${startDate!.day}/${startDate!.month}/${startDate!.year}",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: GestureDetector(
                    onTap: selectedTripType == 0
                        ? null
                        : () => _pickDate(false),
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: selectedTripType == 0
                            ? Colors.grey.shade200
                            : Colors.white,
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        selectedTripType == 0
                            ? "N/A"
                            : returnDate == null
                                ? "Return Date"
                                : "${returnDate!.day}/${returnDate!.month}/${returnDate!.year}",
                        style: TextStyle(
                          fontSize: 16,
                          color: selectedTripType == 0
                              ? Colors.black38
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Passagers
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Passengers",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (passengers > 1) {
                          setState(() {
                            passengers--;
                          });
                        }
                      },
                      icon: const Icon(Icons.remove_circle, color: Colors.red),
                    ),
                    Text(
                      "$passengers",
                      style: const TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          passengers++;
                        });
                      },
                      icon: const Icon(Icons.add_circle, color: Colors.green),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),

            // Bouton Search
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/addPassenger');
              },
              child: const Center(
                child: Text(
                  "Search",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget bouton trip type
  Widget _buildTripTypeButton(String label, int index) {
    bool isSelected = selectedTripType == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTripType = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.deepPurple : Colors.white,
          border: Border.all(color: Colors.deepPurple),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.deepPurple,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
