// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'playlist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Playlist {

 String get id; String get name; String get description; String get ownerId; String get ownerDisplayName; bool? get isPublic; bool get isCollaborative; int? get totalTracks; List<Track> get tracks; String? get imageUrl; String get externalUrl; DateTime get createdAt; DateTime? get modifiedAt;
/// Create a copy of Playlist
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaylistCopyWith<Playlist> get copyWith => _$PlaylistCopyWithImpl<Playlist>(this as Playlist, _$identity);

  /// Serializes this Playlist to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Playlist&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.ownerDisplayName, ownerDisplayName) || other.ownerDisplayName == ownerDisplayName)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&(identical(other.isCollaborative, isCollaborative) || other.isCollaborative == isCollaborative)&&(identical(other.totalTracks, totalTracks) || other.totalTracks == totalTracks)&&const DeepCollectionEquality().equals(other.tracks, tracks)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.externalUrl, externalUrl) || other.externalUrl == externalUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.modifiedAt, modifiedAt) || other.modifiedAt == modifiedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,ownerId,ownerDisplayName,isPublic,isCollaborative,totalTracks,const DeepCollectionEquality().hash(tracks),imageUrl,externalUrl,createdAt,modifiedAt);

@override
String toString() {
  return 'Playlist(id: $id, name: $name, description: $description, ownerId: $ownerId, ownerDisplayName: $ownerDisplayName, isPublic: $isPublic, isCollaborative: $isCollaborative, totalTracks: $totalTracks, tracks: $tracks, imageUrl: $imageUrl, externalUrl: $externalUrl, createdAt: $createdAt, modifiedAt: $modifiedAt)';
}


}

