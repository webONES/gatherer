class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :user_id
      t.string :value
      t.string :key

      t.timestamps
    end
  end
end
