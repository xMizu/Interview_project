class CreateInterviewers < ActiveRecord::Migration[5.2]
  def change
    create_table :interviewers do |t|
      t.string :name
      t.integer :age
      t.string :email
      t.string :company

      t.timestamps
    end
  end
end
