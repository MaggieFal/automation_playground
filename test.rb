require 'selenium-webdriver'


Selenium::WebDriver::Chrome::Service.driver_path=('/usr/local/bin/chromedriver')
@driver = Selenium::WebDriver.for :chrome

## For Remote Runs i.e. Gitpod ##
# options = Selenium::WebDriver::Chrome::Options.new
#     options.add_argument('--no-sandbox')
#     options.add_argument('--disable-dev-shm-usage')
# Selenium::WebDriver::Chrome::Service.driver_path=('/usr/bin/chromedriver')
# @driver = Selenium::WebDriver.for :chrome, options: options

@driver.get "http://www.saucedemo.com/"

@driver.find_element(id: 'user-name').send_keys('standard_user')
@driver.find_element(id: 'password').send_keys('secret_sauce')
@driver.find_element(css: "[value='LOGIN']").click()

actual_result = @driver.current_url == "https://www.saucedemo.com/inventory.html" ? "passed" : "failed" 
puts "The test #{actual_result}"








@driver.quit