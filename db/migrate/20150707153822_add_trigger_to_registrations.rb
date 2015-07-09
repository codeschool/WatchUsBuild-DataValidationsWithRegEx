class AddTriggerToRegistrations < ActiveRecord::Migration
  def self.up 
    regex = ".*(?:bad|hate|negative).*"
    execute <<-SQL
      CREATE TRIGGER "insert_denial"
      AFTER INSERT ON "registrations"
      BEGIN
          UPDATE "registrations" 
          SET comment = (NEW.comment || '\n !Sorry, but this comment has been denied!') 
          WHERE id = NEW.id AND comment REGEXP "#{regex}";
      END;
    SQL
  end
  def self.down
    execute <<-SQL
      DROP TRIGGER IF EXISTS "insert_denial";
    SQL
  end
end

#trigger settings - Changes require: rake db:migrate:redo VERSION=20150707153822


#use lookaheads to search for bad words, capture them and show what they were replaced with
