class AddStatusToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :status, :integer, unsigned: true, :default => 1
  end
end
