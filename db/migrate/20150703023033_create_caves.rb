class CreateCaves < ActiveRecord::Migration
  def change
    create_table :caves do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
