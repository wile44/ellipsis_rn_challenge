// coverage:ignore-file




part of 'product_model.dart';





T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _ProductModel.fromJson(json);
}


mixin _$ProductModel {
  String? get name => throw _privateConstructorUsedError;
  String? get detail => throw _privateConstructorUsedError;
  String? get price => throw _privateConstructorUsedError;
  String? get hero => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductModelCopyWith<ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}


abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) then) =
      _$ProductModelCopyWithImpl<$Res>;
  $Res call(
      {String? name,
      String? detail,
      String? price,
      String? hero,
      String? image});
}


class _$ProductModelCopyWithImpl<$Res> implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

  final ProductModel _value;
  
  final $Res Function(ProductModel) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? detail = freezed,
    Object? price = freezed,
    Object? hero = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name 
              as String?,
      detail: detail == freezed
          ? _value.detail
          : detail 
              as String?,
      price: price == freezed
          ? _value.price
          : price 
              as String?,
      hero: hero == freezed
          ? _value.hero
          : hero 
              as String?,
      image: image == freezed
          ? _value.image
          : image 
              as String?,
    ));
  }
}


abstract class _$$_ProductModelCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$$_ProductModelCopyWith(
          _$_ProductModel value, $Res Function(_$_ProductModel) then) =
      __$$_ProductModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? name,
      String? detail,
      String? price,
      String? hero,
      String? image});
}


class __$$_ProductModelCopyWithImpl<$Res>
    extends _$ProductModelCopyWithImpl<$Res>
    implements _$$_ProductModelCopyWith<$Res> {
  __$$_ProductModelCopyWithImpl(
      _$_ProductModel _value, $Res Function(_$_ProductModel) _then)
      : super(_value, (v) => _then(v as _$_ProductModel));

  @override
  _$_ProductModel get _value => super._value as _$_ProductModel;

  @override
  $Res call({
    Object? name = freezed,
    Object? detail = freezed,
    Object? price = freezed,
    Object? hero = freezed,
    Object? image = freezed,
  }) {
    return _then(_$_ProductModel(
      name: name == freezed
          ? _value.name
          : name 
              as String?,
      detail: detail == freezed
          ? _value.detail
          : detail 
              as String?,
      price: price == freezed
          ? _value.price
          : price 
              as String?,
      hero: hero == freezed
          ? _value.hero
          : hero 
              as String?,
      image: image == freezed
          ? _value.image
          : image 
              as String?,
    ));
  }
}


@JsonSerializable()
class _$_ProductModel implements _ProductModel {
  _$_ProductModel({this.name, this.detail, this.price, this.hero, this.image});

  factory _$_ProductModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProductModelFromJson(json);

  @override
  final String? name;
  @override
  final String? detail;
  @override
  final String? price;
  @override
  final String? hero;
  @override
  final String? image;

  @override
  String toString() {
    return 'ProductModel(name: $name, detail: $detail, price: $price, hero: $hero, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductModel &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.detail, detail) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.hero, hero) &&
            const DeepCollectionEquality().equals(other.image, image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(detail),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(hero),
      const DeepCollectionEquality().hash(image));

  @JsonKey(ignore: true)
  @override
  _$$_ProductModelCopyWith<_$_ProductModel> get copyWith =>
      __$$_ProductModelCopyWithImpl<_$_ProductModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductModelToJson(this);
  }
}

abstract class _ProductModel implements ProductModel {
  factory _ProductModel(
      {final String? name,
      final String? detail,
      final String? price,
      final String? hero,
      final String? image}) = _$_ProductModel;

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$_ProductModel.fromJson;

  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get detail => throw _privateConstructorUsedError;
  @override
  String? get price => throw _privateConstructorUsedError;
  @override
  String? get hero => throw _privateConstructorUsedError;
  @override
  String? get image => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ProductModelCopyWith<_$_ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}
