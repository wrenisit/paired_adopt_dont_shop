Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/shelters', to: 'shelters#index'
  get '/shelters/new', to: 'shelters#new'
  post '/shelters/new', to: 'shelters#create'
  get '/shelters/:id', to: 'shelters#show'
  get '/shelters/:id/edit', to: 'shelters#edit'
  patch '/shelters/:id', to: 'shelters#update'
  delete 'shelters/:id', to: 'shelters#destroy'

  get '/pets', to: 'pets#index'
  get '/pets/:id', to: 'pets#show'
  get '/shelters/:shelter_id/pets', to: 'pets#index'
  get '/shelters/:shelter_id/pets/new', to: 'pets#new'
  post '/shelters/:shelter_id/pets', to: 'pets#create'
  get '/pets/:id/edit', to: 'pets#edit'
  patch '/pets/:id', to: 'pets#update'
  delete '/pets/:id', to: 'pets#destroy'

  get '/shelters/:shelter_id/new_review', to: 'reviews#new'
  post '/shelters/:shelter_id/new_review', to: 'reviews#create'
  delete '/shelters/:id/:review_id', to: 'reviews#destroy'

  get '/shelters/:shelter_id/:review_id/edit', to: 'reviews#edit'
  patch '/shelters/:shelter_id/:review_id/edit', to: 'reviews#update'

  delete '/favorites/:id', to: 'favorites#destroy'
  post '/pets/:pet_id/favorite', to: 'favorites#create'
  get '/favorites', to: 'favorites#index'
  delete '/favorites', to: 'favorites#destroy'


  get '/adopts/new', to: 'adopts#new'
  post '/adopts/new', to: 'adopts#create'
end
