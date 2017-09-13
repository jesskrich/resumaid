class AddJobDescriptionColumnToPosts < ActiveRecord::Migration[5.0]
  def change
      add_column :posts, :job_description, :text 
  end
end
