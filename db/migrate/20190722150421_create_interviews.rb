class CreateInterviews < ActiveRecord::Migration[5.2]
  def change
    create_table :interviews do |t|
      t.belongs_to :applicant, foreign_key: true
      t.belongs_to :interviewer, foreign_key: true
      t.datetime :date

      t.timestamps
    end
  end
end
