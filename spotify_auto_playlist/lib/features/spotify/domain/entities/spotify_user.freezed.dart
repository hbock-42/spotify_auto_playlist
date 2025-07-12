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

 String get id;@JsonKey(name: 'display_name') String? get displayName; String? get email; SpotifyFollowers? get followers; String? get country; List<SpotifyImage> get images; String get href; String get uri;@JsonKey(name: 'external_urls') Map<String, String>? get externalUrls;
/// Create a copy of SpotifyUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpotifyUserCopyWith<SpotifyUser> get copyWith => _$SpotifyUserCopyWithImpl<SpotifyUser>(this as SpotifyUser, _$identity);

  /// Serializes this SpotifyUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpotifyUser&&(identical(other.id, id) || other.id == id)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.email, email) || other.email == email)&&(identical(other.followers, followers) || other.followers == followers)&&(identical(other.country, country) || other.country == country)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.href, href) || other.href == href)&&(identical(other.uri, uri) || other.uri == uri)&&const DeepCollectionEquality().equals(other.externalUrls, externalUrls));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,displayName,email,followers,country,const DeepCollectionEquality().hash(images),href,uri,const DeepCollectionEquality().hash(externalUrls));

@override
String toString() {
  return 'SpotifyUser(id: $id, displayName: $displayName, email: $email, followers: $followers, country: $country, images: $images, href: $href, uri: $uri, externalUrls: $externalUrls)';
}


}

/// @nodoc
abstract mixin class $SpotifyUserCopyWith<$Res>  {
  factory $SpotifyUserCopyWith(SpotifyUser value, $Res Function(SpotifyUser) _then) = _$SpotifyUserCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'display_name') String? displayName, String? email, SpotifyFollowers? followers, String? country, List<SpotifyImage> images, String href, String uri,@JsonKey(name: 'external_urls') Map<String, String>? externalUrls
});


$SpotifyFollowersCopyWith<$Res>? get followers;

}
/// @nodoc
class _$SpotifyUserCopyWithImpl<$Res>
    implements $SpotifyUserCopyWith<$Res> {
  _$SpotifyUserCopyWithImpl(this._self, this._then);

  final SpotifyUser _self;
  final $Res Function(SpotifyUser) _then;

/// Create a copy of SpotifyUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? displayName = freezed,Object? email = freezed,Object? followers = freezed,Object? country = freezed,Object? images = null,Object? href = null,Object? uri = null,Object? externalUrls = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,followers: freezed == followers ? _self.followers : followers // ignore: cast_nullable_to_non_nullable
as SpotifyFollowers?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<SpotifyImage>,href: null == href ? _self.href : href // ignore: cast_nullable_to_non_nullable
as String,uri: null == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as String,externalUrls: freezed == externalUrls ? _self.externalUrls : externalUrls // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,
  ));
}
/// Create a copy of SpotifyUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SpotifyFollowersCopyWith<$Res>? get followers {
    if (_self.followers == null) {
    return null;
  }

  return $SpotifyFollowersCopyWith<$Res>(_self.followers!, (value) {
    return _then(_self.copyWith(followers: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'display_name')  String? displayName,  String? email,  SpotifyFollowers? followers,  String? country,  List<SpotifyImage> images,  String href,  String uri, @JsonKey(name: 'external_urls')  Map<String, String>? externalUrls)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpotifyUser() when $default != null:
return $default(_that.id,_that.displayName,_that.email,_that.followers,_that.country,_that.images,_that.href,_that.uri,_that.externalUrls);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'display_name')  String? displayName,  String? email,  SpotifyFollowers? followers,  String? country,  List<SpotifyImage> images,  String href,  String uri, @JsonKey(name: 'external_urls')  Map<String, String>? externalUrls)  $default,) {final _that = this;
switch (_that) {
case _SpotifyUser():
return $default(_that.id,_that.displayName,_that.email,_that.followers,_that.country,_that.images,_that.href,_that.uri,_that.externalUrls);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'display_name')  String? displayName,  String? email,  SpotifyFollowers? followers,  String? country,  List<SpotifyImage> images,  String href,  String uri, @JsonKey(name: 'external_urls')  Map<String, String>? externalUrls)?  $default,) {final _that = this;
switch (_that) {
case _SpotifyUser() when $default != null:
return $default(_that.id,_that.displayName,_that.email,_that.followers,_that.country,_that.images,_that.href,_that.uri,_that.externalUrls);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SpotifyUser extends SpotifyUser {
  const _SpotifyUser({required this.id, @JsonKey(name: 'display_name') this.displayName, this.email, this.followers, this.country, final  List<SpotifyImage> images = const [], required this.href, required this.uri, @JsonKey(name: 'external_urls') final  Map<String, String>? externalUrls}): _images = images,_externalUrls = externalUrls,super._();
  factory _SpotifyUser.fromJson(Map<String, dynamic> json) => _$SpotifyUserFromJson(json);

@override final  String id;
@override@JsonKey(name: 'display_name') final  String? displayName;
@override final  String? email;
@override final  SpotifyFollowers? followers;
@override final  String? country;
 final  List<SpotifyImage> _images;
@override@JsonKey() List<SpotifyImage> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

@override final  String href;
@override final  String uri;
 final  Map<String, String>? _externalUrls;
@override@JsonKey(name: 'external_urls') Map<String, String>? get externalUrls {
  final value = _externalUrls;
  if (value == null) return null;
  if (_externalUrls is EqualUnmodifiableMapView) return _externalUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpotifyUser&&(identical(other.id, id) || other.id == id)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.email, email) || other.email == email)&&(identical(other.followers, followers) || other.followers == followers)&&(identical(other.country, country) || other.country == country)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.href, href) || other.href == href)&&(identical(other.uri, uri) || other.uri == uri)&&const DeepCollectionEquality().equals(other._externalUrls, _externalUrls));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,displayName,email,followers,country,const DeepCollectionEquality().hash(_images),href,uri,const DeepCollectionEquality().hash(_externalUrls));

