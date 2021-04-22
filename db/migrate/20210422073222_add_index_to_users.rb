class AddIndexToUsers < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t|
      t.index :email, unique: true
    end
  end
end
