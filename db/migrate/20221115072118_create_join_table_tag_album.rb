class CreateJoinTableTagAlbum < ActiveRecord::Migration[7.0]
  def change
    create_table :albums_tags, id: false do |t|
      t.bigint :album_id
      t.bigint :tag_id
    end

    add_index :albums_tags, :album_id
    add_index :albums_tags, :tag_id
  end
end
