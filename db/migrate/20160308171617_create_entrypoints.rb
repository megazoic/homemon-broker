class CreateEntrypoints < ActiveRecord::Migration
  def change
    create_table :entrypoints do |t|
      t.integer :location
      t.integer :status

      t.timestamps null: false
    end
  end
end
