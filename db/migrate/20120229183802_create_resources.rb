class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :url
      t.text :attributes
      t.integer :resourceful_id
      t.string :resourceful_type

      t.timestamps
    end
  end
end
