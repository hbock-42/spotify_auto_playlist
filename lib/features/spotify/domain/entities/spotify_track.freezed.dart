// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spotify_track.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SpotifyTrack {

 String get id; String get name; List<SpotifyArtist> get artists; SpotifyAlbum get album; int get durationMs; String get uri; String get href; String? get previewUrl; bool get isLocal; int get popularity; bool get explicit;
/// Create a copy of SpotifyTrack
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpotifyTrackCopyWith<SpotifyTrack> get copyWith => _$SpotifyTrackCopyWithImpl<SpotifyTrack>(this as SpotifyTrack, _$identity);

  /// Serializes this SpotifyTrack to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpotifyTrack&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.artists, artists)&&(identical(other.album, album) || other.album == album)&&(identical(other.durationMs, durationMs) || other.durationMs == durationMs)&&(identical(other.uri, uri) || other.uri == uri)&&(identical(other.href, href) || other.href == href)&&(identical(other.previewUrl, previewUrl) || other.previewUrl == previewUrl)&&(identical(other.isLocal, isLocal) || other.isLocal == isLocal)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&(identical(other.explicit, explicit) || other.explicit == explicit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(artists),album,durationMs,uri,href,previewUrl,isLocal,popularity,explicit);

@override
String toString() {
  return 'SpotifyTrack(id: $id, name: $name, artists: $artists, album: $album, durationMs: $durationMs, uri: $uri, href: $href, previewUrl: $previewUrl, isLocal: $isLocal, popularity: $popularity, explicit: $explicit)';
}


}

/// @nodoc
abstract mixin class $SpotifyTrackCopyWith<$Res>  {
  factory $SpotifyTrackCopyWith(SpotifyTrack value, $Res Function(SpotifyTrack) _then) = _$SpotifyTrackCopyWithImpl;
@useResult
$Res call({
 String id, String name, List<SpotifyArtist> artists, SpotifyAlbum album, int durationMs, String uri, String href, String? previewUrl, bool isLocal, int popularity, bool explicit
});


$SpotifyAlbumCopyWith<$Res> get album;

}
/// @nodoc
class _$SpotifyTrackCopyWithImpl<$Res>
    implements $SpotifyTrackCopyWith<$Res> {
  _$SpotifyTrackCopyWithImpl(this._self, this._then);

  final SpotifyTrack _self;
  final $Res Function(SpotifyTrack) _then;

/// Create a copy of SpotifyTrack
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? artists = null,Object? album = null,Object? durationMs = null,Object? uri = null,Object? href = null,Object? previewUrl = freezed,Object? isLocal = null,Object? popularity = null,Object? explicit = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,artists: null == artists ? _self.artists : artists // ignore: cast_nullable_to_non_nullable
as List<SpotifyArtist>,album: null == album ? _self.album : album // ignore: cast_nullable_to_non_nullable
as SpotifyAlbum,durationMs: null == durationMs ? _self.durationMs : durationMs // ignore: cast_nullable_to_non_nullable
as int,uri: null == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as String,href: null == href ? _self.href : href // ignore: cast_nullable_to_non_nullable
as String,previewUrl: freezed == previewUrl ? _self.previewUrl : previewUrl // ignore: cast_nullable_to_non_nullable
as String?,isLocal: null == isLocal ? _self.isLocal : isLocal // ignore: cast_nullable_to_non_nullable
as bool,popularity: null == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as int,explicit: null == explicit ? _self.explicit : explicit // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of SpotifyTrack
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SpotifyAlbumCopyWith<$Res> get album {
  
  return $SpotifyAlbumCopyWith<$Res>(_self.album, (value) {
    return _then(_self.copyWith(album: value));
  });
}
}


