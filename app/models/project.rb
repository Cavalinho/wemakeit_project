class Project < ApplicationRecord
    has_one :pledge
    has_one :image
    validates :owner_email, length: { maximum: 255 }, presence: true
    validates :goal, numericality: { only_integer: true }
    validates_presence_of :title, :introduction_text, :description, :owner_name
end
