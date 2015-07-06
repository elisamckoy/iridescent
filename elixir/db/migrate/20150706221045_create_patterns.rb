class CreatePatterns < ActiveRecord::Migration
  def change
    create_table :patterns do |t|
      t.string :name
      t.string :first
      t.string :second
      t.string :third

      t.timestamps null: false
    end
  end
end
