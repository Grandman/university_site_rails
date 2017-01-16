class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.text :code

      t.timestamps null: false
    end
  end
end
