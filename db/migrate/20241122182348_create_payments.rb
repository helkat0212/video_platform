class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.references :user, foreign_key: true
      t.decimal :amount, precision: 10, scale: 2
      t.date :date
      t.string :status

      t.timestamps
    end
  end
end
