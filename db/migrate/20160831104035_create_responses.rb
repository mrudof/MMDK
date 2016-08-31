class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer     :respondable_id,   { null: false }
      t.string      :respondable_type, { null: false }
      t.string      :text,            { null: false }
      t.integer     :user_id,         { null: false }

      t.timestamps(null: false)
    end
  end
end
