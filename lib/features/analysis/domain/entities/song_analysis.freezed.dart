// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'song_analysis.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SongAnalysis {

 String get trackId; List<String> get moods; List<String> get contexts; List<String> get styles; double get confidence; DateTime get analyzedAt;
/// Create a copy of SongAnalysis
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SongAnalysisCopyWith<SongAnalysis> get copyWith => _$SongAnalysisCopyWithImpl<SongAnalysis>(this as SongAnalysis, _$identity);

  /// Serializes this SongAnalysis to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SongAnalysis&&(identical(other.trackId, trackId) || other.trackId == trackId)&&const DeepCollectionEquality().equals(other.moods, moods)&&const DeepCollectionEquality().equals(other.contexts, contexts)&&const DeepCollectionEquality().equals(other.styles, styles)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&(identical(other.analyzedAt, analyzedAt) || other.analyzedAt == analyzedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,trackId,const DeepCollectionEquality().hash(moods),const DeepCollectionEquality().hash(contexts),const DeepCollectionEquality().hash(styles),confidence,analyzedAt);

@override
String toString() {
  return 'SongAnalysis(trackId: $trackId, moods: $moods, contexts: $contexts, styles: $styles, confidence: $confidence, analyzedAt: $analyzedAt)';
}


}

/// @nodoc
abstract mixin class $SongAnalysisCopyWith<$Res>  {
  factory $SongAnalysisCopyWith(SongAnalysis value, $Res Function(SongAnalysis) _then) = _$SongAnalysisCopyWithImpl;
@useResult
$Res call({
 String trackId, List<String> moods, List<String> contexts, List<String> styles, double confidence, DateTime analyzedAt
});




}
/// @nodoc
class _$SongAnalysisCopyWithImpl<$Res>
    implements $SongAnalysisCopyWith<$Res> {
  _$SongAnalysisCopyWithImpl(this._self, this._then);

  final SongAnalysis _self;
  final $Res Function(SongAnalysis) _then;

/// Create a copy of SongAnalysis
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? trackId = null,Object? moods = null,Object? contexts = null,Object? styles = null,Object? confidence = null,Object? analyzedAt = null,}) {
  return _then(_self.copyWith(
trackId: null == trackId ? _self.trackId : trackId // ignore: cast_nullable_to_non_nullable
as String,moods: null == moods ? _self.moods : moods // ignore: cast_nullable_to_non_nullable
as List<String>,contexts: null == contexts ? _self.contexts : contexts // ignore: cast_nullable_to_non_nullable
as List<String>,styles: null == styles ? _self.styles : styles // ignore: cast_nullable_to_non_nullable
as List<String>,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double,analyzedAt: null == analyzedAt ? _self.analyzedAt : analyzedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [SongAnalysis].
extension SongAnalysisPatterns on SongAnalysis {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SongAnalysis value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SongAnalysis() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SongAnalysis value)  $default,){
final _that = this;
switch (_that) {
case _SongAnalysis():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SongAnalysis value)?  $default,){
final _that = this;
switch (_that) {
case _SongAnalysis() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String trackId,  List<String> moods,  List<String> contexts,  List<String> styles,  double confidence,  DateTime analyzedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SongAnalysis() when $default != null:
return $default(_that.trackId,_that.moods,_that.contexts,_that.styles,_that.confidence,_that.analyzedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String trackId,  List<String> moods,  List<String> contexts,  List<String> styles,  double confidence,  DateTime analyzedAt)  $default,) {final _that = this;
switch (_that) {
case _SongAnalysis():
return $default(_that.trackId,_that.moods,_that.contexts,_that.styles,_that.confidence,_that.analyzedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String trackId,  List<String> moods,  List<String> contexts,  List<String> styles,  double confidence,  DateTime analyzedAt)?  $default,) {final _that = this;
switch (_that) {
case _SongAnalysis() when $default != null:
return $default(_that.trackId,_that.moods,_that.contexts,_that.styles,_that.confidence,_that.analyzedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SongAnalysis implements SongAnalysis {
  const _SongAnalysis({required this.trackId, required final  List<String> moods, required final  List<String> contexts, required final  List<String> styles, required this.confidence, required this.analyzedAt}): _moods = moods,_contexts = contexts,_styles = styles;
  factory _SongAnalysis.fromJson(Map<String, dynamic> json) => _$SongAnalysisFromJson(json);

@override final  String trackId;
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

/// Create a copy of SongAnalysis
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SongAnalysisCopyWith<_SongAnalysis> get copyWith => __$SongAnalysisCopyWithImpl<_SongAnalysis>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SongAnalysisToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SongAnalysis&&(identical(other.trackId, trackId) || other.trackId == trackId)&&const DeepCollectionEquality().equals(other._moods, _moods)&&const DeepCollectionEquality().equals(other._contexts, _contexts)&&const DeepCollectionEquality().equals(other._styles, _styles)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&(identical(other.analyzedAt, analyzedAt) || other.analyzedAt == analyzedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,trackId,const DeepCollectionEquality().hash(_moods),const DeepCollectionEquality().hash(_contexts),const DeepCollectionEquality().hash(_styles),confidence,analyzedAt);

@override
String toString() {
  return 'SongAnalysis(trackId: $trackId, moods: $moods, contexts: $contexts, styles: $styles, confidence: $confidence, analyzedAt: $analyzedAt)';
}


}

/// @nodoc
abstract mixin class _$SongAnalysisCopyWith<$Res> implements $SongAnalysisCopyWith<$Res> {
  factory _$SongAnalysisCopyWith(_SongAnalysis value, $Res Function(_SongAnalysis) _then) = __$SongAnalysisCopyWithImpl;
@override @useResult
$Res call({
 String trackId, List<String> moods, List<String> contexts, List<String> styles, double confidence, DateTime analyzedAt
});




}
/// @nodoc
class __$SongAnalysisCopyWithImpl<$Res>
    implements _$SongAnalysisCopyWith<$Res> {
  __$SongAnalysisCopyWithImpl(this._self, this._then);

  final _SongAnalysis _self;
  final $Res Function(_SongAnalysis) _then;

/// Create a copy of SongAnalysis
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? trackId = null,Object? moods = null,Object? contexts = null,Object? styles = null,Object? confidence = null,Object? analyzedAt = null,}) {
  return _then(_SongAnalysis(
trackId: null == trackId ? _self.trackId : trackId // ignore: cast_nullable_to_non_nullable
as String,moods: null == moods ? _self._moods : moods // ignore: cast_nullable_to_non_nullable
as List<String>,contexts: null == contexts ? _self._contexts : contexts // ignore: cast_nullable_to_non_nullable
as List<String>,styles: null == styles ? _self._styles : styles // ignore: cast_nullable_to_non_nullable
as List<String>,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double,analyzedAt: null == analyzedAt ? _self.analyzedAt : analyzedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$SongMetadata {

 String get title; String get artist; List<String> get genres; double get energy; double get danceability; double get valence; double get tempo; double get acousticness;
/// Create a copy of SongMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SongMetadataCopyWith<SongMetadata> get copyWith => _$SongMetadataCopyWithImpl<SongMetadata>(this as SongMetadata, _$identity);

  /// Serializes this SongMetadata to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SongMetadata&&(identical(other.title, title) || other.title == title)&&(identical(other.artist, artist) || other.artist == artist)&&const DeepCollectionEquality().equals(other.genres, genres)&&(identical(other.energy, energy) || other.energy == energy)&&(identical(other.danceability, danceability) || other.danceability == danceability)&&(identical(other.valence, valence) || other.valence == valence)&&(identical(other.tempo, tempo) || other.tempo == tempo)&&(identical(other.acousticness, acousticness) || other.acousticness == acousticness));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,artist,const DeepCollectionEquality().hash(genres),energy,danceability,valence,tempo,acousticness);

@override
String toString() {
  return 'SongMetadata(title: $title, artist: $artist, genres: $genres, energy: $energy, danceability: $danceability, valence: $valence, tempo: $tempo, acousticness: $acousticness)';
}


}

/// @nodoc
abstract mixin class $SongMetadataCopyWith<$Res>  {
  factory $SongMetadataCopyWith(SongMetadata value, $Res Function(SongMetadata) _then) = _$SongMetadataCopyWithImpl;
@useResult
$Res call({
 String title, String artist, List<String> genres, double energy, double danceability, double valence, double tempo, double acousticness
});




}
/// @nodoc
class _$SongMetadataCopyWithImpl<$Res>
    implements $SongMetadataCopyWith<$Res> {
  _$SongMetadataCopyWithImpl(this._self, this._then);

  final SongMetadata _self;
  final $Res Function(SongMetadata) _then;

/// Create a copy of SongMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? artist = null,Object? genres = null,Object? energy = null,Object? danceability = null,Object? valence = null,Object? tempo = null,Object? acousticness = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,artist: null == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as String,genres: null == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<String>,energy: null == energy ? _self.energy : energy // ignore: cast_nullable_to_non_nullable
as double,danceability: null == danceability ? _self.danceability : danceability // ignore: cast_nullable_to_non_nullable
as double,valence: null == valence ? _self.valence : valence // ignore: cast_nullable_to_non_nullable
as double,tempo: null == tempo ? _self.tempo : tempo // ignore: cast_nullable_to_non_nullable
as double,acousticness: null == acousticness ? _self.acousticness : acousticness // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [SongMetadata].
extension SongMetadataPatterns on SongMetadata {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SongMetadata value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SongMetadata() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SongMetadata value)  $default,){
final _that = this;
switch (_that) {
case _SongMetadata():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SongMetadata value)?  $default,){
final _that = this;
switch (_that) {
case _SongMetadata() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String artist,  List<String> genres,  double energy,  double danceability,  double valence,  double tempo,  double acousticness)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SongMetadata() when $default != null:
return $default(_that.title,_that.artist,_that.genres,_that.energy,_that.danceability,_that.valence,_that.tempo,_that.acousticness);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String artist,  List<String> genres,  double energy,  double danceability,  double valence,  double tempo,  double acousticness)  $default,) {final _that = this;
switch (_that) {
case _SongMetadata():
return $default(_that.title,_that.artist,_that.genres,_that.energy,_that.danceability,_that.valence,_that.tempo,_that.acousticness);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String artist,  List<String> genres,  double energy,  double danceability,  double valence,  double tempo,  double acousticness)?  $default,) {final _that = this;
switch (_that) {
case _SongMetadata() when $default != null:
return $default(_that.title,_that.artist,_that.genres,_that.energy,_that.danceability,_that.valence,_that.tempo,_that.acousticness);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SongMetadata implements SongMetadata {
  const _SongMetadata({required this.title, required this.artist, required final  List<String> genres, required this.energy, required this.danceability, required this.valence, required this.tempo, required this.acousticness}): _genres = genres;
  factory _SongMetadata.fromJson(Map<String, dynamic> json) => _$SongMetadataFromJson(json);

@override final  String title;
@override final  String artist;
 final  List<String> _genres;
@override List<String> get genres {
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_genres);
}

@override final  double energy;
@override final  double danceability;
@override final  double valence;
@override final  double tempo;
@override final  double acousticness;

/// Create a copy of SongMetadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SongMetadataCopyWith<_SongMetadata> get copyWith => __$SongMetadataCopyWithImpl<_SongMetadata>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SongMetadataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SongMetadata&&(identical(other.title, title) || other.title == title)&&(identical(other.artist, artist) || other.artist == artist)&&const DeepCollectionEquality().equals(other._genres, _genres)&&(identical(other.energy, energy) || other.energy == energy)&&(identical(other.danceability, danceability) || other.danceability == danceability)&&(identical(other.valence, valence) || other.valence == valence)&&(identical(other.tempo, tempo) || other.tempo == tempo)&&(identical(other.acousticness, acousticness) || other.acousticness == acousticness));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,artist,const DeepCollectionEquality().hash(_genres),energy,danceability,valence,tempo,acousticness);

@override
String toString() {
  return 'SongMetadata(title: $title, artist: $artist, genres: $genres, energy: $energy, danceability: $danceability, valence: $valence, tempo: $tempo, acousticness: $acousticness)';
}


}

/// @nodoc
abstract mixin class _$SongMetadataCopyWith<$Res> implements $SongMetadataCopyWith<$Res> {
  factory _$SongMetadataCopyWith(_SongMetadata value, $Res Function(_SongMetadata) _then) = __$SongMetadataCopyWithImpl;
@override @useResult
$Res call({
 String title, String artist, List<String> genres, double energy, double danceability, double valence, double tempo, double acousticness
});




}
/// @nodoc
class __$SongMetadataCopyWithImpl<$Res>
    implements _$SongMetadataCopyWith<$Res> {
  __$SongMetadataCopyWithImpl(this._self, this._then);

  final _SongMetadata _self;
  final $Res Function(_SongMetadata) _then;

/// Create a copy of SongMetadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? artist = null,Object? genres = null,Object? energy = null,Object? danceability = null,Object? valence = null,Object? tempo = null,Object? acousticness = null,}) {
  return _then(_SongMetadata(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,artist: null == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as String,genres: null == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<String>,energy: null == energy ? _self.energy : energy // ignore: cast_nullable_to_non_nullable
as double,danceability: null == danceability ? _self.danceability : danceability // ignore: cast_nullable_to_non_nullable
as double,valence: null == valence ? _self.valence : valence // ignore: cast_nullable_to_non_nullable
as double,tempo: null == tempo ? _self.tempo : tempo // ignore: cast_nullable_to_non_nullable
as double,acousticness: null == acousticness ? _self.acousticness : acousticness // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
