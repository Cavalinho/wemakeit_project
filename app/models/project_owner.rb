class ProjectOwner
    include ActiveModel::Model
    attr_accessor :owner_name, :owner_email
    validates_presence_of :owner_email, :owner_name
end

