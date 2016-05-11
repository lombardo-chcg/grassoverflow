class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text     :content
      t.boolean  :sharpest_blade, default: :false
      t.integer  :question_id
      t.integer  :author_id

      t.timestamps
    end
  end
end
