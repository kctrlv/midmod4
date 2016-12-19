class Link < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :url, presence: true
  validate :url_is_valid

  def url_is_valid
    uri = URI.parse(url)
    unless uri.kind_of?(URI::HTTP) or uri.kind_of?(URI::HTTPS)
      errors.add(:url, "is not a valid URL")
    end
  end
end
