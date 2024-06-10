import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AfericoesRecord extends FirestoreRecord {
  AfericoesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "pressao" field.
  double? _pressao;
  double get pressao => _pressao ?? 0.0;
  bool hasPressao() => _pressao != null;

  // "data_p" field.
  DateTime? _dataP;
  DateTime? get dataP => _dataP;
  bool hasDataP() => _dataP != null;

  // "glicose" field.
  double? _glicose;
  double get glicose => _glicose ?? 0.0;
  bool hasGlicose() => _glicose != null;

  // "data_g" field.
  DateTime? _dataG;
  DateTime? get dataG => _dataG;
  bool hasDataG() => _dataG != null;

  void _initializeFields() {
    _pressao = castToType<double>(snapshotData['pressao']);
    _dataP = snapshotData['data_p'] as DateTime?;
    _glicose = castToType<double>(snapshotData['glicose']);
    _dataG = snapshotData['data_g'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('afericoes');

  static Stream<AfericoesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AfericoesRecord.fromSnapshot(s));

  static Future<AfericoesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AfericoesRecord.fromSnapshot(s));

  static AfericoesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AfericoesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AfericoesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AfericoesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AfericoesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AfericoesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAfericoesRecordData({
  double? pressao,
  DateTime? dataP,
  double? glicose,
  DateTime? dataG,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'pressao': pressao,
      'data_p': dataP,
      'glicose': glicose,
      'data_g': dataG,
    }.withoutNulls,
  );

  return firestoreData;
}

class AfericoesRecordDocumentEquality implements Equality<AfericoesRecord> {
  const AfericoesRecordDocumentEquality();

  @override
  bool equals(AfericoesRecord? e1, AfericoesRecord? e2) {
    return e1?.pressao == e2?.pressao &&
        e1?.dataP == e2?.dataP &&
        e1?.glicose == e2?.glicose &&
        e1?.dataG == e2?.dataG;
  }

  @override
  int hash(AfericoesRecord? e) =>
      const ListEquality().hash([e?.pressao, e?.dataP, e?.glicose, e?.dataG]);

  @override
  bool isValidKey(Object? o) => o is AfericoesRecord;
}
