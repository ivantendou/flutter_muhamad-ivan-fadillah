String? validateName(String? value) {
    if (value?.isEmpty == true) {
      return 'Name must not be empty.';
    } else if ((value?.length ?? 0) < 2) {
      return 'The name must consist of at least 2 words.';
    } else if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(value!)) {
      return 'Name should not contain special characters or numbers.';
    } else if (!RegExp(r'^[A-Z][a-z]*([\s-][A-Z][a-z]*)*$').hasMatch(value)) {
      return 'Each word should start with a capital letter.';
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value?.isEmpty == true) {
      return 'Number must not be empty.';
    } else if (!RegExp(r'^0').hasMatch(value!)) {
      return 'Phone number must start with 0.';
    } else if (value.length < 8) {
      return 'The phone number must be a minimum of 8 digits long.';
    } else if (value.length > 15) {
      return 'The phone number must be a maximum of 15 digits long.';
    }
    return null;
  }