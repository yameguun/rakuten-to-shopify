class CreateOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :options do |t|
      t.string :handle
      t.string :option1_name
      t.string :option1_value
      t.string :option2_name
      t.string :option2_value

      #t.timestamps
    end
    add_index :options, :handle
  end
end
