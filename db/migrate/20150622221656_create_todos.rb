class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :task
      t.string :location
      t.references :destination

      t.timestamps null: false
    end
  end
end
