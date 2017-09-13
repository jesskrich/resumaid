class RenameCoverLetterToCustomCoverLetter < ActiveRecord::Migration[5.0]
  def change
      rename_column :posts, :cover_letter, :custom_cover_letter
  end
end
