// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'config_loader.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppConfig {

 AppInfo get app; SpotifyConfig get spotify; ApiConfig get api; FeaturesConfig get features;
/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppConfigCopyWith<AppConfig> get copyWith => _$AppConfigCopyWithImpl<AppConfig>(this as AppConfig, _$identity);

  /// Serializes this AppConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppConfig&&(identical(other.app, app) || other.app == app)&&(identical(other.spotify, spotify) || other.spotify == spotify)&&(identical(other.api, api) || other.api == api)&&(identical(other.features, features) || other.features == features));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,app,spotify,api,features);

@override
String toString() {
  return 'AppConfig(app: $app, spotify: $spotify, api: $api, features: $features)';
}


}

/// @nodoc
abstract mixin class $AppConfigCopyWith<$Res>  {
  factory $AppConfigCopyWith(AppConfig value, $Res Function(AppConfig) _then) = _$AppConfigCopyWithImpl;
@useResult
$Res call({
 AppInfo app, SpotifyConfig spotify, ApiConfig api, FeaturesConfig features
});


$AppInfoCopyWith<$Res> get app;$SpotifyConfigCopyWith<$Res> get spotify;$ApiConfigCopyWith<$Res> get api;$FeaturesConfigCopyWith<$Res> get features;

}
/// @nodoc
class _$AppConfigCopyWithImpl<$Res>
    implements $AppConfigCopyWith<$Res> {
  _$AppConfigCopyWithImpl(this._self, this._then);

  final AppConfig _self;
  final $Res Function(AppConfig) _then;

/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? app = null,Object? spotify = null,Object? api = null,Object? features = null,}) {
  return _then(_self.copyWith(
app: null == app ? _self.app : app // ignore: cast_nullable_to_non_nullable
as AppInfo,spotify: null == spotify ? _self.spotify : spotify // ignore: cast_nullable_to_non_nullable
as SpotifyConfig,api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as ApiConfig,features: null == features ? _self.features : features // ignore: cast_nullable_to_non_nullable
as FeaturesConfig,
  ));
}
/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppInfoCopyWith<$Res> get app {
  
  return $AppInfoCopyWith<$Res>(_self.app, (value) {
    return _then(_self.copyWith(app: value));
  });
}/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SpotifyConfigCopyWith<$Res> get spotify {
  
  return $SpotifyConfigCopyWith<$Res>(_self.spotify, (value) {
    return _then(_self.copyWith(spotify: value));
  });
}/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiConfigCopyWith<$Res> get api {
  
  return $ApiConfigCopyWith<$Res>(_self.api, (value) {
    return _then(_self.copyWith(api: value));
  });
}/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FeaturesConfigCopyWith<$Res> get features {
  
  return $FeaturesConfigCopyWith<$Res>(_self.features, (value) {
    return _then(_self.copyWith(features: value));
  });
}
}


/// Adds pattern-matching-related methods to [AppConfig].
extension AppConfigPatterns on AppConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppConfig value)  $default,){
final _that = this;
switch (_that) {
case _AppConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppConfig value)?  $default,){
final _that = this;
switch (_that) {
case _AppConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AppInfo app,  SpotifyConfig spotify,  ApiConfig api,  FeaturesConfig features)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppConfig() when $default != null:
return $default(_that.app,_that.spotify,_that.api,_that.features);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AppInfo app,  SpotifyConfig spotify,  ApiConfig api,  FeaturesConfig features)  $default,) {final _that = this;
switch (_that) {
case _AppConfig():
return $default(_that.app,_that.spotify,_that.api,_that.features);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AppInfo app,  SpotifyConfig spotify,  ApiConfig api,  FeaturesConfig features)?  $default,) {final _that = this;
switch (_that) {
case _AppConfig() when $default != null:
return $default(_that.app,_that.spotify,_that.api,_that.features);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppConfig implements AppConfig {
  const _AppConfig({required this.app, required this.spotify, required this.api, required this.features});
  factory _AppConfig.fromJson(Map<String, dynamic> json) => _$AppConfigFromJson(json);

@override final  AppInfo app;
@override final  SpotifyConfig spotify;
@override final  ApiConfig api;
@override final  FeaturesConfig features;

/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppConfigCopyWith<_AppConfig> get copyWith => __$AppConfigCopyWithImpl<_AppConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppConfig&&(identical(other.app, app) || other.app == app)&&(identical(other.spotify, spotify) || other.spotify == spotify)&&(identical(other.api, api) || other.api == api)&&(identical(other.features, features) || other.features == features));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,app,spotify,api,features);

@override
String toString() {
  return 'AppConfig(app: $app, spotify: $spotify, api: $api, features: $features)';
}


}

