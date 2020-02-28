# 日本語のテキスト（漢字・かな混じり）を入力したら、それをルビに直したテキストを出力するアプリ

&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;![20200228_174440](https://user-images.githubusercontent.com/47974150/75524889-2a329e80-5a52-11ea-8549-10ccbc1d0adb.GIF)

## プロジェクトのクローンからビルド完了までの手順

### ⚠️bundlerでcocoapodsをバージョン管理しています。
```
 *version
 
 Bundler '1.17.2'
 Cocoapods '1.8.4'
```
### クローンからビルド完了までの手順
1. このプロジェクトをclone or download

2. ```$ bundle install --path vendor/bundle```

3. ```$ bundle exec pod install```


### エラーが出る場合
1. ```$ bundle exec pod --version```で、’1.8.4’であるか確認して下さい。
2. ```$ gem list | grep 'bundler'```で、**bundlerがインストール**されているか確認してください。

# 🚀工夫した点
- 責務の切り分け（1VC1Storyboardにしました。）
- ソースコードを読みやすくするため、extensionで分けました。
- 非同期処理(API処理が終わり次第画面遷移させるため、クロージャの使い方を工夫しました。)
- アニメーション
- テキストフィールド内の空文字の制限をするバリデーションメソッドを記述しました。
- トーストアラートを使用しました。

# 使用したAPI
[ひらがな化API](https://labs.goo.ne.jp/api/jp/hiragana-translation/)

![sgoo](https://user-images.githubusercontent.com/47974150/75524406-2baf9700-5a51-11ea-9473-847661afbd1a.png)
