class App {
  App(this._name, this._iconName, this._description, this._googlePlayLink,
      this._appStoreLink, this._publisher, this._screenshots);

  final String _name;
  final String _iconName;
  final String _description;
  final String _googlePlayLink;
  final String _appStoreLink;
  final String _publisher;
  final List<String> _screenshots;

  String get name => _name;
  String get iconName => _iconName;
  String get description => _description;
  String get googlePlayLink => _googlePlayLink;
  String get appStoreLink => _appStoreLink;
  String get publisher => _publisher;
  List<String> get screenshots => _screenshots;
}
