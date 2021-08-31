import 'package:flutter/material.dart';

import '../theme/theme_index.dart';

class UserCard extends StatelessWidget {
  final String name;
  final String email;

  const UserCard({
    Key? key,
    required this.name,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: Card(
        elevation: 2,
        shadowColor: Colors.grey.shade300,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: kSecondaryColor,
            child: Icon(
              Icons.account_circle,
              color: Colors.white,
            ),
          ),
          title: Text(
            name,
            style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          subtitle: Text(
            email,
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
          trailing: Icon(Icons.chevron_right_rounded),
        ),
      ),
    );
  }
}

