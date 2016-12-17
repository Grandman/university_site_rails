class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.references :user, index: true, foreign_key: true
      t.text :content
      t.datetime :date
      t.string :title

      t.timestamps null: false
    end
  end
end
