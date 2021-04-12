class Image < ApplicationRecord
    belongs_to :project

    has_one_attached :file
    validates_presence_of :title, :description
end
