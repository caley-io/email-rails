class User < ApplicationRecord
  has_secure_password

  belongs_to :team
  accepts_nested_attributes_for :team

  validates :email, presence: true, uniqueness: true
  normalizes :email, with: ->(email) { email.strip.downcase }

  generates_token_for :password_reset, expires_in: 15.minutes do
    password_salt&.last(10)
  end

  validate :validate_email_format, on: [ :create, :update ]
  before_save :postfix_email

  private

  def validate_email_format
    if email.include?("@")
      errors.add(:email, "must not include an '@' symbol followed by the domain name")
    end
  end

  def postfix_email
    self.email = "#{email}@caley.io" unless email.include?("@caley.io")
  end
end
