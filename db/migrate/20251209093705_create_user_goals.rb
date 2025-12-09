class CreateUserGoals < ActiveRecord::Migration[7.1]
  def change
    create_table :user_goals do |t|
      t.references :goal, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :finished

      t.timestamps
    end
  end
end
