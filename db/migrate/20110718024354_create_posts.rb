class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      # foreign key
      t.integer "user_id"
      # regular
	  t.string "content"
	  t.float "latitude"
	  t.float "longitude"
	  t.string "address"
	  t.boolean 'gmaps'
      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
