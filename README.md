active_breadcrumbs
===========

This gem makes it easy to generate breadcrumb trails in a Rails application.
The emphasis is on "structural" breadcrumbs, where a breadcrumb trail reflects
the logical structure of a web site (as opposed to a "dynamic" trail, which
reflects where the user has been - for which I humbbly suggest the user take
advantage of the browser's Back button)..

To generate a breadcrumb trail:

      @trail = breadcrumbs(['Home', root_path, 'Admin', admin_path],
                 :direction => 'right', :separator => '&lt;')
	      
The first argument is an array in which alternate elements represent the
link text of a breadcrumb followed by the URL/path. Options include:

   :direction - Legal values of :left and :right, where :right means that the
                trails runs to the right, or vice versa for :left. Defaults
		to :right.

   :separator - The separator to use between breadcrumbs. By default, the
                separator will be "&gt;" or "&lt;" depending on the direction,
		but thedefaults can be overridden by this option.

The breadcrumbs method can be used in both views and controllers. Simply
include the active_breadcrumbs gem in your Gemfile, and the breadcrumbs
method will be available for both Rails views and controllers.

Despite its availability in controllers, the breadcrumbs method is most often
use in views. Typically, a view will have a snippet of code that stores the
breadcrumbs in a variable, such as @trail, which will be referenced in a
layout so that the breadcrumbs trail gets displayed.

The separator can be defined individually for each breadcrumb trail, but this
is tedious. The following code overrides the separator in an initializers
file (which will be placed in the config/initializers directory of your Rails
web site):

    module ActionView

      class Base

        # Overrides the version of this method that is provided by the
        # active_breadcrumbs gem.
 
        def breadcrumb_separator_right
          image_tag('triangle_right.gif')
        end

      end

    end

Initial Genesis
===============

This gem has evolved over time. First, it was an application helper, then a
library method and eventually a plugin. Now it's a gem, which should hopefully
be it's final form. Consequently, a version of this code has been in use for
the KeenerTech.com blog site and several other small web sites for the last
few years.

It's genesis was in a couple of blog entries that were written a few years ago
by David Keener. Note that the original articles are slightly out-of-date now
that Rails 3.0 has come out.

   Creating a Breadcrumb Trail in Rails, Part 1
   http://www.keenertech.com/articles/2008/06/18/creating_a_breadcrumbs_trail1

   Creating a Breadcrumb Trail in Rails, Part 2
   http://www.keenertech.com/articles/2009/12/21/creating-a-breadcrumb-trail-in-rails-part-2

Features
--------

* A simple utility for creating breadcrumb trails as a navigational aid for
  web sites.

* Functionality is available in both Rails views and controllers.

* Easily create breadcrumb trails that run from left-to-right or vice versa.

* Easily override separator definitions to create customized breadcrumb 
  trails, i.e. - breadcrumb trails with a graphic image as a separator.

Examples
--------

    @trail = breadcrumbs(['Home', root_path, 'Admin', admin_path],
               :direction => 'right', :separator => '&lt;')

Requirements
------------

* Requires Rails 3.x.

Install
-------

* gem install active_breadcrumbs

Author
------

Original Author: David Keener

License
-------

The MIT License

Copyright (c) 2012 David Keener

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
