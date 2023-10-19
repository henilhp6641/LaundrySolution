class FieldModel {
  Field? field;

  FieldModel({this.field});

  FieldModel.fromJson(Map<String, dynamic> json) {
    field = json['field'] != null ? new Field.fromJson(json['field']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.field != null) {
      data['field'] = this.field!.toJson();
    }
    return data;
  }
}

class Field {
  BBA? bBA;
  BCA? bCA;
  BCOM? bCOM;

  Field({this.bBA, this.bCA, this.bCOM});

  Field.fromJson(Map<String, dynamic> json) {
    bBA = json['BBA'] != null ? new BBA.fromJson(json['BBA']) : null;
    bCA = json['BCA'] != null ? new BCA.fromJson(json['BCA']) : null;
    bCOM = json['BCOM'] != null ? new BCOM.fromJson(json['BCOM']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bBA != null) {
      data['BBA'] = this.bBA!.toJson();
    }
    if (this.bCA != null) {
      data['BCA'] = this.bCA!.toJson();
    }
    if (this.bCOM != null) {
      data['BCOM'] = this.bCOM!.toJson();
    }
    return data;
  }
}

class BBA {
  List<String>? fYBBA;
  List<String>? sYBBA;
  List<String>? tYBBA;

  BBA({this.fYBBA, this.sYBBA, this.tYBBA});

  BBA.fromJson(Map<String, dynamic> json) {
    fYBBA = json['FYBBA'].cast<String>();
    sYBBA = json['SYBBA'].cast<String>();
    tYBBA = json['TYBBA'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FYBBA'] = this.fYBBA;
    data['SYBBA'] = this.sYBBA;
    data['TYBBA'] = this.tYBBA;
    return data;
  }
}

class BCA {
  List<String>? fYBCA;
  List<String>? sYBCA;
  List<String>? tYBCA;

  BCA({this.fYBCA, this.sYBCA, this.tYBCA});

  BCA.fromJson(Map<String, dynamic> json) {
    fYBCA = json['FYBCA'].cast<String>();
    sYBCA = json['SYBCA'].cast<String>();
    tYBCA = json['TYBCA'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FYBCA'] = this.fYBCA;
    data['SYBCA'] = this.sYBCA;
    data['TYBCA'] = this.tYBCA;
    return data;
  }
}

class BCOM {
  List<String>? fYBCOM;
  List<String>? sYBCOM;
  List<String>? tYBCOM;

  BCOM({this.fYBCOM, this.sYBCOM, this.tYBCOM});

  BCOM.fromJson(Map<String, dynamic> json) {
    fYBCOM = json['FYBCOM'].cast<String>();
    sYBCOM = json['SYBCOM'].cast<String>();
    tYBCOM = json['TYBCOM'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FYBCOM'] = this.fYBCOM;
    data['SYBCOM'] = this.sYBCOM;
    data['TYBCOM'] = this.tYBCOM;
    return data;
  }
}
