class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer     :user_id,           { null: false }
      t.string      :title,             { null: false }
      t.string      :text,              { null: false }
      t.integer     :favorite_answer_id

      t.timestamps(null: false)
    end
  end
end
