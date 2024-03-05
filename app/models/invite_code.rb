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

# == Schema Information
#
# Table name: invite_codes
#
#  id         :bigint           not null, primary key
#  token      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_invite_codes_on_token  (token) UNIQUE
#
