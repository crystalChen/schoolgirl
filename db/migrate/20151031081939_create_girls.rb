class CreateGirls < ActiveRecord::Migration
  def change
    create_table :girls do |t|
      t.string :studentNo
      t.string :studentName
      t.string :img
      t.text :comment
      t.float :score

      t.timestamps
    end
    add_index :girls, :studentNo
  end
end
