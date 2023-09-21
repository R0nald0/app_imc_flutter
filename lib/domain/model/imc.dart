class Imc {
  String _name ;
  double imc ;
  Enum _statusWeight;
  String _date;

  Imc(this._name,this.imc,this._statusWeight,this._date);
   

   String get name => _name;
   set name(name) => _name = name;

   
   double get weight => imc;
   set weight(weight) => imc = weight; 
   
   Enum get statusWeight => _statusWeight;
   set statusWeight(statusWeigh) => _statusWeight = statusWeight;

  String get date => _date;
   set date(date)=> _date = date;

}

