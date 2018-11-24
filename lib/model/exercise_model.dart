class Exercise {
  String _id;
  String _name;
  String _description;
  String _category;
  int _sets;
  int timeMin;
  int loadKg;
  String _idUser;
  String _idRoutine;

  Exercise(this._id, this._name, this._description, this._category, this._sets,
      this._idUser, this._idRoutine,
      [this.timeMin, this.loadKg]);

  String get id => _id;
  String get name => _name;
  String get description => _description;
  String get category => _category;
  int get sets => _sets;
  String get idUser => _idUser;
  String get idRoutine => _idRoutine;
}
