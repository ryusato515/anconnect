class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true, null: false
      t.string :name, null: false
      t.string :photo_image, null: false
      t.references :prefecture, foreign_key: true
      t.string :shop_name, null: false
      t.string :address
      t.references :ingredient, foreign_key: true, null: false
      t.references :cooking_method, foreign_key: true, null: false
      t.text :comment, null: false
      t.timestamps
    end
  end
end