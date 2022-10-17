Rails.application.routes.draw do
  get 'lists/new' #投稿ページの表示
  post 'lists' => 'lists#create'
  get 'lists' => 'lists#index' #一覧の表示
  get 'lists/show' #内容の表示
  get 'lists/edit' #内容の編集
  get '/top' => 'homes#top'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
