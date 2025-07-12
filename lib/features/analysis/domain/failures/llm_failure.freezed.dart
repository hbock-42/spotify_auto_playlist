// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'llm_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LlmFailure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LlmFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LlmFailure()';
}


}

/// @nodoc
class $LlmFailureCopyWith<$Res>  {
$LlmFailureCopyWith(LlmFailure _, $Res Function(LlmFailure) __);
}


/// Adds pattern-matching-related methods to [LlmFailure].
extension LlmFailurePatterns on LlmFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _NetworkError value)?  networkError,TResult Function( _ServerError value)?  serverError,TResult Function( _InvalidResponse value)?  invalidResponse,TResult Function( _ModelNotAvailable value)?  modelNotAvailable,TResult Function( _RateLimited value)?  rateLimited,TResult Function( _Timeout value)?  timeout,TResult Function( _Unknown value)?  unknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NetworkError() when networkError != null:
return networkError(_that);case _ServerError() when serverError != null:
return serverError(_that);case _InvalidResponse() when invalidResponse != null:
return invalidResponse(_that);case _ModelNotAvailable() when modelNotAvailable != null:
return modelNotAvailable(_that);case _RateLimited() when rateLimited != null:
return rateLimited(_that);case _Timeout() when timeout != null:
return timeout(_that);case _Unknown() when unknown != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _NetworkError value)  networkError,required TResult Function( _ServerError value)  serverError,required TResult Function( _InvalidResponse value)  invalidResponse,required TResult Function( _ModelNotAvailable value)  modelNotAvailable,required TResult Function( _RateLimited value)  rateLimited,required TResult Function( _Timeout value)  timeout,required TResult Function( _Unknown value)  unknown,}){
final _that = this;
switch (_that) {
case _NetworkError():
return networkError(_that);case _ServerError():
return serverError(_that);case _InvalidResponse():
return invalidResponse(_that);case _ModelNotAvailable():
return modelNotAvailable(_that);case _RateLimited():
return rateLimited(_that);case _Timeout():
return timeout(_that);case _Unknown():
return unknown(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _NetworkError value)?  networkError,TResult? Function( _ServerError value)?  serverError,TResult? Function( _InvalidResponse value)?  invalidResponse,TResult? Function( _ModelNotAvailable value)?  modelNotAvailable,TResult? Function( _RateLimited value)?  rateLimited,TResult? Function( _Timeout value)?  timeout,TResult? Function( _Unknown value)?  unknown,}){
final _that = this;
switch (_that) {
case _NetworkError() when networkError != null:
return networkError(_that);case _ServerError() when serverError != null:
return serverError(_that);case _InvalidResponse() when invalidResponse != null:
return invalidResponse(_that);case _ModelNotAvailable() when modelNotAvailable != null:
return modelNotAvailable(_that);case _RateLimited() when rateLimited != null:
return rateLimited(_that);case _Timeout() when timeout != null:
return timeout(_that);case _Unknown() when unknown != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  networkError,TResult Function( String message)?  serverError,TResult Function( String message)?  invalidResponse,TResult Function( String message)?  modelNotAvailable,TResult Function()?  rateLimited,TResult Function()?  timeout,TResult Function( String message)?  unknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NetworkError() when networkError != null:
return networkError(_that.message);case _ServerError() when serverError != null:
return serverError(_that.message);case _InvalidResponse() when invalidResponse != null:
return invalidResponse(_that.message);case _ModelNotAvailable() when modelNotAvailable != null:
return modelNotAvailable(_that.message);case _RateLimited() when rateLimited != null:
return rateLimited();case _Timeout() when timeout != null:
return timeout();case _Unknown() when unknown != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  networkError,required TResult Function( String message)  serverError,required TResult Function( String message)  invalidResponse,required TResult Function( String message)  modelNotAvailable,required TResult Function()  rateLimited,required TResult Function()  timeout,required TResult Function( String message)  unknown,}) {final _that = this;
switch (_that) {
case _NetworkError():
return networkError(_that.message);case _ServerError():
return serverError(_that.message);case _InvalidResponse():
return invalidResponse(_that.message);case _ModelNotAvailable():
return modelNotAvailable(_that.message);case _RateLimited():
return rateLimited();case _Timeout():
return timeout();case _Unknown():
return unknown(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  networkError,TResult? Function( String message)?  serverError,TResult? Function( String message)?  invalidResponse,TResult? Function( String message)?  modelNotAvailable,TResult? Function()?  rateLimited,TResult? Function()?  timeout,TResult? Function( String message)?  unknown,}) {final _that = this;
switch (_that) {
case _NetworkError() when networkError != null:
return networkError(_that.message);case _ServerError() when serverError != null:
return serverError(_that.message);case _InvalidResponse() when invalidResponse != null:
return invalidResponse(_that.message);case _ModelNotAvailable() when modelNotAvailable != null:
return modelNotAvailable(_that.message);case _RateLimited() when rateLimited != null:
return rateLimited();case _Timeout() when timeout != null:
return timeout();case _Unknown() when unknown != null:
return unknown(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _NetworkError implements LlmFailure {
  const _NetworkError(this.message);
  

 final  String message;

/// Create a copy of LlmFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NetworkErrorCopyWith<_NetworkError> get copyWith => __$NetworkErrorCopyWithImpl<_NetworkError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NetworkError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'LlmFailure.networkError(message: $message)';
}


}

/// @nodoc
abstract mixin class _$NetworkErrorCopyWith<$Res> implements $LlmFailureCopyWith<$Res> {
  factory _$NetworkErrorCopyWith(_NetworkError value, $Res Function(_NetworkError) _then) = __$NetworkErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$NetworkErrorCopyWithImpl<$Res>
    implements _$NetworkErrorCopyWith<$Res> {
  __$NetworkErrorCopyWithImpl(this._self, this._then);

  final _NetworkError _self;
  final $Res Function(_NetworkError) _then;

/// Create a copy of LlmFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_NetworkError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ServerError implements LlmFailure {
  const _ServerError(this.message);
  

 final  String message;

/// Create a copy of LlmFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServerErrorCopyWith<_ServerError> get copyWith => __$ServerErrorCopyWithImpl<_ServerError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServerError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'LlmFailure.serverError(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ServerErrorCopyWith<$Res> implements $LlmFailureCopyWith<$Res> {
  factory _$ServerErrorCopyWith(_ServerError value, $Res Function(_ServerError) _then) = __$ServerErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ServerErrorCopyWithImpl<$Res>
    implements _$ServerErrorCopyWith<$Res> {
  __$ServerErrorCopyWithImpl(this._self, this._then);

  final _ServerError _self;
  final $Res Function(_ServerError) _then;

/// Create a copy of LlmFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ServerError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _InvalidResponse implements LlmFailure {
  const _InvalidResponse(this.message);
  

 final  String message;

/// Create a copy of LlmFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvalidResponseCopyWith<_InvalidResponse> get copyWith => __$InvalidResponseCopyWithImpl<_InvalidResponse>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvalidResponse&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'LlmFailure.invalidResponse(message: $message)';
}


}

/// @nodoc
abstract mixin class _$InvalidResponseCopyWith<$Res> implements $LlmFailureCopyWith<$Res> {
  factory _$InvalidResponseCopyWith(_InvalidResponse value, $Res Function(_InvalidResponse) _then) = __$InvalidResponseCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$InvalidResponseCopyWithImpl<$Res>
    implements _$InvalidResponseCopyWith<$Res> {
  __$InvalidResponseCopyWithImpl(this._self, this._then);

  final _InvalidResponse _self;
  final $Res Function(_InvalidResponse) _then;

/// Create a copy of LlmFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_InvalidResponse(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ModelNotAvailable implements LlmFailure {
  const _ModelNotAvailable(this.message);
  

 final  String message;

/// Create a copy of LlmFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModelNotAvailableCopyWith<_ModelNotAvailable> get copyWith => __$ModelNotAvailableCopyWithImpl<_ModelNotAvailable>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ModelNotAvailable&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'LlmFailure.modelNotAvailable(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ModelNotAvailableCopyWith<$Res> implements $LlmFailureCopyWith<$Res> {
  factory _$ModelNotAvailableCopyWith(_ModelNotAvailable value, $Res Function(_ModelNotAvailable) _then) = __$ModelNotAvailableCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ModelNotAvailableCopyWithImpl<$Res>
    implements _$ModelNotAvailableCopyWith<$Res> {
  __$ModelNotAvailableCopyWithImpl(this._self, this._then);

  final _ModelNotAvailable _self;
  final $Res Function(_ModelNotAvailable) _then;

/// Create a copy of LlmFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ModelNotAvailable(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _RateLimited implements LlmFailure {
  const _RateLimited();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RateLimited);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LlmFailure.rateLimited()';
}


}




/// @nodoc


class _Timeout implements LlmFailure {
  const _Timeout();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Timeout);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LlmFailure.timeout()';
}


}




/// @nodoc


class _Unknown implements LlmFailure {
  const _Unknown(this.message);
  

 final  String message;

/// Create a copy of LlmFailure
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
  return 'LlmFailure.unknown(message: $message)';
}


}

/// @nodoc
abstract mixin class _$UnknownCopyWith<$Res> implements $LlmFailureCopyWith<$Res> {
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

/// Create a copy of LlmFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Unknown(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
