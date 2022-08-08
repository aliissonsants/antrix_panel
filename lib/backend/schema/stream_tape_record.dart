import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'stream_tape_record.g.dart';

abstract class StreamTapeRecord
    implements Built<StreamTapeRecord, StreamTapeRecordBuilder> {
  static Serializer<StreamTapeRecord> get serializer =>
      _$streamTapeRecordSerializer;

  String? get dirName;

  String? get dirID;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(StreamTapeRecordBuilder builder) => builder
    ..dirName = ''
    ..dirID = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('streamTape');

  static Stream<StreamTapeRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<StreamTapeRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  StreamTapeRecord._();
  factory StreamTapeRecord([void Function(StreamTapeRecordBuilder) updates]) =
      _$StreamTapeRecord;

  static StreamTapeRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createStreamTapeRecordData({
  String? dirName,
  String? dirID,
}) {
  final firestoreData = serializers.toFirestore(
    StreamTapeRecord.serializer,
    StreamTapeRecord(
      (s) => s
        ..dirName = dirName
        ..dirID = dirID,
    ),
  );

  return firestoreData;
}
