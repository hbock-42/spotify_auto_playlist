// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'playlist_creation_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlaylistCreationFailure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaylistCreationFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlaylistCreationFailure()';
}


}

/// @nodoc
class $PlaylistCreationFailureCopyWith<$Res>  {
$PlaylistCreationFailureCopyWith(PlaylistCreationFailure _, $Res Function(PlaylistCreationFailure) __);
}


/// Adds pattern-matching-related methods to [PlaylistCreationFailure].
extension PlaylistCreationFailurePatterns on PlaylistCreationFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Unauthorized value)?  unauthorized,TResult Function( _Forbidden value)?  forbidden,TResult Function( _InvalidRequest value)?  invalidRequest,TResult Function( _TrackNotFound value)?  trackNotFound,TResult Function( _RateLimitExceeded value)?  rateLimitExceeded,TResult Function( _NetworkError value)?  networkError,TResult Function( _ServerError value)?  serverError,TResult Function( _Unknown value)?  unknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Unauthorized() when unauthorized != null:
return unauthorized(_that);case _Forbidden() when forbidden != null:
return forbidden(_that);case _InvalidRequest() when invalidRequest != null:
return invalidRequest(_that);case _TrackNotFound() when trackNotFound != null:
return trackNotFound(_that);case _RateLimitExceeded() when rateLimitExceeded != null:
return rateLimitExceeded(_that);case _NetworkError() when networkError != null:
return networkError(_that);case _ServerError() when serverError != null:
return serverError(_that);case _Unknown() when unknown != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Unauthorized value)  unauthorized,required TResult Function( _Forbidden value)  forbidden,required TResult Function( _InvalidRequest value)  invalidRequest,required TResult Function( _TrackNotFound value)  trackNotFound,required TResult Function( _RateLimitExceeded value)  rateLimitExceeded,required TResult Function( _NetworkError value)  networkError,required TResult Function( _ServerError value)  serverError,required TResult Function( _Unknown value)  unknown,}){
final _that = this;
switch (_that) {
case _Unauthorized():
return unauthorized(_that);case _Forbidden():
return forbidden(_that);case _InvalidRequest():
return invalidRequest(_that);case _TrackNotFound():
return trackNotFound(_that);case _RateLimitExceeded():
return rateLimitExceeded(_that);case _NetworkError():
return networkError(_that);case _ServerError():
return serverError(_that);case _Unknown():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Unauthorized value)?  unauthorized,TResult? Function( _Forbidden value)?  forbidden,TResult? Function( _InvalidRequest value)?  invalidRequest,TResult? Function( _TrackNotFound value)?  trackNotFound,TResult? Function( _RateLimitExceeded value)?  rateLimitExceeded,TResult? Function( _NetworkError value)?  networkError,TResult? Function( _ServerError value)?  serverError,TResult? Function( _Unknown value)?  unknown,}){
final _that = this;
switch (_that) {
case _Unauthorized() when unauthorized != null:
return unauthorized(_that);case _Forbidden() when forbidden != null:
return forbidden(_that);case _InvalidRequest() when invalidRequest != null:
return invalidRequest(_that);case _TrackNotFound() when trackNotFound != null:
return trackNotFound(_that);case _RateLimitExceeded() when rateLimitExceeded != null:
return rateLimitExceeded(_that);case _NetworkError() when networkError != null:
return networkError(_that);case _ServerError() when serverError != null:
return serverError(_that);case _Unknown() when unknown != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  unauthorized,TResult Function( String message)?  forbidden,TResult Function( String message)?  invalidRequest,TResult Function( String trackId)?  trackNotFound,TResult Function( String message)?  rateLimitExceeded,TResult Function( String message)?  networkError,TResult Function( String message)?  serverError,TResult Function( String message)?  unknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Unauthorized() when unauthorized != null:
return unauthorized(_that.message);case _Forbidden() when forbidden != null:
return forbidden(_that.message);case _InvalidRequest() when invalidRequest != null:
return invalidRequest(_that.message);case _TrackNotFound() when trackNotFound != null:
return trackNotFound(_that.trackId);case _RateLimitExceeded() when rateLimitExceeded != null:
return rateLimitExceeded(_that.message);case _NetworkError() when networkError != null:
return networkError(_that.message);case _ServerError() when serverError != null:
return serverError(_that.message);case _Unknown() when unknown != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  unauthorized,required TResult Function( String message)  forbidden,required TResult Function( String message)  invalidRequest,required TResult Function( String trackId)  trackNotFound,required TResult Function( String message)  rateLimitExceeded,required TResult Function( String message)  networkError,required TResult Function( String message)  serverError,required TResult Function( String message)  unknown,}) {final _that = this;
switch (_that) {
case _Unauthorized():
return unauthorized(_that.message);case _Forbidden():
return forbidden(_that.message);case _InvalidRequest():
return invalidRequest(_that.message);case _TrackNotFound():
return trackNotFound(_that.trackId);case _RateLimitExceeded():
return rateLimitExceeded(_that.message);case _NetworkError():
return networkError(_that.message);case _ServerError():
return serverError(_that.message);case _Unknown():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  unauthorized,TResult? Function( String message)?  forbidden,TResult? Function( String message)?  invalidRequest,TResult? Function( String trackId)?  trackNotFound,TResult? Function( String message)?  rateLimitExceeded,TResult? Function( String message)?  networkError,TResult? Function( String message)?  serverError,TResult? Function( String message)?  unknown,}) {final _that = this;
switch (_that) {
case _Unauthorized() when unauthorized != null:
return unauthorized(_that.message);case _Forbidden() when forbidden != null:
return forbidden(_that.message);case _InvalidRequest() when invalidRequest != null:
return invalidRequest(_that.message);case _TrackNotFound() when trackNotFound != null:
return trackNotFound(_that.trackId);case _RateLimitExceeded() when rateLimitExceeded != null:
return rateLimitExceeded(_that.message);case _NetworkError() when networkError != null:
return networkError(_that.message);case _ServerError() when serverError != null:
return serverError(_that.message);case _Unknown() when unknown != null:
return unknown(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Unauthorized implements PlaylistCreationFailure {
   _Unauthorized(this.message);
  

 final  String message;

/// Create a copy of PlaylistCreationFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnauthorizedCopyWith<_Unauthorized> get copyWith => __$UnauthorizedCopyWithImpl<_Unauthorized>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Unauthorized&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'PlaylistCreationFailure.unauthorized(message: $message)';
}


}

/// @nodoc
abstract mixin class _$UnauthorizedCopyWith<$Res> implements $PlaylistCreationFailureCopyWith<$Res> {
  factory _$UnauthorizedCopyWith(_Unauthorized value, $Res Function(_Unauthorized) _then) = __$UnauthorizedCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$UnauthorizedCopyWithImpl<$Res>
    implements _$UnauthorizedCopyWith<$Res> {
  __$UnauthorizedCopyWithImpl(this._self, this._then);

  final _Unauthorized _self;
  final $Res Function(_Unauthorized) _then;

/// Create a copy of PlaylistCreationFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Unauthorized(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Forbidden implements PlaylistCreationFailure {
   _Forbidden(this.message);
  

 final  String message;

/// Create a copy of PlaylistCreationFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForbiddenCopyWith<_Forbidden> get copyWith => __$ForbiddenCopyWithImpl<_Forbidden>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Forbidden&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'PlaylistCreationFailure.forbidden(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ForbiddenCopyWith<$Res> implements $PlaylistCreationFailureCopyWith<$Res> {
  factory _$ForbiddenCopyWith(_Forbidden value, $Res Function(_Forbidden) _then) = __$ForbiddenCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ForbiddenCopyWithImpl<$Res>
    implements _$ForbiddenCopyWith<$Res> {
  __$ForbiddenCopyWithImpl(this._self, this._then);

  final _Forbidden _self;
  final $Res Function(_Forbidden) _then;

/// Create a copy of PlaylistCreationFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Forbidden(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _InvalidRequest implements PlaylistCreationFailure {
   _InvalidRequest(this.message);
  

 final  String message;

/// Create a copy of PlaylistCreationFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvalidRequestCopyWith<_InvalidRequest> get copyWith => __$InvalidRequestCopyWithImpl<_InvalidRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvalidRequest&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'PlaylistCreationFailure.invalidRequest(message: $message)';
}


}

/// @nodoc
abstract mixin class _$InvalidRequestCopyWith<$Res> implements $PlaylistCreationFailureCopyWith<$Res> {
  factory _$InvalidRequestCopyWith(_InvalidRequest value, $Res Function(_InvalidRequest) _then) = __$InvalidRequestCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$InvalidRequestCopyWithImpl<$Res>
    implements _$InvalidRequestCopyWith<$Res> {
  __$InvalidRequestCopyWithImpl(this._self, this._then);

  final _InvalidRequest _self;
  final $Res Function(_InvalidRequest) _then;

/// Create a copy of PlaylistCreationFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_InvalidRequest(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _TrackNotFound implements PlaylistCreationFailure {
   _TrackNotFound(this.trackId);
  

 final  String trackId;

/// Create a copy of PlaylistCreationFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrackNotFoundCopyWith<_TrackNotFound> get copyWith => __$TrackNotFoundCopyWithImpl<_TrackNotFound>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrackNotFound&&(identical(other.trackId, trackId) || other.trackId == trackId));
}


@override
int get hashCode => Object.hash(runtimeType,trackId);

@override
String toString() {
  return 'PlaylistCreationFailure.trackNotFound(trackId: $trackId)';
}


}

/// @nodoc
abstract mixin class _$TrackNotFoundCopyWith<$Res> implements $PlaylistCreationFailureCopyWith<$Res> {
  factory _$TrackNotFoundCopyWith(_TrackNotFound value, $Res Function(_TrackNotFound) _then) = __$TrackNotFoundCopyWithImpl;
@useResult
$Res call({
 String trackId
});




}
/// @nodoc
class __$TrackNotFoundCopyWithImpl<$Res>
    implements _$TrackNotFoundCopyWith<$Res> {
  __$TrackNotFoundCopyWithImpl(this._self, this._then);

  final _TrackNotFound _self;
  final $Res Function(_TrackNotFound) _then;

/// Create a copy of PlaylistCreationFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? trackId = null,}) {
  return _then(_TrackNotFound(
null == trackId ? _self.trackId : trackId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _RateLimitExceeded implements PlaylistCreationFailure {
   _RateLimitExceeded(this.message);
  

 final  String message;

/// Create a copy of PlaylistCreationFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RateLimitExceededCopyWith<_RateLimitExceeded> get copyWith => __$RateLimitExceededCopyWithImpl<_RateLimitExceeded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RateLimitExceeded&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'PlaylistCreationFailure.rateLimitExceeded(message: $message)';
}


}

/// @nodoc
abstract mixin class _$RateLimitExceededCopyWith<$Res> implements $PlaylistCreationFailureCopyWith<$Res> {
  factory _$RateLimitExceededCopyWith(_RateLimitExceeded value, $Res Function(_RateLimitExceeded) _then) = __$RateLimitExceededCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$RateLimitExceededCopyWithImpl<$Res>
    implements _$RateLimitExceededCopyWith<$Res> {
  __$RateLimitExceededCopyWithImpl(this._self, this._then);

  final _RateLimitExceeded _self;
  final $Res Function(_RateLimitExceeded) _then;

/// Create a copy of PlaylistCreationFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_RateLimitExceeded(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _NetworkError implements PlaylistCreationFailure {
   _NetworkError(this.message);
  

 final  String message;

/// Create a copy of PlaylistCreationFailure
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
  return 'PlaylistCreationFailure.networkError(message: $message)';
}


}

/// @nodoc
abstract mixin class _$NetworkErrorCopyWith<$Res> implements $PlaylistCreationFailureCopyWith<$Res> {
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

/// Create a copy of PlaylistCreationFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_NetworkError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ServerError implements PlaylistCreationFailure {
   _ServerError(this.message);
  

 final  String message;

/// Create a copy of PlaylistCreationFailure
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
  return 'PlaylistCreationFailure.serverError(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ServerErrorCopyWith<$Res> implements $PlaylistCreationFailureCopyWith<$Res> {
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

/// Create a copy of PlaylistCreationFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ServerError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Unknown implements PlaylistCreationFailure {
   _Unknown(this.message);
  

 final  String message;

/// Create a copy of PlaylistCreationFailure
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
  return 'PlaylistCreationFailure.unknown(message: $message)';
}


}

/// @nodoc
abstract mixin class _$UnknownCopyWith<$Res> implements $PlaylistCreationFailureCopyWith<$Res> {
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

/// Create a copy of PlaylistCreationFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Unknown(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
