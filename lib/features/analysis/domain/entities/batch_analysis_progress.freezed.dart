// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'batch_analysis_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BatchAnalysisProgress {

 int get totalSongs; int get completedSongs; int get failedSongs; List<SongAnalysis> get completedAnalyses; List<String> get failedSongTitles; String? get currentSongTitle; bool get isCompleted; bool get isPaused; bool get isCancelled;
/// Create a copy of BatchAnalysisProgress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BatchAnalysisProgressCopyWith<BatchAnalysisProgress> get copyWith => _$BatchAnalysisProgressCopyWithImpl<BatchAnalysisProgress>(this as BatchAnalysisProgress, _$identity);

  /// Serializes this BatchAnalysisProgress to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BatchAnalysisProgress&&(identical(other.totalSongs, totalSongs) || other.totalSongs == totalSongs)&&(identical(other.completedSongs, completedSongs) || other.completedSongs == completedSongs)&&(identical(other.failedSongs, failedSongs) || other.failedSongs == failedSongs)&&const DeepCollectionEquality().equals(other.completedAnalyses, completedAnalyses)&&const DeepCollectionEquality().equals(other.failedSongTitles, failedSongTitles)&&(identical(other.currentSongTitle, currentSongTitle) || other.currentSongTitle == currentSongTitle)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.isPaused, isPaused) || other.isPaused == isPaused)&&(identical(other.isCancelled, isCancelled) || other.isCancelled == isCancelled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalSongs,completedSongs,failedSongs,const DeepCollectionEquality().hash(completedAnalyses),const DeepCollectionEquality().hash(failedSongTitles),currentSongTitle,isCompleted,isPaused,isCancelled);

@override
String toString() {
  return 'BatchAnalysisProgress(totalSongs: $totalSongs, completedSongs: $completedSongs, failedSongs: $failedSongs, completedAnalyses: $completedAnalyses, failedSongTitles: $failedSongTitles, currentSongTitle: $currentSongTitle, isCompleted: $isCompleted, isPaused: $isPaused, isCancelled: $isCancelled)';
}


}

