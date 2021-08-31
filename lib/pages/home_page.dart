import 'package:flutter/material.dart';
import 'package:ydl_task_app/pages/info_page.dart';

import '../models/modes_index.dart';
import '../services/services_index.dart';
import '../theme/theme_index.dart';
import '../widgets/widgets_index.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _dataService = DataService();

  List<User> _users = [];
  var usersData;

  @override
  void initState() {
    _fetchUser();
    super.initState();
  }

  void _fetchUser() async {
    usersData = await _dataService.getUsers();
    setState(() => _users = usersData);
  }

  void _filterUsers(String query) {
    List<User> _filterData = [];
    if (query.isEmpty) {
      _filterData = usersData;
    } else {
      _filterData = _users
          .where(
            (user) => user.name!.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    }

    setState(() => _users = _filterData);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Users Data'),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: _users.length <= 0
              ? Center(child: CircularProgressIndicator(color: kSecondaryColor))
              : Column(
                  children: [
                    buildSearchInput(),
                    Expanded(child: buildUsersList(_users)),
                  ],
                ),
        ),
      ),
    );
  }

  Widget buildSearchInput() {
    return Container(
      padding: EdgeInsets.only(top: 16),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Search username',
          filled: true,
          fillColor: Colors.white,
          suffixIcon: Icon(Icons.search),
        ),
        onChanged: (value) => _filterUsers(value),
      ),
    );
  }

  Widget buildUsersList(List<User> users) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: users.length,
      itemBuilder: (context, idx) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => InfoPage(
                  user: users[idx],
                ),
              ),
            );
          },
          child: UserCard(
            id: users[idx].id!.toString(),
            name: users[idx].name!,
            email: users[idx].email!,
          ),
        );
      },
    );
  }
}
