class AddPlaintextPasswordToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :plaintext_password, :string
  end
end
