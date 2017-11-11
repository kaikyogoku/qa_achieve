class ContactsController < ApplicationController
before_action :set_contact, only: [:edit, :update, :destroy]

  def index
        @contacts = Contact.all
  end

  def new
    if params[:back]
      @contact = Contact.new(contacts_params)
    else
      @contact = Contact.new
    end
  end
  
  def create
    @contact = Contact.new(contacts_params)
    if @contact.save
      # 一覧画面へ遷移して"Tweetを作成しました！"とメッセージを表示します。
      redirect_to contacts_path, notice: "Tweetを作成しました！"
    else
      # 入力フォームを再描画します。
      render 'new'
    end
  end
  
  def edit
  end
  
  def destroy
    @contact.destroy
    redirect_to contacts_path, notice: "Tweetを削除しました！"
  end
  
  def update
    # edit, update, destroyで共通コード

    if @contact.update(contacts_params)
      redirect_to contacts_path, notice: "Tweetを更新しました！"
    else
      render 'edit'
    end
  end

  def create
    @contact = Contact.new(contacts_params)
    if @contact.save
      redirect_to top_index_path, notice: "Tweetありがとうございました！"
    else
      render 'new'
    end
  end
  
  def confirm
    @contact = Contact.new(contacts_params)
    render :new if @contact.invalid?  
  end
  
  private
    def contacts_params
      params.require(:contact).permit(:content, :confirm)
    end
    
    # idをキーとして値を取得するメソッド
    def set_contact
      @contact = Contact.find(params[:id])
    end
end
