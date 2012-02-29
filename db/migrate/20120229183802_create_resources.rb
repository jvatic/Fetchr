class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :url
      t.text :attrs
      t.integer :page_id
      t.string :type

      t.timestamps
    end
  end
end