/// @nodoc
abstract mixin class $BatchAnalysisProgressCopyWith<$Res>  {
  factory $BatchAnalysisProgressCopyWith(BatchAnalysisProgress value, $Res Function(BatchAnalysisProgress) _then) = _$BatchAnalysisProgressCopyWithImpl;
@useResult
$Res call({
 int totalSongs, int completedSongs, int failedSongs, List<SongAnalysis> completedAnalyses, List<String> failedSongTitles, String? currentSongTitle, bool isCompleted, bool isPaused, bool isCancelled
});




}
/// @nodoc
class _$BatchAnalysisProgressCopyWithImpl<$Res>
    implements $BatchAnalysisProgressCopyWith<$Res> {
  _$BatchAnalysisProgressCopyWithImpl(this._self, this._then);

  final BatchAnalysisProgress _self;
  final $Res Function(BatchAnalysisProgress) _then;

/// Create a copy of BatchAnalysisProgress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalSongs = null,Object? completedSongs = null,Object? failedSongs = null,Object? completedAnalyses = null,Object? failedSongTitles = null,Object? currentSongTitle = freezed,Object? isCompleted = null,Object? isPaused = null,Object? isCancelled = null,}) {
  return _then(_self.copyWith(
totalSongs: null == totalSongs ? _self.totalSongs : totalSongs // ignore: cast_nullable_to_non_nullable
as int,completedSongs: null == completedSongs ? _self.completedSongs : completedSongs // ignore: cast_nullable_to_non_nullable
as int,failedSongs: null == failedSongs ? _self.failedSongs : failedSongs // ignore: cast_nullable_to_non_nullable
as int,completedAnalyses: null == completedAnalyses ? _self.completedAnalyses : completedAnalyses // ignore: cast_nullable_to_non_nullable
as List<SongAnalysis>,failedSongTitles: null == failedSongTitles ? _self.failedSongTitles : failedSongTitles // ignore: cast_nullable_to_non_nullable
as List<String>,currentSongTitle: freezed == currentSongTitle ? _self.currentSongTitle : currentSongTitle // ignore: cast_nullable_to_non_nullable
as String?,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,isPaused: null == isPaused ? _self.isPaused : isPaused // ignore: cast_nullable_to_non_nullable
as bool,isCancelled: null == isCancelled ? _self.isCancelled : isCancelled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [BatchAnalysisProgress].
extension BatchAnalysisProgressPatterns on BatchAnalysisProgress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BatchAnalysisProgress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BatchAnalysisProgress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BatchAnalysisProgress value)  $default,){
final _that = this;
switch (_that) {
case _BatchAnalysisProgress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BatchAnalysisProgress value)?  $default,){
final _that = this;
switch (_that) {
case _BatchAnalysisProgress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalSongs,  int completedSongs,  int failedSongs,  List<SongAnalysis> completedAnalyses,  List<String> failedSongTitles,  String? currentSongTitle,  bool isCompleted,  bool isPaused,  bool isCancelled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BatchAnalysisProgress() when $default != null:
return $default(_that.totalSongs,_that.completedSongs,_that.failedSongs,_that.completedAnalyses,_that.failedSongTitles,_that.currentSongTitle,_that.isCompleted,_that.isPaused,_that.isCancelled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalSongs,  int completedSongs,  int failedSongs,  List<SongAnalysis> completedAnalyses,  List<String> failedSongTitles,  String? currentSongTitle,  bool isCompleted,  bool isPaused,  bool isCancelled)  $default,) {final _that = this;
switch (_that) {
case _BatchAnalysisProgress():
return $default(_that.totalSongs,_that.completedSongs,_that.failedSongs,_that.completedAnalyses,_that.failedSongTitles,_that.currentSongTitle,_that.isCompleted,_that.isPaused,_that.isCancelled);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalSongs,  int completedSongs,  int failedSongs,  List<SongAnalysis> completedAnalyses,  List<String> failedSongTitles,  String? currentSongTitle,  bool isCompleted,  bool isPaused,  bool isCancelled)?  $default,) {final _that = this;
switch (_that) {
case _BatchAnalysisProgress() when $default != null:
return $default(_that.totalSongs,_that.completedSongs,_that.failedSongs,_that.completedAnalyses,_that.failedSongTitles,_that.currentSongTitle,_that.isCompleted,_that.isPaused,_that.isCancelled);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BatchAnalysisProgress implements BatchAnalysisProgress {
  const _BatchAnalysisProgress({required this.totalSongs, required this.completedSongs, required this.failedSongs, required final  List<SongAnalysis> completedAnalyses, required final  List<String> failedSongTitles, this.currentSongTitle, this.isCompleted = false, this.isPaused = false, this.isCancelled = false}): _completedAnalyses = completedAnalyses,_failedSongTitles = failedSongTitles;
  factory _BatchAnalysisProgress.fromJson(Map<String, dynamic> json) => _$BatchAnalysisProgressFromJson(json);

@override final  int totalSongs;
@override final  int completedSongs;
@override final  int failedSongs;
 final  List<SongAnalysis> _completedAnalyses;
@override List<SongAnalysis> get completedAnalyses {
  if (_completedAnalyses is EqualUnmodifiableListView) return _completedAnalyses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_completedAnalyses);
}

 final  List<String> _failedSongTitles;
@override List<String> get failedSongTitles {
  if (_failedSongTitles is EqualUnmodifiableListView) return _failedSongTitles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_failedSongTitles);
}

@override final  String? currentSongTitle;
@override@JsonKey() final  bool isCompleted;
@override@JsonKey() final  bool isPaused;
@override@JsonKey() final  bool isCancelled;

/// Create a copy of BatchAnalysisProgress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BatchAnalysisProgressCopyWith<_BatchAnalysisProgress> get copyWith => __$BatchAnalysisProgressCopyWithImpl<_BatchAnalysisProgress>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BatchAnalysisProgressToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BatchAnalysisProgress&&(identical(other.totalSongs, totalSongs) || other.totalSongs == totalSongs)&&(identical(other.completedSongs, completedSongs) || other.completedSongs == completedSongs)&&(identical(other.failedSongs, failedSongs) || other.failedSongs == failedSongs)&&const DeepCollectionEquality().equals(other._completedAnalyses, _completedAnalyses)&&const DeepCollectionEquality().equals(other._failedSongTitles, _failedSongTitles)&&(identical(other.currentSongTitle, currentSongTitle) || other.currentSongTitle == currentSongTitle)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.isPaused, isPaused) || other.isPaused == isPaused)&&(identical(other.isCancelled, isCancelled) || other.isCancelled == isCancelled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalSongs,completedSongs,failedSongs,const DeepCollectionEquality().hash(_completedAnalyses),const DeepCollectionEquality().hash(_failedSongTitles),currentSongTitle,isCompleted,isPaused,isCancelled);

@override
String toString() {
  return 'BatchAnalysisProgress(totalSongs: $totalSongs, completedSongs: $completedSongs, failedSongs: $failedSongs, completedAnalyses: $completedAnalyses, failedSongTitles: $failedSongTitles, currentSongTitle: $currentSongTitle, isCompleted: $isCompleted, isPaused: $isPaused, isCancelled: $isCancelled)';
}


}

/// @nodoc
abstract mixin class _$BatchAnalysisProgressCopyWith<$Res> implements $BatchAnalysisProgressCopyWith<$Res> {
  factory _$BatchAnalysisProgressCopyWith(_BatchAnalysisProgress value, $Res Function(_BatchAnalysisProgress) _then) = __$BatchAnalysisProgressCopyWithImpl;
@override @useResult
$Res call({
 int totalSongs, int completedSongs, int failedSongs, List<SongAnalysis> completedAnalyses, List<String> failedSongTitles, String? currentSongTitle, bool isCompleted, bool isPaused, bool isCancelled
});




}
/// @nodoc
class __$BatchAnalysisProgressCopyWithImpl<$Res>
    implements _$BatchAnalysisProgressCopyWith<$Res> {
  __$BatchAnalysisProgressCopyWithImpl(this._self, this._then);

  final _BatchAnalysisProgress _self;
  final $Res Function(_BatchAnalysisProgress) _then;

/// Create a copy of BatchAnalysisProgress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalSongs = null,Object? completedSongs = null,Object? failedSongs = null,Object? completedAnalyses = null,Object? failedSongTitles = null,Object? currentSongTitle = freezed,Object? isCompleted = null,Object? isPaused = null,Object? isCancelled = null,}) {
  return _then(_BatchAnalysisProgress(
totalSongs: null == totalSongs ? _self.totalSongs : totalSongs // ignore: cast_nullable_to_non_nullable
as int,completedSongs: null == completedSongs ? _self.completedSongs : completedSongs // ignore: cast_nullable_to_non_nullable
as int,failedSongs: null == failedSongs ? _self.failedSongs : failedSongs // ignore: cast_nullable_to_non_nullable
as int,completedAnalyses: null == completedAnalyses ? _self._completedAnalyses : completedAnalyses // ignore: cast_nullable_to_non_nullable
as List<SongAnalysis>,failedSongTitles: null == failedSongTitles ? _self._failedSongTitles : failedSongTitles // ignore: cast_nullable_to_non_nullable
as List<String>,currentSongTitle: freezed == currentSongTitle ? _self.currentSongTitle : currentSongTitle // ignore: cast_nullable_to_non_nullable
as String?,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,isPaused: null == isPaused ? _self.isPaused : isPaused // ignore: cast_nullable_to_non_nullable
as bool,isCancelled: null == isCancelled ? _self.isCancelled : isCancelled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$BatchAnalysisState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BatchAnalysisState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BatchAnalysisState()';
}


}

/// @nodoc
class $BatchAnalysisStateCopyWith<$Res>  {
$BatchAnalysisStateCopyWith(BatchAnalysisState _, $Res Function(BatchAnalysisState) __);
}


/// Adds pattern-matching-related methods to [BatchAnalysisState].
extension BatchAnalysisStatePatterns on BatchAnalysisState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Idle value)?  idle,TResult Function( _Running value)?  running,TResult Function( _Paused value)?  paused,TResult Function( _Completed value)?  completed,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle(_that);case _Running() when running != null:
return running(_that);case _Paused() when paused != null:
return paused(_that);case _Completed() when completed != null:
return completed(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Idle value)  idle,required TResult Function( _Running value)  running,required TResult Function( _Paused value)  paused,required TResult Function( _Completed value)  completed,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Idle():
return idle(_that);case _Running():
return running(_that);case _Paused():
return paused(_that);case _Completed():
return completed(_that);case _Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Idle value)?  idle,TResult? Function( _Running value)?  running,TResult? Function( _Paused value)?  paused,TResult? Function( _Completed value)?  completed,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle(_that);case _Running() when running != null:
return running(_that);case _Paused() when paused != null:
return paused(_that);case _Completed() when completed != null:
return completed(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function( BatchAnalysisProgress progress)?  running,TResult Function( BatchAnalysisProgress progress)?  paused,TResult Function( BatchAnalysisProgress progress)?  completed,TResult Function( String message,  BatchAnalysisProgress? progress)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle();case _Running() when running != null:
return running(_that.progress);case _Paused() when paused != null:
return paused(_that.progress);case _Completed() when completed != null:
return completed(_that.progress);case _Error() when error != null:
return error(_that.message,_that.progress);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function( BatchAnalysisProgress progress)  running,required TResult Function( BatchAnalysisProgress progress)  paused,required TResult Function( BatchAnalysisProgress progress)  completed,required TResult Function( String message,  BatchAnalysisProgress? progress)  error,}) {final _that = this;
switch (_that) {
case _Idle():
return idle();case _Running():
return running(_that.progress);case _Paused():
return paused(_that.progress);case _Completed():
return completed(_that.progress);case _Error():
return error(_that.message,_that.progress);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function( BatchAnalysisProgress progress)?  running,TResult? Function( BatchAnalysisProgress progress)?  paused,TResult? Function( BatchAnalysisProgress progress)?  completed,TResult? Function( String message,  BatchAnalysisProgress? progress)?  error,}) {final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle();case _Running() when running != null:
return running(_that.progress);case _Paused() when paused != null:
return paused(_that.progress);case _Completed() when completed != null:
return completed(_that.progress);case _Error() when error != null:
return error(_that.message,_that.progress);case _:
  return null;

}
}

}

