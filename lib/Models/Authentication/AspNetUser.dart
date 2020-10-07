import 'dart:convert';

class AspNetUser {
  String id;
  String email;
  bool emailConfirmed;
  String passwordHash;
  String securityStamp;
  Null phoneNumber;
  bool phoneNumberConfirmed;
  bool twoFactorEnabled;
  Null lockoutEndDateUtc;
  bool lockoutEnabled;
  int accessFailedCount;
  String userName;
  String imageUrl;
  int credits;
  List<dynamic> aspNetUserClaims;
  List<dynamic> aspNetUserLogins;
  List<dynamic> partners;
  List<dynamic> userChoiceAccounts;
  List<dynamic> aspNetRoles;

  AspNetUser(
      {this.id,
      this.email,
      this.emailConfirmed,
      this.passwordHash,
      this.securityStamp,
      this.phoneNumber,
      this.phoneNumberConfirmed,
      this.twoFactorEnabled,
      this.lockoutEndDateUtc,
      this.lockoutEnabled,
      this.accessFailedCount,
      this.userName,
      this.imageUrl,
      this.credits,
      this.aspNetUserClaims,
      this.aspNetUserLogins,
      this.partners,
      this.userChoiceAccounts,
      this.aspNetRoles});

  AspNetUser.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    email = json['Email'];
    emailConfirmed = json['EmailConfirmed'];
    passwordHash = json['PasswordHash'];
    securityStamp = json['SecurityStamp'];
    phoneNumber = json['PhoneNumber'];
    phoneNumberConfirmed = json['PhoneNumberConfirmed'];
    twoFactorEnabled = json['TwoFactorEnabled'];
    lockoutEndDateUtc = json['LockoutEndDateUtc'];
    lockoutEnabled = json['LockoutEnabled'];
    accessFailedCount = json['AccessFailedCount'];
    userName = json['UserName'];
    imageUrl = json['ImageUrl'];
    credits = json['Credits'];
    if (json['AspNetUserClaims'] != null) {
      aspNetUserClaims = new List<dynamic>();
      json['AspNetUserClaims'].forEach((v) {
        aspNetUserClaims.add(jsonDecode(v));
      });
    }
    if (json['AspNetUserLogins'] != null) {
      aspNetUserLogins = new List<dynamic>();
      json['AspNetUserLogins'].forEach((v) {
        aspNetUserLogins.add(jsonDecode(v));
      });
    }
    if (json['Partners'] != null) {
      partners = new List<dynamic>();
      json['Partners'].forEach((v) {
        partners.add(jsonDecode(v));
      });
    }
    if (json['user_choice_accounts'] != null) {
      userChoiceAccounts = new List<dynamic>();
      json['user_choice_accounts'].forEach((v) {
        userChoiceAccounts.add(jsonDecode(v));
      });
    }
    if (json['AspNetRoles'] != null) {
      aspNetRoles = new List<dynamic>();
      json['AspNetRoles'].forEach((v) {
        aspNetRoles.add(jsonDecode(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Email'] = this.email;
    data['EmailConfirmed'] = this.emailConfirmed;
    data['PasswordHash'] = this.passwordHash;
    data['SecurityStamp'] = this.securityStamp;
    data['PhoneNumber'] = this.phoneNumber;
    data['PhoneNumberConfirmed'] = this.phoneNumberConfirmed;
    data['TwoFactorEnabled'] = this.twoFactorEnabled;
    data['LockoutEndDateUtc'] = this.lockoutEndDateUtc;
    data['LockoutEnabled'] = this.lockoutEnabled;
    data['AccessFailedCount'] = this.accessFailedCount;
    data['UserName'] = this.userName;
    data['ImageUrl'] = this.imageUrl;
    data['Credits'] = this.credits;
    if (this.aspNetUserClaims != null) {
      data['AspNetUserClaims'] =
          this.aspNetUserClaims.map((v) => v.toJson()).toList();
    }
    if (this.aspNetUserLogins != null) {
      data['AspNetUserLogins'] =
          this.aspNetUserLogins.map((v) => v.toJson()).toList();
    }
    if (this.partners != null) {
      data['Partners'] = this.partners.map((v) => v.toJson()).toList();
    }
    if (this.userChoiceAccounts != null) {
      data['user_choice_accounts'] =
          this.userChoiceAccounts.map((v) => v.toJson()).toList();
    }
    if (this.aspNetRoles != null) {
      data['AspNetRoles'] = this.aspNetRoles.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
