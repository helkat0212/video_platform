class ChannelsController < ApplicationController
  before_action :authenticate_user!

  def index
    @channels = Channel.all
  end

  def show
    @channel = Channel.find(params[:id])
  end

  def new
    @channel = Channel.new
  end

  def create
    @channel = Channel.new(channel_params)
    if @channel.save
      redirect_to @channel, notice: 'Channel was successfully created.'
    else
      render :new
    end
  end

  def edit
    @channel = Channel.find(params[:id])
  end

  def update
    @channel = Channel.find(params[:id])
    if @channel.update(channel_params)
      redirect_to @channel, notice: 'Channel was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @channel = Channel.find(params[:id])
    @channel.destroy
    redirect_to channels_url, notice: 'Channel was successfully destroyed.'
  end

  def subscribe
    @channel = Channel.find(params[:id])
    @subscription = Subscription.new(user: current_user, channel: @channel, startDate: Date.today, endDate: Date.today + 30)

    if @subscription.save
      redirect_to @channel, notice: 'Successfully subscribed to the channel.'
    else
      redirect_to @channel, alert: 'Failed to subscribe to the channel.'
    end
  end

  def my_subscriptions
    @subscriptions = current_user.subscriptions
  end

  private

  def channel_params
    params.require(:channel).permit(:channelName, :description, :createDate)
  end
end
