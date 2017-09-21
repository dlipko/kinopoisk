Rails.application.routes.draw do

	
  resources :movies do
  	resources :reviews, except: [:show, :index]
  end


  devise_for :users
  root to: "movies#index"

  devise_scope :user do
  delete "/users/sign_out" => "devise/sessions#destroy"
end

end
