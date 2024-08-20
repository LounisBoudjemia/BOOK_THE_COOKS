class AddDescriptiontoServices < ActiveRecord::Migration[7.1]
  def change
    add_column :services, :description, :string
  end
end
