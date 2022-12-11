class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  def self.search_for(content, search)
    if search == "perfect_match"
      @book = Book.where("name LIKE?", "#{content}")
    elsif search == "forward_match"
      @book = Book.where("name LIKE?","#{content}%")
    elsif search == "backward_match"
      @book = Book.where("name LIKE?","%#{content}")
    elsif search == "partial_match"
      @book = Book.where("name LIKE?","%#{content}%")
    else
      @book = Book.all
    end
  end
end
