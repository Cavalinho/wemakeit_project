class ProjectOverview
    include ActiveModel::Model
    attr_accessor :title, :introduction_text, :description
    validates_presence_of :title, :introduction_text, :description
end

