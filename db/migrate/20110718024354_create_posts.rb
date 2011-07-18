class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      # foreign key
      t.integer "user_id"
      # regular
	  t.text "content"
	  t.float "latitude"
	  t.float "longitude"
      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
