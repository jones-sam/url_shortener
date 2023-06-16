class Link < ApplicationRecord
  has_many :visits
  validates :url, presence: true
  validates :token, uniqueness: true

  before_validation :generate_token

  def generate_token
    self.token = SecureRandom.urlsafe_base64(6)
  end
end
