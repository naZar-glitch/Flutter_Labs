abstract class UserStorage {
  Future<void> saveUserData(String email, String password);
  Future<Map<String, String>?> getUserData(String email);
  Future<void> updateUserData(String email, Map<String, String> updatedData);
  Future<void> deleteUserData(String email);
}

class LocalUserStorage extends UserStorage {
  final Map<String, Map<String, String>> _storage = {};

  @override
  Future<void> saveUserData(String email, String password) async {
    _storage[email] = {'email': email, 'password': password};
  }

  @override
  Future<Map<String, String>?> getUserData(String email) async {
    return _storage[email];
  }

  @override
  Future<void> updateUserData(String email, Map<String, String> updatedData) async {
    if (_storage.containsKey(email)) {
      _storage[email] = updatedData;
    }
  }

  @override
  Future<void> deleteUserData(String email) async {
    _storage.remove(email);
  }
}