/// @nodoc
abstract mixin class _$AppConfigCopyWith<$Res> implements $AppConfigCopyWith<$Res> {
  factory _$AppConfigCopyWith(_AppConfig value, $Res Function(_AppConfig) _then) = __$AppConfigCopyWithImpl;
@override @useResult
$Res call({
 AppInfo app, SpotifyConfig spotify, ApiConfig api, FeaturesConfig features
});


@override $AppInfoCopyWith<$Res> get app;@override $SpotifyConfigCopyWith<$Res> get spotify;@override $ApiConfigCopyWith<$Res> get api;@override $FeaturesConfigCopyWith<$Res> get features;

}
/// @nodoc
class __$AppConfigCopyWithImpl<$Res>
    implements _$AppConfigCopyWith<$Res> {
  __$AppConfigCopyWithImpl(this._self, this._then);

  final _AppConfig _self;
  final $Res Function(_AppConfig) _then;

/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? app = null,Object? spotify = null,Object? api = null,Object? features = null,}) {
  return _then(_AppConfig(
app: null == app ? _self.app : app // ignore: cast_nullable_to_non_nullable
as AppInfo,spotify: null == spotify ? _self.spotify : spotify // ignore: cast_nullable_to_non_nullable
as SpotifyConfig,api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as ApiConfig,features: null == features ? _self.features : features // ignore: cast_nullable_to_non_nullable
as FeaturesConfig,
  ));
}

/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppInfoCopyWith<$Res> get app {
  
  return $AppInfoCopyWith<$Res>(_self.app, (value) {
    return _then(_self.copyWith(app: value));
  });
}/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SpotifyConfigCopyWith<$Res> get spotify {
  
  return $SpotifyConfigCopyWith<$Res>(_self.spotify, (value) {
    return _then(_self.copyWith(spotify: value));
  });
}/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiConfigCopyWith<$Res> get api {
  
  return $ApiConfigCopyWith<$Res>(_self.api, (value) {
    return _then(_self.copyWith(api: value));
  });
}/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FeaturesConfigCopyWith<$Res> get features {
  
  return $FeaturesConfigCopyWith<$Res>(_self.features, (value) {
    return _then(_self.copyWith(features: value));
  });
}
}


/// @nodoc
mixin _$AppInfo {

 String get name; String get version; String get environment;
/// Create a copy of AppInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppInfoCopyWith<AppInfo> get copyWith => _$AppInfoCopyWithImpl<AppInfo>(this as AppInfo, _$identity);

  /// Serializes this AppInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppInfo&&(identical(other.name, name) || other.name == name)&&(identical(other.version, version) || other.version == version)&&(identical(other.environment, environment) || other.environment == environment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,version,environment);

@override
String toString() {
  return 'AppInfo(name: $name, version: $version, environment: $environment)';
}


}

