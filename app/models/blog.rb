class Blog < ActiveRecord::Base
  validates :content, presence: true
end
