ActiveAdmin.register AgentRole do
  menu :parent => "Other Entities"
  config.sort_order = "name"

  before_destroy :check_dependent

  controller do
    def check_dependent(object)
      if object.item_agents.count > 0
        flash[:error] = "ERROR: Role used in items - cannot be removed."
        return false
      end
    end
  end
end
