class CreateCoverLetters < ActiveRecord::Migration[5.0]
  def change
    create_table :cover_letters do |t|
        t.text :body

        t.timestamps
    end
  end
end
