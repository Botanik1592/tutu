class AddUserToTicket < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :user_name, :string
    add_column :tickets, :passport, :string
  end
end
