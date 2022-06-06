// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'qiita_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QiitaItem _$QiitaItemFromJson(Map<String, dynamic> json) {
  return _QiitaItem.fromJson(json);
}

/// @nodoc
class _$QiitaItemTearOff {
  const _$QiitaItemTearOff();

  _QiitaItem call(
      {@JsonKey(name: 'title') String? title,
      @JsonKey(name: 'url') String? url,
      @JsonKey(name: 'user') QiitaUser? user}) {
    return _QiitaItem(
      title: title,
      url: url,
      user: user,
    );
  }

  QiitaItem fromJson(Map<String, Object?> json) {
    return QiitaItem.fromJson(json);
  }
}

/// @nodoc
const $QiitaItem = _$QiitaItemTearOff();

/// @nodoc
mixin _$QiitaItem {
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'url')
  String? get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'user')
  QiitaUser? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QiitaItemCopyWith<QiitaItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QiitaItemCopyWith<$Res> {
  factory $QiitaItemCopyWith(QiitaItem value, $Res Function(QiitaItem) then) =
      _$QiitaItemCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'title') String? title,
      @JsonKey(name: 'url') String? url,
      @JsonKey(name: 'user') QiitaUser? user});

  $QiitaUserCopyWith<$Res>? get user;
}

/// @nodoc
class _$QiitaItemCopyWithImpl<$Res> implements $QiitaItemCopyWith<$Res> {
  _$QiitaItemCopyWithImpl(this._value, this._then);

  final QiitaItem _value;
  // ignore: unused_field
  final $Res Function(QiitaItem) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? url = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as QiitaUser?,
    ));
  }

  @override
  $QiitaUserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $QiitaUserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$QiitaItemCopyWith<$Res> implements $QiitaItemCopyWith<$Res> {
  factory _$QiitaItemCopyWith(
          _QiitaItem value, $Res Function(_QiitaItem) then) =
      __$QiitaItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'title') String? title,
      @JsonKey(name: 'url') String? url,
      @JsonKey(name: 'user') QiitaUser? user});

  @override
  $QiitaUserCopyWith<$Res>? get user;
}

/// @nodoc
class __$QiitaItemCopyWithImpl<$Res> extends _$QiitaItemCopyWithImpl<$Res>
    implements _$QiitaItemCopyWith<$Res> {
  __$QiitaItemCopyWithImpl(_QiitaItem _value, $Res Function(_QiitaItem) _then)
      : super(_value, (v) => _then(v as _QiitaItem));

  @override
  _QiitaItem get _value => super._value as _QiitaItem;

  @override
  $Res call({
    Object? title = freezed,
    Object? url = freezed,
    Object? user = freezed,
  }) {
    return _then(_QiitaItem(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as QiitaUser?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QiitaItem implements _QiitaItem {
  const _$_QiitaItem(
      {@JsonKey(name: 'title') this.title,
      @JsonKey(name: 'url') this.url,
      @JsonKey(name: 'user') this.user});

  factory _$_QiitaItem.fromJson(Map<String, dynamic> json) =>
      _$$_QiitaItemFromJson(json);

  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'url')
  final String? url;
  @override
  @JsonKey(name: 'user')
  final QiitaUser? user;

  @override
  String toString() {
    return 'QiitaItem(title: $title, url: $url, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QiitaItem &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$QiitaItemCopyWith<_QiitaItem> get copyWith =>
      __$QiitaItemCopyWithImpl<_QiitaItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QiitaItemToJson(this);
  }
}

abstract class _QiitaItem implements QiitaItem {
  const factory _QiitaItem(
      {@JsonKey(name: 'title') String? title,
      @JsonKey(name: 'url') String? url,
      @JsonKey(name: 'user') QiitaUser? user}) = _$_QiitaItem;

  factory _QiitaItem.fromJson(Map<String, dynamic> json) =
      _$_QiitaItem.fromJson;

  @override
  @JsonKey(name: 'title')
  String? get title;
  @override
  @JsonKey(name: 'url')
  String? get url;
  @override
  @JsonKey(name: 'user')
  QiitaUser? get user;
  @override
  @JsonKey(ignore: true)
  _$QiitaItemCopyWith<_QiitaItem> get copyWith =>
      throw _privateConstructorUsedError;
}
