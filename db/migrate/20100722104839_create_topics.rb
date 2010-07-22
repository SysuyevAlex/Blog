class CreateTopics < ActiveRecord::Migration
  def self.up
    create_table :topics do |t|
      t.string :name
      t.datetime :creation_time
      t.datetime :last_post
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :topics
  end
end
