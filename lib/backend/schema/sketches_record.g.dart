// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sketches_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SketchesRecord> _$sketchesRecordSerializer =
    new _$SketchesRecordSerializer();

class _$SketchesRecordSerializer
    implements StructuredSerializer<SketchesRecord> {
  @override
  final Iterable<Type> types = const [SketchesRecord, _$SketchesRecord];
  @override
  final String wireName = 'SketchesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, SketchesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.sketch;
    if (value != null) {
      result
        ..add('sketch')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.replicateOutput;
    if (value != null) {
      result
        ..add('replicateOutput')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.timeCreated;
    if (value != null) {
      result
        ..add('timeCreated')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.replicatePrompt;
    if (value != null) {
      result
        ..add('replicatePrompt')
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
  SketchesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SketchesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'sketch':
          result.sketch = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'replicateOutput':
          result.replicateOutput = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'timeCreated':
          result.timeCreated = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'replicatePrompt':
          result.replicatePrompt = serializers.deserialize(value,
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

class _$SketchesRecord extends SketchesRecord {
  @override
  final String? sketch;
  @override
  final String? replicateOutput;
  @override
  final DateTime? timeCreated;
  @override
  final String? replicatePrompt;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$SketchesRecord([void Function(SketchesRecordBuilder)? updates]) =>
      (new SketchesRecordBuilder()..update(updates))._build();

  _$SketchesRecord._(
      {this.sketch,
      this.replicateOutput,
      this.timeCreated,
      this.replicatePrompt,
      this.ffRef})
      : super._();

  @override
  SketchesRecord rebuild(void Function(SketchesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SketchesRecordBuilder toBuilder() =>
      new SketchesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SketchesRecord &&
        sketch == other.sketch &&
        replicateOutput == other.replicateOutput &&
        timeCreated == other.timeCreated &&
        replicatePrompt == other.replicatePrompt &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, sketch.hashCode);
    _$hash = $jc(_$hash, replicateOutput.hashCode);
    _$hash = $jc(_$hash, timeCreated.hashCode);
    _$hash = $jc(_$hash, replicatePrompt.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SketchesRecord')
          ..add('sketch', sketch)
          ..add('replicateOutput', replicateOutput)
          ..add('timeCreated', timeCreated)
          ..add('replicatePrompt', replicatePrompt)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class SketchesRecordBuilder
    implements Builder<SketchesRecord, SketchesRecordBuilder> {
  _$SketchesRecord? _$v;

  String? _sketch;
  String? get sketch => _$this._sketch;
  set sketch(String? sketch) => _$this._sketch = sketch;

  String? _replicateOutput;
  String? get replicateOutput => _$this._replicateOutput;
  set replicateOutput(String? replicateOutput) =>
      _$this._replicateOutput = replicateOutput;

  DateTime? _timeCreated;
  DateTime? get timeCreated => _$this._timeCreated;
  set timeCreated(DateTime? timeCreated) => _$this._timeCreated = timeCreated;

  String? _replicatePrompt;
  String? get replicatePrompt => _$this._replicatePrompt;
  set replicatePrompt(String? replicatePrompt) =>
      _$this._replicatePrompt = replicatePrompt;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  SketchesRecordBuilder() {
    SketchesRecord._initializeBuilder(this);
  }

  SketchesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _sketch = $v.sketch;
      _replicateOutput = $v.replicateOutput;
      _timeCreated = $v.timeCreated;
      _replicatePrompt = $v.replicatePrompt;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SketchesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SketchesRecord;
  }

  @override
  void update(void Function(SketchesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SketchesRecord build() => _build();

  _$SketchesRecord _build() {
    final _$result = _$v ??
        new _$SketchesRecord._(
            sketch: sketch,
            replicateOutput: replicateOutput,
            timeCreated: timeCreated,
            replicatePrompt: replicatePrompt,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
