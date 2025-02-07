import 'package:flutter/material.dart';
import 'package:offto/Core/Const/colors.dart';
import '../../../../generated/l10n.dart';

class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var tr = S.of(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(tr.searchResultPage),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              tr.searchResultPage,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
