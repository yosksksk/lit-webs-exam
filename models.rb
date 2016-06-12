ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || "sqlite3:db/development.db")

##############################################
# モデルの作成例
# class Model < ActiveRecord::Base
# end
#
# 注：
# モデルの名前（上記でいうModel）は
# 大文字から始めて単数形で表現します
##############################################

# メモに関するモデルの作成

# カテゴリに関するモデルの作成

