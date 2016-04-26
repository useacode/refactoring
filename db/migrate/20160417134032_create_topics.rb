class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.text :body
      t.boolean :is_draft, :default => true
      t.boolean :is_open, :default => true

      t.timestamps null: false
    end
  end
end
