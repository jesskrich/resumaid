class AddJobTitleToPosts < ActiveRecord::Migration[5.0]
  def change
      add_column :posts, :position_title, :string
  end
end
