import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class AdicionarMedicamentoRecord extends FirestoreRecord {
  AdicionarMedicamentoRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nome_medicamento" field.
  String? _nomeMedicamento;
  String get nomeMedicamento => _nomeMedicamento ?? '';
  bool hasNomeMedicamento() => _nomeMedicamento != null;

  // "dosagem_medicacao" field.
  String? _dosagemMedicacao;
  String get dosagemMedicacao => _dosagemMedicacao ?? '';
  bool hasDosagemMedicacao() => _dosagemMedicacao != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  // "horario_medicacao" field.
  DateTime? _horarioMedicacao;
  DateTime? get horarioMedicacao => _horarioMedicacao;
  bool hasHorarioMedicacao() => _horarioMedicacao != null;

  // "frequencia_diaria" field.
  String? _frequenciaDiaria;
  String get frequenciaDiaria => _frequenciaDiaria ?? '';
  bool hasFrequenciaDiaria() => _frequenciaDiaria != null;

  void _initializeFields() {
    _nomeMedicamento = snapshotData['nome_medicamento'] as String?;
    _dosagemMedicacao = snapshotData['dosagem_medicacao'] as String?;
    _status = snapshotData['status'] as bool?;
    _horarioMedicacao = snapshotData['horario_medicacao'] as DateTime?;
    _frequenciaDiaria = snapshotData['frequencia_diaria'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('adicionar_medicamento');

  static Stream<AdicionarMedicamentoRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => AdicionarMedicamentoRecord.fromSnapshot(s));

  static Future<AdicionarMedicamentoRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => AdicionarMedicamentoRecord.fromSnapshot(s));

  static AdicionarMedicamentoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AdicionarMedicamentoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdicionarMedicamentoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdicionarMedicamentoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdicionarMedicamentoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdicionarMedicamentoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdicionarMedicamentoRecordData({
  String? nomeMedicamento,
  String? dosagemMedicacao,
  bool? status,
  DateTime? horarioMedicacao,
  String? frequenciaDiaria,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome_medicamento': nomeMedicamento,
      'dosagem_medicacao': dosagemMedicacao,
      'status': status,
      'horario_medicacao': horarioMedicacao,
      'frequencia_diaria': frequenciaDiaria,
    }.withoutNulls,
  );

  return firestoreData;
}

class AdicionarMedicamentoRecordDocumentEquality
    implements Equality<AdicionarMedicamentoRecord> {
  const AdicionarMedicamentoRecordDocumentEquality();

  @override
  bool equals(AdicionarMedicamentoRecord? e1, AdicionarMedicamentoRecord? e2) {
    return e1?.nomeMedicamento == e2?.nomeMedicamento &&
        e1?.dosagemMedicacao == e2?.dosagemMedicacao &&
        e1?.status == e2?.status &&
        e1?.horarioMedicacao == e2?.horarioMedicacao &&
        e1?.frequenciaDiaria == e2?.frequenciaDiaria;
  }

  @override
  int hash(AdicionarMedicamentoRecord? e) => const ListEquality().hash([
        e?.nomeMedicamento,
        e?.dosagemMedicacao,
        e?.status,
        e?.horarioMedicacao,
        e?.frequenciaDiaria
      ]);

  @override
  bool isValidKey(Object? o) => o is AdicionarMedicamentoRecord;
}
