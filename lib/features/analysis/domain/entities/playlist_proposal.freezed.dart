// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'playlist_proposal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlaylistProposal {

 String get id; String get suggestedName; String get description; List<String> get criteria; List<SongClassification> get songs; ProposalMetadata get metadata; DateTime get createdAt; bool get isSelected;
/// Create a copy of PlaylistProposal
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaylistProposalCopyWith<PlaylistProposal> get copyWith => _$PlaylistProposalCopyWithImpl<PlaylistProposal>(this as PlaylistProposal, _$identity);

  /// Serializes this PlaylistProposal to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaylistProposal&&(identical(other.id, id) || other.id == id)&&(identical(other.suggestedName, suggestedName) || other.suggestedName == suggestedName)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.criteria, criteria)&&const DeepCollectionEquality().equals(other.songs, songs)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,suggestedName,description,const DeepCollectionEquality().hash(criteria),const DeepCollectionEquality().hash(songs),metadata,createdAt,isSelected);

@override
String toString() {
  return 'PlaylistProposal(id: $id, suggestedName: $suggestedName, description: $description, criteria: $criteria, songs: $songs, metadata: $metadata, createdAt: $createdAt, isSelected: $isSelected)';
}


}

/// @nodoc
abstract mixin class $PlaylistProposalCopyWith<$Res>  {
  factory $PlaylistProposalCopyWith(PlaylistProposal value, $Res Function(PlaylistProposal) _then) = _$PlaylistProposalCopyWithImpl;
@useResult
$Res call({
 String id, String suggestedName, String description, List<String> criteria, List<SongClassification> songs, ProposalMetadata metadata, DateTime createdAt, bool isSelected
});


$ProposalMetadataCopyWith<$Res> get metadata;

}
/// @nodoc
class _$PlaylistProposalCopyWithImpl<$Res>
    implements $PlaylistProposalCopyWith<$Res> {
  _$PlaylistProposalCopyWithImpl(this._self, this._then);

  final PlaylistProposal _self;
  final $Res Function(PlaylistProposal) _then;

/// Create a copy of PlaylistProposal
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? suggestedName = null,Object? description = null,Object? criteria = null,Object? songs = null,Object? metadata = null,Object? createdAt = null,Object? isSelected = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,suggestedName: null == suggestedName ? _self.suggestedName : suggestedName // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,criteria: null == criteria ? _self.criteria : criteria // ignore: cast_nullable_to_non_nullable
as List<String>,songs: null == songs ? _self.songs : songs // ignore: cast_nullable_to_non_nullable
as List<SongClassification>,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as ProposalMetadata,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,isSelected: null == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of PlaylistProposal
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProposalMetadataCopyWith<$Res> get metadata {
  
  return $ProposalMetadataCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}


/// Adds pattern-matching-related methods to [PlaylistProposal].
extension PlaylistProposalPatterns on PlaylistProposal {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlaylistProposal value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlaylistProposal() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlaylistProposal value)  $default,){
final _that = this;
switch (_that) {
case _PlaylistProposal():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlaylistProposal value)?  $default,){
final _that = this;
switch (_that) {
case _PlaylistProposal() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String suggestedName,  String description,  List<String> criteria,  List<SongClassification> songs,  ProposalMetadata metadata,  DateTime createdAt,  bool isSelected)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlaylistProposal() when $default != null:
return $default(_that.id,_that.suggestedName,_that.description,_that.criteria,_that.songs,_that.metadata,_that.createdAt,_that.isSelected);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String suggestedName,  String description,  List<String> criteria,  List<SongClassification> songs,  ProposalMetadata metadata,  DateTime createdAt,  bool isSelected)  $default,) {final _that = this;
switch (_that) {
case _PlaylistProposal():
return $default(_that.id,_that.suggestedName,_that.description,_that.criteria,_that.songs,_that.metadata,_that.createdAt,_that.isSelected);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String suggestedName,  String description,  List<String> criteria,  List<SongClassification> songs,  ProposalMetadata metadata,  DateTime createdAt,  bool isSelected)?  $default,) {final _that = this;
switch (_that) {
case _PlaylistProposal() when $default != null:
return $default(_that.id,_that.suggestedName,_that.description,_that.criteria,_that.songs,_that.metadata,_that.createdAt,_that.isSelected);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlaylistProposal extends PlaylistProposal {
  const _PlaylistProposal({required this.id, required this.suggestedName, required this.description, required final  List<String> criteria, required final  List<SongClassification> songs, required this.metadata, required this.createdAt, required this.isSelected}): _criteria = criteria,_songs = songs,super._();
  factory _PlaylistProposal.fromJson(Map<String, dynamic> json) => _$PlaylistProposalFromJson(json);

@override final  String id;
@override final  String suggestedName;
@override final  String description;
 final  List<String> _criteria;
@override List<String> get criteria {
  if (_criteria is EqualUnmodifiableListView) return _criteria;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_criteria);
}

 final  List<SongClassification> _songs;
@override List<SongClassification> get songs {
  if (_songs is EqualUnmodifiableListView) return _songs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_songs);
}

@override final  ProposalMetadata metadata;
@override final  DateTime createdAt;
@override final  bool isSelected;

/// Create a copy of PlaylistProposal
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaylistProposalCopyWith<_PlaylistProposal> get copyWith => __$PlaylistProposalCopyWithImpl<_PlaylistProposal>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlaylistProposalToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaylistProposal&&(identical(other.id, id) || other.id == id)&&(identical(other.suggestedName, suggestedName) || other.suggestedName == suggestedName)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._criteria, _criteria)&&const DeepCollectionEquality().equals(other._songs, _songs)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,suggestedName,description,const DeepCollectionEquality().hash(_criteria),const DeepCollectionEquality().hash(_songs),metadata,createdAt,isSelected);

