class CreateIdeas < ActiveRecord::Migration[6.1]
  def change
    create_table :ideas do |t|
      t.text :body, null: false
      t.bigint :category_id, null: false
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
