module EventsHelper
  def cant_subscribe
    @event.user == current_user
  end
end