/// @nodoc
abstract mixin class $PlaylistCopyWith<$Res>  {
  factory $PlaylistCopyWith(Playlist value, $Res Function(Playlist) _then) = _$PlaylistCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description, String ownerId, String ownerDisplayName, bool? isPublic, bool isCollaborative, int? totalTracks, List<Track> tracks, String? imageUrl, String externalUrl, DateTime createdAt, DateTime? modifiedAt
});




}
/// @nodoc
class _$PlaylistCopyWithImpl<$Res>
    implements $PlaylistCopyWith<$Res> {
  _$PlaylistCopyWithImpl(this._self, this._then);

  final Playlist _self;
  final $Res Function(Playlist) _then;

/// Create a copy of Playlist
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? ownerId = null,Object? ownerDisplayName = null,Object? isPublic = freezed,Object? isCollaborative = null,Object? totalTracks = freezed,Object? tracks = null,Object? imageUrl = freezed,Object? externalUrl = null,Object? createdAt = null,Object? modifiedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,ownerDisplayName: null == ownerDisplayName ? _self.ownerDisplayName : ownerDisplayName // ignore: cast_nullable_to_non_nullable
as String,isPublic: freezed == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool?,isCollaborative: null == isCollaborative ? _self.isCollaborative : isCollaborative // ignore: cast_nullable_to_non_nullable
as bool,totalTracks: freezed == totalTracks ? _self.totalTracks : totalTracks // ignore: cast_nullable_to_non_nullable
as int?,tracks: null == tracks ? _self.tracks : tracks // ignore: cast_nullable_to_non_nullable
as List<Track>,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,externalUrl: null == externalUrl ? _self.externalUrl : externalUrl // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,modifiedAt: freezed == modifiedAt ? _self.modifiedAt : modifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Playlist].
extension PlaylistPatterns on Playlist {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Playlist value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Playlist() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Playlist value)  $default,){
final _that = this;
switch (_that) {
case _Playlist():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Playlist value)?  $default,){
final _that = this;
switch (_that) {
case _Playlist() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description,  String ownerId,  String ownerDisplayName,  bool? isPublic,  bool isCollaborative,  int? totalTracks,  List<Track> tracks,  String? imageUrl,  String externalUrl,  DateTime createdAt,  DateTime? modifiedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Playlist() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.ownerId,_that.ownerDisplayName,_that.isPublic,_that.isCollaborative,_that.totalTracks,_that.tracks,_that.imageUrl,_that.externalUrl,_that.createdAt,_that.modifiedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description,  String ownerId,  String ownerDisplayName,  bool? isPublic,  bool isCollaborative,  int? totalTracks,  List<Track> tracks,  String? imageUrl,  String externalUrl,  DateTime createdAt,  DateTime? modifiedAt)  $default,) {final _that = this;
switch (_that) {
case _Playlist():
return $default(_that.id,_that.name,_that.description,_that.ownerId,_that.ownerDisplayName,_that.isPublic,_that.isCollaborative,_that.totalTracks,_that.tracks,_that.imageUrl,_that.externalUrl,_that.createdAt,_that.modifiedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description,  String ownerId,  String ownerDisplayName,  bool? isPublic,  bool isCollaborative,  int? totalTracks,  List<Track> tracks,  String? imageUrl,  String externalUrl,  DateTime createdAt,  DateTime? modifiedAt)?  $default,) {final _that = this;
switch (_that) {
case _Playlist() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.ownerId,_that.ownerDisplayName,_that.isPublic,_that.isCollaborative,_that.totalTracks,_that.tracks,_that.imageUrl,_that.externalUrl,_that.createdAt,_that.modifiedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Playlist implements Playlist {
  const _Playlist({required this.id, required this.name, required this.description, required this.ownerId, required this.ownerDisplayName, required this.isPublic, required this.isCollaborative, required this.totalTracks, required final  List<Track> tracks, required this.imageUrl, required this.externalUrl, required this.createdAt, required this.modifiedAt}): _tracks = tracks;
  factory _Playlist.fromJson(Map<String, dynamic> json) => _$PlaylistFromJson(json);

@override final  String id;
@override final  String name;
@override final  String description;
@override final  String ownerId;
@override final  String ownerDisplayName;
@override final  bool? isPublic;
@override final  bool isCollaborative;
@override final  int? totalTracks;
 final  List<Track> _tracks;
@override List<Track> get tracks {
  if (_tracks is EqualUnmodifiableListView) return _tracks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tracks);
}

@override final  String? imageUrl;
@override final  String externalUrl;
@override final  DateTime createdAt;
@override final  DateTime? modifiedAt;

/// Create a copy of Playlist
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaylistCopyWith<_Playlist> get copyWith => __$PlaylistCopyWithImpl<_Playlist>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlaylistToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Playlist&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.ownerDisplayName, ownerDisplayName) || other.ownerDisplayName == ownerDisplayName)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&(identical(other.isCollaborative, isCollaborative) || other.isCollaborative == isCollaborative)&&(identical(other.totalTracks, totalTracks) || other.totalTracks == totalTracks)&&const DeepCollectionEquality().equals(other._tracks, _tracks)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.externalUrl, externalUrl) || other.externalUrl == externalUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.modifiedAt, modifiedAt) || other.modifiedAt == modifiedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,ownerId,ownerDisplayName,isPublic,isCollaborative,totalTracks,const DeepCollectionEquality().hash(_tracks),imageUrl,externalUrl,createdAt,modifiedAt);

@override
String toString() {
  return 'Playlist(id: $id, name: $name, description: $description, ownerId: $ownerId, ownerDisplayName: $ownerDisplayName, isPublic: $isPublic, isCollaborative: $isCollaborative, totalTracks: $totalTracks, tracks: $tracks, imageUrl: $imageUrl, externalUrl: $externalUrl, createdAt: $createdAt, modifiedAt: $modifiedAt)';
}


}

