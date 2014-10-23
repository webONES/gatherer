class CreateConfigurations < ActiveRecord::Migration
  def change
    create_table :configurations do |t|
      t.string :name
      t.string :key
      t.string :value

      t.timestamps
    end
  end
end
