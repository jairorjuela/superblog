class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email, limit: 50
      t.string :password_digest
      t.string :name, limit: 50

      t.timestamps null: false
    end
  end
end
