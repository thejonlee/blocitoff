class Item < ApplicationRecord
  belongs_to :user

  default_scope { order(created_at: :asc) }

  def days_left
    7 - (DateTime.now.to_date - created_at.to_date).to_i
  end
end
