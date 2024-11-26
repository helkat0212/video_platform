class RemoveChannelFromSubscriptions < ActiveRecord::Migration[7.1]
  def change
    remove_reference :subscriptions, :channel, null: false, foreign_key: true
  end
end
