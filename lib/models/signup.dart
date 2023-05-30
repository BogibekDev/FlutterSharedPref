class Account {
  String? name;
  String? email;
  String? phoneNumber;
  String? password;

  Account(this.name, this.email, this.phoneNumber, this.password);

  Account.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        phoneNumber = json['phoneNumber'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'phoneNumber': phoneNumber,
        'password': password
      };
}