/// @nodoc
abstract mixin class _$PlaylistCopyWith<$Res> implements $PlaylistCopyWith<$Res> {
  factory _$PlaylistCopyWith(_Playlist value, $Res Function(_Playlist) _then) = __$PlaylistCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description, String ownerId, String ownerDisplayName, bool? isPublic, bool isCollaborative, int? totalTracks, List<Track> tracks, String? imageUrl, String externalUrl, DateTime createdAt, DateTime? modifiedAt
});




}
/// @nodoc
class __$PlaylistCopyWithImpl<$Res>
    implements _$PlaylistCopyWith<$Res> {
  __$PlaylistCopyWithImpl(this._self, this._then);

  final _Playlist _self;
  final $Res Function(_Playlist) _then;

/// Create a copy of Playlist
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? ownerId = null,Object? ownerDisplayName = null,Object? isPublic = freezed,Object? isCollaborative = null,Object? totalTracks = freezed,Object? tracks = null,Object? imageUrl = freezed,Object? externalUrl = null,Object? createdAt = null,Object? modifiedAt = freezed,}) {
  return _then(_Playlist(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,ownerDisplayName: null == ownerDisplayName ? _self.ownerDisplayName : ownerDisplayName // ignore: cast_nullable_to_non_nullable
as String,isPublic: freezed == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool?,isCollaborative: null == isCollaborative ? _self.isCollaborative : isCollaborative // ignore: cast_nullable_to_non_nullable
as bool,totalTracks: freezed == totalTracks ? _self.totalTracks : totalTracks // ignore: cast_nullable_to_non_nullable
as int?,tracks: null == tracks ? _self._tracks : tracks // ignore: cast_nullable_to_non_nullable
as List<Track>,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,externalUrl: null == externalUrl ? _self.externalUrl : externalUrl // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,modifiedAt: freezed == modifiedAt ? _self.modifiedAt : modifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$Track {

 String get id; String get name; String get artistName; String get albumName; int get durationMs; String? get previewUrl; String get externalUrl; String? get imageUrl; bool get isExplicit; int get popularity; DateTime get addedAt; AudioFeatures? get audioFeatures;
/// Create a copy of Track
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrackCopyWith<Track> get copyWith => _$TrackCopyWithImpl<Track>(this as Track, _$identity);

  /// Serializes this Track to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Track&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.artistName, artistName) || other.artistName == artistName)&&(identical(other.albumName, albumName) || other.albumName == albumName)&&(identical(other.durationMs, durationMs) || other.durationMs == durationMs)&&(identical(other.previewUrl, previewUrl) || other.previewUrl == previewUrl)&&(identical(other.externalUrl, externalUrl) || other.externalUrl == externalUrl)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.isExplicit, isExplicit) || other.isExplicit == isExplicit)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.audioFeatures, audioFeatures) || other.audioFeatures == audioFeatures));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,artistName,albumName,durationMs,previewUrl,externalUrl,imageUrl,isExplicit,popularity,addedAt,audioFeatures);

@override
String toString() {
  return 'Track(id: $id, name: $name, artistName: $artistName, albumName: $albumName, durationMs: $durationMs, previewUrl: $previewUrl, externalUrl: $externalUrl, imageUrl: $imageUrl, isExplicit: $isExplicit, popularity: $popularity, addedAt: $addedAt, audioFeatures: $audioFeatures)';
}


}

/// @nodoc
abstract mixin class $TrackCopyWith<$Res>  {
  factory $TrackCopyWith(Track value, $Res Function(Track) _then) = _$TrackCopyWithImpl;
@useResult
$Res call({
 String id, String name, String artistName, String albumName, int durationMs, String? previewUrl, String externalUrl, String? imageUrl, bool isExplicit, int popularity, DateTime addedAt, AudioFeatures? audioFeatures
});


$AudioFeaturesCopyWith<$Res>? get audioFeatures;

}
/// @nodoc
class _$TrackCopyWithImpl<$Res>
    implements $TrackCopyWith<$Res> {
  _$TrackCopyWithImpl(this._self, this._then);

  final Track _self;
  final $Res Function(Track) _then;

/// Create a copy of Track
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? artistName = null,Object? albumName = null,Object? durationMs = null,Object? previewUrl = freezed,Object? externalUrl = null,Object? imageUrl = freezed,Object? isExplicit = null,Object? popularity = null,Object? addedAt = null,Object? audioFeatures = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,artistName: null == artistName ? _self.artistName : artistName // ignore: cast_nullable_to_non_nullable
as String,albumName: null == albumName ? _self.albumName : albumName // ignore: cast_nullable_to_non_nullable
as String,durationMs: null == durationMs ? _self.durationMs : durationMs // ignore: cast_nullable_to_non_nullable
as int,previewUrl: freezed == previewUrl ? _self.previewUrl : previewUrl // ignore: cast_nullable_to_non_nullable
as String?,externalUrl: null == externalUrl ? _self.externalUrl : externalUrl // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,isExplicit: null == isExplicit ? _self.isExplicit : isExplicit // ignore: cast_nullable_to_non_nullable
as bool,popularity: null == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as int,addedAt: null == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime,audioFeatures: freezed == audioFeatures ? _self.audioFeatures : audioFeatures // ignore: cast_nullable_to_non_nullable
as AudioFeatures?,
  ));
}
/// Create a copy of Track
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AudioFeaturesCopyWith<$Res>? get audioFeatures {
    if (_self.audioFeatures == null) {
    return null;
  }

  return $AudioFeaturesCopyWith<$Res>(_self.audioFeatures!, (value) {
    return _then(_self.copyWith(audioFeatures: value));
  });
}
}


