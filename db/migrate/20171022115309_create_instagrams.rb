class CreateInstagrams < ActiveRecord::Migration[5.1]
  def change
    create_table :instagrams do |t|
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end
end
