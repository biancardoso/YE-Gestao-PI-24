import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ImcRecord extends FirestoreRecord {
  ImcRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "altura" field.
  double? _altura;
  double get altura => _altura ?? 0.0;
  bool hasAltura() => _altura != null;

  // "peso" field.
  double? _peso;
  double get peso => _peso ?? 0.0;
  bool hasPeso() => _peso != null;

  // "imc" field.
  double? _imc;
  double get imc => _imc ?? 0.0;
  bool hasImc() => _imc != null;

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  void _initializeFields() {
    _altura = castToType<double>(snapshotData['altura']);
    _peso = castToType<double>(snapshotData['peso']);
    _imc = castToType<double>(snapshotData['imc']);
    _data = snapshotData['data'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('imc');

  static Stream<ImcRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ImcRecord.fromSnapshot(s));

  static Future<ImcRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ImcRecord.fromSnapshot(s));

  static ImcRecord fromSnapshot(DocumentSnapshot snapshot) => ImcRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ImcRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ImcRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ImcRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ImcRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createImcRecordData({
  double? altura,
  double? peso,
  double? imc,
  DateTime? data,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'altura': altura,
      'peso': peso,
      'imc': imc,
      'data': data,
    }.withoutNulls,
  );

  return firestoreData;
}

class ImcRecordDocumentEquality implements Equality<ImcRecord> {
  const ImcRecordDocumentEquality();

  @override
  bool equals(ImcRecord? e1, ImcRecord? e2) {
    return e1?.altura == e2?.altura &&
        e1?.peso == e2?.peso &&
        e1?.imc == e2?.imc &&
        e1?.data == e2?.data;
  }

  @override
  int hash(ImcRecord? e) =>
      const ListEquality().hash([e?.altura, e?.peso, e?.imc, e?.data]);

  @override
  bool isValidKey(Object? o) => o is ImcRecord;
}
