module Backend
    class ProjectsController < BackendController

        def index
            @projects = Project.all
        end

        def show
            @project = Project.find(params[:id])
        end

        def destroy
            @project = Project.find(params[:id])
            @project.destroy
            redirect_to backend_path
        end
    end
end
