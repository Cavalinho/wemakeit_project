module Backend
    class PledgesController < BackendController
        require "pry"

        before_action :set_project

        def new
            @pledge = Pledge.new
        end

        def create
            @pledge = Pledge.new(params.require(:pledge).permit(:title, :amount, :description))
            @pledge.update(project_id: @project.id)
            if @pledge.save
                redirect_to backend_path
            else
                flash[:alert_5] = "required fields or right format is missing"
                redirect_to new_backend_project_pledge_path(@project)
            end
        end

        def destroy
            @pledge = Pledge.find(params[:id])
            @pledge.destroy
            redirect_to backend_path
        end

        private

        def set_project
            @project = Project.find(params[:project_id])
        end
    end
end
