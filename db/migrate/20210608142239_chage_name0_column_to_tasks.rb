class ChageName0ColumnToTasks < ActiveRecord::Migration[6.0]
  def change
    rename_column :tasks, :name0, :name
  end
end
