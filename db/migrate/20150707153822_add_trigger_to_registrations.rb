class AddTriggerToRegistrations < ActiveRecord::Migration
  def self.up
    regex = ""
    execute <<-SQL
      CREATE TRIGGER "check_for_badness"
      AFTER INSERT ON "registrations"
      BEGIN
          UPDATE "registrations"
          SET flagged = 'true'
          WHERE id = NEW.id AND comment REGEXP "#{regex}";
      END;
    SQL
  end
  def self.down
    execute <<-SQL
      DROP TRIGGER IF EXISTS "check_for_badness";
    SQL
  end
end

#trigger settings - Changes require: rake db:migrate:redo VERSION=20150707153822
