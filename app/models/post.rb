class Post < ApplicationRecord
	belongs_to :user
	validates :subject, presence: true, length: {maximum:60}
	validates :body, presence: true, length: {maximum:140}
end
