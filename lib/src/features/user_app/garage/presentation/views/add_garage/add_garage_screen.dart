import 'package:carma_app/src/core/services/user_service.dart';
import 'package:carma_app/src/core/utils/service_locator.dart';
import 'package:carma_app/src/features/user_app/garage/domain/repository/garage_repository.dart';
import 'package:carma_app/src/features/user_app/garage/presentation/views/add_garage/add_garage_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddGarageScreen extends StatelessWidget {
  const AddGarageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddGarageViewModel>.reactive(
      viewModelBuilder: () => AddGarageViewModel(
        navigationService: locator<NavigationService>(),
        garageRepository: locator<GarageRepository>(),
        userService: locator<UserService>(),
      ),
      builder: (context, viewModel, _) => Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 243, 148, 30),
          elevation: 0,
          leading: IconButton(
            icon: Image.asset('assets/images/backbutton.png'),
            onPressed: viewModel.goBack,
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add Car to Garage',
                    style: GoogleFonts.inder(
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/images/bookImage.png'),
                      const SizedBox(width: 20),
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 217, 217, 217),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.camera_alt_outlined, size: 35),
                          onPressed: () {
                            // Handle image upload
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/brakeslogo.svg'),
                      const SizedBox(width: 5),
                      Text(
                        'Description',
                        style: GoogleFonts.inder(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildDropdown(
                    'Year',
                    viewModel.year,
                    (value) => viewModel.setYear(value ?? ''),
                    ['2020', '2021', '2022', '2023', '2024'],
                  ),
                  const SizedBox(height: 10),
                  _buildDropdown(
                    'Make',
                    viewModel.make,
                    (value) => viewModel.setMake(value ?? ''),
                    ['Toyota', 'Honda', 'Ford', 'Chevrolet', 'BMW'],
                  ),
                  const SizedBox(height: 10),
                  _buildDropdown(
                    'Model',
                    viewModel.model,
                    (value) => viewModel.setModel(value ?? ''),
                    ['Camry', 'Civic', 'F-150', 'Malibu', '3 Series'],
                  ),
                  const SizedBox(height: 40),
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
                      onPressed: viewModel.isBusy ? null : viewModel.addCar,
                      child: viewModel.isBusy
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Text(
                              'Save',
                              style: GoogleFonts.openSans(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                  if (viewModel.hasError)
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text(
                        viewModel.error.toString(),
                        style: const TextStyle(color: Colors.red),
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

  Widget _buildDropdown(
    String label,
    String value,
    void Function(String?) onChanged,
    List<String> items,
  ) {
    return Card(
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 217, 217, 217),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: value.isEmpty ? null : value,
            hint: Text(label),
            isExpanded: true,
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.4),
            ),
            items: items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
