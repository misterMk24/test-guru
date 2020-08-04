class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :title

      t.timestamps
    end

    change_table :tests do |t|
      t.belongs_to :category, foreign_key: true
    end
  end
end
