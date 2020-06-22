require 'rspec'
require 'capybara/cucumber'
require 'site_prism'
require 'selenium-webdriver'
require 'faker'
require 'cpf_faker'

Capybara.register_driver :site_prism do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--headless')
  options.add_argument('--no-sandbox')
  options.add_argument('--disable-dev-shm-usage')
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.configure do |config|
  config.run_server = false
  Capybara.default_driver = :site_prism
  Capybara.page.driver.browser.manage.window.maximize
  config.default_max_wait_time = 10
  config.app_host = 'http://www.lourencodemonaco.com.br/qarentena'
end