/// @nodoc


class _Idle implements BatchAnalysisState {
  const _Idle();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Idle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BatchAnalysisState.idle()';
}


}




/// @nodoc


class _Running implements BatchAnalysisState {
  const _Running(this.progress);
  

 final  BatchAnalysisProgress progress;

/// Create a copy of BatchAnalysisState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RunningCopyWith<_Running> get copyWith => __$RunningCopyWithImpl<_Running>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Running&&(identical(other.progress, progress) || other.progress == progress));
}


@override
int get hashCode => Object.hash(runtimeType,progress);

@override
String toString() {
  return 'BatchAnalysisState.running(progress: $progress)';
}


}

/// @nodoc
abstract mixin class _$RunningCopyWith<$Res> implements $BatchAnalysisStateCopyWith<$Res> {
  factory _$RunningCopyWith(_Running value, $Res Function(_Running) _then) = __$RunningCopyWithImpl;
@useResult
$Res call({
 BatchAnalysisProgress progress
});


$BatchAnalysisProgressCopyWith<$Res> get progress;

}
/// @nodoc
class __$RunningCopyWithImpl<$Res>
    implements _$RunningCopyWith<$Res> {
  __$RunningCopyWithImpl(this._self, this._then);

  final _Running _self;
  final $Res Function(_Running) _then;

/// Create a copy of BatchAnalysisState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? progress = null,}) {
  return _then(_Running(
null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as BatchAnalysisProgress,
  ));
}

