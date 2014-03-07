require 'cgi'
    
module ActiveBreadcrumbs

  module Breadcrumbs
    class Crumb
      def initialize(title,path)
        @title = title
        @path = path
      end

      def to_bootstrap
        "<li><a href='#{@path}'>#{@title}</a></li>"
      end
    end

    class Crumbs 
      def initialize(crumbs)
        @crumbs = crumbs
      end

      def to_crumbs
        pairs = []
        crumbs = @crumbs.clone
        while !crumbs.empty?
          title = crumbs.shift
          path = crumbs.shift
          pairs << Crumb.new(title,path)
        end
        pairs
      end
    end


    BREADCRUMB_SIZE_LIMIT = 30

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
      #        :separator => "&gt;") %>

      def breadcrumbs(crumbs,opts={})
        if opts[:bootstrap] 
          crumbs = Crumbs.new(crumbs)
          crumbs = crumbs.to_crumbs
          bootstrap_crumbs = crumbs.map(&:to_bootstrap)
          str = bootstrap_crumbs.join
        else
          direction = 'right'                        # Default direction
          separator = breadcrumb_separator_right     # Default separator
          if !opts.empty?
            dir = opts[:direction].to_s
            if dir == 'left'
              direction = dir
              separator = breadcrumb_separator_left
            end
            separator = opts[:separator] if opts[:separator]
          end
          str = ""
          if crumbs.size > 0
            if opts[:css]
              str += '<div id="breadcrumbs">'
            end
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
            if opts[:css]
              str += '</div>'
            end
          end
        end
        defined?(ActionController::Base) ? str.html_safe : str
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
        xtitle = CGI::escapeHTML(truncate(title, breadcrumb_size_limit))
        if is_external_breadcrumb?(url)
          str += "<a href=\"#{url}\" class=\"bt_external\">#{xtitle}</a>"
        else
          str += "<a href='#{url}'>#{xtitle}</a>"
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

      # Returns the maximum allowed size of an individual breadcrumb item,
      # which is defined by the BREADCRUMB_SIZE_LIMIT constant. This method
      # can be overridden to increase the size limit for all breadcrumbs.

      def breadcrumb_size_limit
        BREADCRUMB_SIZE_LIMIT
      end

      def truncate(str, size)
        return str if size >= str.size
        return str[0, size] if str.size <= 3
        str[0, size -3] + '...'
      end

    end # InstanceMethods

  end  # Module

end
