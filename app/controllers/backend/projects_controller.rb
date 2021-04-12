module Backend
    class ProjectsController < BackendController

        def index
            @projects = Project.all
        end

        def show
            @project = Project.find(params[:id])
        end

        def destroy
        end
    end
end
