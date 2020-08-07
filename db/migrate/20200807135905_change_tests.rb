class ChangeTests < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :author_id, :bigint
    add_foreign_key :tests, :users, column: :author_id, primary_key: "id"
  end
end
