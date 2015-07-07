class AddTriggerToRegistrations < ActiveRecord::Migration
  def self.up 
    execute <<-SQL
      CREATE TRIGGER "denial"
      AFTER INSERT ON "registrations"
      BEGIN
          UPDATE "registrations" 
          SET comment = 'This comment has been denied.' 
          WHERE id = NEW.id AND comment REGEXP "heck|geeze|bad";
      END;
    SQL
  end
  def self.down
    execute <<-SQL
      DROP TRIGGER "denial";
    SQL

  end
end
