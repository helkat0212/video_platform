class RenameChannelNameToChannelNameInChannels < ActiveRecord::Migration[7.1]
  def change
    rename_column :channels, :channelName, :channel_name
  end
end
