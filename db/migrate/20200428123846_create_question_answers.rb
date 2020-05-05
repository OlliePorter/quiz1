class CreateQuestionAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :question_answers do |t|
      t.text :text
      t.boolean :correct
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
