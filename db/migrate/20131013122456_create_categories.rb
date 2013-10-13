class CreateCategories < ActiveRecord::Migration
  def up
    create_hydra_entity :categories do |t|
      t.string :name, null: false

      t.timestamps
    end
  end

  def down
    drop_hydra_entity :categories
  end
end
