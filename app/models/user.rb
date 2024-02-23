class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_secure_password

  has_many :workspaces_users
  has_many :workspaces, through: :workspaces_users
  has_many :teams_users
  has_many :teams, through: :teams_users

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
