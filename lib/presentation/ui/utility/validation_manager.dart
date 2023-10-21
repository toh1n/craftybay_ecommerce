import 'package:fluttertoast/fluttertoast.dart';

class ValidationManager {
  ValidationManager._();
  static String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return ("Please Enter Your Email");
    }
    final RegExp emailRegExp = RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]");
    if (!emailRegExp.hasMatch(value)) {

      Fluttertoast.showToast(msg: "Please Enter a Valid Email.");
      return ("Please Enter a Valid Email.");
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }
    if (password.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  static String? validatePasswordConfirmation(String? password, String? confirmPassword) {
    if (password != confirmPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      return 'Name is required';
    }

    final RegExp nameRegExp = RegExp(r"^[a-zA-Z ]+$");
    if (!nameRegExp.hasMatch(name)) {
      return 'Please enter a valid name';
    }

    return null;
  }

  static String? validateBangladeshiPhoneNumber(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return 'Phone number is required';
    }

    final RegExp bdPhoneNumberRegExp = RegExp(r'^(\+?880)?1[3456789]\d{8}$');
    if (!bdPhoneNumberRegExp.hasMatch(phoneNumber)) {
      return 'Please enter a valid Bangladeshi phone number';
    }

    return null;
  }
  static String? validateNull(String? value){
    if(value == null || value.isEmpty){
      return "Can't be Empty";
    }
    return null;
  }

  static String? validateCity(String? city) {
    if (city == null || city.isEmpty) {
      return 'City is required';
    }

    final RegExp cityRegExp = RegExp(r"^[a-zA-Z ]+$");
    if (!cityRegExp.hasMatch(city)) {
      return 'Please enter a valid city name';
    }

    return null;
  }

  static String? validateAddress(String? address) {
    if (address == null || address.isEmpty) {
      return 'Address is required';
    }

    // Check if the address contains valid characters (alphanumeric, spaces, commas, periods, etc.).
    final RegExp validCharactersRegExp = RegExp(r"^[a-zA-Z0-9\s,.-]+$");
    if (!validCharactersRegExp.hasMatch(address)) {
      return 'Please enter a valid address';
    }

    // Check if the address is not too short or too long.
    if (address.length < 5 || address.length > 100) {
      return 'Address should be between 5 and 100 characters';
    }

    return null;
  }

  static String? validatePostalCode(String? postalCode) {
    if (postalCode == null || postalCode.isEmpty) {
      return 'Postal Code is required';
    }

    final RegExp postalCodeRegExp = RegExp(r'^\d{4}$');
    if (!postalCodeRegExp.hasMatch(postalCode)) {
      return 'Please enter a valid 4-digit postal code';
    }

    return null;
  }





}