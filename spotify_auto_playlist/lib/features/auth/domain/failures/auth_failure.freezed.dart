// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthFailure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthFailure()';
}


}

/// @nodoc
class $AuthFailureCopyWith<$Res>  {
$AuthFailureCopyWith(AuthFailure _, $Res Function(AuthFailure) __);
}


/// Adds pattern-matching-related methods to [AuthFailure].
extension AuthFailurePatterns on AuthFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _UserCancelled value)?  userCancelled,TResult Function( _AuthorizationFailed value)?  authorizationFailed,TResult Function( _TokenExpired value)?  tokenExpired,TResult Function( _TokenRefreshFailed value)?  tokenRefreshFailed,TResult Function( _NetworkError value)?  networkError,TResult Function( _StorageError value)?  storageError,TResult Function( _InvalidConfiguration value)?  invalidConfiguration,TResult Function( _Unknown value)?  unknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserCancelled() when userCancelled != null:
return userCancelled(_that);case _AuthorizationFailed() when authorizationFailed != null:
return authorizationFailed(_that);case _TokenExpired() when tokenExpired != null:
return tokenExpired(_that);case _TokenRefreshFailed() when tokenRefreshFailed != null:
return tokenRefreshFailed(_that);case _NetworkError() when networkError != null:
return networkError(_that);case _StorageError() when storageError != null:
return storageError(_that);case _InvalidConfiguration() when invalidConfiguration != null:
return invalidConfiguration(_that);case _Unknown() when unknown != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _UserCancelled value)  userCancelled,required TResult Function( _AuthorizationFailed value)  authorizationFailed,required TResult Function( _TokenExpired value)  tokenExpired,required TResult Function( _TokenRefreshFailed value)  tokenRefreshFailed,required TResult Function( _NetworkError value)  networkError,required TResult Function( _StorageError value)  storageError,required TResult Function( _InvalidConfiguration value)  invalidConfiguration,required TResult Function( _Unknown value)  unknown,}){
final _that = this;
switch (_that) {
case _UserCancelled():
return userCancelled(_that);case _AuthorizationFailed():
return authorizationFailed(_that);case _TokenExpired():
return tokenExpired(_that);case _TokenRefreshFailed():
return tokenRefreshFailed(_that);case _NetworkError():
return networkError(_that);case _StorageError():
return storageError(_that);case _InvalidConfiguration():
return invalidConfiguration(_that);case _Unknown():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _UserCancelled value)?  userCancelled,TResult? Function( _AuthorizationFailed value)?  authorizationFailed,TResult? Function( _TokenExpired value)?  tokenExpired,TResult? Function( _TokenRefreshFailed value)?  tokenRefreshFailed,TResult? Function( _NetworkError value)?  networkError,TResult? Function( _StorageError value)?  storageError,TResult? Function( _InvalidConfiguration value)?  invalidConfiguration,TResult? Function( _Unknown value)?  unknown,}){
final _that = this;
switch (_that) {
case _UserCancelled() when userCancelled != null:
return userCancelled(_that);case _AuthorizationFailed() when authorizationFailed != null:
return authorizationFailed(_that);case _TokenExpired() when tokenExpired != null:
return tokenExpired(_that);case _TokenRefreshFailed() when tokenRefreshFailed != null:
return tokenRefreshFailed(_that);case _NetworkError() when networkError != null:
return networkError(_that);case _StorageError() when storageError != null:
return storageError(_that);case _InvalidConfiguration() when invalidConfiguration != null:
return invalidConfiguration(_that);case _Unknown() when unknown != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  userCancelled,TResult Function( String message)?  authorizationFailed,TResult Function()?  tokenExpired,TResult Function( String message)?  tokenRefreshFailed,TResult Function( String message)?  networkError,TResult Function( String message)?  storageError,TResult Function( String message)?  invalidConfiguration,TResult Function( String message)?  unknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserCancelled() when userCancelled != null:
return userCancelled();case _AuthorizationFailed() when authorizationFailed != null:
return authorizationFailed(_that.message);case _TokenExpired() when tokenExpired != null:
return tokenExpired();case _TokenRefreshFailed() when tokenRefreshFailed != null:
return tokenRefreshFailed(_that.message);case _NetworkError() when networkError != null:
return networkError(_that.message);case _StorageError() when storageError != null:
return storageError(_that.message);case _InvalidConfiguration() when invalidConfiguration != null:
return invalidConfiguration(_that.message);case _Unknown() when unknown != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  userCancelled,required TResult Function( String message)  authorizationFailed,required TResult Function()  tokenExpired,required TResult Function( String message)  tokenRefreshFailed,required TResult Function( String message)  networkError,required TResult Function( String message)  storageError,required TResult Function( String message)  invalidConfiguration,required TResult Function( String message)  unknown,}) {final _that = this;
switch (_that) {
case _UserCancelled():
return userCancelled();case _AuthorizationFailed():
return authorizationFailed(_that.message);case _TokenExpired():
return tokenExpired();case _TokenRefreshFailed():
return tokenRefreshFailed(_that.message);case _NetworkError():
return networkError(_that.message);case _StorageError():
return storageError(_that.message);case _InvalidConfiguration():
return invalidConfiguration(_that.message);case _Unknown():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  userCancelled,TResult? Function( String message)?  authorizationFailed,TResult? Function()?  tokenExpired,TResult? Function( String message)?  tokenRefreshFailed,TResult? Function( String message)?  networkError,TResult? Function( String message)?  storageError,TResult? Function( String message)?  invalidConfiguration,TResult? Function( String message)?  unknown,}) {final _that = this;
switch (_that) {
case _UserCancelled() when userCancelled != null:
return userCancelled();case _AuthorizationFailed() when authorizationFailed != null:
return authorizationFailed(_that.message);case _TokenExpired() when tokenExpired != null:
return tokenExpired();case _TokenRefreshFailed() when tokenRefreshFailed != null:
return tokenRefreshFailed(_that.message);case _NetworkError() when networkError != null:
return networkError(_that.message);case _StorageError() when storageError != null:
return storageError(_that.message);case _InvalidConfiguration() when invalidConfiguration != null:
return invalidConfiguration(_that.message);case _Unknown() when unknown != null:
return unknown(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _UserCancelled implements AuthFailure {
  const _UserCancelled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserCancelled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthFailure.userCancelled()';
}


}




/// @nodoc


class _AuthorizationFailed implements AuthFailure {
  const _AuthorizationFailed(this.message);
  

 final  String message;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthorizationFailedCopyWith<_AuthorizationFailed> get copyWith => __$AuthorizationFailedCopyWithImpl<_AuthorizationFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthorizationFailed&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthFailure.authorizationFailed(message: $message)';
}


}

/// @nodoc
abstract mixin class _$AuthorizationFailedCopyWith<$Res> implements $AuthFailureCopyWith<$Res> {
  factory _$AuthorizationFailedCopyWith(_AuthorizationFailed value, $Res Function(_AuthorizationFailed) _then) = __$AuthorizationFailedCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$AuthorizationFailedCopyWithImpl<$Res>
    implements _$AuthorizationFailedCopyWith<$Res> {
  __$AuthorizationFailedCopyWithImpl(this._self, this._then);

  final _AuthorizationFailed _self;
  final $Res Function(_AuthorizationFailed) _then;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_AuthorizationFailed(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _TokenExpired implements AuthFailure {
  const _TokenExpired();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TokenExpired);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthFailure.tokenExpired()';
}


}




/// @nodoc


class _TokenRefreshFailed implements AuthFailure {
  const _TokenRefreshFailed(this.message);
  

 final  String message;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TokenRefreshFailedCopyWith<_TokenRefreshFailed> get copyWith => __$TokenRefreshFailedCopyWithImpl<_TokenRefreshFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TokenRefreshFailed&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthFailure.tokenRefreshFailed(message: $message)';
}


}

/// @nodoc
abstract mixin class _$TokenRefreshFailedCopyWith<$Res> implements $AuthFailureCopyWith<$Res> {
  factory _$TokenRefreshFailedCopyWith(_TokenRefreshFailed value, $Res Function(_TokenRefreshFailed) _then) = __$TokenRefreshFailedCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$TokenRefreshFailedCopyWithImpl<$Res>
    implements _$TokenRefreshFailedCopyWith<$Res> {
  __$TokenRefreshFailedCopyWithImpl(this._self, this._then);

  final _TokenRefreshFailed _self;
  final $Res Function(_TokenRefreshFailed) _then;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_TokenRefreshFailed(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _NetworkError implements AuthFailure {
  const _NetworkError(this.message);
  

 final  String message;

/// Create a copy of AuthFailure
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
  return 'AuthFailure.networkError(message: $message)';
}


}

/// @nodoc
abstract mixin class _$NetworkErrorCopyWith<$Res> implements $AuthFailureCopyWith<$Res> {
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

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_NetworkError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _StorageError implements AuthFailure {
  const _StorageError(this.message);
  

 final  String message;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StorageErrorCopyWith<_StorageError> get copyWith => __$StorageErrorCopyWithImpl<_StorageError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StorageError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthFailure.storageError(message: $message)';
}


}

/// @nodoc
abstract mixin class _$StorageErrorCopyWith<$Res> implements $AuthFailureCopyWith<$Res> {
  factory _$StorageErrorCopyWith(_StorageError value, $Res Function(_StorageError) _then) = __$StorageErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$StorageErrorCopyWithImpl<$Res>
    implements _$StorageErrorCopyWith<$Res> {
  __$StorageErrorCopyWithImpl(this._self, this._then);

  final _StorageError _self;
  final $Res Function(_StorageError) _then;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_StorageError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _InvalidConfiguration implements AuthFailure {
  const _InvalidConfiguration(this.message);
  

 final  String message;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvalidConfigurationCopyWith<_InvalidConfiguration> get copyWith => __$InvalidConfigurationCopyWithImpl<_InvalidConfiguration>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvalidConfiguration&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthFailure.invalidConfiguration(message: $message)';
}


}

/// @nodoc
abstract mixin class _$InvalidConfigurationCopyWith<$Res> implements $AuthFailureCopyWith<$Res> {
  factory _$InvalidConfigurationCopyWith(_InvalidConfiguration value, $Res Function(_InvalidConfiguration) _then) = __$InvalidConfigurationCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$InvalidConfigurationCopyWithImpl<$Res>
    implements _$InvalidConfigurationCopyWith<$Res> {
  __$InvalidConfigurationCopyWithImpl(this._self, this._then);

  final _InvalidConfiguration _self;
  final $Res Function(_InvalidConfiguration) _then;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_InvalidConfiguration(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Unknown implements AuthFailure {
  const _Unknown(this.message);
  

 final  String message;

/// Create a copy of AuthFailure
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
  return 'AuthFailure.unknown(message: $message)';
}


}

/// @nodoc
abstract mixin class _$UnknownCopyWith<$Res> implements $AuthFailureCopyWith<$Res> {
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

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Unknown(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
