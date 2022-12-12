class AddFavoritesCountToBooks < ActiveRecord::Migration[6.1]
  def self.up
    add_column :books, :favorites_count, :integer, null: false, default: 0
  end

  def self.down
    remove_column :books, :favorites_count
  end
end
