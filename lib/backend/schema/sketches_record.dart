import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'sketches_record.g.dart';

abstract class SketchesRecord
    implements Built<SketchesRecord, SketchesRecordBuilder> {
  static Serializer<SketchesRecord> get serializer =>
      _$sketchesRecordSerializer;

  String? get sketch;

  String? get replicateOutput;

  DateTime? get timeCreated;

  String? get replicatePrompt;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(SketchesRecordBuilder builder) => builder
    ..sketch = ''
    ..replicateOutput = ''
    ..replicatePrompt = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('sketches')
          : FirebaseFirestore.instance.collectionGroup('sketches');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('sketches').doc();

  static Stream<SketchesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SketchesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  SketchesRecord._();
  factory SketchesRecord([void Function(SketchesRecordBuilder) updates]) =
      _$SketchesRecord;

  static SketchesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createSketchesRecordData({
  String? sketch,
  String? replicateOutput,
  DateTime? timeCreated,
  String? replicatePrompt,
}) {
  final firestoreData = serializers.toFirestore(
    SketchesRecord.serializer,
    SketchesRecord(
      (s) => s
        ..sketch = sketch
        ..replicateOutput = replicateOutput
        ..timeCreated = timeCreated
        ..replicatePrompt = replicatePrompt,
    ),
  );

  return firestoreData;
}
