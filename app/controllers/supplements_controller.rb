class SupplementsController < ApplicationController
  before_action :authenticate_user!

  def index
    @supplements = Supplement.all
  end

  def new
    @supplement = Supplement.new
  end

  def create
    supplement = Supplement.new(supplement_params)
    supplement.save!
    redirect_to supplements_path, notice: "サプリメント「#{supplement.name}」を登録しました。"
  end

  def edit
    @supplement = Supplement.find(params[:id])
  end

  def update
    supplement = Supplement.find(params[:id])
    supplement.update!(supplement_params)
    redirect_to supplements_path, notice: "サプリメント「#{supplement.name}」 を更新しました。"
  end

  def destroy
    supplement = Supplement.find(params[:id])
    supplement.destroy
    redirect_to supplements_path, notice: "タスク「#supplement.name」を削除しました。"
  end

  private

  def supplement_params
    params.require(:supplement).permit(:name, :supplement_type, :content_size, :daily_intake, :remind)
  end
end
