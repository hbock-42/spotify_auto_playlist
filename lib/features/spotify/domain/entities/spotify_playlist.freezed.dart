// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spotify_playlist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SpotifyPlaylist {

 String get id; String get name; String? get description; SpotifyUser get owner; bool get public; bool get collaborative; int get totalTracks; String get uri; String get href; List<SpotifyImage> get images; String? get snapshotId; List<SpotifyTrack>? get tracks;
/// Create a copy of SpotifyPlaylist
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpotifyPlaylistCopyWith<SpotifyPlaylist> get copyWith => _$SpotifyPlaylistCopyWithImpl<SpotifyPlaylist>(this as SpotifyPlaylist, _$identity);

  /// Serializes this SpotifyPlaylist to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpotifyPlaylist&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.public, public) || other.public == public)&&(identical(other.collaborative, collaborative) || other.collaborative == collaborative)&&(identical(other.totalTracks, totalTracks) || other.totalTracks == totalTracks)&&(identical(other.uri, uri) || other.uri == uri)&&(identical(other.href, href) || other.href == href)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.snapshotId, snapshotId) || other.snapshotId == snapshotId)&&const DeepCollectionEquality().equals(other.tracks, tracks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,owner,public,collaborative,totalTracks,uri,href,const DeepCollectionEquality().hash(images),snapshotId,const DeepCollectionEquality().hash(tracks));

@override
String toString() {
  return 'SpotifyPlaylist(id: $id, name: $name, description: $description, owner: $owner, public: $public, collaborative: $collaborative, totalTracks: $totalTracks, uri: $uri, href: $href, images: $images, snapshotId: $snapshotId, tracks: $tracks)';
}


}

/// @nodoc
abstract mixin class $SpotifyPlaylistCopyWith<$Res>  {
  factory $SpotifyPlaylistCopyWith(SpotifyPlaylist value, $Res Function(SpotifyPlaylist) _then) = _$SpotifyPlaylistCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? description, SpotifyUser owner, bool public, bool collaborative, int totalTracks, String uri, String href, List<SpotifyImage> images, String? snapshotId, List<SpotifyTrack>? tracks
});


$SpotifyUserCopyWith<$Res> get owner;

}
/// @nodoc
class _$SpotifyPlaylistCopyWithImpl<$Res>
    implements $SpotifyPlaylistCopyWith<$Res> {
  _$SpotifyPlaylistCopyWithImpl(this._self, this._then);

  final SpotifyPlaylist _self;
  final $Res Function(SpotifyPlaylist) _then;

/// Create a copy of SpotifyPlaylist
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? owner = null,Object? public = null,Object? collaborative = null,Object? totalTracks = null,Object? uri = null,Object? href = null,Object? images = null,Object? snapshotId = freezed,Object? tracks = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,owner: null == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as SpotifyUser,public: null == public ? _self.public : public // ignore: cast_nullable_to_non_nullable
as bool,collaborative: null == collaborative ? _self.collaborative : collaborative // ignore: cast_nullable_to_non_nullable
as bool,totalTracks: null == totalTracks ? _self.totalTracks : totalTracks // ignore: cast_nullable_to_non_nullable
as int,uri: null == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as String,href: null == href ? _self.href : href // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<SpotifyImage>,snapshotId: freezed == snapshotId ? _self.snapshotId : snapshotId // ignore: cast_nullable_to_non_nullable
as String?,tracks: freezed == tracks ? _self.tracks : tracks // ignore: cast_nullable_to_non_nullable
as List<SpotifyTrack>?,
  ));
}
/// Create a copy of SpotifyPlaylist
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SpotifyUserCopyWith<$Res> get owner {
  
  return $SpotifyUserCopyWith<$Res>(_self.owner, (value) {
    return _then(_self.copyWith(owner: value));
  });
}
}


