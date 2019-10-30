Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :applications, only: [:create] do 
    	resources :chats, only: [:create, :show] do 
    		resources :messages, only: [:create, :show]
    	end
    end
end
