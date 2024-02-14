class User < ApplicationRecord
  has_secure_password

  belongs_to :team
  accepts_nested_attributes_for :team

  validates :email, presence: true, uniqueness: true
  normalizes :email, with: ->(email) { email.strip.downcase }

  generates_token_for :password_reset, expires_in: 15.minutes do
    password_salt&.last(10)
  end

  before_save :postfix_email

  private

  def postfix_email
    self.email = "#{email}@caley.io" unless email.include?("@caley.io")
  end
end
