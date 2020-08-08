class ChangeUsers < ActiveRecord::Migration[6.0]
  def change
    add_column(:users, :email, :string, limit: 50, null: false)
    add_index(:users, :username, unique: true)
  end
end
