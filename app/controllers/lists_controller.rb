class ListsController < ApplicationController
  def new
    @list = List.new
  end
  
  def create
    list = List.new(list_params)  #データを受け取り新規登録するためのインスタンス作成
    
    list.save  #データをデータベースに保存するためのsaveメソッドを実行
    
    redirect_to '/top'
  end
  
  def index
    @lists = List.all #Listモデルが、やりとりしているデータ全てを取得し、それを@listsというインスタンス変数に格納するアクション
  end

  def show
  end

  def edit
  end
  
  private 
  
  #ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
  end
  
end
