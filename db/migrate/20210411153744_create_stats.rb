class CreateStats < ActiveRecord::Migration[5.2]
  def change
    create_table :stats do |t|
      t.references :link, foreign_key: true
      t.string :ip_address
      t.string :country
      t.string :browser
      t.string :os

      t.timestamps
    end
  end
end
