class AddBadgeTable < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :image_ref, null: false
      t.integer :test_passages_amount, default: 0
      t.integer :level
      t.boolean :first_attempt, default: false
      t.references :category, foreign_key: true
      t.index [:category_id, :level, :test_passages_amount], unique: true

      t.timestamps
    end

    create_table :user_badges do |t|
      t.references :badge, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end

    add_column :test_passages, :success, :boolean, default: false
    add_index :categories, :title, unique: true
  end
end
