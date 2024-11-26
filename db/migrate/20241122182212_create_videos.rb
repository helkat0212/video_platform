class CreateVideos < ActiveRecord::Migration[7.1]
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.string :url
      t.date :uploadDate
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

