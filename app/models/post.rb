class Post < ApplicationRecord
    has_many :comments, dependent: :destroy
    validates :company_name, presence: true, length: { minimum: 2}
    validates :custom_cover_letter, presence: true
end
