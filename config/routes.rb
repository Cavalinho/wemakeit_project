Rails.application.routes.draw do
    resources :welcome, only: %i[index]

    scope module: 'frontend' do

        root 'projects#index'

        resources :projects, param: :id, only: %i[show index] do
            resources :pledges, only: %i[show index]
        end
    end

    #backend
    namespace :backend do
        get '/', to: 'projects#index'

        get 'project/step_2', to: 'projects#step_2'
        get 'project/step_3', to: 'projects#step_3'
        get 'project/step_4', to: 'projects#step_4'
        post 'project/step_5', to: 'projects#step_5'

        namespace :project_pacer do
            resources :project_overviews, only: %i[new create]
            resources :project_goals, only: %i[new create]
            resources :project_owners, only: %i[new create]
            resources :project_images, only: %i[new create]
        end

        resources :projects do
            resources :pledges, only: %i[new create destroy]
        end
    end
end
