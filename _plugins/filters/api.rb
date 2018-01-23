module Jekyll
  module Paginate
    module Api

  class Pagination < Generator
    safe true
    priority :lowest

    def generate(site)
      if Paginate::Pager.pagination_enabled?(site)
        site.categories.each do |category, posts|
          total = Paginate::Pager.calculate_pages(posts, site.config['paginate'])
          (1..total).each do |i|
            site.pages << JsonPage.new(site, category, i,site.categories[category])

          end
        end
        total = Paginate::Pager.calculate_pages(site.posts, site.config['paginate'])
        (1..total).each do |i|
            site.pages << JsonPage.new(site, 'all', i,site.posts)
        end  


      end
    end
  end

  class JsonPage < Page
    def initialize(site, category, num_page,posts)
      @site = site
      @base = site.source
      @total = posts.length()
      @current = num_page

      @previous = -1
      @next = -1
      @paginator = Paginate::Pager.new(site, num_page, posts)
      @length = @paginator.posts.length()

      if(@paginator.previous_page)
        @previous = @current - 1
      end
      if(@paginator.next_page)
        @next = @current + 1
      end
      category_dir = site.config['api_category_dir'] || 'api'

      @dir = File.join(category_dir,category)

      #@name = Paginate::Pager.paginate_path(site, num_page)
      #@name.concat '/' unless @name.end_with? '/'

      @name = num_page.to_s + '.json' 

      self.process(@name)

      category_layout = site.config['api_layout'] || '_layouts/api.md'
      self.read_yaml(@base, category_layout)

      self.data.merge!(
                       'title'     => category,
                       'category' => category,
                       'length' => @length,
                       'total' => @total,
                       'current' => @current,
                       'next' => @next,
                       'previous' => @previous,
                       'paginator' => @paginator
                      )
    end
  end


end

end
end
