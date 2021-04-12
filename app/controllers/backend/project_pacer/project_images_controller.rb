module Backend
    module ProjectPacer
        class ProjectImagesController < BackendController

            def new
                @project_image = ProjectImage.new
            end

            def create
                @project_image = ProjectImage.new(project_image_params)

                if @project_image.valid?
                  session[:project_image] = {
                      'image' => @project_image.image,
                      'title' => @project_image.title,
                      'description' => @project_image.description
                  }
                redirect_to new_backend_project_pacer_project_goal_path
                else
                    flash[:alert_2] = "required fields missing"
                    render :new
                end
            end

            private

            def project_image_params
            params.require(:project_image).permit(
                    :image,
                    :title,
                    :description
                  )
            end
        end
    end
end
