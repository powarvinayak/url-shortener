class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string :long_url
      t.string :short_url
      t.integer :no_of_clicks, default: 0

      t.timestamps
    end
  end
end
