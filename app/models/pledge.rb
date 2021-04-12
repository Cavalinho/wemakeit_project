class Pledge < ApplicationRecord
    belongs_to :project

    validates :amount, numericality: { only_integer: true }
    validates_presence_of :title, :amount, :description
end