/// Adds pattern-matching-related methods to [SpotifyPlaylist].
extension SpotifyPlaylistPatterns on SpotifyPlaylist {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpotifyPlaylist value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpotifyPlaylist() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpotifyPlaylist value)  $default,){
final _that = this;
switch (_that) {
case _SpotifyPlaylist():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpotifyPlaylist value)?  $default,){
final _that = this;
switch (_that) {
case _SpotifyPlaylist() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  SpotifyUser owner,  bool public,  bool collaborative,  int totalTracks,  String uri,  String href,  List<SpotifyImage> images,  String? snapshotId,  List<SpotifyTrack>? tracks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpotifyPlaylist() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.owner,_that.public,_that.collaborative,_that.totalTracks,_that.uri,_that.href,_that.images,_that.snapshotId,_that.tracks);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  SpotifyUser owner,  bool public,  bool collaborative,  int totalTracks,  String uri,  String href,  List<SpotifyImage> images,  String? snapshotId,  List<SpotifyTrack>? tracks)  $default,) {final _that = this;
switch (_that) {
case _SpotifyPlaylist():
return $default(_that.id,_that.name,_that.description,_that.owner,_that.public,_that.collaborative,_that.totalTracks,_that.uri,_that.href,_that.images,_that.snapshotId,_that.tracks);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? description,  SpotifyUser owner,  bool public,  bool collaborative,  int totalTracks,  String uri,  String href,  List<SpotifyImage> images,  String? snapshotId,  List<SpotifyTrack>? tracks)?  $default,) {final _that = this;
switch (_that) {
case _SpotifyPlaylist() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.owner,_that.public,_that.collaborative,_that.totalTracks,_that.uri,_that.href,_that.images,_that.snapshotId,_that.tracks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SpotifyPlaylist extends SpotifyPlaylist {
  const _SpotifyPlaylist({required this.id, required this.name, this.description, required this.owner, required this.public, required this.collaborative, required this.totalTracks, required this.uri, required this.href, required final  List<SpotifyImage> images, this.snapshotId, final  List<SpotifyTrack>? tracks}): _images = images,_tracks = tracks,super._();
  factory _SpotifyPlaylist.fromJson(Map<String, dynamic> json) => _$SpotifyPlaylistFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? description;
@override final  SpotifyUser owner;
@override final  bool public;
@override final  bool collaborative;
@override final  int totalTracks;
@override final  String uri;
@override final  String href;
 final  List<SpotifyImage> _images;
@override List<SpotifyImage> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

@override final  String? snapshotId;
 final  List<SpotifyTrack>? _tracks;
@override List<SpotifyTrack>? get tracks {
  final value = _tracks;
  if (value == null) return null;
  if (_tracks is EqualUnmodifiableListView) return _tracks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of SpotifyPlaylist
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpotifyPlaylistCopyWith<_SpotifyPlaylist> get copyWith => __$SpotifyPlaylistCopyWithImpl<_SpotifyPlaylist>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpotifyPlaylistToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpotifyPlaylist&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.public, public) || other.public == public)&&(identical(other.collaborative, collaborative) || other.collaborative == collaborative)&&(identical(other.totalTracks, totalTracks) || other.totalTracks == totalTracks)&&(identical(other.uri, uri) || other.uri == uri)&&(identical(other.href, href) || other.href == href)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.snapshotId, snapshotId) || other.snapshotId == snapshotId)&&const DeepCollectionEquality().equals(other._tracks, _tracks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,owner,public,collaborative,totalTracks,uri,href,const DeepCollectionEquality().hash(_images),snapshotId,const DeepCollectionEquality().hash(_tracks));

@override
String toString() {
  return 'SpotifyPlaylist(id: $id, name: $name, description: $description, owner: $owner, public: $public, collaborative: $collaborative, totalTracks: $totalTracks, uri: $uri, href: $href, images: $images, snapshotId: $snapshotId, tracks: $tracks)';
}


}

/// @nodoc
abstract mixin class _$SpotifyPlaylistCopyWith<$Res> implements $SpotifyPlaylistCopyWith<$Res> {
  factory _$SpotifyPlaylistCopyWith(_SpotifyPlaylist value, $Res Function(_SpotifyPlaylist) _then) = __$SpotifyPlaylistCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? description, SpotifyUser owner, bool public, bool collaborative, int totalTracks, String uri, String href, List<SpotifyImage> images, String? snapshotId, List<SpotifyTrack>? tracks
});


@override $SpotifyUserCopyWith<$Res> get owner;

}
/// @nodoc
class __$SpotifyPlaylistCopyWithImpl<$Res>
    implements _$SpotifyPlaylistCopyWith<$Res> {
  __$SpotifyPlaylistCopyWithImpl(this._self, this._then);

  final _SpotifyPlaylist _self;
  final $Res Function(_SpotifyPlaylist) _then;

/// Create a copy of SpotifyPlaylist
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? owner = null,Object? public = null,Object? collaborative = null,Object? totalTracks = null,Object? uri = null,Object? href = null,Object? images = null,Object? snapshotId = freezed,Object? tracks = freezed,}) {
  return _then(_SpotifyPlaylist(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,owner: null == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as SpotifyUser,public: null == public ? _self.public : public // ignore: cast_nullable_to_non_nullable
as bool,collaborative: null == collaborative ? _self.collaborative : collaborative // ignore: cast_nullable_to_non_nullable
as bool,totalTracks: null == totalTracks ? _self.totalTracks : totalTracks // ignore: cast_nullable_to_non_nullable
as int,uri: null == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as String,href: null == href ? _self.href : href // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<SpotifyImage>,snapshotId: freezed == snapshotId ? _self.snapshotId : snapshotId // ignore: cast_nullable_to_non_nullable
as String?,tracks: freezed == tracks ? _self._tracks : tracks // ignore: cast_nullable_to_non_nullable
as List<SpotifyTrack>?,
  ));
}

/// Create a copy of SpotifyPlaylist
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SpotifyUserCopyWith<$Res> get owner {
  
  return $SpotifyUserCopyWith<$Res>(_self.owner, (value) {
    return _then(_self.copyWith(owner: value));
  });
}
}

// dart format on
