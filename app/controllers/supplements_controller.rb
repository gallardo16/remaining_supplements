class SupplementsController < ApplicationController
  before_action :authenticate_user!

  def index
    @supplements = current_user.supplements
  end

  def new
    @supplement = Supplement.new
  end

  def create
    @supplement = current_user.supplements.new(supplement_params)
    if @supplement.save
      redirect_to supplements_path, notice: "サプリメント「#{@supplement.name}」を登録しました。"
    else
      render :new
    end
  end

  def edit
    @supplement = current_user.supplements.find(params[:id])
  end

  def update
    @supplement = current_user.supplements.find(params[:id])
    if @supplement.update(supplement_params)
      redirect_to supplements_path, notice: "サプリメント「#{@supplement.name}」を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    supplement = current_user.supplements.find(params[:id])
    supplement.destroy
    redirect_to supplements_path, notice: "サプリメント「#{supplement.name}」を削除しました。"
  end

  private
    def supplement_params
      params.require(:supplement).permit(:name, :supplement_type, :content_size, :daily_intake, :remind)
    end
end
