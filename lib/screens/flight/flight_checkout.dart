import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class FlightCheckoutScreen extends StatelessWidget {
  const FlightCheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final seats = ModalRoute.of(context)!.settings.arguments as List<String>?;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flight Checkout"),
        backgroundColor: Colors.deepPurple,
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Carte billet avec QR code
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("AF 358",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Icon(Icons.flight_takeoff, color: Colors.deepPurple),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("From", style: TextStyle(color: Colors.black54)),
                            Text("Conakry (CKY)",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("To", style: TextStyle(color: Colors.black54)),
                            Text("Paris (CDG)",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ],
                    ),
                    const Divider(height: 30, thickness: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Date", style: TextStyle(color: Colors.black54)),
                            Text("12 Sep 2025",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                        const Column(
                          children: [
                            Text("Gate", style: TextStyle(color: Colors.black54)),
                            Text("A23",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text("Seats",
                                style: TextStyle(color: Colors.black54)),
                            Text(
                              seats == null || seats.isEmpty
                                  ? "N/A"
                                  : seats.join(", "),
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: QrImageView(
                        data:
                            "Flight AF358 | From CKY | To CDG | Seats: ${seats?.join(", ")}",
                        size: 150,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),

            // Bouton Confirm Booking
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                // Après validation -> aller vers Flight Confirmation
                Navigator.pushReplacementNamed(context, '/flightConfirmation');
              },
              child: const Center(
                child: Text(
                  "Confirm Booking",
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
