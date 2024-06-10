import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EditarPerfilRecord extends FirestoreRecord {
  EditarPerfilRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "idade" field.
  int? _idade;
  int get idade => _idade ?? 0;
  bool hasIdade() => _idade != null;

  // "estado" field.
  String? _estado;
  String get estado => _estado ?? '';
  bool hasEstado() => _estado != null;

  // "foto" field.
  String? _foto;
  String get foto => _foto ?? '';
  bool hasFoto() => _foto != null;

  void _initializeFields() {
    _nome = snapshotData['nome'] as String?;
    _idade = castToType<int>(snapshotData['idade']);
    _estado = snapshotData['estado'] as String?;
    _foto = snapshotData['foto'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('editar_perfil');

  static Stream<EditarPerfilRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EditarPerfilRecord.fromSnapshot(s));

  static Future<EditarPerfilRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EditarPerfilRecord.fromSnapshot(s));

  static EditarPerfilRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EditarPerfilRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EditarPerfilRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EditarPerfilRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EditarPerfilRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EditarPerfilRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEditarPerfilRecordData({
  String? nome,
  int? idade,
  String? estado,
  String? foto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome': nome,
      'idade': idade,
      'estado': estado,
      'foto': foto,
    }.withoutNulls,
  );

  return firestoreData;
}

class EditarPerfilRecordDocumentEquality
    implements Equality<EditarPerfilRecord> {
  const EditarPerfilRecordDocumentEquality();

  @override
  bool equals(EditarPerfilRecord? e1, EditarPerfilRecord? e2) {
    return e1?.nome == e2?.nome &&
        e1?.idade == e2?.idade &&
        e1?.estado == e2?.estado &&
        e1?.foto == e2?.foto;
  }

  @override
  int hash(EditarPerfilRecord? e) =>
      const ListEquality().hash([e?.nome, e?.idade, e?.estado, e?.foto]);

  @override
  bool isValidKey(Object? o) => o is EditarPerfilRecord;
}
