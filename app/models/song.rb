class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: [:artist_name, :release_year] }
  validates :released, inclusion: { in: [true, false] }
  validate :song_released_and_year_is_valid
  # validates :release_year, numericality: { less_than_or_equal_to: DateTime.now.year }, allow_nil: true, if: :not_released?
  validates :artist_name, presence: true

  def song_released_and_year_is_valid
    if released && release_year > DateTime.now.year
      errors.add(:release_year, "cannot be in the future")
    elsif released && release_year.nil?
      errors.add(:release_year, "must include release year")
    end
  end
end
