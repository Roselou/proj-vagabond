class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :avatar
      t.string :current_city
      t.string :password_digest
      t.string :email
      t.string :username
    

      t.timestamps
    end
  end
end
