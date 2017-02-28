class AddCategoryIdToMemos < ActiveRecord::Migration
  def change
      add_column :memos, :category_id, :integer
  end
end
