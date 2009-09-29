module AdminView
  module Actions
    def path_to_index(options = {})
      polymorphic_path(controller.smart_path, options)
    end

    def link_to_new_action
      if controller.accepted_action?(:new)
        link_to( "#{t('views.add_new_record')} #{controller.model_name.titleize}",
                 new_polymorphic_url(controller.smart_path), :class => :add_new )
      end
    end

    def link_to_edit_action(title, resource)
      rtn = ""
      if controller.accepted_action?(:edit)
        rtn = link_to(title, [:edit] + controller.smart_path(resource), :title => t('views.edit_this_record'))
      end
      rtn
    end

    def link_to_destroy_action(title, resource)
      rtn = ""
      if controller.accepted_action?(:destroy)
        rtn = link_to(title, controller.smart_path(resource),
                      :confirm => t('views.delete_confirm'), :method => :delete,
                      :title => t('views.delete_this_record'), :class => :destroy)
      end
      rtn
    end

    def link_to_show_action(title, resource)
      rtn = ""
      if controller.accepted_action?(:show)
        rtn = link_to(title, controller.smart_path(resource), :title => t('views.see_more'))
      end
      rtn
    end

    def link_to_parent
      context = controller.options[:context]
      caption = context ? @parent.send(context) : @parent.class
      link_to(caption, controller.path_to_parent(@parent))
    end
  end
end