@override
String toString() {
  return 'SpotifyUser(id: $id, displayName: $displayName, email: $email, followers: $followers, country: $country, images: $images, href: $href, uri: $uri, externalUrls: $externalUrls)';
}


}

/// @nodoc
abstract mixin class _$SpotifyUserCopyWith<$Res> implements $SpotifyUserCopyWith<$Res> {
  factory _$SpotifyUserCopyWith(_SpotifyUser value, $Res Function(_SpotifyUser) _then) = __$SpotifyUserCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'display_name') String? displayName, String? email, SpotifyFollowers? followers, String? country, List<SpotifyImage> images, String href, String uri,@JsonKey(name: 'external_urls') Map<String, String>? externalUrls
});


@override $SpotifyFollowersCopyWith<$Res>? get followers;

}
/// @nodoc
class __$SpotifyUserCopyWithImpl<$Res>
    implements _$SpotifyUserCopyWith<$Res> {
  __$SpotifyUserCopyWithImpl(this._self, this._then);

  final _SpotifyUser _self;
  final $Res Function(_SpotifyUser) _then;

/// Create a copy of SpotifyUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? displayName = freezed,Object? email = freezed,Object? followers = freezed,Object? country = freezed,Object? images = null,Object? href = null,Object? uri = null,Object? externalUrls = freezed,}) {
  return _then(_SpotifyUser(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,followers: freezed == followers ? _self.followers : followers // ignore: cast_nullable_to_non_nullable
as SpotifyFollowers?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<SpotifyImage>,href: null == href ? _self.href : href // ignore: cast_nullable_to_non_nullable
as String,uri: null == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as String,externalUrls: freezed == externalUrls ? _self._externalUrls : externalUrls // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,
  ));
}

/// Create a copy of SpotifyUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SpotifyFollowersCopyWith<$Res>? get followers {
    if (_self.followers == null) {
    return null;
  }

  return $SpotifyFollowersCopyWith<$Res>(_self.followers!, (value) {
    return _then(_self.copyWith(followers: value));
  });
}
}


