import 'package:flutter/material.dart';
import 'package:ydl_task_app/models/modes_index.dart';
import 'package:ydl_task_app/theme/theme_index.dart';

class InfoPage extends StatelessWidget {
  final User? user;

  const InfoPage({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${user?.name}'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: CircleAvatar(
              maxRadius: 46,
              backgroundColor: kSecondaryColor,
              child: Icon(
                Icons.account_circle,
                color: Colors.white,
                size: 70,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Card(
              elevation: 2,
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildUserInfo(
                      'Username',
                      '${user?.username}',
                    ),
                    Divider(),
                    _buildUserInfo(
                      'Name',
                      '${user?.name}',
                    ),
                    Divider(),
                    _buildUserInfo(
                      'Email',
                      '${user?.email}',
                    ),
                    Divider(),
                    _buildUserInfo(
                      'Phone',
                      '${user?.phone}',
                    ),
                    Divider(),
                    _buildUserInfo(
                      'Website',
                      '${user?.website}',
                    ),
                    Divider(),
                    _buildUserInfo(
                      'Company',
                      '${user?.company?.name}',
                    ),
                    Divider(),
                    _buildUserInfo(
                      'Address',
                      '${user?.address?.city}',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserInfo(String key, String value) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            key,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
