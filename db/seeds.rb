# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create the default user
user = User.create_or_find_by!(
  first_name: "Jeremy", last_name: "Caley", email: "jeremy",
  password: "password", password_confirmation: "password"
)

user.workspaces.create_or_find_by!(name: "Caley", owner_id: user.id)
puts "Workspace created: #{user.workspaces.first.name}"

user.teams.create_or_find_by!(name: "Caley", workspace_id: user.workspaces.first.id)
puts "Team created: #{user.teams.first.name}"
