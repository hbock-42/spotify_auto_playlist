// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'song_classification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SongClassification {

 String get trackId; String get trackName; String get artistName; List<String> get moods; List<String> get contexts; List<String> get styles; double get confidence; DateTime get analyzedAt; ClassificationMetadata get metadata;
/// Create a copy of SongClassification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SongClassificationCopyWith<SongClassification> get copyWith => _$SongClassificationCopyWithImpl<SongClassification>(this as SongClassification, _$identity);

  /// Serializes this SongClassification to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SongClassification&&(identical(other.trackId, trackId) || other.trackId == trackId)&&(identical(other.trackName, trackName) || other.trackName == trackName)&&(identical(other.artistName, artistName) || other.artistName == artistName)&&const DeepCollectionEquality().equals(other.moods, moods)&&const DeepCollectionEquality().equals(other.contexts, contexts)&&const DeepCollectionEquality().equals(other.styles, styles)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&(identical(other.analyzedAt, analyzedAt) || other.analyzedAt == analyzedAt)&&(identical(other.metadata, metadata) || other.metadata == metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,trackId,trackName,artistName,const DeepCollectionEquality().hash(moods),const DeepCollectionEquality().hash(contexts),const DeepCollectionEquality().hash(styles),confidence,analyzedAt,metadata);

@override
String toString() {
  return 'SongClassification(trackId: $trackId, trackName: $trackName, artistName: $artistName, moods: $moods, contexts: $contexts, styles: $styles, confidence: $confidence, analyzedAt: $analyzedAt, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $SongClassificationCopyWith<$Res>  {
  factory $SongClassificationCopyWith(SongClassification value, $Res Function(SongClassification) _then) = _$SongClassificationCopyWithImpl;
@useResult
$Res call({
 String trackId, String trackName, String artistName, List<String> moods, List<String> contexts, List<String> styles, double confidence, DateTime analyzedAt, ClassificationMetadata metadata
});


$ClassificationMetadataCopyWith<$Res> get metadata;

}
/// @nodoc
class _$SongClassificationCopyWithImpl<$Res>
    implements $SongClassificationCopyWith<$Res> {
  _$SongClassificationCopyWithImpl(this._self, this._then);

  final SongClassification _self;
  final $Res Function(SongClassification) _then;

/// Create a copy of SongClassification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? trackId = null,Object? trackName = null,Object? artistName = null,Object? moods = null,Object? contexts = null,Object? styles = null,Object? confidence = null,Object? analyzedAt = null,Object? metadata = null,}) {
  return _then(_self.copyWith(
trackId: null == trackId ? _self.trackId : trackId // ignore: cast_nullable_to_non_nullable
as String,trackName: null == trackName ? _self.trackName : trackName // ignore: cast_nullable_to_non_nullable
as String,artistName: null == artistName ? _self.artistName : artistName // ignore: cast_nullable_to_non_nullable
as String,moods: null == moods ? _self.moods : moods // ignore: cast_nullable_to_non_nullable
as List<String>,contexts: null == contexts ? _self.contexts : contexts // ignore: cast_nullable_to_non_nullable
as List<String>,styles: null == styles ? _self.styles : styles // ignore: cast_nullable_to_non_nullable
as List<String>,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double,analyzedAt: null == analyzedAt ? _self.analyzedAt : analyzedAt // ignore: cast_nullable_to_non_nullable
as DateTime,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as ClassificationMetadata,
  ));
}
/// Create a copy of SongClassification
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClassificationMetadataCopyWith<$Res> get metadata {
  
  return $ClassificationMetadataCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}


