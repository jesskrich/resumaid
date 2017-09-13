class AddNameToCoverLetters < ActiveRecord::Migration[5.0]
  def change
      add_column :cover_letters, :name, :string
  end
end
