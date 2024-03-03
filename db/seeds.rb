# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "faker"

caley_workspace_name = "Caley".freeze
ios_team_name = "iOS".freeze
ror_team_name = "Ruby on Rails".freeze

user_names = ["user", "user1", "user2", "user3"]

# Create User for Caley workspace
email = "user@caley.to"
user = User.find_or_create_by!(email:) do |user|
  user.assign_attributes({
    first_name: "user".capitalize,
    last_name: Faker::Name.last_name,
    email: "user",
    password: "password",
    password_confirmation: "password"
  })
end
puts "Created User for Caley workspace - #{user.email}"

# Create Caley workspace
caley_workspace = Workspace.find_or_create_by!(name: caley_workspace_name) do |workspace|
  workspace.assign_attributes({
    name: caley_workspace_name,
    avatar_url: Faker::Company.logo,
    owner: user
  })
end
puts "Created Workspace - #{caley_workspace.name}"

# Create iOS and Ruby on Rails teams for Caley workspace
ios_team = Team.find_or_create_by!(name: ios_team_name) do |team|
  team.assign_attributes({
    name: ios_team_name,
    avatar_url: Faker::Company.logo,
    workspace_id: caley_workspace.id
  })
end
puts "Created Team - #{ios_team.name}"

rails_team = Team.find_or_create_by!(name: ror_team_name) do |team|
  team.assign_attributes({
    name: ror_team_name,
    avatar_url: Faker::Company.logo,
    workspace_id: caley_workspace.id
  })
end
puts "Created Team - #{rails_team.name}"

# Create users and their workspaces
user_names.each do |user_name|
  email = "#{user_name}@caley.to"
  user = User.find_or_create_by!(email:) do |user|
    user.assign_attributes({
      first_name: user_name.to_s.capitalize,
      last_name: Faker::Name.last_name,
      email: user_name,
      password: "password",
      password_confirmation: "password"
    })
  end

  # Create Caley workspace for each user
  name = "#{user.first_name} Workspace"
  caley_personal_workspace = Workspace.find_or_create_by!(name:) do |workspace|
    workspace.assign_attributes({
      name: name,
      avatar_url: Faker::Company.logo,
      owner: user
    })
  end

  # Associate the user with Caley and personal workspace
  caley_personal_workspace.users << user unless caley_personal_workspace.users.include?(user)
  caley_workspace.users << user unless caley_workspace.users.include?(user)

  # Assign users to teams based on requirements
  if ["user", "user1", "user2"].include?(user_name)
    rails_team.users << user unless rails_team.users.include?(user)
  end

  if ["user2", "user3"].include?(user_name)
    ios_team.users << user unless ios_team.users.include?(user)
  end

  # Create email servers for each user
  email_providers = []

  if ["user", "user1"].include?(user_name)
    2.times { email_providers << "gmail.com" }
  elsif user_name == "user2"
    email_providers << "gmail.com"
    email_providers << "outlook.com"
  elsif user_name == "user3"
    2.times { email_providers << "outlook.com" }
  end

  email_providers.each do |provider|
    email_server = EmailServer.find_or_create_by!(
      name: "#{Faker::Company.name} Email Server",
      email: Faker::Internet.email.sub(/@.*/, "@#{provider}"),
      provider: provider,
      imap_server: "imap.#{provider}",
      imap_port: 993,
      imap_ssl: true,
      password: "password",
      user: user
    )

    # Create some sample email threads for each email server
    3.times do
      email_thread = EmailThread.create!(
        user: user,
        email_server: email_server,
        snippet: Faker::Lorem.sentence,
        summary: Faker::Lorem.sentence,
        urgency: rand(5)
      )

      # Create sample messages for each email thread
      2.times do
        Message.create!(
          user: user,
          email_thread: email_thread,
          email_server: email_server,
          sender_name: Faker::Name.name,
          from: Faker::Internet.email,
          to: user.email,
          subject: Faker::Lorem.sentence,
          snippet: Faker::Lorem.sentence,
          body: Faker::Lorem.paragraph,
          summary: Faker::Lorem.sentence,
          urgency: rand(5)
        )
      end
    end
  end

  puts "Loaded workspaces, teams, emails for User - #{user.email}"
end

# Create a user4 for Caley workspace but not part of any team
email = "user4@caley.to"
user4 = User.find_or_create_by!(email:) do |user|
  user.assign_attributes({
    first_name: "user4".capitalize,
    last_name: Faker::Name.last_name,
    email: "user4",
    password: "password",
    password_confirmation: "password"
  })
end

# Create Caley workspace for user4
user4_personal_workspace = Workspace.find_or_create_by!(
  name: "#{user4.first_name} Workspace",
  avatar_url: Faker::Company.logo,
  owner: user4
)

# Associate the user4 with Caley workspace
user4_personal_workspace.users << user4 unless user4_personal_workspace.users.include?(user4)

puts "Loaded workspace for User without team - #{user4.email}"

puts "Seed data created successfully!"
