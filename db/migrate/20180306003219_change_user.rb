class ChangeUser < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.remove :name, :email
      t.string :username
      t.index :username
    end
  end
end