/// @nodoc
mixin _$SpotifyFollowers {

 String? get href; int get total;
/// Create a copy of SpotifyFollowers
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpotifyFollowersCopyWith<SpotifyFollowers> get copyWith => _$SpotifyFollowersCopyWithImpl<SpotifyFollowers>(this as SpotifyFollowers, _$identity);

  /// Serializes this SpotifyFollowers to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpotifyFollowers&&(identical(other.href, href) || other.href == href)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,href,total);

@override
String toString() {
  return 'SpotifyFollowers(href: $href, total: $total)';
}


}

/// @nodoc
abstract mixin class $SpotifyFollowersCopyWith<$Res>  {
  factory $SpotifyFollowersCopyWith(SpotifyFollowers value, $Res Function(SpotifyFollowers) _then) = _$SpotifyFollowersCopyWithImpl;
@useResult
$Res call({
 String? href, int total
});




}
/// @nodoc
class _$SpotifyFollowersCopyWithImpl<$Res>
    implements $SpotifyFollowersCopyWith<$Res> {
  _$SpotifyFollowersCopyWithImpl(this._self, this._then);

  final SpotifyFollowers _self;
  final $Res Function(SpotifyFollowers) _then;

/// Create a copy of SpotifyFollowers
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? href = freezed,Object? total = null,}) {
  return _then(_self.copyWith(
href: freezed == href ? _self.href : href // ignore: cast_nullable_to_non_nullable
as String?,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SpotifyFollowers].
extension SpotifyFollowersPatterns on SpotifyFollowers {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpotifyFollowers value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpotifyFollowers() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpotifyFollowers value)  $default,){
final _that = this;
switch (_that) {
case _SpotifyFollowers():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpotifyFollowers value)?  $default,){
final _that = this;
switch (_that) {
case _SpotifyFollowers() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? href,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpotifyFollowers() when $default != null:
return $default(_that.href,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? href,  int total)  $default,) {final _that = this;
switch (_that) {
case _SpotifyFollowers():
return $default(_that.href,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? href,  int total)?  $default,) {final _that = this;
switch (_that) {
case _SpotifyFollowers() when $default != null:
return $default(_that.href,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SpotifyFollowers implements SpotifyFollowers {
  const _SpotifyFollowers({this.href, required this.total});
  factory _SpotifyFollowers.fromJson(Map<String, dynamic> json) => _$SpotifyFollowersFromJson(json);

@override final  String? href;
@override final  int total;

/// Create a copy of SpotifyFollowers
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpotifyFollowersCopyWith<_SpotifyFollowers> get copyWith => __$SpotifyFollowersCopyWithImpl<_SpotifyFollowers>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpotifyFollowersToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpotifyFollowers&&(identical(other.href, href) || other.href == href)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,href,total);

@override
String toString() {
  return 'SpotifyFollowers(href: $href, total: $total)';
}


}

/// @nodoc
abstract mixin class _$SpotifyFollowersCopyWith<$Res> implements $SpotifyFollowersCopyWith<$Res> {
  factory _$SpotifyFollowersCopyWith(_SpotifyFollowers value, $Res Function(_SpotifyFollowers) _then) = __$SpotifyFollowersCopyWithImpl;
@override @useResult
$Res call({
 String? href, int total
});




}
/// @nodoc
class __$SpotifyFollowersCopyWithImpl<$Res>
    implements _$SpotifyFollowersCopyWith<$Res> {
  __$SpotifyFollowersCopyWithImpl(this._self, this._then);

  final _SpotifyFollowers _self;
  final $Res Function(_SpotifyFollowers) _then;

/// Create a copy of SpotifyFollowers
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? href = freezed,Object? total = null,}) {
  return _then(_SpotifyFollowers(
href: freezed == href ? _self.href : href // ignore: cast_nullable_to_non_nullable
as String?,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
