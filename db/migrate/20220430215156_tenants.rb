class Tenants < ActiveRecord::Migration[7.0]
  def change
    create_table :tenants do |t|
      t.string :name,    null: false
      t.string :api_key, null: false
      t.integer :request_count

      t.timestamps
    end
  end
end