/// Adds pattern-matching-related methods to [SpotifyTrack].
extension SpotifyTrackPatterns on SpotifyTrack {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpotifyTrack value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpotifyTrack() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpotifyTrack value)  $default,){
final _that = this;
switch (_that) {
case _SpotifyTrack():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpotifyTrack value)?  $default,){
final _that = this;
switch (_that) {
case _SpotifyTrack() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  List<SpotifyArtist> artists,  SpotifyAlbum album,  int durationMs,  String uri,  String href,  String? previewUrl,  bool isLocal,  int popularity,  bool explicit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpotifyTrack() when $default != null:
return $default(_that.id,_that.name,_that.artists,_that.album,_that.durationMs,_that.uri,_that.href,_that.previewUrl,_that.isLocal,_that.popularity,_that.explicit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  List<SpotifyArtist> artists,  SpotifyAlbum album,  int durationMs,  String uri,  String href,  String? previewUrl,  bool isLocal,  int popularity,  bool explicit)  $default,) {final _that = this;
switch (_that) {
case _SpotifyTrack():
return $default(_that.id,_that.name,_that.artists,_that.album,_that.durationMs,_that.uri,_that.href,_that.previewUrl,_that.isLocal,_that.popularity,_that.explicit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  List<SpotifyArtist> artists,  SpotifyAlbum album,  int durationMs,  String uri,  String href,  String? previewUrl,  bool isLocal,  int popularity,  bool explicit)?  $default,) {final _that = this;
switch (_that) {
case _SpotifyTrack() when $default != null:
return $default(_that.id,_that.name,_that.artists,_that.album,_that.durationMs,_that.uri,_that.href,_that.previewUrl,_that.isLocal,_that.popularity,_that.explicit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SpotifyTrack implements SpotifyTrack {
  const _SpotifyTrack({required this.id, required this.name, required final  List<SpotifyArtist> artists, required this.album, required this.durationMs, required this.uri, required this.href, this.previewUrl, required this.isLocal, required this.popularity, required this.explicit}): _artists = artists;
  factory _SpotifyTrack.fromJson(Map<String, dynamic> json) => _$SpotifyTrackFromJson(json);

@override final  String id;
@override final  String name;
 final  List<SpotifyArtist> _artists;
@override List<SpotifyArtist> get artists {
  if (_artists is EqualUnmodifiableListView) return _artists;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_artists);
}

@override final  SpotifyAlbum album;
@override final  int durationMs;
@override final  String uri;
@override final  String href;
@override final  String? previewUrl;
@override final  bool isLocal;
@override final  int popularity;
@override final  bool explicit;

/// Create a copy of SpotifyTrack
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpotifyTrackCopyWith<_SpotifyTrack> get copyWith => __$SpotifyTrackCopyWithImpl<_SpotifyTrack>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpotifyTrackToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpotifyTrack&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._artists, _artists)&&(identical(other.album, album) || other.album == album)&&(identical(other.durationMs, durationMs) || other.durationMs == durationMs)&&(identical(other.uri, uri) || other.uri == uri)&&(identical(other.href, href) || other.href == href)&&(identical(other.previewUrl, previewUrl) || other.previewUrl == previewUrl)&&(identical(other.isLocal, isLocal) || other.isLocal == isLocal)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&(identical(other.explicit, explicit) || other.explicit == explicit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_artists),album,durationMs,uri,href,previewUrl,isLocal,popularity,explicit);

@override
String toString() {
  return 'SpotifyTrack(id: $id, name: $name, artists: $artists, album: $album, durationMs: $durationMs, uri: $uri, href: $href, previewUrl: $previewUrl, isLocal: $isLocal, popularity: $popularity, explicit: $explicit)';
}


}

/// @nodoc
abstract mixin class _$SpotifyTrackCopyWith<$Res> implements $SpotifyTrackCopyWith<$Res> {
  factory _$SpotifyTrackCopyWith(_SpotifyTrack value, $Res Function(_SpotifyTrack) _then) = __$SpotifyTrackCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, List<SpotifyArtist> artists, SpotifyAlbum album, int durationMs, String uri, String href, String? previewUrl, bool isLocal, int popularity, bool explicit
});


@override $SpotifyAlbumCopyWith<$Res> get album;

}
/// @nodoc
class __$SpotifyTrackCopyWithImpl<$Res>
    implements _$SpotifyTrackCopyWith<$Res> {
  __$SpotifyTrackCopyWithImpl(this._self, this._then);

  final _SpotifyTrack _self;
  final $Res Function(_SpotifyTrack) _then;

/// Create a copy of SpotifyTrack
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? artists = null,Object? album = null,Object? durationMs = null,Object? uri = null,Object? href = null,Object? previewUrl = freezed,Object? isLocal = null,Object? popularity = null,Object? explicit = null,}) {
  return _then(_SpotifyTrack(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,artists: null == artists ? _self._artists : artists // ignore: cast_nullable_to_non_nullable
as List<SpotifyArtist>,album: null == album ? _self.album : album // ignore: cast_nullable_to_non_nullable
as SpotifyAlbum,durationMs: null == durationMs ? _self.durationMs : durationMs // ignore: cast_nullable_to_non_nullable
as int,uri: null == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as String,href: null == href ? _self.href : href // ignore: cast_nullable_to_non_nullable
as String,previewUrl: freezed == previewUrl ? _self.previewUrl : previewUrl // ignore: cast_nullable_to_non_nullable
as String?,isLocal: null == isLocal ? _self.isLocal : isLocal // ignore: cast_nullable_to_non_nullable
as bool,popularity: null == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as int,explicit: null == explicit ? _self.explicit : explicit // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of SpotifyTrack
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SpotifyAlbumCopyWith<$Res> get album {
  
  return $SpotifyAlbumCopyWith<$Res>(_self.album, (value) {
    return _then(_self.copyWith(album: value));
  });
}
}


/// @nodoc
mixin _$SpotifyArtist {

 String get id; String get name; String get uri; String get href;
/// Create a copy of SpotifyArtist
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpotifyArtistCopyWith<SpotifyArtist> get copyWith => _$SpotifyArtistCopyWithImpl<SpotifyArtist>(this as SpotifyArtist, _$identity);

  /// Serializes this SpotifyArtist to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpotifyArtist&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.uri, uri) || other.uri == uri)&&(identical(other.href, href) || other.href == href));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,uri,href);

@override
String toString() {
  return 'SpotifyArtist(id: $id, name: $name, uri: $uri, href: $href)';
}


}

/// @nodoc
abstract mixin class $SpotifyArtistCopyWith<$Res>  {
  factory $SpotifyArtistCopyWith(SpotifyArtist value, $Res Function(SpotifyArtist) _then) = _$SpotifyArtistCopyWithImpl;
@useResult
$Res call({
 String id, String name, String uri, String href
});




}
/// @nodoc
class _$SpotifyArtistCopyWithImpl<$Res>
    implements $SpotifyArtistCopyWith<$Res> {
  _$SpotifyArtistCopyWithImpl(this._self, this._then);

  final SpotifyArtist _self;
  final $Res Function(SpotifyArtist) _then;

/// Create a copy of SpotifyArtist
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? uri = null,Object? href = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,uri: null == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as String,href: null == href ? _self.href : href // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SpotifyArtist].
extension SpotifyArtistPatterns on SpotifyArtist {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpotifyArtist value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpotifyArtist() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpotifyArtist value)  $default,){
final _that = this;
switch (_that) {
case _SpotifyArtist():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpotifyArtist value)?  $default,){
final _that = this;
switch (_that) {
case _SpotifyArtist() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String uri,  String href)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpotifyArtist() when $default != null:
return $default(_that.id,_that.name,_that.uri,_that.href);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String uri,  String href)  $default,) {final _that = this;
switch (_that) {
case _SpotifyArtist():
return $default(_that.id,_that.name,_that.uri,_that.href);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String uri,  String href)?  $default,) {final _that = this;
switch (_that) {
case _SpotifyArtist() when $default != null:
return $default(_that.id,_that.name,_that.uri,_that.href);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SpotifyArtist implements SpotifyArtist {
  const _SpotifyArtist({required this.id, required this.name, required this.uri, required this.href});
  factory _SpotifyArtist.fromJson(Map<String, dynamic> json) => _$SpotifyArtistFromJson(json);

@override final  String id;
@override final  String name;
@override final  String uri;
@override final  String href;

/// Create a copy of SpotifyArtist
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpotifyArtistCopyWith<_SpotifyArtist> get copyWith => __$SpotifyArtistCopyWithImpl<_SpotifyArtist>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpotifyArtistToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpotifyArtist&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.uri, uri) || other.uri == uri)&&(identical(other.href, href) || other.href == href));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,uri,href);

