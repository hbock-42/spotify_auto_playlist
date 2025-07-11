// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spotify_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SpotifyUser {

 String get id; String get displayName; String? get email; int? get followers; String? get country; String? get imageUrl;
/// Create a copy of SpotifyUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpotifyUserCopyWith<SpotifyUser> get copyWith => _$SpotifyUserCopyWithImpl<SpotifyUser>(this as SpotifyUser, _$identity);

  /// Serializes this SpotifyUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpotifyUser&&(identical(other.id, id) || other.id == id)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.email, email) || other.email == email)&&(identical(other.followers, followers) || other.followers == followers)&&(identical(other.country, country) || other.country == country)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,displayName,email,followers,country,imageUrl);

@override
String toString() {
  return 'SpotifyUser(id: $id, displayName: $displayName, email: $email, followers: $followers, country: $country, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $SpotifyUserCopyWith<$Res>  {
  factory $SpotifyUserCopyWith(SpotifyUser value, $Res Function(SpotifyUser) _then) = _$SpotifyUserCopyWithImpl;
@useResult
$Res call({
 String id, String displayName, String? email, int? followers, String? country, String? imageUrl
});




}
/// @nodoc
class _$SpotifyUserCopyWithImpl<$Res>
    implements $SpotifyUserCopyWith<$Res> {
  _$SpotifyUserCopyWithImpl(this._self, this._then);

  final SpotifyUser _self;
  final $Res Function(SpotifyUser) _then;

/// Create a copy of SpotifyUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? displayName = null,Object? email = freezed,Object? followers = freezed,Object? country = freezed,Object? imageUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,followers: freezed == followers ? _self.followers : followers // ignore: cast_nullable_to_non_nullable
as int?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SpotifyUser].
extension SpotifyUserPatterns on SpotifyUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpotifyUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpotifyUser() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpotifyUser value)  $default,){
final _that = this;
switch (_that) {
case _SpotifyUser():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpotifyUser value)?  $default,){
final _that = this;
switch (_that) {
case _SpotifyUser() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String displayName,  String? email,  int? followers,  String? country,  String? imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpotifyUser() when $default != null:
return $default(_that.id,_that.displayName,_that.email,_that.followers,_that.country,_that.imageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String displayName,  String? email,  int? followers,  String? country,  String? imageUrl)  $default,) {final _that = this;
switch (_that) {
case _SpotifyUser():
return $default(_that.id,_that.displayName,_that.email,_that.followers,_that.country,_that.imageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String displayName,  String? email,  int? followers,  String? country,  String? imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _SpotifyUser() when $default != null:
return $default(_that.id,_that.displayName,_that.email,_that.followers,_that.country,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SpotifyUser implements SpotifyUser {
  const _SpotifyUser({required this.id, required this.displayName, this.email, this.followers, this.country, this.imageUrl});
  factory _SpotifyUser.fromJson(Map<String, dynamic> json) => _$SpotifyUserFromJson(json);

@override final  String id;
@override final  String displayName;
@override final  String? email;
@override final  int? followers;
@override final  String? country;
@override final  String? imageUrl;

/// Create a copy of SpotifyUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpotifyUserCopyWith<_SpotifyUser> get copyWith => __$SpotifyUserCopyWithImpl<_SpotifyUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpotifyUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpotifyUser&&(identical(other.id, id) || other.id == id)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.email, email) || other.email == email)&&(identical(other.followers, followers) || other.followers == followers)&&(identical(other.country, country) || other.country == country)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,displayName,email,followers,country,imageUrl);

@override
String toString() {
  return 'SpotifyUser(id: $id, displayName: $displayName, email: $email, followers: $followers, country: $country, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$SpotifyUserCopyWith<$Res> implements $SpotifyUserCopyWith<$Res> {
  factory _$SpotifyUserCopyWith(_SpotifyUser value, $Res Function(_SpotifyUser) _then) = __$SpotifyUserCopyWithImpl;
@override @useResult
$Res call({
 String id, String displayName, String? email, int? followers, String? country, String? imageUrl
});




}
/// @nodoc
class __$SpotifyUserCopyWithImpl<$Res>
    implements _$SpotifyUserCopyWith<$Res> {
  __$SpotifyUserCopyWithImpl(this._self, this._then);

  final _SpotifyUser _self;
  final $Res Function(_SpotifyUser) _then;

/// Create a copy of SpotifyUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? displayName = null,Object? email = freezed,Object? followers = freezed,Object? country = freezed,Object? imageUrl = freezed,}) {
  return _then(_SpotifyUser(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,followers: freezed == followers ? _self.followers : followers // ignore: cast_nullable_to_non_nullable
as int?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