/// Adds pattern-matching-related methods to [SongClassification].
extension SongClassificationPatterns on SongClassification {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SongClassification value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SongClassification() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SongClassification value)  $default,){
final _that = this;
switch (_that) {
case _SongClassification():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SongClassification value)?  $default,){
final _that = this;
switch (_that) {
case _SongClassification() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String trackId,  String trackName,  String artistName,  List<String> moods,  List<String> contexts,  List<String> styles,  double confidence,  DateTime analyzedAt,  ClassificationMetadata metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SongClassification() when $default != null:
return $default(_that.trackId,_that.trackName,_that.artistName,_that.moods,_that.contexts,_that.styles,_that.confidence,_that.analyzedAt,_that.metadata);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String trackId,  String trackName,  String artistName,  List<String> moods,  List<String> contexts,  List<String> styles,  double confidence,  DateTime analyzedAt,  ClassificationMetadata metadata)  $default,) {final _that = this;
switch (_that) {
case _SongClassification():
return $default(_that.trackId,_that.trackName,_that.artistName,_that.moods,_that.contexts,_that.styles,_that.confidence,_that.analyzedAt,_that.metadata);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String trackId,  String trackName,  String artistName,  List<String> moods,  List<String> contexts,  List<String> styles,  double confidence,  DateTime analyzedAt,  ClassificationMetadata metadata)?  $default,) {final _that = this;
switch (_that) {
case _SongClassification() when $default != null:
return $default(_that.trackId,_that.trackName,_that.artistName,_that.moods,_that.contexts,_that.styles,_that.confidence,_that.analyzedAt,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SongClassification extends SongClassification {
  const _SongClassification({required this.trackId, required this.trackName, required this.artistName, required final  List<String> moods, required final  List<String> contexts, required final  List<String> styles, required this.confidence, required this.analyzedAt, required this.metadata}): _moods = moods,_contexts = contexts,_styles = styles,super._();
  factory _SongClassification.fromJson(Map<String, dynamic> json) => _$SongClassificationFromJson(json);

@override final  String trackId;
@override final  String trackName;
@override final  String artistName;
 final  List<String> _moods;
@override List<String> get moods {
  if (_moods is EqualUnmodifiableListView) return _moods;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_moods);
}

 final  List<String> _contexts;
@override List<String> get contexts {
  if (_contexts is EqualUnmodifiableListView) return _contexts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_contexts);
}

 final  List<String> _styles;
@override List<String> get styles {
  if (_styles is EqualUnmodifiableListView) return _styles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_styles);
}

@override final  double confidence;
@override final  DateTime analyzedAt;
@override final  ClassificationMetadata metadata;

/// Create a copy of SongClassification
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SongClassificationCopyWith<_SongClassification> get copyWith => __$SongClassificationCopyWithImpl<_SongClassification>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SongClassificationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SongClassification&&(identical(other.trackId, trackId) || other.trackId == trackId)&&(identical(other.trackName, trackName) || other.trackName == trackName)&&(identical(other.artistName, artistName) || other.artistName == artistName)&&const DeepCollectionEquality().equals(other._moods, _moods)&&const DeepCollectionEquality().equals(other._contexts, _contexts)&&const DeepCollectionEquality().equals(other._styles, _styles)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&(identical(other.analyzedAt, analyzedAt) || other.analyzedAt == analyzedAt)&&(identical(other.metadata, metadata) || other.metadata == metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,trackId,trackName,artistName,const DeepCollectionEquality().hash(_moods),const DeepCollectionEquality().hash(_contexts),const DeepCollectionEquality().hash(_styles),confidence,analyzedAt,metadata);

@override
String toString() {
  return 'SongClassification(trackId: $trackId, trackName: $trackName, artistName: $artistName, moods: $moods, contexts: $contexts, styles: $styles, confidence: $confidence, analyzedAt: $analyzedAt, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$SongClassificationCopyWith<$Res> implements $SongClassificationCopyWith<$Res> {
  factory _$SongClassificationCopyWith(_SongClassification value, $Res Function(_SongClassification) _then) = __$SongClassificationCopyWithImpl;
@override @useResult
$Res call({
 String trackId, String trackName, String artistName, List<String> moods, List<String> contexts, List<String> styles, double confidence, DateTime analyzedAt, ClassificationMetadata metadata
});


@override $ClassificationMetadataCopyWith<$Res> get metadata;

}
/// @nodoc
class __$SongClassificationCopyWithImpl<$Res>
    implements _$SongClassificationCopyWith<$Res> {
  __$SongClassificationCopyWithImpl(this._self, this._then);

  final _SongClassification _self;
  final $Res Function(_SongClassification) _then;

/// Create a copy of SongClassification
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? trackId = null,Object? trackName = null,Object? artistName = null,Object? moods = null,Object? contexts = null,Object? styles = null,Object? confidence = null,Object? analyzedAt = null,Object? metadata = null,}) {
  return _then(_SongClassification(
trackId: null == trackId ? _self.trackId : trackId // ignore: cast_nullable_to_non_nullable
as String,trackName: null == trackName ? _self.trackName : trackName // ignore: cast_nullable_to_non_nullable
as String,artistName: null == artistName ? _self.artistName : artistName // ignore: cast_nullable_to_non_nullable
as String,moods: null == moods ? _self._moods : moods // ignore: cast_nullable_to_non_nullable
as List<String>,contexts: null == contexts ? _self._contexts : contexts // ignore: cast_nullable_to_non_nullable
as List<String>,styles: null == styles ? _self._styles : styles // ignore: cast_nullable_to_non_nullable
as List<String>,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double,analyzedAt: null == analyzedAt ? _self.analyzedAt : analyzedAt // ignore: cast_nullable_to_non_nullable
as DateTime,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as ClassificationMetadata,
  ));
}

