class CreateTestPassages < ActiveRecord::Migration[6.0]
  def change
    create_table :test_passages do |t|
      t.references :test, foreign_key: true
      t.references :user, foreign_key: true
      t.bigint :current_question_id
      t.integer :correct_questions, default: 0
      t.foreign_key(:questions, column: :current_question_id, primary_key: 'id')
      t.timestamps
    end
  end
end
