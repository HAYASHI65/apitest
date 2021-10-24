class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name, null: false, unique: true
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
