class IdeasController < ApplicationController
  before_action :set_category

  def create
    @category = Category.create(name: idea_params[:name]) if @category.blank?
    idea = Idea.new(body: idea_params[:body], category_id: @category.id)
    if idea.save
      render json: { status: 201 }
    else
      render json: { status: 422 }
    end
  end

  def index
    if idea_params[:name].nil?
      ideas = Idea.includes(:category)
      render json: ideas
    else
      ideas = @category.ideas
      render json: ideas
    end
  end

  private

  def idea_params
    params.permit(:body, :name)
  end

  def set_category
    @category = Category.find_by(name: idea_params[:name])
  end
end