/// Adds pattern-matching-related methods to [Track].
extension TrackPatterns on Track {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Track value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Track() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Track value)  $default,){
final _that = this;
switch (_that) {
case _Track():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Track value)?  $default,){
final _that = this;
switch (_that) {
case _Track() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String artistName,  String albumName,  int durationMs,  String? previewUrl,  String externalUrl,  String? imageUrl,  bool isExplicit,  int popularity,  DateTime addedAt,  AudioFeatures? audioFeatures)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Track() when $default != null:
return $default(_that.id,_that.name,_that.artistName,_that.albumName,_that.durationMs,_that.previewUrl,_that.externalUrl,_that.imageUrl,_that.isExplicit,_that.popularity,_that.addedAt,_that.audioFeatures);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String artistName,  String albumName,  int durationMs,  String? previewUrl,  String externalUrl,  String? imageUrl,  bool isExplicit,  int popularity,  DateTime addedAt,  AudioFeatures? audioFeatures)  $default,) {final _that = this;
switch (_that) {
case _Track():
return $default(_that.id,_that.name,_that.artistName,_that.albumName,_that.durationMs,_that.previewUrl,_that.externalUrl,_that.imageUrl,_that.isExplicit,_that.popularity,_that.addedAt,_that.audioFeatures);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String artistName,  String albumName,  int durationMs,  String? previewUrl,  String externalUrl,  String? imageUrl,  bool isExplicit,  int popularity,  DateTime addedAt,  AudioFeatures? audioFeatures)?  $default,) {final _that = this;
switch (_that) {
case _Track() when $default != null:
return $default(_that.id,_that.name,_that.artistName,_that.albumName,_that.durationMs,_that.previewUrl,_that.externalUrl,_that.imageUrl,_that.isExplicit,_that.popularity,_that.addedAt,_that.audioFeatures);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Track implements Track {
  const _Track({required this.id, required this.name, required this.artistName, required this.albumName, required this.durationMs, required this.previewUrl, required this.externalUrl, required this.imageUrl, required this.isExplicit, required this.popularity, required this.addedAt, required this.audioFeatures});
  factory _Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);

@override final  String id;
@override final  String name;
@override final  String artistName;
@override final  String albumName;
@override final  int durationMs;
@override final  String? previewUrl;
@override final  String externalUrl;
@override final  String? imageUrl;
@override final  bool isExplicit;
@override final  int popularity;
@override final  DateTime addedAt;
@override final  AudioFeatures? audioFeatures;

/// Create a copy of Track
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrackCopyWith<_Track> get copyWith => __$TrackCopyWithImpl<_Track>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrackToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Track&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.artistName, artistName) || other.artistName == artistName)&&(identical(other.albumName, albumName) || other.albumName == albumName)&&(identical(other.durationMs, durationMs) || other.durationMs == durationMs)&&(identical(other.previewUrl, previewUrl) || other.previewUrl == previewUrl)&&(identical(other.externalUrl, externalUrl) || other.externalUrl == externalUrl)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.isExplicit, isExplicit) || other.isExplicit == isExplicit)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.audioFeatures, audioFeatures) || other.audioFeatures == audioFeatures));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,artistName,albumName,durationMs,previewUrl,externalUrl,imageUrl,isExplicit,popularity,addedAt,audioFeatures);

@override
String toString() {
  return 'Track(id: $id, name: $name, artistName: $artistName, albumName: $albumName, durationMs: $durationMs, previewUrl: $previewUrl, externalUrl: $externalUrl, imageUrl: $imageUrl, isExplicit: $isExplicit, popularity: $popularity, addedAt: $addedAt, audioFeatures: $audioFeatures)';
}


}

