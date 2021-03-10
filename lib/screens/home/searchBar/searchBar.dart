// import 'package:flutter/material.dart';
// import 'package:material_floating_search_bar/material_floating_search_bar.dart';
// import 'package:provider/provider.dart';

// class SearchBar extends StatefulWidget {
//   @override
//   _SearchBarState createState() => _SearchBarState();
// }

// class _SearchBarState extends State<SearchBar> {
//   static const historyLenth = 5;

//   List<String> _searchHistory = [
//     'adidas',
//     'nike',
//     'puma',
//     'bilablong',
//     'Gshock'
//   ];
//   List<String> filteredSearchHistory;
//   String selectTerm;

//   List<String> filterSearchItem({@required String filter}) {
//     if (filter != null && filter.isNotEmpty) {
//       return _searchHistory.reversed
//           .where((i) => i.startsWith(filter))
//           .toList();
//     } else {
//       return _searchHistory.reversed.toList();
//     }
//   }

//   void addSearchTerm(String term) {
//     if (_searchHistory.contains(term)) {
//       putSerchTermFirst(term);
//       return;
//     }
//     _searchHistory.add(term);
//     if (_searchHistory.length > historyLenth) {
//       _searchHistory.removeRange(0, _searchHistory.length - historyLenth);
//     }
//     filteredSearchHistory = filterSearchItem(filter: null);
//   }

//   void deleteSearchTerm(String term) {
//     _searchHistory.removeWhere((i) => i == term);
//     filteredSearchHistory = filterSearchItem(filter: null);
//   }

//   void putSerchTermFirst(String term) {
//     deleteSearchTerm(term);
//     addSearchTerm(term);
//   }

//   FloatingSearchBarController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = FloatingSearchBarController();
//     filteredSearchHistory = filterSearchItem(filter: null);
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FloatingSearchBar(
//         controller: controller,
//         body: SearchResultListView(
//           searchTerm: null,
//         ),
//         builder: (BuildContext context, Animation<double> transition) {},
//       ),
//     );
//   }
// }

// class SearchResultListView extends StatelessWidget {
//   final String searchTerm;
//   const SearchResultListView({@required this.searchTerm});
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
