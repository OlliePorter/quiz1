class CreateQuizzes < ActiveRecord::Migration[6.0]
  def change
    create_table :quizzes do |t|
      t.text :name
      t.text :description

      t.timestamps
    end
  end
end