/// @nodoc
abstract mixin class _$TrackCopyWith<$Res> implements $TrackCopyWith<$Res> {
  factory _$TrackCopyWith(_Track value, $Res Function(_Track) _then) = __$TrackCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String artistName, String albumName, int durationMs, String? previewUrl, String externalUrl, String? imageUrl, bool isExplicit, int popularity, DateTime addedAt, AudioFeatures? audioFeatures
});


@override $AudioFeaturesCopyWith<$Res>? get audioFeatures;

}
/// @nodoc
class __$TrackCopyWithImpl<$Res>
    implements _$TrackCopyWith<$Res> {
  __$TrackCopyWithImpl(this._self, this._then);

  final _Track _self;
  final $Res Function(_Track) _then;

/// Create a copy of Track
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? artistName = null,Object? albumName = null,Object? durationMs = null,Object? previewUrl = freezed,Object? externalUrl = null,Object? imageUrl = freezed,Object? isExplicit = null,Object? popularity = null,Object? addedAt = null,Object? audioFeatures = freezed,}) {
  return _then(_Track(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,artistName: null == artistName ? _self.artistName : artistName // ignore: cast_nullable_to_non_nullable
as String,albumName: null == albumName ? _self.albumName : albumName // ignore: cast_nullable_to_non_nullable
as String,durationMs: null == durationMs ? _self.durationMs : durationMs // ignore: cast_nullable_to_non_nullable
as int,previewUrl: freezed == previewUrl ? _self.previewUrl : previewUrl // ignore: cast_nullable_to_non_nullable
as String?,externalUrl: null == externalUrl ? _self.externalUrl : externalUrl // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,isExplicit: null == isExplicit ? _self.isExplicit : isExplicit // ignore: cast_nullable_to_non_nullable
as bool,popularity: null == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as int,addedAt: null == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime,audioFeatures: freezed == audioFeatures ? _self.audioFeatures : audioFeatures // ignore: cast_nullable_to_non_nullable
as AudioFeatures?,
  ));
}

/// Create a copy of Track
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AudioFeaturesCopyWith<$Res>? get audioFeatures {
    if (_self.audioFeatures == null) {
    return null;
  }

  return $AudioFeaturesCopyWith<$Res>(_self.audioFeatures!, (value) {
    return _then(_self.copyWith(audioFeatures: value));
  });
}
}


/// @nodoc
mixin _$AudioFeatures {

 String get id; double get acousticness; double get danceability; double get energy; double get instrumentalness; int get key; double get liveness; double get loudness; int get mode; double get speechiness; double get tempo; int get timeSignature; double get valence;
/// Create a copy of AudioFeatures
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AudioFeaturesCopyWith<AudioFeatures> get copyWith => _$AudioFeaturesCopyWithImpl<AudioFeatures>(this as AudioFeatures, _$identity);

  /// Serializes this AudioFeatures to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AudioFeatures&&(identical(other.id, id) || other.id == id)&&(identical(other.acousticness, acousticness) || other.acousticness == acousticness)&&(identical(other.danceability, danceability) || other.danceability == danceability)&&(identical(other.energy, energy) || other.energy == energy)&&(identical(other.instrumentalness, instrumentalness) || other.instrumentalness == instrumentalness)&&(identical(other.key, key) || other.key == key)&&(identical(other.liveness, liveness) || other.liveness == liveness)&&(identical(other.loudness, loudness) || other.loudness == loudness)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.speechiness, speechiness) || other.speechiness == speechiness)&&(identical(other.tempo, tempo) || other.tempo == tempo)&&(identical(other.timeSignature, timeSignature) || other.timeSignature == timeSignature)&&(identical(other.valence, valence) || other.valence == valence));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,acousticness,danceability,energy,instrumentalness,key,liveness,loudness,mode,speechiness,tempo,timeSignature,valence);

@override
String toString() {
  return 'AudioFeatures(id: $id, acousticness: $acousticness, danceability: $danceability, energy: $energy, instrumentalness: $instrumentalness, key: $key, liveness: $liveness, loudness: $loudness, mode: $mode, speechiness: $speechiness, tempo: $tempo, timeSignature: $timeSignature, valence: $valence)';
}


}

