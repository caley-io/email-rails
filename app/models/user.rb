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

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string           not null
#  last_name              :string           not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
