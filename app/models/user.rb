class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable

  has_many :workspaces_users
  has_many :workspaces, through: :workspaces_users
  has_many :teams_users
  has_many :teams, through: :teams_users
  has_many :email_servers
  has_many :messages

  validates :email, presence: true, uniqueness: true
  normalizes :email, with: ->(email) { email.strip.downcase }
  validate :validate_email_format, on: [:create, :update]

  validates :password, presence: true, length: {minimum: 6, maximum: 128}, on: :create
  validates :password, length: {minimum: 6, maximum: 128}, on: :update, allow_blank: true

  before_save :postfix_email

  private

  def validate_email_format
    if email.include?("@")
      errors.add(:email, "must not include an '@' symbol followed by the domain name")
    end
  end

  def postfix_email
    self.email = "#{email}@caley.to" unless email.include?("@caley.to")
  end
end
