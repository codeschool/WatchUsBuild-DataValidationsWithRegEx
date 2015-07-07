class AddTriggerToRegistrations < ActiveRecord::Migration
  def change
    execute <<-SQL
      CREATE TRIGGER "denial"
      AFTER INSERT ON "registrations"
      BEGIN
          UPDATE "registrations" 
          SET comment = 'denied' 
          WHERE id = NEW.id AND comment REGEXP ".*bad.*";
      END;
    SQL
  end
end
