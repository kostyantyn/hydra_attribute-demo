class CreateProducts < ActiveRecord::Migration
  def up
    create_hydra_entity :products do |t|
      t.string :sku,  null: false, limit: 32
      t.string :name, null: false

      t.timestamps
    end
    add_index :products, :sku, unique: true
  end

  def down
    drop_hydra_entity :products
  end
end
