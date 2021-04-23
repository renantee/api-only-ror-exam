class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :title
      t.text :body
      t.integer :commentable_id
      t.string :commentable_type
      t.integer :parent_id
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :comments, [:commentable_type, :commentable_id]
  end
end
