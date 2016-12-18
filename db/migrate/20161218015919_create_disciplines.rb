class CreateDisciplines < ActiveRecord::Migration
  def change
    create_table :disciplines do |t|
      t.string :name
      t.references :user, index: true, foreign_key: true
      t.text :page

      t.timestamps null: false
    end
  end
end
