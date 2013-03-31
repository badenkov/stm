class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.text :description
      t.integer :requester_id
      t.integer :owner_id
      t.string :state

      t.timestamps
    end
  end
end
