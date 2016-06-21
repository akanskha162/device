class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :member
  has_many :likes, as: :likeable
  has_many :replies ,:class_name => "Comment",foreign_key: 'reply_id'
  belongs_to :comment ,:class_name => "Comment",foreign_key: 'reply_id'
end
