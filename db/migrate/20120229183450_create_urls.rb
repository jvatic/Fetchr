class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :url
      t.string :title
      t.text :body
      t.datetime :last_fetch_at
      t.string :fetch_error

      t.timestamps
    end
  end
end