/// Create a copy of BatchAnalysisState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BatchAnalysisProgressCopyWith<$Res> get progress {
  
  return $BatchAnalysisProgressCopyWith<$Res>(_self.progress, (value) {
    return _then(_self.copyWith(progress: value));
  });
}
}

/// @nodoc


class _Paused implements BatchAnalysisState {
  const _Paused(this.progress);
  

 final  BatchAnalysisProgress progress;

/// Create a copy of BatchAnalysisState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PausedCopyWith<_Paused> get copyWith => __$PausedCopyWithImpl<_Paused>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Paused&&(identical(other.progress, progress) || other.progress == progress));
}


@override
int get hashCode => Object.hash(runtimeType,progress);

@override
String toString() {
  return 'BatchAnalysisState.paused(progress: $progress)';
}


}

/// @nodoc
abstract mixin class _$PausedCopyWith<$Res> implements $BatchAnalysisStateCopyWith<$Res> {
  factory _$PausedCopyWith(_Paused value, $Res Function(_Paused) _then) = __$PausedCopyWithImpl;
@useResult
$Res call({
 BatchAnalysisProgress progress
});


$BatchAnalysisProgressCopyWith<$Res> get progress;

}
/// @nodoc
class __$PausedCopyWithImpl<$Res>
    implements _$PausedCopyWith<$Res> {
  __$PausedCopyWithImpl(this._self, this._then);

  final _Paused _self;
  final $Res Function(_Paused) _then;

/// Create a copy of BatchAnalysisState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? progress = null,}) {
  return _then(_Paused(
null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as BatchAnalysisProgress,
  ));
}

