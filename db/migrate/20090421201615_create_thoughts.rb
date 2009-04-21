class CreateThoughts < ActiveRecord::Migration
  def self.up
    create_table :thoughts, :force => true do |t|
      t.string :title
      t.string :description
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :thoughts
  end
end
