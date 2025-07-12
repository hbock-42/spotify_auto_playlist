// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analysis_statistics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnalysisStatistics {

 int get totalAnalyses; Map<String, int> get moodCounts; Map<String, int> get contextCounts; Map<String, int> get styleCounts; double get averageConfidence; DateTime? get lastAnalyzedAt; DateTime? get firstAnalyzedAt;
/// Create a copy of AnalysisStatistics
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnalysisStatisticsCopyWith<AnalysisStatistics> get copyWith => _$AnalysisStatisticsCopyWithImpl<AnalysisStatistics>(this as AnalysisStatistics, _$identity);

  /// Serializes this AnalysisStatistics to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalysisStatistics&&(identical(other.totalAnalyses, totalAnalyses) || other.totalAnalyses == totalAnalyses)&&const DeepCollectionEquality().equals(other.moodCounts, moodCounts)&&const DeepCollectionEquality().equals(other.contextCounts, contextCounts)&&const DeepCollectionEquality().equals(other.styleCounts, styleCounts)&&(identical(other.averageConfidence, averageConfidence) || other.averageConfidence == averageConfidence)&&(identical(other.lastAnalyzedAt, lastAnalyzedAt) || other.lastAnalyzedAt == lastAnalyzedAt)&&(identical(other.firstAnalyzedAt, firstAnalyzedAt) || other.firstAnalyzedAt == firstAnalyzedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalAnalyses,const DeepCollectionEquality().hash(moodCounts),const DeepCollectionEquality().hash(contextCounts),const DeepCollectionEquality().hash(styleCounts),averageConfidence,lastAnalyzedAt,firstAnalyzedAt);

@override
String toString() {
  return 'AnalysisStatistics(totalAnalyses: $totalAnalyses, moodCounts: $moodCounts, contextCounts: $contextCounts, styleCounts: $styleCounts, averageConfidence: $averageConfidence, lastAnalyzedAt: $lastAnalyzedAt, firstAnalyzedAt: $firstAnalyzedAt)';
}


}

