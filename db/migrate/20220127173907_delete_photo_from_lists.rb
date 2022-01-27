class DeletePhotoFromLists < ActiveRecord::Migration[6.1]
  def change
    remove_column :lists, :photo
  end
end
