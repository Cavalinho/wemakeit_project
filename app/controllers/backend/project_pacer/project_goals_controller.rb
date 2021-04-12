module Backend
    module ProjectPacer
        class ProjectGoalsController < BackendController

            def new
                @project_goal = ProjectGoal.new
            end

            def create
                @project_goal = ProjectGoal.new(project_goal_params)

                if @project_goal.valid?
                  session[:project_goal] = {
                      'goal' => @project_goal.goal
                  }
                redirect_to new_backend_project_pacer_project_owner_path
                else
                    flash[:alert_3] = "required number"
                    render :new
                end
            end

            private

            def project_goal_params
            params.require(:project_goal).permit(
                    :goal
                  )
            end
        end
    end
end
