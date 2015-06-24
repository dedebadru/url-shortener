class CreateShorteners < ActiveRecord::Migration
  def change
    create_table :shorteners do |t|
      t.string :short_url, null: false
      t.string :destination_url, null: false
      t.string :own_ip, null: false

      t.timestamps null: false
    end
  end
end