@override
String toString() {
  return 'SpotifyArtist(id: $id, name: $name, uri: $uri, href: $href)';
}


}

/// @nodoc
abstract mixin class _$SpotifyArtistCopyWith<$Res> implements $SpotifyArtistCopyWith<$Res> {
  factory _$SpotifyArtistCopyWith(_SpotifyArtist value, $Res Function(_SpotifyArtist) _then) = __$SpotifyArtistCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String uri, String href
});




}
/// @nodoc
class __$SpotifyArtistCopyWithImpl<$Res>
    implements _$SpotifyArtistCopyWith<$Res> {
  __$SpotifyArtistCopyWithImpl(this._self, this._then);

  final _SpotifyArtist _self;
  final $Res Function(_SpotifyArtist) _then;

/// Create a copy of SpotifyArtist
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? uri = null,Object? href = null,}) {
  return _then(_SpotifyArtist(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,uri: null == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as String,href: null == href ? _self.href : href // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SpotifyAlbum {

 String get id; String get name; String get albumType; String get releaseDate; int get totalTracks; String get uri; String get href; List<SpotifyImage> get images;
/// Create a copy of SpotifyAlbum
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpotifyAlbumCopyWith<SpotifyAlbum> get copyWith => _$SpotifyAlbumCopyWithImpl<SpotifyAlbum>(this as SpotifyAlbum, _$identity);

  /// Serializes this SpotifyAlbum to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpotifyAlbum&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.albumType, albumType) || other.albumType == albumType)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.totalTracks, totalTracks) || other.totalTracks == totalTracks)&&(identical(other.uri, uri) || other.uri == uri)&&(identical(other.href, href) || other.href == href)&&const DeepCollectionEquality().equals(other.images, images));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,albumType,releaseDate,totalTracks,uri,href,const DeepCollectionEquality().hash(images));

@override
String toString() {
  return 'SpotifyAlbum(id: $id, name: $name, albumType: $albumType, releaseDate: $releaseDate, totalTracks: $totalTracks, uri: $uri, href: $href, images: $images)';
}


}

/// @nodoc
abstract mixin class $SpotifyAlbumCopyWith<$Res>  {
  factory $SpotifyAlbumCopyWith(SpotifyAlbum value, $Res Function(SpotifyAlbum) _then) = _$SpotifyAlbumCopyWithImpl;
@useResult
$Res call({
 String id, String name, String albumType, String releaseDate, int totalTracks, String uri, String href, List<SpotifyImage> images
});




}
/// @nodoc
class _$SpotifyAlbumCopyWithImpl<$Res>
    implements $SpotifyAlbumCopyWith<$Res> {
  _$SpotifyAlbumCopyWithImpl(this._self, this._then);

  final SpotifyAlbum _self;
  final $Res Function(SpotifyAlbum) _then;

/// Create a copy of SpotifyAlbum
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? albumType = null,Object? releaseDate = null,Object? totalTracks = null,Object? uri = null,Object? href = null,Object? images = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,albumType: null == albumType ? _self.albumType : albumType // ignore: cast_nullable_to_non_nullable
as String,releaseDate: null == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String,totalTracks: null == totalTracks ? _self.totalTracks : totalTracks // ignore: cast_nullable_to_non_nullable
as int,uri: null == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as String,href: null == href ? _self.href : href // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<SpotifyImage>,
  ));
}

}


