class Feedback < ApplicationRecord
  validates :content, presence: true
end
