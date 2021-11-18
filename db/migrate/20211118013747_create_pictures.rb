class CreatePictures < ActiveRecord::Migration[6.1]
  def change
    create_table :pictures do |t|
      t.text :image
      t.text :content
      t.timestamps
    end
  end
end
