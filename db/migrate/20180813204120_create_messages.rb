class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :user_uid
      t.string :username
      t.string :message
    end
  end
end
