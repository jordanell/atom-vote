module Features
  module DocumentationHelpers
    def api_documentation_page(page = '', version = 'v1')
      "/documentation/api/#{version}/#{page}"
    end
  end
end
