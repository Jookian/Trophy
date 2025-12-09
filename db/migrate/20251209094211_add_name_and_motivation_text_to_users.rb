class AddNameAndMotivationTextToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :motivation_text, :text
  end
end
