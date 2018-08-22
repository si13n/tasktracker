class Tag < ApplicationRecord
  belongs_to :task
  validates :tag, presence: true
end
