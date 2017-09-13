class RenameNotesToCoverLetter < ActiveRecord::Migration[5.0]
  def change
      rename_column :posts, :notes, :cover_letter
  end
end
