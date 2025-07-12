// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'storage_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StorageFailure {

 String get message;
/// Create a copy of StorageFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StorageFailureCopyWith<StorageFailure> get copyWith => _$StorageFailureCopyWithImpl<StorageFailure>(this as StorageFailure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StorageFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'StorageFailure(message: $message)';
}


}

/// @nodoc
abstract mixin class $StorageFailureCopyWith<$Res>  {
  factory $StorageFailureCopyWith(StorageFailure value, $Res Function(StorageFailure) _then) = _$StorageFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$StorageFailureCopyWithImpl<$Res>
    implements $StorageFailureCopyWith<$Res> {
  _$StorageFailureCopyWithImpl(this._self, this._then);

  final StorageFailure _self;
  final $Res Function(StorageFailure) _then;

/// Create a copy of StorageFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [StorageFailure].
extension StorageFailurePatterns on StorageFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _NotFound value)?  notFound,TResult Function( _WriteError value)?  writeError,TResult Function( _ReadError value)?  readError,TResult Function( _SerializationError value)?  serializationError,TResult Function( _Unknown value)?  unknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotFound() when notFound != null:
return notFound(_that);case _WriteError() when writeError != null:
return writeError(_that);case _ReadError() when readError != null:
return readError(_that);case _SerializationError() when serializationError != null:
return serializationError(_that);case _Unknown() when unknown != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _NotFound value)  notFound,required TResult Function( _WriteError value)  writeError,required TResult Function( _ReadError value)  readError,required TResult Function( _SerializationError value)  serializationError,required TResult Function( _Unknown value)  unknown,}){
final _that = this;
switch (_that) {
case _NotFound():
return notFound(_that);case _WriteError():
return writeError(_that);case _ReadError():
return readError(_that);case _SerializationError():
return serializationError(_that);case _Unknown():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _NotFound value)?  notFound,TResult? Function( _WriteError value)?  writeError,TResult? Function( _ReadError value)?  readError,TResult? Function( _SerializationError value)?  serializationError,TResult? Function( _Unknown value)?  unknown,}){
final _that = this;
switch (_that) {
case _NotFound() when notFound != null:
return notFound(_that);case _WriteError() when writeError != null:
return writeError(_that);case _ReadError() when readError != null:
return readError(_that);case _SerializationError() when serializationError != null:
return serializationError(_that);case _Unknown() when unknown != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  notFound,TResult Function( String message)?  writeError,TResult Function( String message)?  readError,TResult Function( String message)?  serializationError,TResult Function( String message)?  unknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotFound() when notFound != null:
return notFound(_that.message);case _WriteError() when writeError != null:
return writeError(_that.message);case _ReadError() when readError != null:
return readError(_that.message);case _SerializationError() when serializationError != null:
return serializationError(_that.message);case _Unknown() when unknown != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  notFound,required TResult Function( String message)  writeError,required TResult Function( String message)  readError,required TResult Function( String message)  serializationError,required TResult Function( String message)  unknown,}) {final _that = this;
switch (_that) {
case _NotFound():
return notFound(_that.message);case _WriteError():
return writeError(_that.message);case _ReadError():
return readError(_that.message);case _SerializationError():
return serializationError(_that.message);case _Unknown():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  notFound,TResult? Function( String message)?  writeError,TResult? Function( String message)?  readError,TResult? Function( String message)?  serializationError,TResult? Function( String message)?  unknown,}) {final _that = this;
switch (_that) {
case _NotFound() when notFound != null:
return notFound(_that.message);case _WriteError() when writeError != null:
return writeError(_that.message);case _ReadError() when readError != null:
return readError(_that.message);case _SerializationError() when serializationError != null:
return serializationError(_that.message);case _Unknown() when unknown != null:
return unknown(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _NotFound implements StorageFailure {
   _NotFound(this.message);
  

@override final  String message;

/// Create a copy of StorageFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotFoundCopyWith<_NotFound> get copyWith => __$NotFoundCopyWithImpl<_NotFound>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotFound&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'StorageFailure.notFound(message: $message)';
}


}

/// @nodoc
abstract mixin class _$NotFoundCopyWith<$Res> implements $StorageFailureCopyWith<$Res> {
  factory _$NotFoundCopyWith(_NotFound value, $Res Function(_NotFound) _then) = __$NotFoundCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class __$NotFoundCopyWithImpl<$Res>
    implements _$NotFoundCopyWith<$Res> {
  __$NotFoundCopyWithImpl(this._self, this._then);

  final _NotFound _self;
  final $Res Function(_NotFound) _then;

/// Create a copy of StorageFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_NotFound(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _WriteError implements StorageFailure {
   _WriteError(this.message);
  

@override final  String message;

/// Create a copy of StorageFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WriteErrorCopyWith<_WriteError> get copyWith => __$WriteErrorCopyWithImpl<_WriteError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WriteError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'StorageFailure.writeError(message: $message)';
}


}

/// @nodoc
abstract mixin class _$WriteErrorCopyWith<$Res> implements $StorageFailureCopyWith<$Res> {
  factory _$WriteErrorCopyWith(_WriteError value, $Res Function(_WriteError) _then) = __$WriteErrorCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class __$WriteErrorCopyWithImpl<$Res>
    implements _$WriteErrorCopyWith<$Res> {
  __$WriteErrorCopyWithImpl(this._self, this._then);

  final _WriteError _self;
  final $Res Function(_WriteError) _then;

/// Create a copy of StorageFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_WriteError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ReadError implements StorageFailure {
   _ReadError(this.message);
  

@override final  String message;

/// Create a copy of StorageFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReadErrorCopyWith<_ReadError> get copyWith => __$ReadErrorCopyWithImpl<_ReadError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReadError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'StorageFailure.readError(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ReadErrorCopyWith<$Res> implements $StorageFailureCopyWith<$Res> {
  factory _$ReadErrorCopyWith(_ReadError value, $Res Function(_ReadError) _then) = __$ReadErrorCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ReadErrorCopyWithImpl<$Res>
    implements _$ReadErrorCopyWith<$Res> {
  __$ReadErrorCopyWithImpl(this._self, this._then);

  final _ReadError _self;
  final $Res Function(_ReadError) _then;

/// Create a copy of StorageFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ReadError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SerializationError implements StorageFailure {
   _SerializationError(this.message);
  

@override final  String message;

/// Create a copy of StorageFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SerializationErrorCopyWith<_SerializationError> get copyWith => __$SerializationErrorCopyWithImpl<_SerializationError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SerializationError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'StorageFailure.serializationError(message: $message)';
}


}

/// @nodoc
abstract mixin class _$SerializationErrorCopyWith<$Res> implements $StorageFailureCopyWith<$Res> {
  factory _$SerializationErrorCopyWith(_SerializationError value, $Res Function(_SerializationError) _then) = __$SerializationErrorCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class __$SerializationErrorCopyWithImpl<$Res>
    implements _$SerializationErrorCopyWith<$Res> {
  __$SerializationErrorCopyWithImpl(this._self, this._then);

  final _SerializationError _self;
  final $Res Function(_SerializationError) _then;

/// Create a copy of StorageFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_SerializationError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Unknown implements StorageFailure {
   _Unknown(this.message);
  

@override final  String message;

/// Create a copy of StorageFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
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
  return 'StorageFailure.unknown(message: $message)';
}


}

/// @nodoc
abstract mixin class _$UnknownCopyWith<$Res> implements $StorageFailureCopyWith<$Res> {
  factory _$UnknownCopyWith(_Unknown value, $Res Function(_Unknown) _then) = __$UnknownCopyWithImpl;
@override @useResult
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

/// Create a copy of StorageFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Unknown(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