/// Create a copy of SongClassification
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClassificationMetadataCopyWith<$Res> get metadata {
  
  return $ClassificationMetadataCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}


/// @nodoc
mixin _$ClassificationMetadata {

 String get modelUsed; String get promptVersion; Duration get processingTime; Map<String, dynamic> get audioFeatures; double get confidenceScore;
/// Create a copy of ClassificationMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClassificationMetadataCopyWith<ClassificationMetadata> get copyWith => _$ClassificationMetadataCopyWithImpl<ClassificationMetadata>(this as ClassificationMetadata, _$identity);

  /// Serializes this ClassificationMetadata to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClassificationMetadata&&(identical(other.modelUsed, modelUsed) || other.modelUsed == modelUsed)&&(identical(other.promptVersion, promptVersion) || other.promptVersion == promptVersion)&&(identical(other.processingTime, processingTime) || other.processingTime == processingTime)&&const DeepCollectionEquality().equals(other.audioFeatures, audioFeatures)&&(identical(other.confidenceScore, confidenceScore) || other.confidenceScore == confidenceScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,modelUsed,promptVersion,processingTime,const DeepCollectionEquality().hash(audioFeatures),confidenceScore);

@override
String toString() {
  return 'ClassificationMetadata(modelUsed: $modelUsed, promptVersion: $promptVersion, processingTime: $processingTime, audioFeatures: $audioFeatures, confidenceScore: $confidenceScore)';
}


}