/// Create a copy of BatchAnalysisState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BatchAnalysisProgressCopyWith<$Res> get progress {
  
  return $BatchAnalysisProgressCopyWith<$Res>(_self.progress, (value) {
    return _then(_self.copyWith(progress: value));
  });
}
}

/// @nodoc


class _Completed implements BatchAnalysisState {
  const _Completed(this.progress);
  

 final  BatchAnalysisProgress progress;

/// Create a copy of BatchAnalysisState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompletedCopyWith<_Completed> get copyWith => __$CompletedCopyWithImpl<_Completed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Completed&&(identical(other.progress, progress) || other.progress == progress));
}


@override
int get hashCode => Object.hash(runtimeType,progress);

@override
String toString() {
  return 'BatchAnalysisState.completed(progress: $progress)';
}


}

/// @nodoc
abstract mixin class _$CompletedCopyWith<$Res> implements $BatchAnalysisStateCopyWith<$Res> {
  factory _$CompletedCopyWith(_Completed value, $Res Function(_Completed) _then) = __$CompletedCopyWithImpl;
@useResult
$Res call({
 BatchAnalysisProgress progress
});


$BatchAnalysisProgressCopyWith<$Res> get progress;

}
/// @nodoc
class __$CompletedCopyWithImpl<$Res>
    implements _$CompletedCopyWith<$Res> {
  __$CompletedCopyWithImpl(this._self, this._then);

  final _Completed _self;
  final $Res Function(_Completed) _then;

/// Create a copy of BatchAnalysisState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? progress = null,}) {
  return _then(_Completed(
null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as BatchAnalysisProgress,
  ));
}

/// Create a copy of BatchAnalysisState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BatchAnalysisProgressCopyWith<$Res> get progress {
  
  return $BatchAnalysisProgressCopyWith<$Res>(_self.progress, (value) {
    return _then(_self.copyWith(progress: value));
  });
}
}

/// @nodoc


class _Error implements BatchAnalysisState {
  const _Error(this.message, this.progress);
  

 final  String message;
 final  BatchAnalysisProgress? progress;

/// Create a copy of BatchAnalysisState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message)&&(identical(other.progress, progress) || other.progress == progress));
}


@override
int get hashCode => Object.hash(runtimeType,message,progress);

@override
String toString() {
  return 'BatchAnalysisState.error(message: $message, progress: $progress)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $BatchAnalysisStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message, BatchAnalysisProgress? progress
});


$BatchAnalysisProgressCopyWith<$Res>? get progress;

}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of BatchAnalysisState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? progress = freezed,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as BatchAnalysisProgress?,
  ));
}

/// Create a copy of BatchAnalysisState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BatchAnalysisProgressCopyWith<$Res>? get progress {
    if (_self.progress == null) {
    return null;
  }

  return $BatchAnalysisProgressCopyWith<$Res>(_self.progress!, (value) {
    return _then(_self.copyWith(progress: value));
  });
}
}

// dart format on
