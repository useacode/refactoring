class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.references :topic, index: true, foreign_key: true
      t.string :title
      t.text :body

      t.timestamps null: false
    end
  end
end
