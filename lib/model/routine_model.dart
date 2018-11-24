class Routine {
  String _id;
  String _name;
  String _description;
  String _category;
  String _durationMin;
  //String _idUser;
  //String _idExercise;

  Routine(
    this._id,
    this._name,
    this._description,
    this._category,
    this._durationMin,
    //this._idUser,
    //this._idExercise,
  );

  String get id => _id;
  String get name => _name;
  String get description => _description;
  String get category => _category;
  String get durationMin => _durationMin;
  //String get idUser => _idUser;
  //String get idExercise => _idExercise;
}
