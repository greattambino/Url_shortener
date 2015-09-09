require 'securerandom'

class ShortenedUrl < ActiveRecord::Base
  validates :short_url, uniqueness: true, presence: true
  validates :long_url, presence: true
  validates :submitter_id, presence: true

  belongs_to :submitter,
    class_name: "User",
    foreign_key: :submitter_id,
    primary_key: :id

  def self.random_code
    random_code = ""
    while random_code == "" || ShortenedUrl.find_by_short_url(random_code)
      random_code = SecureRandom::urlsafe_base64(16)
    end
    random_code
  end

  def self.create_for_user_and_long_url!(user, long_url)
    ShortenedUrl.create!(submitted_id: user.id,
      long_url: long_url,
      short_url: random_code
    )
  end
end
