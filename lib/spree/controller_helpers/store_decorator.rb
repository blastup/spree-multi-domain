Spree::Core::ControllerHelpers::Store.class_eval do
  def current_store
    @current_store ||= Spree::Store.current(request.headers['X-Spree-Store-Code'])
  end
end