// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'qiita_client_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$QiitaClientStateTearOff {
  const _$QiitaClientStateTearOff();

  _QiitaClientState call(
      {bool isLoading = false,
      bool isReadyData = false,
      List<QiitaItem> qiitaItems = const <QiitaItem>[],
      String currentTag = ''}) {
    return _QiitaClientState(
      isLoading: isLoading,
      isReadyData: isReadyData,
      qiitaItems: qiitaItems,
      currentTag: currentTag,
    );
  }
}

/// @nodoc
const $QiitaClientState = _$QiitaClientStateTearOff();

/// @nodoc
mixin _$QiitaClientState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isReadyData => throw _privateConstructorUsedError;
  List<QiitaItem> get qiitaItems => throw _privateConstructorUsedError;
  String get currentTag => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QiitaClientStateCopyWith<QiitaClientState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QiitaClientStateCopyWith<$Res> {
  factory $QiitaClientStateCopyWith(
          QiitaClientState value, $Res Function(QiitaClientState) then) =
      _$QiitaClientStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      bool isReadyData,
      List<QiitaItem> qiitaItems,
      String currentTag});
}

/// @nodoc
class _$QiitaClientStateCopyWithImpl<$Res>
    implements $QiitaClientStateCopyWith<$Res> {
  _$QiitaClientStateCopyWithImpl(this._value, this._then);

  final QiitaClientState _value;
  // ignore: unused_field
  final $Res Function(QiitaClientState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isReadyData = freezed,
    Object? qiitaItems = freezed,
    Object? currentTag = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isReadyData: isReadyData == freezed
          ? _value.isReadyData
          : isReadyData // ignore: cast_nullable_to_non_nullable
              as bool,
      qiitaItems: qiitaItems == freezed
          ? _value.qiitaItems
          : qiitaItems // ignore: cast_nullable_to_non_nullable
              as List<QiitaItem>,
      currentTag: currentTag == freezed
          ? _value.currentTag
          : currentTag // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$QiitaClientStateCopyWith<$Res>
    implements $QiitaClientStateCopyWith<$Res> {
  factory _$QiitaClientStateCopyWith(
          _QiitaClientState value, $Res Function(_QiitaClientState) then) =
      __$QiitaClientStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      bool isReadyData,
      List<QiitaItem> qiitaItems,
      String currentTag});
}

/// @nodoc
class __$QiitaClientStateCopyWithImpl<$Res>
    extends _$QiitaClientStateCopyWithImpl<$Res>
    implements _$QiitaClientStateCopyWith<$Res> {
  __$QiitaClientStateCopyWithImpl(
      _QiitaClientState _value, $Res Function(_QiitaClientState) _then)
      : super(_value, (v) => _then(v as _QiitaClientState));

  @override
  _QiitaClientState get _value => super._value as _QiitaClientState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isReadyData = freezed,
    Object? qiitaItems = freezed,
    Object? currentTag = freezed,
  }) {
    return _then(_QiitaClientState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isReadyData: isReadyData == freezed
          ? _value.isReadyData
          : isReadyData // ignore: cast_nullable_to_non_nullable
              as bool,
      qiitaItems: qiitaItems == freezed
          ? _value.qiitaItems
          : qiitaItems // ignore: cast_nullable_to_non_nullable
              as List<QiitaItem>,
      currentTag: currentTag == freezed
          ? _value.currentTag
          : currentTag // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_QiitaClientState implements _QiitaClientState {
  const _$_QiitaClientState(
      {this.isLoading = false,
      this.isReadyData = false,
      this.qiitaItems = const <QiitaItem>[],
      this.currentTag = ''});

  @JsonKey()
  @override
  final bool isLoading;
  @JsonKey()
  @override
  final bool isReadyData;
  @JsonKey()
  @override
  final List<QiitaItem> qiitaItems;
  @JsonKey()
  @override
  final String currentTag;

  @override
  String toString() {
    return 'QiitaClientState(isLoading: $isLoading, isReadyData: $isReadyData, qiitaItems: $qiitaItems, currentTag: $currentTag)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QiitaClientState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.isReadyData, isReadyData) &&
            const DeepCollectionEquality()
                .equals(other.qiitaItems, qiitaItems) &&
            const DeepCollectionEquality()
                .equals(other.currentTag, currentTag));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isReadyData),
      const DeepCollectionEquality().hash(qiitaItems),
      const DeepCollectionEquality().hash(currentTag));

  @JsonKey(ignore: true)
  @override
  _$QiitaClientStateCopyWith<_QiitaClientState> get copyWith =>
      __$QiitaClientStateCopyWithImpl<_QiitaClientState>(this, _$identity);
}

abstract class _QiitaClientState implements QiitaClientState {
  const factory _QiitaClientState(
      {bool isLoading,
      bool isReadyData,
      List<QiitaItem> qiitaItems,
      String currentTag}) = _$_QiitaClientState;

  @override
  bool get isLoading;
  @override
  bool get isReadyData;
  @override
  List<QiitaItem> get qiitaItems;
  @override
  String get currentTag;
  @override
  @JsonKey(ignore: true)
  _$QiitaClientStateCopyWith<_QiitaClientState> get copyWith =>
      throw _privateConstructorUsedError;
}
