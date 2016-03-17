class AddErrorStateToEntrypoints < ActiveRecord::Migration
  def change
    add_column :entrypoints, :error_state, :integer
  end
end
