class ShortenedUrl < ActiveRecord::Base
  validates :short_url, unique: true, prsence: true
  validates :long_url, presence: true
  validates :submitter_id, presence: true

  belongs_to :submitter,
    class_name: "User",
    foreign_key: :submitter_id,
    primary_key: :id

end
