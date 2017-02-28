class CreateMemos < ActiveRecord::Migration
  def change
      create_table :memos do |t|
          t.string :title
          t.string :body
          t.timestamps null: false
      end
  end
end
