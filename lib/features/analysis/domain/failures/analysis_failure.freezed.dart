// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analysis_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AnalysisFailure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalysisFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AnalysisFailure()';
}


}

/// @nodoc
class $AnalysisFailureCopyWith<$Res>  {
$AnalysisFailureCopyWith(AnalysisFailure _, $Res Function(AnalysisFailure) __);
}


/// Adds pattern-matching-related methods to [AnalysisFailure].
extension AnalysisFailurePatterns on AnalysisFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _SpotifyError value)?  spotifyError,TResult Function( _LlmError value)?  llmError,TResult Function( _EmptyPlaylist value)?  emptyPlaylist,TResult Function( _Cancelled value)?  cancelled,TResult Function( _Unknown value)?  unknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpotifyError() when spotifyError != null:
return spotifyError(_that);case _LlmError() when llmError != null:
return llmError(_that);case _EmptyPlaylist() when emptyPlaylist != null:
return emptyPlaylist(_that);case _Cancelled() when cancelled != null:
return cancelled(_that);case _Unknown() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _SpotifyError value)  spotifyError,required TResult Function( _LlmError value)  llmError,required TResult Function( _EmptyPlaylist value)  emptyPlaylist,required TResult Function( _Cancelled value)  cancelled,required TResult Function( _Unknown value)  unknown,}){
final _that = this;
switch (_that) {
case _SpotifyError():
return spotifyError(_that);case _LlmError():
return llmError(_that);case _EmptyPlaylist():
return emptyPlaylist(_that);case _Cancelled():
return cancelled(_that);case _Unknown():
return unknown(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _SpotifyError value)?  spotifyError,TResult? Function( _LlmError value)?  llmError,TResult? Function( _EmptyPlaylist value)?  emptyPlaylist,TResult? Function( _Cancelled value)?  cancelled,TResult? Function( _Unknown value)?  unknown,}){
final _that = this;
switch (_that) {
case _SpotifyError() when spotifyError != null:
return spotifyError(_that);case _LlmError() when llmError != null:
return llmError(_that);case _EmptyPlaylist() when emptyPlaylist != null:
return emptyPlaylist(_that);case _Cancelled() when cancelled != null:
return cancelled(_that);case _Unknown() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  spotifyError,TResult Function( String message)?  llmError,TResult Function()?  emptyPlaylist,TResult Function()?  cancelled,TResult Function( String message)?  unknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpotifyError() when spotifyError != null:
return spotifyError(_that.message);case _LlmError() when llmError != null:
return llmError(_that.message);case _EmptyPlaylist() when emptyPlaylist != null:
return emptyPlaylist();case _Cancelled() when cancelled != null:
return cancelled();case _Unknown() when unknown != null:
return unknown(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  spotifyError,required TResult Function( String message)  llmError,required TResult Function()  emptyPlaylist,required TResult Function()  cancelled,required TResult Function( String message)  unknown,}) {final _that = this;
switch (_that) {
case _SpotifyError():
return spotifyError(_that.message);case _LlmError():
return llmError(_that.message);case _EmptyPlaylist():
return emptyPlaylist();case _Cancelled():
return cancelled();case _Unknown():
return unknown(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  spotifyError,TResult? Function( String message)?  llmError,TResult? Function()?  emptyPlaylist,TResult? Function()?  cancelled,TResult? Function( String message)?  unknown,}) {final _that = this;
switch (_that) {
case _SpotifyError() when spotifyError != null:
return spotifyError(_that.message);case _LlmError() when llmError != null:
return llmError(_that.message);case _EmptyPlaylist() when emptyPlaylist != null:
return emptyPlaylist();case _Cancelled() when cancelled != null:
return cancelled();case _Unknown() when unknown != null:
return unknown(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _SpotifyError implements AnalysisFailure {
  const _SpotifyError(this.message);
  

 final  String message;

/// Create a copy of AnalysisFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpotifyErrorCopyWith<_SpotifyError> get copyWith => __$SpotifyErrorCopyWithImpl<_SpotifyError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpotifyError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AnalysisFailure.spotifyError(message: $message)';
}


}

/// @nodoc
abstract mixin class _$SpotifyErrorCopyWith<$Res> implements $AnalysisFailureCopyWith<$Res> {
  factory _$SpotifyErrorCopyWith(_SpotifyError value, $Res Function(_SpotifyError) _then) = __$SpotifyErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$SpotifyErrorCopyWithImpl<$Res>
    implements _$SpotifyErrorCopyWith<$Res> {
  __$SpotifyErrorCopyWithImpl(this._self, this._then);

  final _SpotifyError _self;
  final $Res Function(_SpotifyError) _then;

/// Create a copy of AnalysisFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_SpotifyError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _LlmError implements AnalysisFailure {
  const _LlmError(this.message);
  

 final  String message;

/// Create a copy of AnalysisFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LlmErrorCopyWith<_LlmError> get copyWith => __$LlmErrorCopyWithImpl<_LlmError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LlmError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AnalysisFailure.llmError(message: $message)';
}


}

/// @nodoc
abstract mixin class _$LlmErrorCopyWith<$Res> implements $AnalysisFailureCopyWith<$Res> {
  factory _$LlmErrorCopyWith(_LlmError value, $Res Function(_LlmError) _then) = __$LlmErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$LlmErrorCopyWithImpl<$Res>
    implements _$LlmErrorCopyWith<$Res> {
  __$LlmErrorCopyWithImpl(this._self, this._then);

  final _LlmError _self;
  final $Res Function(_LlmError) _then;

/// Create a copy of AnalysisFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_LlmError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _EmptyPlaylist implements AnalysisFailure {
  const _EmptyPlaylist();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmptyPlaylist);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AnalysisFailure.emptyPlaylist()';
}


}




/// @nodoc


class _Cancelled implements AnalysisFailure {
  const _Cancelled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Cancelled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AnalysisFailure.cancelled()';
}


}




/// @nodoc


class _Unknown implements AnalysisFailure {
  const _Unknown(this.message);
  

 final  String message;

/// Create a copy of AnalysisFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnknownCopyWith<_Unknown> get copyWith => __$UnknownCopyWithImpl<_Unknown>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Unknown&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AnalysisFailure.unknown(message: $message)';
}


}

/// @nodoc
abstract mixin class _$UnknownCopyWith<$Res> implements $AnalysisFailureCopyWith<$Res> {
  factory _$UnknownCopyWith(_Unknown value, $Res Function(_Unknown) _then) = __$UnknownCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$UnknownCopyWithImpl<$Res>
    implements _$UnknownCopyWith<$Res> {
  __$UnknownCopyWithImpl(this._self, this._then);

  final _Unknown _self;
  final $Res Function(_Unknown) _then;

/// Create a copy of AnalysisFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Unknown(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
