// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stream_tape_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StreamTapeRecord> _$streamTapeRecordSerializer =
    new _$StreamTapeRecordSerializer();

class _$StreamTapeRecordSerializer
    implements StructuredSerializer<StreamTapeRecord> {
  @override
  final Iterable<Type> types = const [StreamTapeRecord, _$StreamTapeRecord];
  @override
  final String wireName = 'StreamTapeRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, StreamTapeRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.dirName;
    if (value != null) {
      result
        ..add('dirName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dirID;
    if (value != null) {
      result
        ..add('dirID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  StreamTapeRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StreamTapeRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'dirName':
          result.dirName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'dirID':
          result.dirID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$StreamTapeRecord extends StreamTapeRecord {
  @override
  final String? dirName;
  @override
  final String? dirID;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$StreamTapeRecord(
          [void Function(StreamTapeRecordBuilder)? updates]) =>
      (new StreamTapeRecordBuilder()..update(updates))._build();

  _$StreamTapeRecord._({this.dirName, this.dirID, this.ffRef}) : super._();

  @override
  StreamTapeRecord rebuild(void Function(StreamTapeRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StreamTapeRecordBuilder toBuilder() =>
      new StreamTapeRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StreamTapeRecord &&
        dirName == other.dirName &&
        dirID == other.dirID &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, dirName.hashCode), dirID.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StreamTapeRecord')
          ..add('dirName', dirName)
          ..add('dirID', dirID)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class StreamTapeRecordBuilder
    implements Builder<StreamTapeRecord, StreamTapeRecordBuilder> {
  _$StreamTapeRecord? _$v;

  String? _dirName;
  String? get dirName => _$this._dirName;
  set dirName(String? dirName) => _$this._dirName = dirName;

  String? _dirID;
  String? get dirID => _$this._dirID;
  set dirID(String? dirID) => _$this._dirID = dirID;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  StreamTapeRecordBuilder() {
    StreamTapeRecord._initializeBuilder(this);
  }

  StreamTapeRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _dirName = $v.dirName;
      _dirID = $v.dirID;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StreamTapeRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StreamTapeRecord;
  }

  @override
  void update(void Function(StreamTapeRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StreamTapeRecord build() => _build();

  _$StreamTapeRecord _build() {
    final _$result = _$v ??
        new _$StreamTapeRecord._(dirName: dirName, dirID: dirID, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
