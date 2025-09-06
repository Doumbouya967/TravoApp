import 'package:flutter/material.dart';

// Import des écrans
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';

// Hotels
import 'screens/hotel/hotel_booking.dart';
import 'screens/hotel/hotel_list.dart';
import 'screens/hotel/hotel_detail.dart';
import 'screens/hotel/select_room.dart';
import 'screens/hotel/hotel_checkout.dart';
import 'screens/hotel/reviews_screen.dart';
import 'screens/hotel/hotel_confirmation.dart';

// Flights
import 'screens/flight/flight_booking.dart';
import 'screens/flight/add_passenger.dart';
import 'screens/flight/select_seat.dart';
import 'screens/flight/flight_checkout.dart';
import 'screens/flight/flight_confirmation.dart';

// Paiement
import 'screens/payment/add_card_screen.dart';

// Auth
import 'screens/register_screen.dart';
import 'screens/forgot_password_screen.dart';

void main() {
  runApp(const TravoApp());
}

class TravoApp extends StatelessWidget {
  const TravoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'Poppins',
      ),
      // Première page affichée
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),

        // Hotels
        '/hotelBooking': (context) => const HotelBookingScreen(),
        '/hotelList': (context) => const HotelListScreen(),
        '/hotelDetail': (context) => const HotelDetailScreen(),
        '/selectRoom': (context) => const SelectRoomScreen(),
        '/hotelCheckout': (context) => const HotelCheckoutScreen(),
        '/reviews': (context) => const ReviewsScreen(),
        '/hotelConfirmation': (context) => const HotelConfirmationScreen(),

        // Flights
        '/flightBooking': (context) => const FlightBookingScreen(),
        '/addPassenger': (context) => const AddPassengerScreen(),
        '/selectSeat': (context) => const SelectSeatScreen(),
        '/flightCheckout': (context) => const FlightCheckoutScreen(),
        '/flightConfirmation': (context) => const FlightConfirmationScreen(),

        // Paiement
        '/addCard': (context) => const AddCardScreen(),

        // Auth
        '/register': (context) => const RegisterScreen(),
        '/forgotPassword': (context) => const ForgotPasswordScreen(),
      },
    );
  }
}