/// Adds pattern-matching-related methods to [SpotifyAlbum].
extension SpotifyAlbumPatterns on SpotifyAlbum {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpotifyAlbum value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpotifyAlbum() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpotifyAlbum value)  $default,){
final _that = this;
switch (_that) {
case _SpotifyAlbum():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpotifyAlbum value)?  $default,){
final _that = this;
switch (_that) {
case _SpotifyAlbum() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String albumType,  String releaseDate,  int totalTracks,  String uri,  String href,  List<SpotifyImage> images)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpotifyAlbum() when $default != null:
return $default(_that.id,_that.name,_that.albumType,_that.releaseDate,_that.totalTracks,_that.uri,_that.href,_that.images);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String albumType,  String releaseDate,  int totalTracks,  String uri,  String href,  List<SpotifyImage> images)  $default,) {final _that = this;
switch (_that) {
case _SpotifyAlbum():
return $default(_that.id,_that.name,_that.albumType,_that.releaseDate,_that.totalTracks,_that.uri,_that.href,_that.images);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String albumType,  String releaseDate,  int totalTracks,  String uri,  String href,  List<SpotifyImage> images)?  $default,) {final _that = this;
switch (_that) {
case _SpotifyAlbum() when $default != null:
return $default(_that.id,_that.name,_that.albumType,_that.releaseDate,_that.totalTracks,_that.uri,_that.href,_that.images);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SpotifyAlbum implements SpotifyAlbum {
  const _SpotifyAlbum({required this.id, required this.name, required this.albumType, required this.releaseDate, required this.totalTracks, required this.uri, required this.href, required final  List<SpotifyImage> images}): _images = images;
  factory _SpotifyAlbum.fromJson(Map<String, dynamic> json) => _$SpotifyAlbumFromJson(json);

@override final  String id;
@override final  String name;
@override final  String albumType;
@override final  String releaseDate;
@override final  int totalTracks;
@override final  String uri;
@override final  String href;
 final  List<SpotifyImage> _images;
@override List<SpotifyImage> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}


/// Create a copy of SpotifyAlbum
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpotifyAlbumCopyWith<_SpotifyAlbum> get copyWith => __$SpotifyAlbumCopyWithImpl<_SpotifyAlbum>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpotifyAlbumToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpotifyAlbum&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.albumType, albumType) || other.albumType == albumType)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.totalTracks, totalTracks) || other.totalTracks == totalTracks)&&(identical(other.uri, uri) || other.uri == uri)&&(identical(other.href, href) || other.href == href)&&const DeepCollectionEquality().equals(other._images, _images));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,albumType,releaseDate,totalTracks,uri,href,const DeepCollectionEquality().hash(_images));

