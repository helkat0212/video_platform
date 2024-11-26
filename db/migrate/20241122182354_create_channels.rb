class CreateChannels < ActiveRecord::Migration[7.1]
  def change
    create_table :channels do |t|
      t.string :channelName
      t.integer :creatorId
      t.text :description
      t.date :createDate

      t.timestamps
    end
  end
end
