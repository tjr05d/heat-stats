class Player < ApplicationRecord
  belongs_to :team

  alias_attribute :salary, :humanized_salary
end
