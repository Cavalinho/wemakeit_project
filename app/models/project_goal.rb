class ProjectGoal
    include ActiveModel::Model
    attr_accessor :goal
    validates :goal, numericality: { only_integer: true }
    validates_presence_of :goal
end

