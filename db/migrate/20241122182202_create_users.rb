# Міграція для створення таблиці користувачів
class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :userName, null: false
      t.string :email, null: false
      t.string :password_digest, null: false  # Це поле обов'язкове для has_secure_password
      t.string :role

      t.timestamps
    end
  end
end