/// @nodoc
abstract mixin class $AnalysisStatisticsCopyWith<$Res>  {
  factory $AnalysisStatisticsCopyWith(AnalysisStatistics value, $Res Function(AnalysisStatistics) _then) = _$AnalysisStatisticsCopyWithImpl;
@useResult
$Res call({
 int totalAnalyses, Map<String, int> moodCounts, Map<String, int> contextCounts, Map<String, int> styleCounts, double averageConfidence, DateTime? lastAnalyzedAt, DateTime? firstAnalyzedAt
});




}
/// @nodoc
class _$AnalysisStatisticsCopyWithImpl<$Res>
    implements $AnalysisStatisticsCopyWith<$Res> {
  _$AnalysisStatisticsCopyWithImpl(this._self, this._then);

  final AnalysisStatistics _self;
  final $Res Function(AnalysisStatistics) _then;

/// Create a copy of AnalysisStatistics
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalAnalyses = null,Object? moodCounts = null,Object? contextCounts = null,Object? styleCounts = null,Object? averageConfidence = null,Object? lastAnalyzedAt = freezed,Object? firstAnalyzedAt = freezed,}) {
  return _then(_self.copyWith(
totalAnalyses: null == totalAnalyses ? _self.totalAnalyses : totalAnalyses // ignore: cast_nullable_to_non_nullable
as int,moodCounts: null == moodCounts ? _self.moodCounts : moodCounts // ignore: cast_nullable_to_non_nullable
as Map<String, int>,contextCounts: null == contextCounts ? _self.contextCounts : contextCounts // ignore: cast_nullable_to_non_nullable
as Map<String, int>,styleCounts: null == styleCounts ? _self.styleCounts : styleCounts // ignore: cast_nullable_to_non_nullable
as Map<String, int>,averageConfidence: null == averageConfidence ? _self.averageConfidence : averageConfidence // ignore: cast_nullable_to_non_nullable
as double,lastAnalyzedAt: freezed == lastAnalyzedAt ? _self.lastAnalyzedAt : lastAnalyzedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,firstAnalyzedAt: freezed == firstAnalyzedAt ? _self.firstAnalyzedAt : firstAnalyzedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [AnalysisStatistics].
extension AnalysisStatisticsPatterns on AnalysisStatistics {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnalysisStatistics value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnalysisStatistics() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnalysisStatistics value)  $default,){
final _that = this;
switch (_that) {
case _AnalysisStatistics():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnalysisStatistics value)?  $default,){
final _that = this;
switch (_that) {
case _AnalysisStatistics() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalAnalyses,  Map<String, int> moodCounts,  Map<String, int> contextCounts,  Map<String, int> styleCounts,  double averageConfidence,  DateTime? lastAnalyzedAt,  DateTime? firstAnalyzedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnalysisStatistics() when $default != null:
return $default(_that.totalAnalyses,_that.moodCounts,_that.contextCounts,_that.styleCounts,_that.averageConfidence,_that.lastAnalyzedAt,_that.firstAnalyzedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalAnalyses,  Map<String, int> moodCounts,  Map<String, int> contextCounts,  Map<String, int> styleCounts,  double averageConfidence,  DateTime? lastAnalyzedAt,  DateTime? firstAnalyzedAt)  $default,) {final _that = this;
switch (_that) {
case _AnalysisStatistics():
return $default(_that.totalAnalyses,_that.moodCounts,_that.contextCounts,_that.styleCounts,_that.averageConfidence,_that.lastAnalyzedAt,_that.firstAnalyzedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalAnalyses,  Map<String, int> moodCounts,  Map<String, int> contextCounts,  Map<String, int> styleCounts,  double averageConfidence,  DateTime? lastAnalyzedAt,  DateTime? firstAnalyzedAt)?  $default,) {final _that = this;
switch (_that) {
case _AnalysisStatistics() when $default != null:
return $default(_that.totalAnalyses,_that.moodCounts,_that.contextCounts,_that.styleCounts,_that.averageConfidence,_that.lastAnalyzedAt,_that.firstAnalyzedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnalysisStatistics implements AnalysisStatistics {
  const _AnalysisStatistics({required this.totalAnalyses, required final  Map<String, int> moodCounts, required final  Map<String, int> contextCounts, required final  Map<String, int> styleCounts, required this.averageConfidence, required this.lastAnalyzedAt, required this.firstAnalyzedAt}): _moodCounts = moodCounts,_contextCounts = contextCounts,_styleCounts = styleCounts;
  factory _AnalysisStatistics.fromJson(Map<String, dynamic> json) => _$AnalysisStatisticsFromJson(json);

@override final  int totalAnalyses;
 final  Map<String, int> _moodCounts;
@override Map<String, int> get moodCounts {
  if (_moodCounts is EqualUnmodifiableMapView) return _moodCounts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_moodCounts);
}

 final  Map<String, int> _contextCounts;
@override Map<String, int> get contextCounts {
  if (_contextCounts is EqualUnmodifiableMapView) return _contextCounts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_contextCounts);
}

 final  Map<String, int> _styleCounts;
@override Map<String, int> get styleCounts {
  if (_styleCounts is EqualUnmodifiableMapView) return _styleCounts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_styleCounts);
}

@override final  double averageConfidence;
@override final  DateTime? lastAnalyzedAt;
@override final  DateTime? firstAnalyzedAt;

/// Create a copy of AnalysisStatistics
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnalysisStatisticsCopyWith<_AnalysisStatistics> get copyWith => __$AnalysisStatisticsCopyWithImpl<_AnalysisStatistics>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnalysisStatisticsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnalysisStatistics&&(identical(other.totalAnalyses, totalAnalyses) || other.totalAnalyses == totalAnalyses)&&const DeepCollectionEquality().equals(other._moodCounts, _moodCounts)&&const DeepCollectionEquality().equals(other._contextCounts, _contextCounts)&&const DeepCollectionEquality().equals(other._styleCounts, _styleCounts)&&(identical(other.averageConfidence, averageConfidence) || other.averageConfidence == averageConfidence)&&(identical(other.lastAnalyzedAt, lastAnalyzedAt) || other.lastAnalyzedAt == lastAnalyzedAt)&&(identical(other.firstAnalyzedAt, firstAnalyzedAt) || other.firstAnalyzedAt == firstAnalyzedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalAnalyses,const DeepCollectionEquality().hash(_moodCounts),const DeepCollectionEquality().hash(_contextCounts),const DeepCollectionEquality().hash(_styleCounts),averageConfidence,lastAnalyzedAt,firstAnalyzedAt);

@override
String toString() {
  return 'AnalysisStatistics(totalAnalyses: $totalAnalyses, moodCounts: $moodCounts, contextCounts: $contextCounts, styleCounts: $styleCounts, averageConfidence: $averageConfidence, lastAnalyzedAt: $lastAnalyzedAt, firstAnalyzedAt: $firstAnalyzedAt)';
}


}

/// @nodoc
abstract mixin class _$AnalysisStatisticsCopyWith<$Res> implements $AnalysisStatisticsCopyWith<$Res> {
  factory _$AnalysisStatisticsCopyWith(_AnalysisStatistics value, $Res Function(_AnalysisStatistics) _then) = __$AnalysisStatisticsCopyWithImpl;
@override @useResult
$Res call({
 int totalAnalyses, Map<String, int> moodCounts, Map<String, int> contextCounts, Map<String, int> styleCounts, double averageConfidence, DateTime? lastAnalyzedAt, DateTime? firstAnalyzedAt
});




}
/// @nodoc
class __$AnalysisStatisticsCopyWithImpl<$Res>
    implements _$AnalysisStatisticsCopyWith<$Res> {
  __$AnalysisStatisticsCopyWithImpl(this._self, this._then);

  final _AnalysisStatistics _self;
  final $Res Function(_AnalysisStatistics) _then;

/// Create a copy of AnalysisStatistics
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalAnalyses = null,Object? moodCounts = null,Object? contextCounts = null,Object? styleCounts = null,Object? averageConfidence = null,Object? lastAnalyzedAt = freezed,Object? firstAnalyzedAt = freezed,}) {
  return _then(_AnalysisStatistics(
totalAnalyses: null == totalAnalyses ? _self.totalAnalyses : totalAnalyses // ignore: cast_nullable_to_non_nullable
as int,moodCounts: null == moodCounts ? _self._moodCounts : moodCounts // ignore: cast_nullable_to_non_nullable
as Map<String, int>,contextCounts: null == contextCounts ? _self._contextCounts : contextCounts // ignore: cast_nullable_to_non_nullable
as Map<String, int>,styleCounts: null == styleCounts ? _self._styleCounts : styleCounts // ignore: cast_nullable_to_non_nullable
as Map<String, int>,averageConfidence: null == averageConfidence ? _self.averageConfidence : averageConfidence // ignore: cast_nullable_to_non_nullable
as double,lastAnalyzedAt: freezed == lastAnalyzedAt ? _self.lastAnalyzedAt : lastAnalyzedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,firstAnalyzedAt: freezed == firstAnalyzedAt ? _self.firstAnalyzedAt : firstAnalyzedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
