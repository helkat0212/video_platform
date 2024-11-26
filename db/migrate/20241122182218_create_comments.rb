class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :video, foreign_key: true
      t.text :text
      t.date :datePosted

      t.timestamps
    end
  end
end

