class CreateTagRelationships < ActiveRecord::Migration
  def change
    create_table :tag_relationships do |t|
      t.integer :tag_follower_id
      t.string :followed_tag_id

      t.timestamps
    end
    add_index :tag_relationships, :tag_follower_id
    add_index :tag_relationships, :followed_tag_id
    add_index :tag_relationships, [:tag_follower_id, :followed_tag_id], unique: true
  end
end
