ActiveAdmin.register Project do

controller do
    #...
    def permitted_params
      params.permit(:project => [:name, :description, :commit, :project_id])
      # params.permit! # allow all parameters
    end
  end



show do
    attributes_table_for project do
      row :name
      row "Architecture" do
                markdown(project.description)
        end
      row :created_at
      row :updated_at
    end
    active_admin_comments
end



# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


end
