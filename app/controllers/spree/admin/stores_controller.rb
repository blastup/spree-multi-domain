class Spree::Admin::StoresController < Spree::Admin::ResourceController
  include NewslettersParser
  before_action :set_mailchimp_lists, :only => [:edit, :new]

  before_filter :load_payment_methods
  before_filter :load_shipping_methods

  def set_mailchimp_lists
    @mailchimp_lists = get_mailchimp_lists
  end

  def index
    @stores = @stores.ransack({ name_or_domains_or_code_cont: params[:q] }).result if params[:q]
    @stores = @stores.where(id: params[:ids].split(',')) if params[:ids]

    respond_with(@stores) do |format|
      format.html
      format.json
    end
  end

  def create
    if params["store"]["product_image"]
      product_image = Spree::Image.where(:alt => params[:store][:code].to_s + "~generic_product_top_image").first
      product_image.destroy if product_image

      product_image = Spree::Image.create!({:attachment => params["store"]["product_image"], 
                                            :attachment_file_name => params["store"]["product_image"].original_filename, 
                                            :alt => params[:store][:code].to_s + "~generic_product_top_image"})
      params["store"].delete("product_image")
    end

    invoke_callbacks(:create, :before)
    @object.attributes = permitted_resource_params

    if @object.save
      invoke_callbacks(:create, :after)
      flash[:success] = flash_message_for(@object, :successfully_created)
      respond_with(@object) do |format|
        format.html { redirect_to location_after_save }
        format.js   { render :layout => false }
      end
    else
      invoke_callbacks(:create, :fails)
      respond_with(@object) do |format|
        format.html { render action: :new }
        format.js { render layout: false }
      end
    end
  end

  def update
    if params[:remove_product_top_image] && params[:remove_product_top_image] === "true"
      product_image = Spree::Image.where(:alt => @object.code + "~generic_product_top_image").first
      product_image.destroy if product_image
    end

    if params["store"]["product_image"]
      product_image = Spree::Image.where(:alt => @object.code + "~generic_product_top_image").first
      product_image.destroy if product_image

      product_image = Spree::Image.create!({:attachment => params["store"]["product_image"], 
                                            :attachment_file_name => params["store"]["product_image"].original_filename, 
                                            :alt => @object.code + "~generic_product_top_image"})
      params["store"].delete("product_image")
    end

    invoke_callbacks(:update, :before)

    if @object.update_attributes(permitted_resource_params)
      invoke_callbacks(:update, :after)
      respond_with(@object) do |format|
        format.html do
          flash[:success] = flash_message_for(@object, :successfully_updated)
          redirect_to edit_admin_store_path(@object)
        end
        format.js { render layout: false }
      end
    else
      invoke_callbacks(:update, :fails)
      respond_with(@object) do |format|
        format.html { render action: :edit }
        format.js { render layout: false }
      end
    end
  end

  private
    def load_payment_methods
      @payment_methods = Spree::PaymentMethod.all
    end

    def load_shipping_methods
      @shipping_methods = Spree::ShippingMethod.all
    end
end
