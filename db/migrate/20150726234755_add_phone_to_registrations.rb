class AddPhoneToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :phone, :string
  end
end
