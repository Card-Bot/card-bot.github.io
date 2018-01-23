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

            site.pages << JsonPage.new(site, category, i)

          end
        end
      end
    end
  end
end

end
end
