class Route {
  String name;
  String path;

  Route({required this.name, required this.path});
}

class Routes {
  static final Route home =  Route(name: "home", path: "/");
  static final Route packagesScreen =  Route(name: "packagesScreen", path: "/packagesScreen");
  static final Route flightsScreen =  Route(name: "flightsScreen", path: "/flightsScreen");
  static final Route searchResultsScreen =  Route(name: "searchResultsScreen", path: "/searchResultsScreen");
}
