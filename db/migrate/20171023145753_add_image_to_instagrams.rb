class AddImageToInstagrams < ActiveRecord::Migration[5.1]
  def change
    add_column :instagrams, :image, :string
  end
end
