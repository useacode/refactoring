Rails.application.routes.draw do
  resources :topics do
    resources :ideas, shallow: true
  end
  devise_for :users, :path => ''
  root                                'pages#home'
  get     'feature'         =>        'pages#feature'
  get     'leaderboard'     =>        'pages#leaderboard'
  get     'support/write'   =>        'pages#write'
  get     'support/howto'   =>        'pages#howto'
  get     'support/report'  =>        'pages#report'
  get     'support'         =>        'pages#support'
  get     'feedline'        =>        'topics#feedline'
  get     'my_idea'         =>        'ideas#my_idea'
  get     'my_topic'        =>        'topics#my_topic'
  get ':username', to: 'profiles#show', as: :profile
  get ':username/edit', to: 'profiles#edit', as: :edit_profile
  patch ':username/edit', to: 'profiles#update', as: :update_profile
end
