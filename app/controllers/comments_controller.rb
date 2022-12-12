class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      # 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。
      redirect_to comments_path, notice: "ブログを作成しました！"
    else
      # 入力フォームを再描画します。
      render :new
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to comments_path, notice: "ブログを編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to comments_path, notice:"ブログを削除しました！"

  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  # idをキーとして値を取得するメソッドを追加
  def set_comment
    @comment = Comment.find(params[:id])
  end
end
