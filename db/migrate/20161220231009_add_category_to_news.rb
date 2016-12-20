class AddCategoryToNews < ActiveRecord::Migration
  def change
    add_reference :news, :category, index: true, foreign_key: true
  end
end
