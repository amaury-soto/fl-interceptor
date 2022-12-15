class TokenStorage {
  TokenStorage._private();
  String token = '';

  static final _instancia = TokenStorage._private();

  factory TokenStorage() {
    return _instancia;
  }

  setToken(newToken) {
    token = newToken;
  }

  getToken() {
    return token;
  }
}
