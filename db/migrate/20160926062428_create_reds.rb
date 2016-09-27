class CreateReds < ActiveRecord::Migration
  def change
    create_table :reds do |t|
      t.string :email, limit: 50
      t.text :global
      t.string :country

      t.timestamps null: false
    end
  end
end
