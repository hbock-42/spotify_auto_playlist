// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spotify_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SpotifyFailure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpotifyFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SpotifyFailure()';
}


}

/// @nodoc
class $SpotifyFailureCopyWith<$Res>  {
$SpotifyFailureCopyWith(SpotifyFailure _, $Res Function(SpotifyFailure) __);
}


/// Adds pattern-matching-related methods to [SpotifyFailure].
extension SpotifyFailurePatterns on SpotifyFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Unauthorized value)?  unauthorized,TResult Function( _Forbidden value)?  forbidden,TResult Function( _NotFound value)?  notFound,TResult Function( _RateLimited value)?  rateLimited,TResult Function( _ServerError value)?  serverError,TResult Function( _NetworkError value)?  networkError,TResult Function( _ParseError value)?  parseError,TResult Function( _Unknown value)?  unknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Unauthorized() when unauthorized != null:
return unauthorized(_that);case _Forbidden() when forbidden != null:
return forbidden(_that);case _NotFound() when notFound != null:
return notFound(_that);case _RateLimited() when rateLimited != null:
return rateLimited(_that);case _ServerError() when serverError != null:
return serverError(_that);case _NetworkError() when networkError != null:
return networkError(_that);case _ParseError() when parseError != null:
return parseError(_that);case _Unknown() when unknown != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Unauthorized value)  unauthorized,required TResult Function( _Forbidden value)  forbidden,required TResult Function( _NotFound value)  notFound,required TResult Function( _RateLimited value)  rateLimited,required TResult Function( _ServerError value)  serverError,required TResult Function( _NetworkError value)  networkError,required TResult Function( _ParseError value)  parseError,required TResult Function( _Unknown value)  unknown,}){
final _that = this;
switch (_that) {
case _Unauthorized():
return unauthorized(_that);case _Forbidden():
return forbidden(_that);case _NotFound():
return notFound(_that);case _RateLimited():
return rateLimited(_that);case _ServerError():
return serverError(_that);case _NetworkError():
return networkError(_that);case _ParseError():
return parseError(_that);case _Unknown():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Unauthorized value)?  unauthorized,TResult? Function( _Forbidden value)?  forbidden,TResult? Function( _NotFound value)?  notFound,TResult? Function( _RateLimited value)?  rateLimited,TResult? Function( _ServerError value)?  serverError,TResult? Function( _NetworkError value)?  networkError,TResult? Function( _ParseError value)?  parseError,TResult? Function( _Unknown value)?  unknown,}){
final _that = this;
switch (_that) {
case _Unauthorized() when unauthorized != null:
return unauthorized(_that);case _Forbidden() when forbidden != null:
return forbidden(_that);case _NotFound() when notFound != null:
return notFound(_that);case _RateLimited() when rateLimited != null:
return rateLimited(_that);case _ServerError() when serverError != null:
return serverError(_that);case _NetworkError() when networkError != null:
return networkError(_that);case _ParseError() when parseError != null:
return parseError(_that);case _Unknown() when unknown != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  unauthorized,TResult Function()?  forbidden,TResult Function()?  notFound,TResult Function()?  rateLimited,TResult Function( String message)?  serverError,TResult Function( String message)?  networkError,TResult Function( String message)?  parseError,TResult Function( String message)?  unknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Unauthorized() when unauthorized != null:
return unauthorized();case _Forbidden() when forbidden != null:
return forbidden();case _NotFound() when notFound != null:
return notFound();case _RateLimited() when rateLimited != null:
return rateLimited();case _ServerError() when serverError != null:
return serverError(_that.message);case _NetworkError() when networkError != null:
return networkError(_that.message);case _ParseError() when parseError != null:
return parseError(_that.message);case _Unknown() when unknown != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  unauthorized,required TResult Function()  forbidden,required TResult Function()  notFound,required TResult Function()  rateLimited,required TResult Function( String message)  serverError,required TResult Function( String message)  networkError,required TResult Function( String message)  parseError,required TResult Function( String message)  unknown,}) {final _that = this;
switch (_that) {
case _Unauthorized():
return unauthorized();case _Forbidden():
return forbidden();case _NotFound():
return notFound();case _RateLimited():
return rateLimited();case _ServerError():
return serverError(_that.message);case _NetworkError():
return networkError(_that.message);case _ParseError():
return parseError(_that.message);case _Unknown():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  unauthorized,TResult? Function()?  forbidden,TResult? Function()?  notFound,TResult? Function()?  rateLimited,TResult? Function( String message)?  serverError,TResult? Function( String message)?  networkError,TResult? Function( String message)?  parseError,TResult? Function( String message)?  unknown,}) {final _that = this;
switch (_that) {
case _Unauthorized() when unauthorized != null:
return unauthorized();case _Forbidden() when forbidden != null:
return forbidden();case _NotFound() when notFound != null:
return notFound();case _RateLimited() when rateLimited != null:
return rateLimited();case _ServerError() when serverError != null:
return serverError(_that.message);case _NetworkError() when networkError != null:
return networkError(_that.message);case _ParseError() when parseError != null:
return parseError(_that.message);case _Unknown() when unknown != null:
return unknown(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Unauthorized implements SpotifyFailure {
  const _Unauthorized();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Unauthorized);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SpotifyFailure.unauthorized()';
}


}




/// @nodoc


class _Forbidden implements SpotifyFailure {
  const _Forbidden();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Forbidden);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SpotifyFailure.forbidden()';
}


}




