import 'package:flutter/material.dart';
import 'package:pal_mail_project/utils/constant.dart';
import '../screens/new_inbox.dart';

class CustomSearchDelegate extends SearchDelegate {
  List<String> senders = [];

  CustomSearchDelegate({required this.senders});
  final _searchFieldFocusNode = FocusNode();

  @override
  void initState() {
    _searchFieldFocusNode.requestFocus();
  }

  @override
  void dispose() {
    _searchFieldFocusNode.dispose();
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          Navigator.pushNamed(context, NewInbox.id);
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pushNamed(context, NewInbox.id);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List filteredData = [];
    if (query.isNotEmpty) {
      final List<String> searchResults = senders
          .where((string) => string.toLowerCase().contains(query))
          .toList();

      return ListView.separated(
        itemCount: searchResults.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                searchResults[index],
                style: TextStyle(fontSize: 18),
              ),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                NewInbox.id,
                arguments: [searchResults[index]],
              );
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(18.0),
        child: const Text(
          'No sender with this name',
          style: TextStyle(fontSize: 18),
        ),
      );
    }
  }

  @override
  String get query => super.query;

  @override
  Widget buildSuggestions(BuildContext context) {
    if (senders.isNotEmpty) {
      final List<String> searchResults = senders
          .where((string) => string.toLowerCase().contains(query))
          .toList();

      return ListView.separated(
        itemCount: searchResults.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                searchResults[index],
                style: TextStyle(fontSize: 18),
              ),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, NewInbox.id,
                  arguments: [searchResults[index]]);
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(
          color: primaryColor,
        ),
      );
    }
  }
}
