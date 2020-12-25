RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :supplier
  end
  config.current_user_method(&:current_supplier)

  ## == CancanCan ==
  config.authorize_with :cancancan

config.model 'Product' do 
  edit do 
    field :sold_by do
      default_value do
        bindings[:view].current_supplier.company_name
      end
    end
  end 

  show do
    configure :product do
     bindings[:view].current_supplier.products
   end
  end
end


  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
    
    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
