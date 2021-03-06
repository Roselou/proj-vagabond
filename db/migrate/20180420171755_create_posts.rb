class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.belongs_to :user, foreign_key: true
      t.belongs_to :city, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
