# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  author_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Post < ApplicationRecord
    validates :author_id, :body, presence: true

    has_one_attached :photo

    belongs_to :author,
        foreign_key: :author_id,
        class_name: :User

    has_many :comments,
        dependent: :destroy
    
    has_many :likes,
        foreign_key: :likeable_id,
        class_name: :Like,
        dependent: :destroy

    def is_liked(id)
        !self.likes.where("liker_id = ? AND likeable_id = ?", id, self.id).empty?
    end
end
