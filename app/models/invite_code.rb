class InviteCode < ApplicationRecord
  before_validation :generate_token, on: :create

  class << self
    def claim!(token)
      find_by(token: token&.downcase)&.destroy!
    end

    def generate!
      create!.token
    end
  end

  private

  def generate_token
    loop do
      self.token = SecureRandom.hex(4)
      break token unless self.class.exists?(token: token)
    end
  end
end