/// @nodoc
abstract mixin class $ClassificationMetadataCopyWith<$Res>  {
  factory $ClassificationMetadataCopyWith(ClassificationMetadata value, $Res Function(ClassificationMetadata) _then) = _$ClassificationMetadataCopyWithImpl;
@useResult
$Res call({
 String modelUsed, String promptVersion, Duration processingTime, Map<String, dynamic> audioFeatures, double confidenceScore
});




}
/// @nodoc
class _$ClassificationMetadataCopyWithImpl<$Res>
    implements $ClassificationMetadataCopyWith<$Res> {
  _$ClassificationMetadataCopyWithImpl(this._self, this._then);

  final ClassificationMetadata _self;
  final $Res Function(ClassificationMetadata) _then;

/// Create a copy of ClassificationMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? modelUsed = null,Object? promptVersion = null,Object? processingTime = null,Object? audioFeatures = null,Object? confidenceScore = null,}) {
  return _then(_self.copyWith(
modelUsed: null == modelUsed ? _self.modelUsed : modelUsed // ignore: cast_nullable_to_non_nullable
as String,promptVersion: null == promptVersion ? _self.promptVersion : promptVersion // ignore: cast_nullable_to_non_nullable
as String,processingTime: null == processingTime ? _self.processingTime : processingTime // ignore: cast_nullable_to_non_nullable
as Duration,audioFeatures: null == audioFeatures ? _self.audioFeatures : audioFeatures // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,confidenceScore: null == confidenceScore ? _self.confidenceScore : confidenceScore // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ClassificationMetadata].
extension ClassificationMetadataPatterns on ClassificationMetadata {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClassificationMetadata value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClassificationMetadata() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClassificationMetadata value)  $default,){
final _that = this;
switch (_that) {
case _ClassificationMetadata():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClassificationMetadata value)?  $default,){
final _that = this;
switch (_that) {
case _ClassificationMetadata() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String modelUsed,  String promptVersion,  Duration processingTime,  Map<String, dynamic> audioFeatures,  double confidenceScore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClassificationMetadata() when $default != null:
return $default(_that.modelUsed,_that.promptVersion,_that.processingTime,_that.audioFeatures,_that.confidenceScore);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String modelUsed,  String promptVersion,  Duration processingTime,  Map<String, dynamic> audioFeatures,  double confidenceScore)  $default,) {final _that = this;
switch (_that) {
case _ClassificationMetadata():
return $default(_that.modelUsed,_that.promptVersion,_that.processingTime,_that.audioFeatures,_that.confidenceScore);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String modelUsed,  String promptVersion,  Duration processingTime,  Map<String, dynamic> audioFeatures,  double confidenceScore)?  $default,) {final _that = this;
switch (_that) {
case _ClassificationMetadata() when $default != null:
return $default(_that.modelUsed,_that.promptVersion,_that.processingTime,_that.audioFeatures,_that.confidenceScore);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClassificationMetadata implements ClassificationMetadata {
  const _ClassificationMetadata({required this.modelUsed, required this.promptVersion, required this.processingTime, required final  Map<String, dynamic> audioFeatures, required this.confidenceScore}): _audioFeatures = audioFeatures;
  factory _ClassificationMetadata.fromJson(Map<String, dynamic> json) => _$ClassificationMetadataFromJson(json);

@override final  String modelUsed;
@override final  String promptVersion;
@override final  Duration processingTime;
 final  Map<String, dynamic> _audioFeatures;
@override Map<String, dynamic> get audioFeatures {
  if (_audioFeatures is EqualUnmodifiableMapView) return _audioFeatures;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_audioFeatures);
}

@override final  double confidenceScore;

/// Create a copy of ClassificationMetadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClassificationMetadataCopyWith<_ClassificationMetadata> get copyWith => __$ClassificationMetadataCopyWithImpl<_ClassificationMetadata>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClassificationMetadataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClassificationMetadata&&(identical(other.modelUsed, modelUsed) || other.modelUsed == modelUsed)&&(identical(other.promptVersion, promptVersion) || other.promptVersion == promptVersion)&&(identical(other.processingTime, processingTime) || other.processingTime == processingTime)&&const DeepCollectionEquality().equals(other._audioFeatures, _audioFeatures)&&(identical(other.confidenceScore, confidenceScore) || other.confidenceScore == confidenceScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,modelUsed,promptVersion,processingTime,const DeepCollectionEquality().hash(_audioFeatures),confidenceScore);

@override
String toString() {
  return 'ClassificationMetadata(modelUsed: $modelUsed, promptVersion: $promptVersion, processingTime: $processingTime, audioFeatures: $audioFeatures, confidenceScore: $confidenceScore)';
}


}

/// @nodoc
abstract mixin class _$ClassificationMetadataCopyWith<$Res> implements $ClassificationMetadataCopyWith<$Res> {
  factory _$ClassificationMetadataCopyWith(_ClassificationMetadata value, $Res Function(_ClassificationMetadata) _then) = __$ClassificationMetadataCopyWithImpl;
@override @useResult
$Res call({
 String modelUsed, String promptVersion, Duration processingTime, Map<String, dynamic> audioFeatures, double confidenceScore
});




}
/// @nodoc
class __$ClassificationMetadataCopyWithImpl<$Res>
    implements _$ClassificationMetadataCopyWith<$Res> {
  __$ClassificationMetadataCopyWithImpl(this._self, this._then);

  final _ClassificationMetadata _self;
  final $Res Function(_ClassificationMetadata) _then;

/// Create a copy of ClassificationMetadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? modelUsed = null,Object? promptVersion = null,Object? processingTime = null,Object? audioFeatures = null,Object? confidenceScore = null,}) {
  return _then(_ClassificationMetadata(
modelUsed: null == modelUsed ? _self.modelUsed : modelUsed // ignore: cast_nullable_to_non_nullable
as String,promptVersion: null == promptVersion ? _self.promptVersion : promptVersion // ignore: cast_nullable_to_non_nullable
as String,processingTime: null == processingTime ? _self.processingTime : processingTime // ignore: cast_nullable_to_non_nullable
as Duration,audioFeatures: null == audioFeatures ? _self._audioFeatures : audioFeatures // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,confidenceScore: null == confidenceScore ? _self.confidenceScore : confidenceScore // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
