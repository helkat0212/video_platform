class CreateSubscriptions < ActiveRecord::Migration[7.1]
  def change
    create_table :subscriptions do |t|
      t.references :user, foreign_key: true
      t.references :channel, foreign_key: true
      t.date :startDate
      t.date :endDate

      t.timestamps
    end
  end
end

