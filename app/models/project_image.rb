class ProjectImage
    include ActiveModel::Model
    attr_accessor :image, :title, :description
    validates_presence_of :image, :title, :description
end

