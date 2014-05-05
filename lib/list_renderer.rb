module SimpleNavigation
  module Renderer
    class List < SimpleNavigation::Renderer::Base
      def render(item_container)
        list_content = item_container.items.inject([]) do |list, item|
          li_options = item.html_options.reject {|k, v| k == :link}
          li_content = '<span>' + link_to(item.name, item.url, link_options_for(item)) + '</span>'
          if include_sub_navigation?(item)
            li_content << render_sub_navigation_for(item)
          end
          list << content_tag(:li, li_content, li_options)
        end.join
        if skip_if_empty? && item_container.empty?
          ''
        else  
          content_tag(:ul, list_content, {:id => item_container.dom_id, :class => item_container.dom_class}) 
        end
      end
    end
  end
end
