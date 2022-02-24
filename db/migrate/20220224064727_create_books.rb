class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :year_published
      t.decimal :price
      t.boolean :out_of_print
      t.integer :views
      t.integer :supplier_id
      t.integer :author_id

      t.timestamps
    end
  end
end
