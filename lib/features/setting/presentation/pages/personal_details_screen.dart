import 'package:flutter/material.dart';
import 'package:tcw/core/constansts/context_extensions.dart';
import 'package:tcw/core/shared/shared_widget/Custom_button.dart';
import 'package:tcw/core/shared/shared_widget/app_bar.dart';
import 'package:tcw/core/shared/shared_widget/customTextFormFiled.dart';

class PersonalDetailsScreen extends StatefulWidget {
  const PersonalDetailsScreen({super.key});

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController(text: 'Ahmed');
  final _lastNameController = TextEditingController(text: 'Ali');
  final _countryController = TextEditingController(text: 'Egypt');
  final _cityController = TextEditingController(text: 'Cairo');
  final _emailController = TextEditingController(text: 'Ahmed10@Gmail.Com');
  final _phoneController = TextEditingController(text: '0121564548');

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _countryController.dispose();
    _cityController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  InputDecoration _inputDecoration(String hint) => InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: context.propHeight(27)),
                CustomAppBar(title: 'Personal Details',
                width: context.propWidth(20), ),
                SizedBox(height: context.propHeight(24)),

                _buildLabel('First name'),
                CustomTextField(
                  controller: _firstNameController,
                 hintStyle: const TextStyle(color: Colors.grey),
                  hintText: 'Ahmed',
                  keyboardType: TextInputType.name,
                  obscureText: false,
                  errorMessage: 'Please enter first name',
                  validator: (value) => value!.isEmpty ? 'Please enter first name' : null,
                ),
                const SizedBox(height: 16),
                _buildLabel('Last name'),
                CustomTextField(
                  controller: _lastNameController,
                  hintText: 'Ali',
                  keyboardType: TextInputType.name,
                  obscureText: false,
                  errorMessage: 'Please enter last name',
                  validator: (value) => value!.isEmpty ? 'Please enter last name' : null,
                   hintStyle: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 16),
                _buildLabel('Country'),
                CustomTextField(
                  controller: _countryController,
                  hintText: 'Egypt',
                  keyboardType: TextInputType.name,
                  obscureText: false,
                  errorMessage: 'Please enter country',
                  validator: (value) => value!.isEmpty ? 'Please enter country' : null,
                   hintStyle: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 16),
                _buildLabel('City'),
                CustomTextField(
                  controller: _cityController,
                  hintText: 'Cairo',
                  keyboardType: TextInputType.name,
                  obscureText: false,
                  errorMessage: 'Please enter city',
                  validator: (value) => value!.isEmpty ? 'Please enter city' : null,
                   hintStyle: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 16),
                _buildLabel('Email'),
                CustomTextField(
                  hintStyle: const TextStyle(color: Colors.grey),
                  controller: _emailController,
                  obscureText: false,
                  errorMessage: 'Please enter email',
                  fillColor: Colors.white,
                   
          
                ),
                const SizedBox(height: 16),
                _buildLabel('Phone number'),
                CustomTextField(
                  hintStyle: const TextStyle(color: Colors.grey),
                  controller: _phoneController,
                  hintText: '0121564548',
                  keyboardType: TextInputType.phone,
                  obscureText: false,
                  errorMessage: 'Please enter phone number',
                  validator: (value) => value!.isEmpty ? 'Please enter phone number' : null,
                 ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: CustomButton(
                   style: context.textTheme.headlineLarge?.copyWith(
                        fontSize: context.propWidth(16),
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Changes saved successfully!')),
                        );
                      }
                    },
                    title: 'Save Changes',
                  ),
                ),
              ],
            ),
          ),
                ),
        ),
    );
  }

  Widget _buildLabel(String label) => Padding(
        padding: const EdgeInsets.only(bottom: 6.0),
        child: Text(
          label,
          style: context.textTheme.headlineLarge ?.copyWith(
            fontSize: context.propWidth(16),
            
          ),
        ),
      );
}