@override
String toString() {
  return 'PlaylistProposal(id: $id, suggestedName: $suggestedName, description: $description, criteria: $criteria, songs: $songs, metadata: $metadata, createdAt: $createdAt, isSelected: $isSelected)';
}


}

/// @nodoc
abstract mixin class _$PlaylistProposalCopyWith<$Res> implements $PlaylistProposalCopyWith<$Res> {
  factory _$PlaylistProposalCopyWith(_PlaylistProposal value, $Res Function(_PlaylistProposal) _then) = __$PlaylistProposalCopyWithImpl;
@override @useResult
$Res call({
 String id, String suggestedName, String description, List<String> criteria, List<SongClassification> songs, ProposalMetadata metadata, DateTime createdAt, bool isSelected
});


@override $ProposalMetadataCopyWith<$Res> get metadata;

}
/// @nodoc
class __$PlaylistProposalCopyWithImpl<$Res>
    implements _$PlaylistProposalCopyWith<$Res> {
  __$PlaylistProposalCopyWithImpl(this._self, this._then);

  final _PlaylistProposal _self;
  final $Res Function(_PlaylistProposal) _then;

/// Create a copy of PlaylistProposal
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? suggestedName = null,Object? description = null,Object? criteria = null,Object? songs = null,Object? metadata = null,Object? createdAt = null,Object? isSelected = null,}) {
  return _then(_PlaylistProposal(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,suggestedName: null == suggestedName ? _self.suggestedName : suggestedName // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,criteria: null == criteria ? _self._criteria : criteria // ignore: cast_nullable_to_non_nullable
as List<String>,songs: null == songs ? _self._songs : songs // ignore: cast_nullable_to_non_nullable
as List<SongClassification>,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as ProposalMetadata,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,isSelected: null == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of PlaylistProposal
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProposalMetadataCopyWith<$Res> get metadata {
  
  return $ProposalMetadataCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}


/// @nodoc
mixin _$ProposalMetadata {

 GroupingStrategy get strategy; List<String> get primaryCriteria; List<String> get secondaryCriteria; double get cohesionScore; Duration get estimatedDuration; int get optimalSize; int get actualSize; Map<String, dynamic> get groupingParameters;
/// Create a copy of ProposalMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProposalMetadataCopyWith<ProposalMetadata> get copyWith => _$ProposalMetadataCopyWithImpl<ProposalMetadata>(this as ProposalMetadata, _$identity);

  /// Serializes this ProposalMetadata to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProposalMetadata&&(identical(other.strategy, strategy) || other.strategy == strategy)&&const DeepCollectionEquality().equals(other.primaryCriteria, primaryCriteria)&&const DeepCollectionEquality().equals(other.secondaryCriteria, secondaryCriteria)&&(identical(other.cohesionScore, cohesionScore) || other.cohesionScore == cohesionScore)&&(identical(other.estimatedDuration, estimatedDuration) || other.estimatedDuration == estimatedDuration)&&(identical(other.optimalSize, optimalSize) || other.optimalSize == optimalSize)&&(identical(other.actualSize, actualSize) || other.actualSize == actualSize)&&const DeepCollectionEquality().equals(other.groupingParameters, groupingParameters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,strategy,const DeepCollectionEquality().hash(primaryCriteria),const DeepCollectionEquality().hash(secondaryCriteria),cohesionScore,estimatedDuration,optimalSize,actualSize,const DeepCollectionEquality().hash(groupingParameters));

@override
String toString() {
  return 'ProposalMetadata(strategy: $strategy, primaryCriteria: $primaryCriteria, secondaryCriteria: $secondaryCriteria, cohesionScore: $cohesionScore, estimatedDuration: $estimatedDuration, optimalSize: $optimalSize, actualSize: $actualSize, groupingParameters: $groupingParameters)';
}


}

/// @nodoc
abstract mixin class $ProposalMetadataCopyWith<$Res>  {
  factory $ProposalMetadataCopyWith(ProposalMetadata value, $Res Function(ProposalMetadata) _then) = _$ProposalMetadataCopyWithImpl;
@useResult
$Res call({
 GroupingStrategy strategy, List<String> primaryCriteria, List<String> secondaryCriteria, double cohesionScore, Duration estimatedDuration, int optimalSize, int actualSize, Map<String, dynamic> groupingParameters
});




}
/// @nodoc
class _$ProposalMetadataCopyWithImpl<$Res>
    implements $ProposalMetadataCopyWith<$Res> {
  _$ProposalMetadataCopyWithImpl(this._self, this._then);

  final ProposalMetadata _self;
  final $Res Function(ProposalMetadata) _then;

/// Create a copy of ProposalMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? strategy = null,Object? primaryCriteria = null,Object? secondaryCriteria = null,Object? cohesionScore = null,Object? estimatedDuration = null,Object? optimalSize = null,Object? actualSize = null,Object? groupingParameters = null,}) {
  return _then(_self.copyWith(
strategy: null == strategy ? _self.strategy : strategy // ignore: cast_nullable_to_non_nullable
as GroupingStrategy,primaryCriteria: null == primaryCriteria ? _self.primaryCriteria : primaryCriteria // ignore: cast_nullable_to_non_nullable
as List<String>,secondaryCriteria: null == secondaryCriteria ? _self.secondaryCriteria : secondaryCriteria // ignore: cast_nullable_to_non_nullable
as List<String>,cohesionScore: null == cohesionScore ? _self.cohesionScore : cohesionScore // ignore: cast_nullable_to_non_nullable
as double,estimatedDuration: null == estimatedDuration ? _self.estimatedDuration : estimatedDuration // ignore: cast_nullable_to_non_nullable
as Duration,optimalSize: null == optimalSize ? _self.optimalSize : optimalSize // ignore: cast_nullable_to_non_nullable
as int,actualSize: null == actualSize ? _self.actualSize : actualSize // ignore: cast_nullable_to_non_nullable
as int,groupingParameters: null == groupingParameters ? _self.groupingParameters : groupingParameters // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProposalMetadata].
extension ProposalMetadataPatterns on ProposalMetadata {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProposalMetadata value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProposalMetadata() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProposalMetadata value)  $default,){
final _that = this;
switch (_that) {
case _ProposalMetadata():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProposalMetadata value)?  $default,){
final _that = this;
switch (_that) {
case _ProposalMetadata() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( GroupingStrategy strategy,  List<String> primaryCriteria,  List<String> secondaryCriteria,  double cohesionScore,  Duration estimatedDuration,  int optimalSize,  int actualSize,  Map<String, dynamic> groupingParameters)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProposalMetadata() when $default != null:
return $default(_that.strategy,_that.primaryCriteria,_that.secondaryCriteria,_that.cohesionScore,_that.estimatedDuration,_that.optimalSize,_that.actualSize,_that.groupingParameters);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( GroupingStrategy strategy,  List<String> primaryCriteria,  List<String> secondaryCriteria,  double cohesionScore,  Duration estimatedDuration,  int optimalSize,  int actualSize,  Map<String, dynamic> groupingParameters)  $default,) {final _that = this;
switch (_that) {
case _ProposalMetadata():
return $default(_that.strategy,_that.primaryCriteria,_that.secondaryCriteria,_that.cohesionScore,_that.estimatedDuration,_that.optimalSize,_that.actualSize,_that.groupingParameters);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( GroupingStrategy strategy,  List<String> primaryCriteria,  List<String> secondaryCriteria,  double cohesionScore,  Duration estimatedDuration,  int optimalSize,  int actualSize,  Map<String, dynamic> groupingParameters)?  $default,) {final _that = this;
switch (_that) {
case _ProposalMetadata() when $default != null:
return $default(_that.strategy,_that.primaryCriteria,_that.secondaryCriteria,_that.cohesionScore,_that.estimatedDuration,_that.optimalSize,_that.actualSize,_that.groupingParameters);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProposalMetadata implements ProposalMetadata {
  const _ProposalMetadata({required this.strategy, required final  List<String> primaryCriteria, required final  List<String> secondaryCriteria, required this.cohesionScore, required this.estimatedDuration, required this.optimalSize, required this.actualSize, required final  Map<String, dynamic> groupingParameters}): _primaryCriteria = primaryCriteria,_secondaryCriteria = secondaryCriteria,_groupingParameters = groupingParameters;
  factory _ProposalMetadata.fromJson(Map<String, dynamic> json) => _$ProposalMetadataFromJson(json);

@override final  GroupingStrategy strategy;
 final  List<String> _primaryCriteria;
@override List<String> get primaryCriteria {
  if (_primaryCriteria is EqualUnmodifiableListView) return _primaryCriteria;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_primaryCriteria);
}

 final  List<String> _secondaryCriteria;
@override List<String> get secondaryCriteria {
  if (_secondaryCriteria is EqualUnmodifiableListView) return _secondaryCriteria;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_secondaryCriteria);
}

@override final  double cohesionScore;
@override final  Duration estimatedDuration;
@override final  int optimalSize;
@override final  int actualSize;
 final  Map<String, dynamic> _groupingParameters;
@override Map<String, dynamic> get groupingParameters {
  if (_groupingParameters is EqualUnmodifiableMapView) return _groupingParameters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_groupingParameters);
}


/// Create a copy of ProposalMetadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProposalMetadataCopyWith<_ProposalMetadata> get copyWith => __$ProposalMetadataCopyWithImpl<_ProposalMetadata>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProposalMetadataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProposalMetadata&&(identical(other.strategy, strategy) || other.strategy == strategy)&&const DeepCollectionEquality().equals(other._primaryCriteria, _primaryCriteria)&&const DeepCollectionEquality().equals(other._secondaryCriteria, _secondaryCriteria)&&(identical(other.cohesionScore, cohesionScore) || other.cohesionScore == cohesionScore)&&(identical(other.estimatedDuration, estimatedDuration) || other.estimatedDuration == estimatedDuration)&&(identical(other.optimalSize, optimalSize) || other.optimalSize == optimalSize)&&(identical(other.actualSize, actualSize) || other.actualSize == actualSize)&&const DeepCollectionEquality().equals(other._groupingParameters, _groupingParameters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,strategy,const DeepCollectionEquality().hash(_primaryCriteria),const DeepCollectionEquality().hash(_secondaryCriteria),cohesionScore,estimatedDuration,optimalSize,actualSize,const DeepCollectionEquality().hash(_groupingParameters));

@override
String toString() {
  return 'ProposalMetadata(strategy: $strategy, primaryCriteria: $primaryCriteria, secondaryCriteria: $secondaryCriteria, cohesionScore: $cohesionScore, estimatedDuration: $estimatedDuration, optimalSize: $optimalSize, actualSize: $actualSize, groupingParameters: $groupingParameters)';
}


}

/// @nodoc
abstract mixin class _$ProposalMetadataCopyWith<$Res> implements $ProposalMetadataCopyWith<$Res> {
  factory _$ProposalMetadataCopyWith(_ProposalMetadata value, $Res Function(_ProposalMetadata) _then) = __$ProposalMetadataCopyWithImpl;
@override @useResult
$Res call({
 GroupingStrategy strategy, List<String> primaryCriteria, List<String> secondaryCriteria, double cohesionScore, Duration estimatedDuration, int optimalSize, int actualSize, Map<String, dynamic> groupingParameters
});




}
/// @nodoc
class __$ProposalMetadataCopyWithImpl<$Res>
    implements _$ProposalMetadataCopyWith<$Res> {
  __$ProposalMetadataCopyWithImpl(this._self, this._then);

  final _ProposalMetadata _self;
  final $Res Function(_ProposalMetadata) _then;

/// Create a copy of ProposalMetadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? strategy = null,Object? primaryCriteria = null,Object? secondaryCriteria = null,Object? cohesionScore = null,Object? estimatedDuration = null,Object? optimalSize = null,Object? actualSize = null,Object? groupingParameters = null,}) {
  return _then(_ProposalMetadata(
strategy: null == strategy ? _self.strategy : strategy // ignore: cast_nullable_to_non_nullable
as GroupingStrategy,primaryCriteria: null == primaryCriteria ? _self._primaryCriteria : primaryCriteria // ignore: cast_nullable_to_non_nullable
as List<String>,secondaryCriteria: null == secondaryCriteria ? _self._secondaryCriteria : secondaryCriteria // ignore: cast_nullable_to_non_nullable
as List<String>,cohesionScore: null == cohesionScore ? _self.cohesionScore : cohesionScore // ignore: cast_nullable_to_non_nullable
as double,estimatedDuration: null == estimatedDuration ? _self.estimatedDuration : estimatedDuration // ignore: cast_nullable_to_non_nullable
as Duration,optimalSize: null == optimalSize ? _self.optimalSize : optimalSize // ignore: cast_nullable_to_non_nullable
as int,actualSize: null == actualSize ? _self.actualSize : actualSize // ignore: cast_nullable_to_non_nullable
as int,groupingParameters: null == groupingParameters ? _self._groupingParameters : groupingParameters // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}


/// @nodoc
mixin _$PlaylistCreationRequest {

 String get proposalId; String get playlistName; String get description; bool get isPublic; List<String> get trackIds; Map<String, dynamic> get metadata;
/// Create a copy of PlaylistCreationRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaylistCreationRequestCopyWith<PlaylistCreationRequest> get copyWith => _$PlaylistCreationRequestCopyWithImpl<PlaylistCreationRequest>(this as PlaylistCreationRequest, _$identity);

  /// Serializes this PlaylistCreationRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaylistCreationRequest&&(identical(other.proposalId, proposalId) || other.proposalId == proposalId)&&(identical(other.playlistName, playlistName) || other.playlistName == playlistName)&&(identical(other.description, description) || other.description == description)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&const DeepCollectionEquality().equals(other.trackIds, trackIds)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,proposalId,playlistName,description,isPublic,const DeepCollectionEquality().hash(trackIds),const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'PlaylistCreationRequest(proposalId: $proposalId, playlistName: $playlistName, description: $description, isPublic: $isPublic, trackIds: $trackIds, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $PlaylistCreationRequestCopyWith<$Res>  {
  factory $PlaylistCreationRequestCopyWith(PlaylistCreationRequest value, $Res Function(PlaylistCreationRequest) _then) = _$PlaylistCreationRequestCopyWithImpl;
@useResult
$Res call({
 String proposalId, String playlistName, String description, bool isPublic, List<String> trackIds, Map<String, dynamic> metadata
});




}
/// @nodoc
class _$PlaylistCreationRequestCopyWithImpl<$Res>
    implements $PlaylistCreationRequestCopyWith<$Res> {
  _$PlaylistCreationRequestCopyWithImpl(this._self, this._then);

  final PlaylistCreationRequest _self;
  final $Res Function(PlaylistCreationRequest) _then;

/// Create a copy of PlaylistCreationRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? proposalId = null,Object? playlistName = null,Object? description = null,Object? isPublic = null,Object? trackIds = null,Object? metadata = null,}) {
  return _then(_self.copyWith(
proposalId: null == proposalId ? _self.proposalId : proposalId // ignore: cast_nullable_to_non_nullable
as String,playlistName: null == playlistName ? _self.playlistName : playlistName // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,trackIds: null == trackIds ? _self.trackIds : trackIds // ignore: cast_nullable_to_non_nullable
as List<String>,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [PlaylistCreationRequest].
extension PlaylistCreationRequestPatterns on PlaylistCreationRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlaylistCreationRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlaylistCreationRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlaylistCreationRequest value)  $default,){
final _that = this;
switch (_that) {
case _PlaylistCreationRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlaylistCreationRequest value)?  $default,){
final _that = this;
switch (_that) {
case _PlaylistCreationRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String proposalId,  String playlistName,  String description,  bool isPublic,  List<String> trackIds,  Map<String, dynamic> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlaylistCreationRequest() when $default != null:
return $default(_that.proposalId,_that.playlistName,_that.description,_that.isPublic,_that.trackIds,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String proposalId,  String playlistName,  String description,  bool isPublic,  List<String> trackIds,  Map<String, dynamic> metadata)  $default,) {final _that = this;
switch (_that) {
case _PlaylistCreationRequest():
return $default(_that.proposalId,_that.playlistName,_that.description,_that.isPublic,_that.trackIds,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String proposalId,  String playlistName,  String description,  bool isPublic,  List<String> trackIds,  Map<String, dynamic> metadata)?  $default,) {final _that = this;
switch (_that) {
case _PlaylistCreationRequest() when $default != null:
return $default(_that.proposalId,_that.playlistName,_that.description,_that.isPublic,_that.trackIds,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlaylistCreationRequest implements PlaylistCreationRequest {
  const _PlaylistCreationRequest({required this.proposalId, required this.playlistName, required this.description, required this.isPublic, required final  List<String> trackIds, required final  Map<String, dynamic> metadata}): _trackIds = trackIds,_metadata = metadata;
  factory _PlaylistCreationRequest.fromJson(Map<String, dynamic> json) => _$PlaylistCreationRequestFromJson(json);

@override final  String proposalId;
@override final  String playlistName;
@override final  String description;
@override final  bool isPublic;
 final  List<String> _trackIds;
@override List<String> get trackIds {
  if (_trackIds is EqualUnmodifiableListView) return _trackIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_trackIds);
}

 final  Map<String, dynamic> _metadata;
@override Map<String, dynamic> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of PlaylistCreationRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaylistCreationRequestCopyWith<_PlaylistCreationRequest> get copyWith => __$PlaylistCreationRequestCopyWithImpl<_PlaylistCreationRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlaylistCreationRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaylistCreationRequest&&(identical(other.proposalId, proposalId) || other.proposalId == proposalId)&&(identical(other.playlistName, playlistName) || other.playlistName == playlistName)&&(identical(other.description, description) || other.description == description)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&const DeepCollectionEquality().equals(other._trackIds, _trackIds)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,proposalId,playlistName,description,isPublic,const DeepCollectionEquality().hash(_trackIds),const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'PlaylistCreationRequest(proposalId: $proposalId, playlistName: $playlistName, description: $description, isPublic: $isPublic, trackIds: $trackIds, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$PlaylistCreationRequestCopyWith<$Res> implements $PlaylistCreationRequestCopyWith<$Res> {
  factory _$PlaylistCreationRequestCopyWith(_PlaylistCreationRequest value, $Res Function(_PlaylistCreationRequest) _then) = __$PlaylistCreationRequestCopyWithImpl;
@override @useResult
$Res call({
 String proposalId, String playlistName, String description, bool isPublic, List<String> trackIds, Map<String, dynamic> metadata
});




}
/// @nodoc
class __$PlaylistCreationRequestCopyWithImpl<$Res>
    implements _$PlaylistCreationRequestCopyWith<$Res> {
  __$PlaylistCreationRequestCopyWithImpl(this._self, this._then);

  final _PlaylistCreationRequest _self;
  final $Res Function(_PlaylistCreationRequest) _then;

/// Create a copy of PlaylistCreationRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? proposalId = null,Object? playlistName = null,Object? description = null,Object? isPublic = null,Object? trackIds = null,Object? metadata = null,}) {
  return _then(_PlaylistCreationRequest(
proposalId: null == proposalId ? _self.proposalId : proposalId // ignore: cast_nullable_to_non_nullable
as String,playlistName: null == playlistName ? _self.playlistName : playlistName // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,trackIds: null == trackIds ? _self._trackIds : trackIds // ignore: cast_nullable_to_non_nullable
as List<String>,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}


/// @nodoc
mixin _$BatchCreationRequest {

 List<PlaylistCreationRequest> get requests; String get userId; DateTime get requestedAt; Map<String, dynamic> get options;
/// Create a copy of BatchCreationRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BatchCreationRequestCopyWith<BatchCreationRequest> get copyWith => _$BatchCreationRequestCopyWithImpl<BatchCreationRequest>(this as BatchCreationRequest, _$identity);

  /// Serializes this BatchCreationRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BatchCreationRequest&&const DeepCollectionEquality().equals(other.requests, requests)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt)&&const DeepCollectionEquality().equals(other.options, options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(requests),userId,requestedAt,const DeepCollectionEquality().hash(options));

@override
String toString() {
  return 'BatchCreationRequest(requests: $requests, userId: $userId, requestedAt: $requestedAt, options: $options)';
}


}

/// @nodoc
abstract mixin class $BatchCreationRequestCopyWith<$Res>  {
  factory $BatchCreationRequestCopyWith(BatchCreationRequest value, $Res Function(BatchCreationRequest) _then) = _$BatchCreationRequestCopyWithImpl;
@useResult
$Res call({
 List<PlaylistCreationRequest> requests, String userId, DateTime requestedAt, Map<String, dynamic> options
});




}
/// @nodoc
class _$BatchCreationRequestCopyWithImpl<$Res>
    implements $BatchCreationRequestCopyWith<$Res> {
  _$BatchCreationRequestCopyWithImpl(this._self, this._then);

  final BatchCreationRequest _self;
  final $Res Function(BatchCreationRequest) _then;

/// Create a copy of BatchCreationRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requests = null,Object? userId = null,Object? requestedAt = null,Object? options = null,}) {
  return _then(_self.copyWith(
requests: null == requests ? _self.requests : requests // ignore: cast_nullable_to_non_nullable
as List<PlaylistCreationRequest>,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,requestedAt: null == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as DateTime,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [BatchCreationRequest].
extension BatchCreationRequestPatterns on BatchCreationRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BatchCreationRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BatchCreationRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BatchCreationRequest value)  $default,){
final _that = this;
switch (_that) {
case _BatchCreationRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BatchCreationRequest value)?  $default,){
final _that = this;
switch (_that) {
case _BatchCreationRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PlaylistCreationRequest> requests,  String userId,  DateTime requestedAt,  Map<String, dynamic> options)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BatchCreationRequest() when $default != null:
return $default(_that.requests,_that.userId,_that.requestedAt,_that.options);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PlaylistCreationRequest> requests,  String userId,  DateTime requestedAt,  Map<String, dynamic> options)  $default,) {final _that = this;
switch (_that) {
case _BatchCreationRequest():
return $default(_that.requests,_that.userId,_that.requestedAt,_that.options);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PlaylistCreationRequest> requests,  String userId,  DateTime requestedAt,  Map<String, dynamic> options)?  $default,) {final _that = this;
switch (_that) {
case _BatchCreationRequest() when $default != null:
return $default(_that.requests,_that.userId,_that.requestedAt,_that.options);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BatchCreationRequest implements BatchCreationRequest {
  const _BatchCreationRequest({required final  List<PlaylistCreationRequest> requests, required this.userId, required this.requestedAt, required final  Map<String, dynamic> options}): _requests = requests,_options = options;
  factory _BatchCreationRequest.fromJson(Map<String, dynamic> json) => _$BatchCreationRequestFromJson(json);

 final  List<PlaylistCreationRequest> _requests;
@override List<PlaylistCreationRequest> get requests {
  if (_requests is EqualUnmodifiableListView) return _requests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_requests);
}

@override final  String userId;
@override final  DateTime requestedAt;
 final  Map<String, dynamic> _options;
@override Map<String, dynamic> get options {
  if (_options is EqualUnmodifiableMapView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_options);
}


/// Create a copy of BatchCreationRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BatchCreationRequestCopyWith<_BatchCreationRequest> get copyWith => __$BatchCreationRequestCopyWithImpl<_BatchCreationRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BatchCreationRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BatchCreationRequest&&const DeepCollectionEquality().equals(other._requests, _requests)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt)&&const DeepCollectionEquality().equals(other._options, _options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_requests),userId,requestedAt,const DeepCollectionEquality().hash(_options));

@override
String toString() {
  return 'BatchCreationRequest(requests: $requests, userId: $userId, requestedAt: $requestedAt, options: $options)';
}


}

/// @nodoc
abstract mixin class _$BatchCreationRequestCopyWith<$Res> implements $BatchCreationRequestCopyWith<$Res> {
  factory _$BatchCreationRequestCopyWith(_BatchCreationRequest value, $Res Function(_BatchCreationRequest) _then) = __$BatchCreationRequestCopyWithImpl;
@override @useResult
$Res call({
 List<PlaylistCreationRequest> requests, String userId, DateTime requestedAt, Map<String, dynamic> options
});




}
/// @nodoc
class __$BatchCreationRequestCopyWithImpl<$Res>
    implements _$BatchCreationRequestCopyWith<$Res> {
  __$BatchCreationRequestCopyWithImpl(this._self, this._then);

  final _BatchCreationRequest _self;
  final $Res Function(_BatchCreationRequest) _then;

/// Create a copy of BatchCreationRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requests = null,Object? userId = null,Object? requestedAt = null,Object? options = null,}) {
  return _then(_BatchCreationRequest(
requests: null == requests ? _self._requests : requests // ignore: cast_nullable_to_non_nullable
as List<PlaylistCreationRequest>,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,requestedAt: null == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as DateTime,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
