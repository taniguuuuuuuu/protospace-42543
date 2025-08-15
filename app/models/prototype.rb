class Prototype < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :title,      presence: true
  validates :catch_copy, presence: true
  validates :concept,    presence: true

  validates :image,
           attached: true,
           content_type: %w[image/png image/jpg image/jpeg],
           size: { less_than: 5.megabytes }
end
