# 雑記

## Userモデルの仕様策定

Userモデルは複数の世界観（Worldモデル）を持つ。
UserはそれぞれにFollow, Followedの関係を持つ。

Userモデルは以下のステータスを持ち回る。

- id:string
- name:string
- password:string
- mail:string
- discription:text
- has_world:world
- comment:text

その他の細かい設定事項はpreferanceモデルによって管理される。


