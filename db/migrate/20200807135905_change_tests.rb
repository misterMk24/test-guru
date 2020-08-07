class ChangeTests < ActiveRecord::Migration[6.0]
  def change
    change_table :tests do |t|
      t.references :user
    end
  end
end
