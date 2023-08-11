class CreateComments < ActiveRecord::Migration[7.0]
  def self.up
    create_table :comments do |t|
      t.string :title, :limit => 50, :default => "" 
      t.text :comment
      t.references :commentable, :polymorphic => true
      t.references :user
      t.string :role, :default => "comments"
      t.timestamps
    end

    add_index :comments, :commentable_type
    add_index :comments, :commentable_id
    add_index :comments, :user_id, name: 'index_comments_on_different_user_id'
  
  
  end

  def self.down
    drop_table :comments
  end
end
