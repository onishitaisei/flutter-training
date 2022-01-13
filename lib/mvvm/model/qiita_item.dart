// import 'package:training/mvvm/model/qiita_user.dart;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:training/mvvm/model/qiita_user.dart';

part 'qiita_item.freezed.dart'; // build_runnerを実行すると生成。qiita_item.freezed.dartはqiita_item.dartの一部であることを明示
part 'qiita_item.g.dart'; // build_runnerを実行すると生成。qiita_item.g.dartはqiita_item.dartの一部であることを明示

@freezed
class QiitaItem with _$QiitaItem {
  // _$○○クラスをmixin（with）、_○○クラスをコンストラクタに代入
  const factory QiitaItem({
    @JsonKey(name: "title")
        String? title, // Jsonのキーと別名でメンバ変数を定義したい場合は@JsonKeyを使用する。
    @JsonKey(name: "url") String? url,
    @JsonKey(name: "user") QiitaUser? user,
  }) = _QiitaItem;

  factory QiitaItem.fromJson(Map<String, dynamic> json) =>
      _$QiitaItemFromJson(json);
}


// モデル作成時はエラーが発生。build_runnerを実行すると必要ファイルが生成されてエラーが解消される。
// json_serializableを使用することでモデル⇆JSONを自動で行ってくれるファイルを生成する