/// @nodoc
abstract mixin class $AudioFeaturesCopyWith<$Res>  {
  factory $AudioFeaturesCopyWith(AudioFeatures value, $Res Function(AudioFeatures) _then) = _$AudioFeaturesCopyWithImpl;
@useResult
$Res call({
 String id, double acousticness, double danceability, double energy, double instrumentalness, int key, double liveness, double loudness, int mode, double speechiness, double tempo, int timeSignature, double valence
});




}
/// @nodoc
class _$AudioFeaturesCopyWithImpl<$Res>
    implements $AudioFeaturesCopyWith<$Res> {
  _$AudioFeaturesCopyWithImpl(this._self, this._then);

  final AudioFeatures _self;
  final $Res Function(AudioFeatures) _then;

/// Create a copy of AudioFeatures
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? acousticness = null,Object? danceability = null,Object? energy = null,Object? instrumentalness = null,Object? key = null,Object? liveness = null,Object? loudness = null,Object? mode = null,Object? speechiness = null,Object? tempo = null,Object? timeSignature = null,Object? valence = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,acousticness: null == acousticness ? _self.acousticness : acousticness // ignore: cast_nullable_to_non_nullable
as double,danceability: null == danceability ? _self.danceability : danceability // ignore: cast_nullable_to_non_nullable
as double,energy: null == energy ? _self.energy : energy // ignore: cast_nullable_to_non_nullable
as double,instrumentalness: null == instrumentalness ? _self.instrumentalness : instrumentalness // ignore: cast_nullable_to_non_nullable
as double,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as int,liveness: null == liveness ? _self.liveness : liveness // ignore: cast_nullable_to_non_nullable
as double,loudness: null == loudness ? _self.loudness : loudness // ignore: cast_nullable_to_non_nullable
as double,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as int,speechiness: null == speechiness ? _self.speechiness : speechiness // ignore: cast_nullable_to_non_nullable
as double,tempo: null == tempo ? _self.tempo : tempo // ignore: cast_nullable_to_non_nullable
as double,timeSignature: null == timeSignature ? _self.timeSignature : timeSignature // ignore: cast_nullable_to_non_nullable
as int,valence: null == valence ? _self.valence : valence // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [AudioFeatures].
extension AudioFeaturesPatterns on AudioFeatures {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AudioFeatures value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AudioFeatures() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AudioFeatures value)  $default,){
final _that = this;
switch (_that) {
case _AudioFeatures():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AudioFeatures value)?  $default,){
final _that = this;
switch (_that) {
case _AudioFeatures() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  double acousticness,  double danceability,  double energy,  double instrumentalness,  int key,  double liveness,  double loudness,  int mode,  double speechiness,  double tempo,  int timeSignature,  double valence)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AudioFeatures() when $default != null:
return $default(_that.id,_that.acousticness,_that.danceability,_that.energy,_that.instrumentalness,_that.key,_that.liveness,_that.loudness,_that.mode,_that.speechiness,_that.tempo,_that.timeSignature,_that.valence);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  double acousticness,  double danceability,  double energy,  double instrumentalness,  int key,  double liveness,  double loudness,  int mode,  double speechiness,  double tempo,  int timeSignature,  double valence)  $default,) {final _that = this;
switch (_that) {
case _AudioFeatures():
return $default(_that.id,_that.acousticness,_that.danceability,_that.energy,_that.instrumentalness,_that.key,_that.liveness,_that.loudness,_that.mode,_that.speechiness,_that.tempo,_that.timeSignature,_that.valence);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  double acousticness,  double danceability,  double energy,  double instrumentalness,  int key,  double liveness,  double loudness,  int mode,  double speechiness,  double tempo,  int timeSignature,  double valence)?  $default,) {final _that = this;
switch (_that) {
case _AudioFeatures() when $default != null:
return $default(_that.id,_that.acousticness,_that.danceability,_that.energy,_that.instrumentalness,_that.key,_that.liveness,_that.loudness,_that.mode,_that.speechiness,_that.tempo,_that.timeSignature,_that.valence);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AudioFeatures implements AudioFeatures {
  const _AudioFeatures({required this.id, required this.acousticness, required this.danceability, required this.energy, required this.instrumentalness, required this.key, required this.liveness, required this.loudness, required this.mode, required this.speechiness, required this.tempo, required this.timeSignature, required this.valence});
  factory _AudioFeatures.fromJson(Map<String, dynamic> json) => _$AudioFeaturesFromJson(json);

@override final  String id;
@override final  double acousticness;
@override final  double danceability;
@override final  double energy;
@override final  double instrumentalness;
@override final  int key;
@override final  double liveness;
@override final  double loudness;
@override final  int mode;
@override final  double speechiness;
@override final  double tempo;
@override final  int timeSignature;
@override final  double valence;

/// Create a copy of AudioFeatures
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AudioFeaturesCopyWith<_AudioFeatures> get copyWith => __$AudioFeaturesCopyWithImpl<_AudioFeatures>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AudioFeaturesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AudioFeatures&&(identical(other.id, id) || other.id == id)&&(identical(other.acousticness, acousticness) || other.acousticness == acousticness)&&(identical(other.danceability, danceability) || other.danceability == danceability)&&(identical(other.energy, energy) || other.energy == energy)&&(identical(other.instrumentalness, instrumentalness) || other.instrumentalness == instrumentalness)&&(identical(other.key, key) || other.key == key)&&(identical(other.liveness, liveness) || other.liveness == liveness)&&(identical(other.loudness, loudness) || other.loudness == loudness)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.speechiness, speechiness) || other.speechiness == speechiness)&&(identical(other.tempo, tempo) || other.tempo == tempo)&&(identical(other.timeSignature, timeSignature) || other.timeSignature == timeSignature)&&(identical(other.valence, valence) || other.valence == valence));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,acousticness,danceability,energy,instrumentalness,key,liveness,loudness,mode,speechiness,tempo,timeSignature,valence);

