module Frontend
    class ProjectsController < FrontendController

        def index
            @projects = Project.includes(:pledge).where.not(pledges: { id: nil })
        end

        def show
            @project = Project.find(params[:id])
        end
    end
end
