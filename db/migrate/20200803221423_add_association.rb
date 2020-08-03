class AddAssociation < ActiveRecord::Migration[6.0]
  def change
    change_table :questions do |t|
      t.belongs_to :test
    end
  end
end
