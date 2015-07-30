class AddFlaggedToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :flagged, :boolean
  end
end
