String? validateEmail(String? email) {
  if (email == null || email.isEmpty) {
    return 'Email cannot be empty';
  }
  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
  return emailRegex.hasMatch(email) ? null : 'Invalid email format';
}

String? validatePassword(String? password) {
  if (password == null || password.isEmpty) {
    return 'Password cannot be empty';
  }
  return password.length >= 6 ? null : 'Password must be at least 6 characters';
}

String? validateName(String? name) {
  if (name == null || name.isEmpty) {
    return 'Name cannot be empty';
  }
  final nameRegex = RegExp(r'^[a-zA-Z\s]+$');
  return nameRegex.hasMatch(name) ? null : 'Name cannot contain numbers';
}
