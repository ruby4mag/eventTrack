ActiveAdmin.register Device do

controller do
    #...
    def permitted_params
      params.permit(:device => [:name, :ts_steps, :commit, :project_id])
      # params.permit! # allow all parameters
    end
  end

# show do
#    h3 device.name
#    div do
#      simple_format markdown(device.ts_steps)
#    end
#  end

show do
    attributes_table_for device do
      row :name
      row "Projects" do
		link_to Project.find(device.project_id).name, admin_project_path(device.project_id)
        end
      row "Details" do
      		markdown(device.ts_steps)
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
