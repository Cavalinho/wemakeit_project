module Backend
    module ProjectPacer
        class ProjectOwnersController < BackendController
            require 'pry'

            def new
                @project_owner = ProjectOwner.new
            end

            def create
                @project_owner = ProjectOwner.new(project_owner_params)

                if @project_owner.valid?
                  project_params = project_owner_params.merge(
                            goal: session[:project_goal]["goal"],
                            title: session[:project_overview]["title"],
                            introduction_text: session[:project_overview]["introduction_text"],
                            description: session[:project_overview]["description"]
                          )
                    @project = Project.create(project_params)
                    Image.create(file: session[:project_image]["image"], title: session[:project_image]["title"], description: session[:project_image]["description"], project_id: @project.id)
                    redirect_to new_backend_project_pledge_path(@project)
                else
                    flash[:alert_4] = "required fields missing"
                    render :new
                end
            end

            private

            def project_owner_params
                params.require(:project_owner).permit(:owner_email, :owner_name)
            end
        end
    end
end
