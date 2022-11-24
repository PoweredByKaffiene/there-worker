class LoginResult {
  String? email;
  Tokens? tokens;
  String? username;

  LoginResult({this.email, this.tokens, this.username});

  LoginResult.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    tokens =
        json['tokens'] != null ? new Tokens.fromJson(json['tokens']) : null;
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    if (this.tokens != null) {
      data['tokens'] = this.tokens!.toJson();
    }
    data['username'] = this.username;
    return data;
  }
}

class Tokens {
  String? refresh;
  String? access;

  Tokens({this.refresh, this.access});

  Tokens.fromJson(Map<String, dynamic> json) {
    refresh = json['refresh'];
    access = json['access'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refresh'] = this.refresh;
    data['access'] = this.access;
    return data;
  }
}
