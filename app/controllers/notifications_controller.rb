class NotificationsController < ApplicationController
  include SmsTool

  before_filter :authenticate

  def create
    @notification = Notification.new(notification_params)

    respond_to do |format|
      if @notification.save
        SmsTool.send_sms(@notification.phone, @notification.body, @notification.source_app)
        format.json { render action: 'show', status: :created, location: @notification}
      else
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @notification = Notification.find(params[:id])
  end

  private

    def notification_params
      params.require(:notification).permit(:phone, :body, :source_app)
    end

    def authenticate
      authenticate_or_request_with_http_basic do |source_app, api_key|
        client = Client.find_by_source_app(source_app)
        client && client.api_key == api_key
      end
    end
end

