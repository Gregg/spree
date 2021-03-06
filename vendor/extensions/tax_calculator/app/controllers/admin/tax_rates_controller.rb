class Admin::TaxRatesController < Admin::BaseController
  resource_controller
  before_filter :load_data
  
  require_role :admin
  
  update.response do |wants|
    wants.html { redirect_to collection_url }
  end
  
  create.response do |wants|
    wants.html { redirect_to collection_url }
  end
    
  private 
  
    def load_data     
      @available_zones = Zone.find :all, :order => :name
      @available_categories = TaxCategory.find :all, :order => :name
    end
end
