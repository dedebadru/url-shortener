class CreateShortenerDetails < ActiveRecord::Migration
  def change
    create_table :shortener_details do |t|
      t.string :shortener_id, null: false
      t.string :ip
      t.string :os
      t.string :browser

      t.timestamps null: false
    end
  end
end