/// @nodoc


class _NotFound implements SpotifyFailure {
  const _NotFound();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotFound);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SpotifyFailure.notFound()';
}


}




/// @nodoc


class _RateLimited implements SpotifyFailure {
  const _RateLimited();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RateLimited);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SpotifyFailure.rateLimited()';
}


}




/// @nodoc


class _ServerError implements SpotifyFailure {
  const _ServerError(this.message);
  

 final  String message;

/// Create a copy of SpotifyFailure
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
  return 'SpotifyFailure.serverError(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ServerErrorCopyWith<$Res> implements $SpotifyFailureCopyWith<$Res> {
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

/// Create a copy of SpotifyFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ServerError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _NetworkError implements SpotifyFailure {
  const _NetworkError(this.message);
  

 final  String message;

/// Create a copy of SpotifyFailure
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
  return 'SpotifyFailure.networkError(message: $message)';
}


}

/// @nodoc
abstract mixin class _$NetworkErrorCopyWith<$Res> implements $SpotifyFailureCopyWith<$Res> {
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

/// Create a copy of SpotifyFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_NetworkError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ParseError implements SpotifyFailure {
  const _ParseError(this.message);
  

 final  String message;

/// Create a copy of SpotifyFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParseErrorCopyWith<_ParseError> get copyWith => __$ParseErrorCopyWithImpl<_ParseError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParseError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SpotifyFailure.parseError(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ParseErrorCopyWith<$Res> implements $SpotifyFailureCopyWith<$Res> {
  factory _$ParseErrorCopyWith(_ParseError value, $Res Function(_ParseError) _then) = __$ParseErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ParseErrorCopyWithImpl<$Res>
    implements _$ParseErrorCopyWith<$Res> {
  __$ParseErrorCopyWithImpl(this._self, this._then);

  final _ParseError _self;
  final $Res Function(_ParseError) _then;

/// Create a copy of SpotifyFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ParseError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Unknown implements SpotifyFailure {
  const _Unknown(this.message);
  

 final  String message;

/// Create a copy of SpotifyFailure
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
  return 'SpotifyFailure.unknown(message: $message)';
}


}

/// @nodoc
abstract mixin class _$UnknownCopyWith<$Res> implements $SpotifyFailureCopyWith<$Res> {
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

/// Create a copy of SpotifyFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Unknown(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
