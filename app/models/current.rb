class Current < ActiveSupport::CurrentAttributes
  attribute :user

  delegate :team, to: :user
end
