class AddChannelToSubscriptions < ActiveRecord::Migration[7.1]
  def change
    add_reference :subscriptions, :channel, null: false, foreign_key: true
  end
end
