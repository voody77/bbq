class SubscriptionsController < ApplicationController
  before_action :set_event, only: [:create, :destroy]
  before_action :set_subscription, only: [:destroy]

  def create
    @new_subscription = @event.subscription.build(subscription_params)
    @new_subscription.user = current_user

      if @new_subscription.save
        redirect_to @event, notice: t('controllers.subscription.created')
      else
        render 'events/show', alert: t('controllers.subscription.error')
      end
  end

  def destroy
    message = {notice: t('controllers.subscription.destroyed')}

    if current_user_can_edit?(@subscription)
      @subscription.destroy
    else
      message = {alert: t('controllers.subscription.error')}
    end

    redirect_to @event, message
  end

  private
    def set_subscription
      @subscription = @event.subscriptions.find(params[:id])
    end

  def set_event
    @event = Event.find(params[:event_id])
  end

    def subscription_params
      params.fetch(:subscription, {}).permit(:user_email, :user_name)
    end
end
