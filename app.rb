require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'
require './models'

get '/' do
    erb :index
end

# メモを新しく作成するときの処理

# 特定のメモを編集するときの処理

# 特定のメモを更新するときの処理

# 特定のメモを削除するときの処理

# メモをカテゴリ分類して表示するときの処理

