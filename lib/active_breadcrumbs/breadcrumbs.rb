module ActiveBreadcrumbs

  module Breadcrumbs

    def self.included(klass)
      klass.send(:extend, ClassMethods)
      klass.send(:include, InstanceMethods)
    end

    module ClassMethods

    end # ClassMethods

    module InstanceMethods

      # Returns a string containing the HTML necessary to display a breadcrumb
      # trail. The first arg contains an array of elements, where the first
      # element is the name of a breadcrumb, the second is the associated path,
      # and so on in alternating fashion. The final arg is a hash containing
      # options, where the only option currently defined is "direction". This
      # can have values of either "left" or "right", and governs which way the
      # breadcrumbs will be oriented. The default is "right".
      #
      # An example of the method's usage in a view is:
      #
      # <%= breadcrumbs(
      #        ['Home', 'home_url', 
      #         'Tools', 'tools_url',
      #         'Antimatter', 'antimatter_url'], 
      #        :direction => 'left',
      #         ;separator => "&gt;") %>
  
      def breadcrumbs(crumbs, opts = nil)
        direction = 'right'                        # Default direction
        separator = breadcrumb_separator_right     # Default separator
        if opts != nil
          dir = opts[:direction]
          if dir == 'left'
            direction = dir
            separator = breadcrumb_separator_left
          end
	  separator = opts[:separator] if opts[:separator]
        end
    
        str = ""
        if crumbs.size > 0
          str += '<div id="breadcrumbs">'
          if direction == 'right'
            i = 0
            while i < crumbs.size
              url = crumbs[i + 1]
              str += "&nbsp;#{separator}&nbsp;" if i > 0
              str += build_crumb(crumbs[i], url)
              i += 2
            end
          else # Direction equals left
            i = crumbs.size - 2
            while i >= 0
              url = crumbs[i + 1]
              str += "&nbsp;#{separator}&nbsp;" if i < (crumbs.size - 2)
              str += build_crumb(crumbs[i], url)
              i -= 2
            end
          end

          str += '</div>'
        end
    
        str.html_safe
      end
    
      # Returns TRUE if the provided value is an external URL and FALSE if it
      # represents the name of a controller. External URL's can be easily
      # distinguished because they begin with "http".
  
      def is_external_breadcrumb?(val)
        val.to_s.start_with?('http')
      end
  
      # Returns a string containing the HTML for one breadcrumb link within a
      # breadcrumb trail. The first argument is the title of the link, while the
      # second is the destination URL for the link.
  
      def build_crumb(title, url)
        str = ""
        if is_external_breadcrumb?(url)
          str += "<a href=\"#{url}\" class=\"bt_external\">#{title}</a>"
        else
          str += "<a href='#{url}'>#{title}</a>"
        end
        str
      end

      # Defines the separator used between breadcrumb elements when the
      # breadcrumbs are traversed from right to left, i.e. - the separator
      # points to the left.
  
      def breadcrumb_separator_left
        "&lt;"
      end
  
      # Defines the separator used between breadcrumb elements when the
      # breadcrumbs are traversed from left to right, i.e. - the separator
      # points to the right. This is the direction in which most breadcrumb
      # trails are oriented.
  
      def breadcrumb_separator_right
        "&gt;"
      end
  
    end # InstanceMethods

  end  # Module

end
