// ignore_for_file: camel_case_types

class User {
final  String? uid;
 final String? name;
 final String? email;
 final String? phone;
 final String? address;
 final String? profileimage;

  User({ this.uid,
     this.name,
     this.email,
     this.phone,
     this.address,
     this.profileimage});

 factory User.fromMap(Map<String, dynamic>map) {
    return User(
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      address: map['address'],
      profileimage: map['profileimage'],
    );
  }

  Map<String, dynamic>? toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'profileimage': profileimage
    };
  }

}