import 'package:carma_app/src/core/utils/service_locator.dart';
import 'package:carma_app/src/features/user_app/garage/domain/entity/car_entity.dart';
import 'package:carma_app/src/features/user_app/garage/domain/repository/garage_repository.dart';
import 'package:carma_app/src/features/user_app/garage/presentation/views/my_garage/my_garage_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MyGarageScreen extends StatefulWidget {
  const MyGarageScreen({super.key});

  @override
  State<MyGarageScreen> createState() => _MyGarageScreenState();
}

class _MyGarageScreenState extends State<MyGarageScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MyGarageViewModel>.reactive(
      viewModelBuilder: () => MyGarageViewModel(
        garageRepository: locator<GarageRepository>(),
        navigationService: locator<NavigationService>(),
      ),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 243, 148, 30),
          leading: IconButton(
            icon: Image.asset('assets/images/backbutton.png'),
            onPressed: model.goBack,
          ),
        ),
        body: model.isBusy
            ? const Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: () => model.getGarage(),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'My Garage',
                              style: GoogleFonts.inder(
                                fontWeight: FontWeight.w500,
                                fontSize: 30,
                                color: Colors.black,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add, size: 50),
                              onPressed: model.goToAddGarage,
                            ),
                          ],
                        ),
                        if (model.cars.isNotEmpty) ...[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.delete,
                                    color: Colors.red, size: 30),
                                onPressed: () => model.deleteCar(),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 120,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: model.cars
                                    .map((car) => Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: imageTile(car.imageUrl ??
                                              'assets/images/car1.png'),
                                        ))
                                    .toList(),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          sectionHeader('Description'),
                          const SizedBox(height: 10),
                          carDescription(model.cars.first),
                          const SizedBox(height: 10),
                          sectionHeader('History'),
                          const SizedBox(height: 10),
                          historyInfo(),
                          const SizedBox(height: 20),
                        ] else ...[
                          const Center(
                            child: Text(
                                'No cars in your garage yet. Add a car to get started!'),
                          ),
                        ],
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 243, 148, 30),
                              minimumSize: const Size(180, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () {
                              // Handle scan button press
                            },
                            child: Text(
                              'Scan',
                              style: GoogleFonts.openSans(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}

Widget imageTile(String imagePath) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: Image.asset(
      imagePath,
      width: 150,
      height: 150,
      fit: BoxFit.cover,
    ),
  );
}

Widget sectionHeader(String title) {
  return Row(
    children: [
      SvgPicture.asset('assets/icons/brakeslogo.svg'),
      const SizedBox(width: 10),
      Text(
        title,
        style: GoogleFonts.inder(
          fontWeight: FontWeight.w500,
          fontSize: 20,
          color: Colors.black,
        ),
      ),
      const Spacer(),
      if (title == 'Description')
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            side: const BorderSide(color: Colors.black),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {
            // Handle schedule a service press
          },
          child: const Text(
            'Schedule a service',
            style: TextStyle(color: Colors.black),
          ),
        ),
    ],
  );
}

Widget carDescription(Car car) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      textInfoRow('Model:', car.model ?? ''),
      textInfoRow('Name:', car.name ?? ''),
      // textInfoRow('Make:', car.make),
      // textInfoRow('Colour:', car.color),
      textInfoRow('Year:', car.year.toString()),
      // textInfoRow('Mileage:', '${car.mileage} miles'),
      // textInfoRow('Plate Number:', car.plateNumber),
      // textInfoRow('Address:', car.address),
    ],
  );
}

Widget historyInfo() {
  return Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 236, 236, 236),
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.black.withOpacity(0.2)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textInfoRow('Booking ID:', '12345'),
        textInfoRow('Customer Name:', 'John Doe'),
        textInfoRow('Vehicle Model:', 'Toyota Camry 2018'),
        textInfoRow('License Plate:', 'ABC-1234'),
        textInfoRow('Service Requested:', 'Full Service and Oil Change'),
        textInfoRow('Mechanic Assigned:', 'Mike Johnson'),
        textInfoRow('Booking Date:', 'June 1, 2024'),
        textInfoRow('Service Date:', 'June 3, 2024'),
        textInfoRow(
          'Service Location:',
          '123 Main Street, Springfield',
        ),
        textInfoRow('Contact Information:', '+1 555-123-4567'),
      ],
    ),
  );
}

Widget textInfoRow(String title, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title ',
          style: GoogleFonts.inder(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.black,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: GoogleFonts.inder(
              fontSize: 14,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
        ),
      ],
    ),
  );
}
