Spree::Api::BaseController.class_eval do 

  def requires_authentication?
    current_store ? current_store.requires_authentication : Spree::Api::Config[:requires_authentication]
  end
 
end