@override
String toString() {
  return 'AudioFeatures(id: $id, acousticness: $acousticness, danceability: $danceability, energy: $energy, instrumentalness: $instrumentalness, key: $key, liveness: $liveness, loudness: $loudness, mode: $mode, speechiness: $speechiness, tempo: $tempo, timeSignature: $timeSignature, valence: $valence)';
}


}

/// @nodoc
abstract mixin class _$AudioFeaturesCopyWith<$Res> implements $AudioFeaturesCopyWith<$Res> {
  factory _$AudioFeaturesCopyWith(_AudioFeatures value, $Res Function(_AudioFeatures) _then) = __$AudioFeaturesCopyWithImpl;
@override @useResult
$Res call({
 String id, double acousticness, double danceability, double energy, double instrumentalness, int key, double liveness, double loudness, int mode, double speechiness, double tempo, int timeSignature, double valence
});




}
/// @nodoc
class __$AudioFeaturesCopyWithImpl<$Res>
    implements _$AudioFeaturesCopyWith<$Res> {
  __$AudioFeaturesCopyWithImpl(this._self, this._then);

  final _AudioFeatures _self;
  final $Res Function(_AudioFeatures) _then;

/// Create a copy of AudioFeatures
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? acousticness = null,Object? danceability = null,Object? energy = null,Object? instrumentalness = null,Object? key = null,Object? liveness = null,Object? loudness = null,Object? mode = null,Object? speechiness = null,Object? tempo = null,Object? timeSignature = null,Object? valence = null,}) {
  return _then(_AudioFeatures(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,acousticness: null == acousticness ? _self.acousticness : acousticness // ignore: cast_nullable_to_non_nullable
as double,danceability: null == danceability ? _self.danceability : danceability // ignore: cast_nullable_to_non_nullable
as double,energy: null == energy ? _self.energy : energy // ignore: cast_nullable_to_non_nullable
as double,instrumentalness: null == instrumentalness ? _self.instrumentalness : instrumentalness // ignore: cast_nullable_to_non_nullable
as double,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as int,liveness: null == liveness ? _self.liveness : liveness // ignore: cast_nullable_to_non_nullable
as double,loudness: null == loudness ? _self.loudness : loudness // ignore: cast_nullable_to_non_nullable
as double,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as int,speechiness: null == speechiness ? _self.speechiness : speechiness // ignore: cast_nullable_to_non_nullable
as double,tempo: null == tempo ? _self.tempo : tempo // ignore: cast_nullable_to_non_nullable
as double,timeSignature: null == timeSignature ? _self.timeSignature : timeSignature // ignore: cast_nullable_to_non_nullable
as int,valence: null == valence ? _self.valence : valence // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
