## アプリケーション名
  tutti

## アプリケーション概要
  複数人でのビデオチャットアプリ

## URL
https://tutti-application.herokuapp.com/

## テスト用アカウント
email mikiya@example.com
password 111111abc

## 利用方法
  新規登録・ログインしたユーザーのみtuttiを利用できる。
  ホスト役がルームを作り、他のログイン中ユーザーを招待する。
  ルームに招待されたユーザーは承認すると参加できる。
  ルーム内でメッセージや画像の投稿、ビデオ通話ができる。

## 目指した課題解決
  社内交流を円滑にし、社員の不安を取り除くこと。
  新型コロナの影響でコミュニケーションを取る機会が減ってしまった。
  新入社員の方や人事異動があった方は職場での精神的な不安が多い。
  業務外で気軽に交流ができるアプリを使用し、社内交流を深める。

## 用件定義
- ユーザー管理機能
- ルーム作成機能
- メッセージ機能


## 実装予定の機能
  メッセージの既読機能
  メッセージデータは1日で自動削除
  ビデオチャット機能

## データベース設計
## users テーブル

| Column             | Type        | Options                   |
| ------------------ | ----------- | ------------------------- |
| last_name          | string      | null: false               |
| first_name         | string      | null: false               |
| last_name_kana     | string      | null: false               |
| first_name_kana    | string      | null: false               |
| email              | string      | null: false, unique: true |
| encrypted_password | string      | null: false               |

### Association

- has_many :messages
- has_many :room_users

## rooms テーブル

| Column             | Type        | Options                   |
| ------------------ | ----------- | ------------------------- |
| name               | string      | null: false               |

### Association

- has_many :messages
- has_many :room_users


## room_users テーブル

| Column        | Type        | Options                        |
| ------------- | ----------- | ------------------------------ |
| user          | references  | null: false, foreign_key: true |
| room          | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room


## messages テーブル

| Column        | Type        | Options                        |
| ------------- | ----------- | ------------------------------ |
| text          | text        | null: false                    |
| user          | references  | null: false, foreign_key: true |
| room          | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room