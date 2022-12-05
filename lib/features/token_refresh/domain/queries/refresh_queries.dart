class TokenRefreshQueries {
  static String tokenRefresh() {
    return '''
    mutation {
      refreshTokenGeneral{
        expiresIn
        token
      }
    }
''';
  }
}
