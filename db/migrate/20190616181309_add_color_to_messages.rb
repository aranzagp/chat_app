class AddColorToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :color, :string
  end
end
