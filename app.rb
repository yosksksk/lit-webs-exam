require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'
require './models'

get '/' do
    @memos      = Memo.all
    @categories = Category.all

    erb :index
end

# メモを新しく作成するときの処理
post '/new' do
    Memo.create({
        title:       params[:title],
        body:        params[:body],
        category_id: params[:category],
    })

    redirect '/'
end

# 特定のメモを編集するときの処理
get '/memos/:id/edit' do
    @categories = Category.all
    @memo = Memo.find_by({id: params[:id]})
    if @memo.nil?
        redirect '/'
    end

    erb :edit
end

# 特定のメモを更新するときの処理
post '/memos/:id/edit' do
    @memo = Memo.find_by({id: params[:id]})
    if @memo.nil?
        redirect '/'
    end
    @memo.update({
        title:       params[:title],
        body:        params[:body],
        category_id: params[:category],
    })
    @memo.save

    redirect '/'
end

# 特定のメモを削除するときの処理
get '/memos/:id/delete' do
    @memo = Memo.find_by({id: params[:id]})
    unless @memo.nil?
        @memo.destroy
    end

    redirect '/'
end

# メモをカテゴリ分類して表示するときの処理
get '/categories/:id' do
    @categories = Category.all
    @category = @categories.find_by({id: params[:id]})
    if @category.nil?
        @memos = []
    else
        @memos = @category.memos
    end

    erb :index
end