@override
String toString() {
  return 'SpotifyAlbum(id: $id, name: $name, albumType: $albumType, releaseDate: $releaseDate, totalTracks: $totalTracks, uri: $uri, href: $href, images: $images)';
}


}

/// @nodoc
abstract mixin class _$SpotifyAlbumCopyWith<$Res> implements $SpotifyAlbumCopyWith<$Res> {
  factory _$SpotifyAlbumCopyWith(_SpotifyAlbum value, $Res Function(_SpotifyAlbum) _then) = __$SpotifyAlbumCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String albumType, String releaseDate, int totalTracks, String uri, String href, List<SpotifyImage> images
});




}
/// @nodoc
class __$SpotifyAlbumCopyWithImpl<$Res>
    implements _$SpotifyAlbumCopyWith<$Res> {
  __$SpotifyAlbumCopyWithImpl(this._self, this._then);

  final _SpotifyAlbum _self;
  final $Res Function(_SpotifyAlbum) _then;

/// Create a copy of SpotifyAlbum
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? albumType = null,Object? releaseDate = null,Object? totalTracks = null,Object? uri = null,Object? href = null,Object? images = null,}) {
  return _then(_SpotifyAlbum(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,albumType: null == albumType ? _self.albumType : albumType // ignore: cast_nullable_to_non_nullable
as String,releaseDate: null == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String,totalTracks: null == totalTracks ? _self.totalTracks : totalTracks // ignore: cast_nullable_to_non_nullable
as int,uri: null == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as String,href: null == href ? _self.href : href // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<SpotifyImage>,
  ));
}


}