/// @nodoc
abstract mixin class $AppInfoCopyWith<$Res>  {
  factory $AppInfoCopyWith(AppInfo value, $Res Function(AppInfo) _then) = _$AppInfoCopyWithImpl;
@useResult
$Res call({
 String name, String version, String environment
});




}
/// @nodoc
class _$AppInfoCopyWithImpl<$Res>
    implements $AppInfoCopyWith<$Res> {
  _$AppInfoCopyWithImpl(this._self, this._then);

  final AppInfo _self;
  final $Res Function(AppInfo) _then;

/// Create a copy of AppInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? version = null,Object? environment = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,environment: null == environment ? _self.environment : environment // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AppInfo].
extension AppInfoPatterns on AppInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppInfo value)  $default,){
final _that = this;
switch (_that) {
case _AppInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppInfo value)?  $default,){
final _that = this;
switch (_that) {
case _AppInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String version,  String environment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppInfo() when $default != null:
return $default(_that.name,_that.version,_that.environment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String version,  String environment)  $default,) {final _that = this;
switch (_that) {
case _AppInfo():
return $default(_that.name,_that.version,_that.environment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String version,  String environment)?  $default,) {final _that = this;
switch (_that) {
case _AppInfo() when $default != null:
return $default(_that.name,_that.version,_that.environment);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppInfo implements AppInfo {
  const _AppInfo({required this.name, required this.version, required this.environment});
  factory _AppInfo.fromJson(Map<String, dynamic> json) => _$AppInfoFromJson(json);

@override final  String name;
@override final  String version;
@override final  String environment;

/// Create a copy of AppInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppInfoCopyWith<_AppInfo> get copyWith => __$AppInfoCopyWithImpl<_AppInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppInfo&&(identical(other.name, name) || other.name == name)&&(identical(other.version, version) || other.version == version)&&(identical(other.environment, environment) || other.environment == environment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,version,environment);

@override
String toString() {
  return 'AppInfo(name: $name, version: $version, environment: $environment)';
}


}

/// @nodoc
abstract mixin class _$AppInfoCopyWith<$Res> implements $AppInfoCopyWith<$Res> {
  factory _$AppInfoCopyWith(_AppInfo value, $Res Function(_AppInfo) _then) = __$AppInfoCopyWithImpl;
@override @useResult
$Res call({
 String name, String version, String environment
});




}
/// @nodoc
class __$AppInfoCopyWithImpl<$Res>
    implements _$AppInfoCopyWith<$Res> {
  __$AppInfoCopyWithImpl(this._self, this._then);

  final _AppInfo _self;
  final $Res Function(_AppInfo) _then;

/// Create a copy of AppInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? version = null,Object? environment = null,}) {
  return _then(_AppInfo(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,environment: null == environment ? _self.environment : environment // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SpotifyConfig {

 String get clientId; String get redirectUri; String? get redirectUriWeb; List<String> get scopes;
/// Create a copy of SpotifyConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpotifyConfigCopyWith<SpotifyConfig> get copyWith => _$SpotifyConfigCopyWithImpl<SpotifyConfig>(this as SpotifyConfig, _$identity);

  /// Serializes this SpotifyConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpotifyConfig&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.redirectUri, redirectUri) || other.redirectUri == redirectUri)&&(identical(other.redirectUriWeb, redirectUriWeb) || other.redirectUriWeb == redirectUriWeb)&&const DeepCollectionEquality().equals(other.scopes, scopes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clientId,redirectUri,redirectUriWeb,const DeepCollectionEquality().hash(scopes));

@override
String toString() {
  return 'SpotifyConfig(clientId: $clientId, redirectUri: $redirectUri, redirectUriWeb: $redirectUriWeb, scopes: $scopes)';
}


}

/// @nodoc
abstract mixin class $SpotifyConfigCopyWith<$Res>  {
  factory $SpotifyConfigCopyWith(SpotifyConfig value, $Res Function(SpotifyConfig) _then) = _$SpotifyConfigCopyWithImpl;
@useResult
$Res call({
 String clientId, String redirectUri, String? redirectUriWeb, List<String> scopes
});




}
/// @nodoc
class _$SpotifyConfigCopyWithImpl<$Res>
    implements $SpotifyConfigCopyWith<$Res> {
  _$SpotifyConfigCopyWithImpl(this._self, this._then);

  final SpotifyConfig _self;
  final $Res Function(SpotifyConfig) _then;

/// Create a copy of SpotifyConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clientId = null,Object? redirectUri = null,Object? redirectUriWeb = freezed,Object? scopes = null,}) {
  return _then(_self.copyWith(
clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,redirectUri: null == redirectUri ? _self.redirectUri : redirectUri // ignore: cast_nullable_to_non_nullable
as String,redirectUriWeb: freezed == redirectUriWeb ? _self.redirectUriWeb : redirectUriWeb // ignore: cast_nullable_to_non_nullable
as String?,scopes: null == scopes ? _self.scopes : scopes // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [SpotifyConfig].
extension SpotifyConfigPatterns on SpotifyConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpotifyConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpotifyConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpotifyConfig value)  $default,){
final _that = this;
switch (_that) {
case _SpotifyConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpotifyConfig value)?  $default,){
final _that = this;
switch (_that) {
case _SpotifyConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String clientId,  String redirectUri,  String? redirectUriWeb,  List<String> scopes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpotifyConfig() when $default != null:
return $default(_that.clientId,_that.redirectUri,_that.redirectUriWeb,_that.scopes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String clientId,  String redirectUri,  String? redirectUriWeb,  List<String> scopes)  $default,) {final _that = this;
switch (_that) {
case _SpotifyConfig():
return $default(_that.clientId,_that.redirectUri,_that.redirectUriWeb,_that.scopes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String clientId,  String redirectUri,  String? redirectUriWeb,  List<String> scopes)?  $default,) {final _that = this;
switch (_that) {
case _SpotifyConfig() when $default != null:
return $default(_that.clientId,_that.redirectUri,_that.redirectUriWeb,_that.scopes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SpotifyConfig implements SpotifyConfig {
  const _SpotifyConfig({required this.clientId, required this.redirectUri, this.redirectUriWeb, required final  List<String> scopes}): _scopes = scopes;
  factory _SpotifyConfig.fromJson(Map<String, dynamic> json) => _$SpotifyConfigFromJson(json);

@override final  String clientId;
@override final  String redirectUri;
@override final  String? redirectUriWeb;
 final  List<String> _scopes;
@override List<String> get scopes {
  if (_scopes is EqualUnmodifiableListView) return _scopes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_scopes);
}


/// Create a copy of SpotifyConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpotifyConfigCopyWith<_SpotifyConfig> get copyWith => __$SpotifyConfigCopyWithImpl<_SpotifyConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpotifyConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpotifyConfig&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.redirectUri, redirectUri) || other.redirectUri == redirectUri)&&(identical(other.redirectUriWeb, redirectUriWeb) || other.redirectUriWeb == redirectUriWeb)&&const DeepCollectionEquality().equals(other._scopes, _scopes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clientId,redirectUri,redirectUriWeb,const DeepCollectionEquality().hash(_scopes));

@override
String toString() {
  return 'SpotifyConfig(clientId: $clientId, redirectUri: $redirectUri, redirectUriWeb: $redirectUriWeb, scopes: $scopes)';
}


}

/// @nodoc
abstract mixin class _$SpotifyConfigCopyWith<$Res> implements $SpotifyConfigCopyWith<$Res> {
  factory _$SpotifyConfigCopyWith(_SpotifyConfig value, $Res Function(_SpotifyConfig) _then) = __$SpotifyConfigCopyWithImpl;
@override @useResult
$Res call({
 String clientId, String redirectUri, String? redirectUriWeb, List<String> scopes
});




}
/// @nodoc
class __$SpotifyConfigCopyWithImpl<$Res>
    implements _$SpotifyConfigCopyWith<$Res> {
  __$SpotifyConfigCopyWithImpl(this._self, this._then);

  final _SpotifyConfig _self;
  final $Res Function(_SpotifyConfig) _then;

/// Create a copy of SpotifyConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clientId = null,Object? redirectUri = null,Object? redirectUriWeb = freezed,Object? scopes = null,}) {
  return _then(_SpotifyConfig(
clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,redirectUri: null == redirectUri ? _self.redirectUri : redirectUri // ignore: cast_nullable_to_non_nullable
as String,redirectUriWeb: freezed == redirectUriWeb ? _self.redirectUriWeb : redirectUriWeb // ignore: cast_nullable_to_non_nullable
as String?,scopes: null == scopes ? _self._scopes : scopes // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$ApiConfig {

 String get baseUrl; String get tokenUrl; String get authorizeUrl;
/// Create a copy of ApiConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiConfigCopyWith<ApiConfig> get copyWith => _$ApiConfigCopyWithImpl<ApiConfig>(this as ApiConfig, _$identity);

  /// Serializes this ApiConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiConfig&&(identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl)&&(identical(other.tokenUrl, tokenUrl) || other.tokenUrl == tokenUrl)&&(identical(other.authorizeUrl, authorizeUrl) || other.authorizeUrl == authorizeUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,baseUrl,tokenUrl,authorizeUrl);

@override
String toString() {
  return 'ApiConfig(baseUrl: $baseUrl, tokenUrl: $tokenUrl, authorizeUrl: $authorizeUrl)';
}


}

/// @nodoc
abstract mixin class $ApiConfigCopyWith<$Res>  {
  factory $ApiConfigCopyWith(ApiConfig value, $Res Function(ApiConfig) _then) = _$ApiConfigCopyWithImpl;
@useResult
$Res call({
 String baseUrl, String tokenUrl, String authorizeUrl
});




}
/// @nodoc
class _$ApiConfigCopyWithImpl<$Res>
    implements $ApiConfigCopyWith<$Res> {
  _$ApiConfigCopyWithImpl(this._self, this._then);

  final ApiConfig _self;
  final $Res Function(ApiConfig) _then;

/// Create a copy of ApiConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? baseUrl = null,Object? tokenUrl = null,Object? authorizeUrl = null,}) {
  return _then(_self.copyWith(
baseUrl: null == baseUrl ? _self.baseUrl : baseUrl // ignore: cast_nullable_to_non_nullable
as String,tokenUrl: null == tokenUrl ? _self.tokenUrl : tokenUrl // ignore: cast_nullable_to_non_nullable
as String,authorizeUrl: null == authorizeUrl ? _self.authorizeUrl : authorizeUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ApiConfig].
extension ApiConfigPatterns on ApiConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApiConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiConfig value)  $default,){
final _that = this;
switch (_that) {
case _ApiConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiConfig value)?  $default,){
final _that = this;
switch (_that) {
case _ApiConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String baseUrl,  String tokenUrl,  String authorizeUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApiConfig() when $default != null:
return $default(_that.baseUrl,_that.tokenUrl,_that.authorizeUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String baseUrl,  String tokenUrl,  String authorizeUrl)  $default,) {final _that = this;
switch (_that) {
case _ApiConfig():
return $default(_that.baseUrl,_that.tokenUrl,_that.authorizeUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String baseUrl,  String tokenUrl,  String authorizeUrl)?  $default,) {final _that = this;
switch (_that) {
case _ApiConfig() when $default != null:
return $default(_that.baseUrl,_that.tokenUrl,_that.authorizeUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApiConfig implements ApiConfig {
  const _ApiConfig({required this.baseUrl, required this.tokenUrl, required this.authorizeUrl});
  factory _ApiConfig.fromJson(Map<String, dynamic> json) => _$ApiConfigFromJson(json);

@override final  String baseUrl;
@override final  String tokenUrl;
@override final  String authorizeUrl;

/// Create a copy of ApiConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiConfigCopyWith<_ApiConfig> get copyWith => __$ApiConfigCopyWithImpl<_ApiConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiConfig&&(identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl)&&(identical(other.tokenUrl, tokenUrl) || other.tokenUrl == tokenUrl)&&(identical(other.authorizeUrl, authorizeUrl) || other.authorizeUrl == authorizeUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,baseUrl,tokenUrl,authorizeUrl);

@override
String toString() {
  return 'ApiConfig(baseUrl: $baseUrl, tokenUrl: $tokenUrl, authorizeUrl: $authorizeUrl)';
}


}

/// @nodoc
abstract mixin class _$ApiConfigCopyWith<$Res> implements $ApiConfigCopyWith<$Res> {
  factory _$ApiConfigCopyWith(_ApiConfig value, $Res Function(_ApiConfig) _then) = __$ApiConfigCopyWithImpl;
@override @useResult
$Res call({
 String baseUrl, String tokenUrl, String authorizeUrl
});




}
/// @nodoc
class __$ApiConfigCopyWithImpl<$Res>
    implements _$ApiConfigCopyWith<$Res> {
  __$ApiConfigCopyWithImpl(this._self, this._then);

  final _ApiConfig _self;
  final $Res Function(_ApiConfig) _then;

/// Create a copy of ApiConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? baseUrl = null,Object? tokenUrl = null,Object? authorizeUrl = null,}) {
  return _then(_ApiConfig(
baseUrl: null == baseUrl ? _self.baseUrl : baseUrl // ignore: cast_nullable_to_non_nullable
as String,tokenUrl: null == tokenUrl ? _self.tokenUrl : tokenUrl // ignore: cast_nullable_to_non_nullable
as String,authorizeUrl: null == authorizeUrl ? _self.authorizeUrl : authorizeUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$FeaturesConfig {

 bool get enableLogging; int get maxPlaylistAnalysis; String get defaultPlaylistPrefix;
/// Create a copy of FeaturesConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeaturesConfigCopyWith<FeaturesConfig> get copyWith => _$FeaturesConfigCopyWithImpl<FeaturesConfig>(this as FeaturesConfig, _$identity);

  /// Serializes this FeaturesConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeaturesConfig&&(identical(other.enableLogging, enableLogging) || other.enableLogging == enableLogging)&&(identical(other.maxPlaylistAnalysis, maxPlaylistAnalysis) || other.maxPlaylistAnalysis == maxPlaylistAnalysis)&&(identical(other.defaultPlaylistPrefix, defaultPlaylistPrefix) || other.defaultPlaylistPrefix == defaultPlaylistPrefix));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enableLogging,maxPlaylistAnalysis,defaultPlaylistPrefix);

@override
String toString() {
  return 'FeaturesConfig(enableLogging: $enableLogging, maxPlaylistAnalysis: $maxPlaylistAnalysis, defaultPlaylistPrefix: $defaultPlaylistPrefix)';
}


}

/// @nodoc
abstract mixin class $FeaturesConfigCopyWith<$Res>  {
  factory $FeaturesConfigCopyWith(FeaturesConfig value, $Res Function(FeaturesConfig) _then) = _$FeaturesConfigCopyWithImpl;
@useResult
$Res call({
 bool enableLogging, int maxPlaylistAnalysis, String defaultPlaylistPrefix
});




}
/// @nodoc
class _$FeaturesConfigCopyWithImpl<$Res>
    implements $FeaturesConfigCopyWith<$Res> {
  _$FeaturesConfigCopyWithImpl(this._self, this._then);

  final FeaturesConfig _self;
  final $Res Function(FeaturesConfig) _then;

/// Create a copy of FeaturesConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enableLogging = null,Object? maxPlaylistAnalysis = null,Object? defaultPlaylistPrefix = null,}) {
  return _then(_self.copyWith(
enableLogging: null == enableLogging ? _self.enableLogging : enableLogging // ignore: cast_nullable_to_non_nullable
as bool,maxPlaylistAnalysis: null == maxPlaylistAnalysis ? _self.maxPlaylistAnalysis : maxPlaylistAnalysis // ignore: cast_nullable_to_non_nullable
as int,defaultPlaylistPrefix: null == defaultPlaylistPrefix ? _self.defaultPlaylistPrefix : defaultPlaylistPrefix // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FeaturesConfig].
extension FeaturesConfigPatterns on FeaturesConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FeaturesConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FeaturesConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FeaturesConfig value)  $default,){
final _that = this;
switch (_that) {
case _FeaturesConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FeaturesConfig value)?  $default,){
final _that = this;
switch (_that) {
case _FeaturesConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool enableLogging,  int maxPlaylistAnalysis,  String defaultPlaylistPrefix)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FeaturesConfig() when $default != null:
return $default(_that.enableLogging,_that.maxPlaylistAnalysis,_that.defaultPlaylistPrefix);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool enableLogging,  int maxPlaylistAnalysis,  String defaultPlaylistPrefix)  $default,) {final _that = this;
switch (_that) {
case _FeaturesConfig():
return $default(_that.enableLogging,_that.maxPlaylistAnalysis,_that.defaultPlaylistPrefix);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool enableLogging,  int maxPlaylistAnalysis,  String defaultPlaylistPrefix)?  $default,) {final _that = this;
switch (_that) {
case _FeaturesConfig() when $default != null:
return $default(_that.enableLogging,_that.maxPlaylistAnalysis,_that.defaultPlaylistPrefix);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FeaturesConfig implements FeaturesConfig {
  const _FeaturesConfig({required this.enableLogging, required this.maxPlaylistAnalysis, required this.defaultPlaylistPrefix});
  factory _FeaturesConfig.fromJson(Map<String, dynamic> json) => _$FeaturesConfigFromJson(json);

@override final  bool enableLogging;
@override final  int maxPlaylistAnalysis;
@override final  String defaultPlaylistPrefix;

/// Create a copy of FeaturesConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeaturesConfigCopyWith<_FeaturesConfig> get copyWith => __$FeaturesConfigCopyWithImpl<_FeaturesConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FeaturesConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeaturesConfig&&(identical(other.enableLogging, enableLogging) || other.enableLogging == enableLogging)&&(identical(other.maxPlaylistAnalysis, maxPlaylistAnalysis) || other.maxPlaylistAnalysis == maxPlaylistAnalysis)&&(identical(other.defaultPlaylistPrefix, defaultPlaylistPrefix) || other.defaultPlaylistPrefix == defaultPlaylistPrefix));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enableLogging,maxPlaylistAnalysis,defaultPlaylistPrefix);

@override
String toString() {
  return 'FeaturesConfig(enableLogging: $enableLogging, maxPlaylistAnalysis: $maxPlaylistAnalysis, defaultPlaylistPrefix: $defaultPlaylistPrefix)';
}


}

/// @nodoc
abstract mixin class _$FeaturesConfigCopyWith<$Res> implements $FeaturesConfigCopyWith<$Res> {
  factory _$FeaturesConfigCopyWith(_FeaturesConfig value, $Res Function(_FeaturesConfig) _then) = __$FeaturesConfigCopyWithImpl;
@override @useResult
$Res call({
 bool enableLogging, int maxPlaylistAnalysis, String defaultPlaylistPrefix
});




}
/// @nodoc
class __$FeaturesConfigCopyWithImpl<$Res>
    implements _$FeaturesConfigCopyWith<$Res> {
  __$FeaturesConfigCopyWithImpl(this._self, this._then);

  final _FeaturesConfig _self;
  final $Res Function(_FeaturesConfig) _then;

/// Create a copy of FeaturesConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enableLogging = null,Object? maxPlaylistAnalysis = null,Object? defaultPlaylistPrefix = null,}) {
  return _then(_FeaturesConfig(
enableLogging: null == enableLogging ? _self.enableLogging : enableLogging // ignore: cast_nullable_to_non_nullable
as bool,maxPlaylistAnalysis: null == maxPlaylistAnalysis ? _self.maxPlaylistAnalysis : maxPlaylistAnalysis // ignore: cast_nullable_to_non_nullable
as int,defaultPlaylistPrefix: null == defaultPlaylistPrefix ? _self.defaultPlaylistPrefix : defaultPlaylistPrefix // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
