class Micropost < ApplicationRecord
  belongs_to :user
  # allows us to associate an uploaded file with a given model
  has_one_attached :image

  # default_scope -> set the default order in which elements are retrieved from the database
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validates :image,   content_type: { in: %w[image/jpeg image/gif image/png],
                                      message: "must be a valid image format" },
                      size:         { less_than: 5.megabytes,
                                      message:   "should be less than 5MB" }

  # Returns a resized image for display.
  def display_image
    image.variant(resize_to_limit: [500, 500])
  end
end
