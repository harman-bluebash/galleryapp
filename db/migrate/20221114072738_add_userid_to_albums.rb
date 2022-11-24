class AddUseridToAlbums < ActiveRecord::Migration[7.0]
  def change
    add_column :albums, :user_id, :string
  end
end
