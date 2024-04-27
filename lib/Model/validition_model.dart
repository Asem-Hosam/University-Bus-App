class ValidtionModel {
  String? validateUsername(String? username) {
    if (username == null || username.trim().isEmpty) {
      return 'Username is required';
    } else if (username.length < 3) {
      return 'Username must be at least 3 characters long';
    } else if (username.length > 20) {
      return 'Username cannot be longer than 20 characters';
    } else if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(username)) {
      return 'Username can only contain letters, numbers, and underscores';
    }
    return null;
  }

  String? validateEmail(String? email) {
    if (email == null || email.trim().isEmpty || email.length < 3) {
      return 'Email is required';
    } else if (!email.contains('@su.edu.eg')) {
      return 'Student email Format needed';
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password == null || password.trim().isEmpty) {
      return 'Password is required';
    } else if (password.length < 8) {
      return 'Password must be at least 8 characters long';
    } else if (!_containsUppercase(password)) {
      return 'Password must contain at least one uppercase letter';
    } else if (!_containsLowercase(password)) {
      return 'Password must contain at least one lowercase letter';
    } else if (!_containsDigit(password)) {
      return 'Password must contain at least one digit';
    }
    return null;
  }

  String? validateLoginPassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  bool _containsUppercase(String password) {
    return password.contains(RegExp(r'[A-Z]'));
  }

  bool _containsLowercase(String password) {
    return password.contains(RegExp(r'[a-z]'));
  }

  bool _containsDigit(String password) {
    return password.contains(RegExp(r'[0-9]'));
  }

  String? validatePhoneNumber(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.trim().isEmpty) {
      return 'Phone number is required';
    } else if (phoneNumber.length != 10) {
      return 'Phone number must be exactly 10 digits';
    }
    return null;
  }
}