/// @nodoc
mixin _$SpotifyImage {

 String get url; int? get height; int? get width;
/// Create a copy of SpotifyImage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpotifyImageCopyWith<SpotifyImage> get copyWith => _$SpotifyImageCopyWithImpl<SpotifyImage>(this as SpotifyImage, _$identity);

  /// Serializes this SpotifyImage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpotifyImage&&(identical(other.url, url) || other.url == url)&&(identical(other.height, height) || other.height == height)&&(identical(other.width, width) || other.width == width));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,height,width);

@override
String toString() {
  return 'SpotifyImage(url: $url, height: $height, width: $width)';
}


}

/// @nodoc
abstract mixin class $SpotifyImageCopyWith<$Res>  {
  factory $SpotifyImageCopyWith(SpotifyImage value, $Res Function(SpotifyImage) _then) = _$SpotifyImageCopyWithImpl;
@useResult
$Res call({
 String url, int? height, int? width
});




}
/// @nodoc
class _$SpotifyImageCopyWithImpl<$Res>
    implements $SpotifyImageCopyWith<$Res> {
  _$SpotifyImageCopyWithImpl(this._self, this._then);

  final SpotifyImage _self;
  final $Res Function(SpotifyImage) _then;

/// Create a copy of SpotifyImage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = null,Object? height = freezed,Object? width = freezed,}) {
  return _then(_self.copyWith(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [SpotifyImage].
extension SpotifyImagePatterns on SpotifyImage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpotifyImage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpotifyImage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpotifyImage value)  $default,){
final _that = this;
switch (_that) {
case _SpotifyImage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpotifyImage value)?  $default,){
final _that = this;
switch (_that) {
case _SpotifyImage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String url,  int? height,  int? width)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpotifyImage() when $default != null:
return $default(_that.url,_that.height,_that.width);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String url,  int? height,  int? width)  $default,) {final _that = this;
switch (_that) {
case _SpotifyImage():
return $default(_that.url,_that.height,_that.width);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String url,  int? height,  int? width)?  $default,) {final _that = this;
switch (_that) {
case _SpotifyImage() when $default != null:
return $default(_that.url,_that.height,_that.width);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SpotifyImage implements SpotifyImage {
  const _SpotifyImage({required this.url, this.height, this.width});
  factory _SpotifyImage.fromJson(Map<String, dynamic> json) => _$SpotifyImageFromJson(json);

@override final  String url;
@override final  int? height;
@override final  int? width;

/// Create a copy of SpotifyImage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpotifyImageCopyWith<_SpotifyImage> get copyWith => __$SpotifyImageCopyWithImpl<_SpotifyImage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpotifyImageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpotifyImage&&(identical(other.url, url) || other.url == url)&&(identical(other.height, height) || other.height == height)&&(identical(other.width, width) || other.width == width));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,height,width);

@override
String toString() {
  return 'SpotifyImage(url: $url, height: $height, width: $width)';
}


}

/// @nodoc
abstract mixin class _$SpotifyImageCopyWith<$Res> implements $SpotifyImageCopyWith<$Res> {
  factory _$SpotifyImageCopyWith(_SpotifyImage value, $Res Function(_SpotifyImage) _then) = __$SpotifyImageCopyWithImpl;
@override @useResult
$Res call({
 String url, int? height, int? width
});




}
/// @nodoc
class __$SpotifyImageCopyWithImpl<$Res>
    implements _$SpotifyImageCopyWith<$Res> {
  __$SpotifyImageCopyWithImpl(this._self, this._then);

  final _SpotifyImage _self;
  final $Res Function(_SpotifyImage) _then;

/// Create a copy of SpotifyImage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = null,Object? height = freezed,Object? width = freezed,}) {
  return _then(_SpotifyImage(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
