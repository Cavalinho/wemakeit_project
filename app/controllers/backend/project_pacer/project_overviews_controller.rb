module Backend
    module ProjectPacer
        class ProjectOverviewsController < BackendController
            require 'pry'

            def new
                @project_overview = ProjectOverview.new
            end

            def create
                @project_overview = ProjectOverview.new(params.require(:project_overview).permit(:title, :introduction_text, :description))

                if @project_overview.valid?
                    session[:project_overview] = {
                        'title' => @project_overview.title,
                        'introduction_text' => @project_overview.introduction_text,
                        'description' => @project_overview.description
                    }
                    redirect_to new_backend_project_pacer_project_image_path
                else
                    flash[:alert_1] = "required fields missing"
                    render :new
                end
            end
        end
    end
end
