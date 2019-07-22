class AddStatusAndMessageToInterviews < ActiveRecord::Migration[5.2]
  def change
    add_column :interviews, :status, :string
    add_column :interviews, :message, :string
  end
end
