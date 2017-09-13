class RenameTitleToCompanyName < ActiveRecord::Migration[5.0]
  def change
      rename_column :posts, :title, :company_name
  end
end
