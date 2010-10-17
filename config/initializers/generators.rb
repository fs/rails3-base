Rails3Base::Application.configure do
  config.generators do |g|
    g.stylesheets false
    g.helper false
    g.integration_tool false
    g.test_framework  :rspec, :controller_specs => false, :helper_specs => false, :routing_specs => false, :view_specs => false
    g.fixture_replacement :factory_girl, :dir => 'spec/factories'
  end
end
