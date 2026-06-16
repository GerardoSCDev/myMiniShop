abstract class ApiHeaders {
  const ApiHeaders();

  Map<String, dynamic> toMap();
}

class DefaultApiHeaders extends ApiHeaders {
  const DefaultApiHeaders({
    this.token,
    this.extraHeaders = const {},
  });

  final String? token;
  final Map<String, dynamic> extraHeaders;

  @override
  Map<String, dynamic> toMap() {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
      ...extraHeaders,
    };
  }
}
