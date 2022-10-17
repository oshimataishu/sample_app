class ListsController < ApplicationController
  def new
    @list = List.new
  end
  
  def create
    @list = List.new(list_params)  #データを受け取り新規登録するためのインスタンス作成
    if @list.save
      redirect_to list_path(@list.id)
    else
      render :new
    end
  end
  
  def index
    @lists = List.all #Listモデルが、やりとりしているデータ全てを取得し、それを@listsというインスタンス変数に格納するアクション
  end

  def show
    @list = List.find(params[:id]) #Listモデルがやりとりしているデータのうち指定のものを取得し、それを@listというインスタンス変数に格納するアクション
  end

  def edit
    @list = List.find(params[:id])
  end
  
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end
  
  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to '/lists'
  end
  
  private 
  
  #ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
  
end
