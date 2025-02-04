class Route {
  String name;
  String path;

  Route({required this.name, required this.path});
}

class Routes {
  static final Route home =  Route(name: "home", path: "/");
}
