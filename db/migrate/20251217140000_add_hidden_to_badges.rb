class AddHiddenToBadges < ActiveRecord::Migration[7.1]
  def change
    add_column :badges, :hidden, :boolean, default: false, null: false
  end
end
