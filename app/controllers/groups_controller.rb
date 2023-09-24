class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = current_user.groups.all
  end

  def new
    @group = current_user.groups.new
  end

  def create
    @group = current_user.groups.new(group_params)
    if @group.save
      redirect_to groups_path, notice: 'Category created successfully.'
    else
      render 'new'
    end
  end

  def show
    @group = current_user.groups.find(params[:id])
    @entities = @group.entities
  end

  def delete_category
    @group = Group.find(params[:id])
    @group.group_entities.destroy_all # Manually delete associated records
    @group.destroy
    redirect_to groups_path, notice: 'Category and associated records deleted successfully.'
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
