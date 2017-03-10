class Bookmark < ApplicationRecord
  belongs_to :user

  # validates :url, format: {with: Regexp.new(URI::regexp(%w(http https)))}, presence: true
end
