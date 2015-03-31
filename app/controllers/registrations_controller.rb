class RegistrationsController < Devise::RegistrationsController  
    
    before_filter :assign_variable
    
    respond_to :json
    
    private 
    
    def assign_variable
        @cart = current_cart
    
    end
    
    
end 