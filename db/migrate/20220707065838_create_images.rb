class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.string :handle
      t.string :src
      t.string :alt

      #t.timestamps
    end
    add_index :images, :handle
  end
end
