require 'rails/generators'
require 'rails/generators/migration'
require 'rails/generators/active_record'

module DelayedJobClassNamePlugin
  class InstallGenerator < Rails::Generators::Base
    include Rails::Generators::Migration

    self.source_paths << File.join(File.dirname(__FILE__), 'templates')

    def create_migration_file
      migration_template('migration.rb', 'db/migrate/add_class_name_to_delayed_jobs.rb', migration_version: migration_version)
    end

    def self.next_migration_number(dirname)
      ActiveRecord::Generators::Base.next_migration_number(dirname)
    end

    private

    def migration_version
      "[#{ActiveRecord::VERSION::MAJOR}.#{ActiveRecord::VERSION::MINOR}]" if ActiveRecord::VERSION::MAJOR >= 5
    end
  end
end
