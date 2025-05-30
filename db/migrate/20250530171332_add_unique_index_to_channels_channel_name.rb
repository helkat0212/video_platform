class AddUniqueIndexToChannelsChannelName < ActiveRecord::Migration[7.1]
  def change
    add_index :channels, :channel_name, unique: true
  end
end
