class EntitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group

  def new
    @entity = Entity.new
    @groups = current_user.groups
  end

  def create
    @entity = Entity.new(entity_params)
    @entity.user_id = current_user.id
    @group = Group.find(params[:entity][:group_id])
    if @entity.save
      GroupEntity.create(group: @group, entity: @entity)
      redirect_to group_path(@group), notice: 'Transaction was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_group
    @group = current_user.groups.find(params[:group_id])
  end

  def entity_params
    params.require(:entity).permit(:name, :amount, group_ids: [])
  end
end
