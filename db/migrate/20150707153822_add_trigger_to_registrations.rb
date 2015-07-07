class AddTriggerToRegistrations < ActiveRecord::Migration
  def self.up 
    execute <<-SQL
      CREATE TRIGGER "denial"
      AFTER INSERT ON "registrations"
      BEGIN
          UPDATE "registrations" 
          SET comment = '#{Registration::COMMENT_PATTERN}' 
          WHERE id = NEW.id AND comment REGEXP "#{Registration::BAD_COMMENT_TEXT}";
      END;
    SQL
  end
  def self.down
    execute <<-SQL
      DROP TRIGGER "denial";
    SQL

  end
end
