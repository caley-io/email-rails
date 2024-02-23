class RegistrationsController < Devise::RegistrationsController

  def create
    super do |resource|
      if resource.persisted?
        user = resource
        user.workspaces.create(name: "#{user.first_name}'s Workspace", owner: user)
      end
    end
  end
end
