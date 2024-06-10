import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ConsultasRecord extends FirestoreRecord {
  ConsultasRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "resumo" field.
  String? _resumo;
  String get resumo => _resumo ?? '';
  bool hasResumo() => _resumo != null;

  // "dia" field.
  DateTime? _dia;
  DateTime? get dia => _dia;
  bool hasDia() => _dia != null;

  // "horario_consulta" field.
  DateTime? _horarioConsulta;
  DateTime? get horarioConsulta => _horarioConsulta;
  bool hasHorarioConsulta() => _horarioConsulta != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  // "especialidade" field.
  String? _especialidade;
  String get especialidade => _especialidade ?? '';
  bool hasEspecialidade() => _especialidade != null;

  void _initializeFields() {
    _resumo = snapshotData['resumo'] as String?;
    _dia = snapshotData['dia'] as DateTime?;
    _horarioConsulta = snapshotData['horario_consulta'] as DateTime?;
    _status = snapshotData['status'] as bool?;
    _especialidade = snapshotData['especialidade'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('consultas');

  static Stream<ConsultasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ConsultasRecord.fromSnapshot(s));

  static Future<ConsultasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ConsultasRecord.fromSnapshot(s));

  static ConsultasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ConsultasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConsultasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConsultasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConsultasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConsultasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createConsultasRecordData({
  String? resumo,
  DateTime? dia,
  DateTime? horarioConsulta,
  bool? status,
  String? especialidade,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'resumo': resumo,
      'dia': dia,
      'horario_consulta': horarioConsulta,
      'status': status,
      'especialidade': especialidade,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConsultasRecordDocumentEquality implements Equality<ConsultasRecord> {
  const ConsultasRecordDocumentEquality();

  @override
  bool equals(ConsultasRecord? e1, ConsultasRecord? e2) {
    return e1?.resumo == e2?.resumo &&
        e1?.dia == e2?.dia &&
        e1?.horarioConsulta == e2?.horarioConsulta &&
        e1?.status == e2?.status &&
        e1?.especialidade == e2?.especialidade;
  }

  @override
  int hash(ConsultasRecord? e) => const ListEquality().hash(
      [e?.resumo, e?.dia, e?.horarioConsulta, e?.status, e?.especialidade]);

  @override
  bool isValidKey(Object? o) => o is ConsultasRecord;
}
