class RenameBodyToNotes < ActiveRecord::Migration[5.0]
  def change
      rename_column :posts, :body, :notes
  end
end
