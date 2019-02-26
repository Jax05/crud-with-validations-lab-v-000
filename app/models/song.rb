class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: [:artist_name, :release_year] }
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, numericality: { less_than_or_equal_to: DateTime.now.year }, allow_nil: true, if: :not_released?
  validates :artist_name, presence: true

  def not_released?
    released == false
  end
end
