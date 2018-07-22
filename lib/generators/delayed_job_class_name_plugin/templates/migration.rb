class AddClassNameToDelayedJobs < ActiveRecord::Migration<%= migration_version %>
  def change
    add_column :delayed_jobs, :class_name, :string
    add_index :delayed_jobs, :class_name
  end
end
