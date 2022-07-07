class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :handle
      t.string :title
      t.text :body
      t.integer :variant_price
      t.string :option1_name
      t.string :option2_name

      #t.timestamps
    end
    add_index :products, :handle
  end
end
