import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExameRecord extends FirestoreRecord {
  ExameRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nome_exame" field.
  String? _nomeExame;
  String get nomeExame => _nomeExame ?? '';
  bool hasNomeExame() => _nomeExame != null;

  // "data_exame" field.
  DateTime? _dataExame;
  DateTime? get dataExame => _dataExame;
  bool hasDataExame() => _dataExame != null;

  // "resultado" field.
  double? _resultado;
  double get resultado => _resultado ?? 0.0;
  bool hasResultado() => _resultado != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  String? _idImagem;
  String get idImagem => _idImagem ?? '';
  bool hasidImagem() => _idImagem != null;

  void _initializeFields() {
    _nomeExame = snapshotData['nome_exame'] as String?;
    _dataExame = snapshotData['data_exame'] as DateTime?;
    _resultado = castToType<double>(snapshotData['resultado']);
    _status = snapshotData['status'] as bool?;
    _idImagem = snapshotData['idImagem'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('exame');

  static Stream<ExameRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ExameRecord.fromSnapshot(s));

  static Future<ExameRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ExameRecord.fromSnapshot(s));

  static ExameRecord fromSnapshot(DocumentSnapshot snapshot) => ExameRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ExameRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ExameRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ExameRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ExameRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createExameRecordData({
  String? nomeExame,
  String? idImagem,
  DateTime? dataExame,
  double? resultado,
  bool? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome_exame': nomeExame,
      'data_exame': dataExame,
      'resultado': resultado,
      'status': status,
      'idImagem': idImagem,
    }.withoutNulls,
  );

  return firestoreData;
}

class ExameRecordDocumentEquality implements Equality<ExameRecord> {
  const ExameRecordDocumentEquality();

  @override
  bool equals(ExameRecord? e1, ExameRecord? e2) {
    return e1?.nomeExame == e2?.nomeExame &&
        e1?.dataExame == e2?.dataExame &&
        e1?.resultado == e2?.resultado &&
        e1?.status == e2?.status &&
        e1?.idImagem == e2?.idImagem;
  }

  @override
  int hash(ExameRecord? e) => const ListEquality()
      .hash([e?.nomeExame, e?.dataExame, e?.resultado, e?.status, e?.idImagem]);

  @override
  bool isValidKey(Object? o) => o is ExameRecord;
}
