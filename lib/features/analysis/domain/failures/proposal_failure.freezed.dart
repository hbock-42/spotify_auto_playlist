// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'proposal_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProposalFailure {

 String get message;
/// Create a copy of ProposalFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProposalFailureCopyWith<ProposalFailure> get copyWith => _$ProposalFailureCopyWithImpl<ProposalFailure>(this as ProposalFailure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProposalFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ProposalFailure(message: $message)';
}


}

/// @nodoc
abstract mixin class $ProposalFailureCopyWith<$Res>  {
  factory $ProposalFailureCopyWith(ProposalFailure value, $Res Function(ProposalFailure) _then) = _$ProposalFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ProposalFailureCopyWithImpl<$Res>
    implements $ProposalFailureCopyWith<$Res> {
  _$ProposalFailureCopyWithImpl(this._self, this._then);

  final ProposalFailure _self;
  final $Res Function(ProposalFailure) _then;

/// Create a copy of ProposalFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProposalFailure].
extension ProposalFailurePatterns on ProposalFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _InsufficientData value)?  insufficientData,TResult Function( _NoValidGroups value)?  noValidGroups,TResult Function( _InvalidSelection value)?  invalidSelection,TResult Function( _ProcessingError value)?  processingError,TResult Function( _Unknown value)?  unknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InsufficientData() when insufficientData != null:
return insufficientData(_that);case _NoValidGroups() when noValidGroups != null:
return noValidGroups(_that);case _InvalidSelection() when invalidSelection != null:
return invalidSelection(_that);case _ProcessingError() when processingError != null:
return processingError(_that);case _Unknown() when unknown != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _InsufficientData value)  insufficientData,required TResult Function( _NoValidGroups value)  noValidGroups,required TResult Function( _InvalidSelection value)  invalidSelection,required TResult Function( _ProcessingError value)  processingError,required TResult Function( _Unknown value)  unknown,}){
final _that = this;
switch (_that) {
case _InsufficientData():
return insufficientData(_that);case _NoValidGroups():
return noValidGroups(_that);case _InvalidSelection():
return invalidSelection(_that);case _ProcessingError():
return processingError(_that);case _Unknown():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _InsufficientData value)?  insufficientData,TResult? Function( _NoValidGroups value)?  noValidGroups,TResult? Function( _InvalidSelection value)?  invalidSelection,TResult? Function( _ProcessingError value)?  processingError,TResult? Function( _Unknown value)?  unknown,}){
final _that = this;
switch (_that) {
case _InsufficientData() when insufficientData != null:
return insufficientData(_that);case _NoValidGroups() when noValidGroups != null:
return noValidGroups(_that);case _InvalidSelection() when invalidSelection != null:
return invalidSelection(_that);case _ProcessingError() when processingError != null:
return processingError(_that);case _Unknown() when unknown != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  insufficientData,TResult Function( String message)?  noValidGroups,TResult Function( String message)?  invalidSelection,TResult Function( String message)?  processingError,TResult Function( String message)?  unknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InsufficientData() when insufficientData != null:
return insufficientData(_that.message);case _NoValidGroups() when noValidGroups != null:
return noValidGroups(_that.message);case _InvalidSelection() when invalidSelection != null:
return invalidSelection(_that.message);case _ProcessingError() when processingError != null:
return processingError(_that.message);case _Unknown() when unknown != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  insufficientData,required TResult Function( String message)  noValidGroups,required TResult Function( String message)  invalidSelection,required TResult Function( String message)  processingError,required TResult Function( String message)  unknown,}) {final _that = this;
switch (_that) {
case _InsufficientData():
return insufficientData(_that.message);case _NoValidGroups():
return noValidGroups(_that.message);case _InvalidSelection():
return invalidSelection(_that.message);case _ProcessingError():
return processingError(_that.message);case _Unknown():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  insufficientData,TResult? Function( String message)?  noValidGroups,TResult? Function( String message)?  invalidSelection,TResult? Function( String message)?  processingError,TResult? Function( String message)?  unknown,}) {final _that = this;
switch (_that) {
case _InsufficientData() when insufficientData != null:
return insufficientData(_that.message);case _NoValidGroups() when noValidGroups != null:
return noValidGroups(_that.message);case _InvalidSelection() when invalidSelection != null:
return invalidSelection(_that.message);case _ProcessingError() when processingError != null:
return processingError(_that.message);case _Unknown() when unknown != null:
return unknown(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _InsufficientData implements ProposalFailure {
   _InsufficientData(this.message);
  

@override final  String message;

/// Create a copy of ProposalFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InsufficientDataCopyWith<_InsufficientData> get copyWith => __$InsufficientDataCopyWithImpl<_InsufficientData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InsufficientData&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ProposalFailure.insufficientData(message: $message)';
}


}

/// @nodoc
abstract mixin class _$InsufficientDataCopyWith<$Res> implements $ProposalFailureCopyWith<$Res> {
  factory _$InsufficientDataCopyWith(_InsufficientData value, $Res Function(_InsufficientData) _then) = __$InsufficientDataCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class __$InsufficientDataCopyWithImpl<$Res>
    implements _$InsufficientDataCopyWith<$Res> {
  __$InsufficientDataCopyWithImpl(this._self, this._then);

  final _InsufficientData _self;
  final $Res Function(_InsufficientData) _then;

/// Create a copy of ProposalFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_InsufficientData(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _NoValidGroups implements ProposalFailure {
   _NoValidGroups(this.message);
  

@override final  String message;

/// Create a copy of ProposalFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NoValidGroupsCopyWith<_NoValidGroups> get copyWith => __$NoValidGroupsCopyWithImpl<_NoValidGroups>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NoValidGroups&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ProposalFailure.noValidGroups(message: $message)';
}


}

/// @nodoc
abstract mixin class _$NoValidGroupsCopyWith<$Res> implements $ProposalFailureCopyWith<$Res> {
  factory _$NoValidGroupsCopyWith(_NoValidGroups value, $Res Function(_NoValidGroups) _then) = __$NoValidGroupsCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class __$NoValidGroupsCopyWithImpl<$Res>
    implements _$NoValidGroupsCopyWith<$Res> {
  __$NoValidGroupsCopyWithImpl(this._self, this._then);

  final _NoValidGroups _self;
  final $Res Function(_NoValidGroups) _then;

/// Create a copy of ProposalFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_NoValidGroups(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _InvalidSelection implements ProposalFailure {
   _InvalidSelection(this.message);
  

@override final  String message;

/// Create a copy of ProposalFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvalidSelectionCopyWith<_InvalidSelection> get copyWith => __$InvalidSelectionCopyWithImpl<_InvalidSelection>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvalidSelection&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ProposalFailure.invalidSelection(message: $message)';
}


}

/// @nodoc
abstract mixin class _$InvalidSelectionCopyWith<$Res> implements $ProposalFailureCopyWith<$Res> {
  factory _$InvalidSelectionCopyWith(_InvalidSelection value, $Res Function(_InvalidSelection) _then) = __$InvalidSelectionCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class __$InvalidSelectionCopyWithImpl<$Res>
    implements _$InvalidSelectionCopyWith<$Res> {
  __$InvalidSelectionCopyWithImpl(this._self, this._then);

  final _InvalidSelection _self;
  final $Res Function(_InvalidSelection) _then;

/// Create a copy of ProposalFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_InvalidSelection(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ProcessingError implements ProposalFailure {
   _ProcessingError(this.message);
  

@override final  String message;

/// Create a copy of ProposalFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProcessingErrorCopyWith<_ProcessingError> get copyWith => __$ProcessingErrorCopyWithImpl<_ProcessingError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProcessingError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ProposalFailure.processingError(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ProcessingErrorCopyWith<$Res> implements $ProposalFailureCopyWith<$Res> {
  factory _$ProcessingErrorCopyWith(_ProcessingError value, $Res Function(_ProcessingError) _then) = __$ProcessingErrorCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ProcessingErrorCopyWithImpl<$Res>
    implements _$ProcessingErrorCopyWith<$Res> {
  __$ProcessingErrorCopyWithImpl(this._self, this._then);

  final _ProcessingError _self;
  final $Res Function(_ProcessingError) _then;

/// Create a copy of ProposalFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ProcessingError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Unknown implements ProposalFailure {
   _Unknown(this.message);
  

@override final  String message;

/// Create a copy of ProposalFailure
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
  return 'ProposalFailure.unknown(message: $message)';
}


}

/// @nodoc
abstract mixin class _$UnknownCopyWith<$Res> implements $ProposalFailureCopyWith<$Res> {
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

/// Create a copy of ProposalFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Unknown(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
