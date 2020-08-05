class AssociateUserAndTest < ActiveRecord::Migration[6.0]
  def change
    create_table :tests_users do |t|
      t.references :user
      t.references :test
    end
  end
end
