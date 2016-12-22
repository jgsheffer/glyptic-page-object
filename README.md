#Glyptic Gems - Cucumber Gem Generation

## Description

Glyptic Page Object is meant to be used as a way to create organize and interact with a generic page object model.
Glyptic Page Object can be used with the ruby tools of your choice.  example: Appium, Watir, Selenium etc...

## Setup
add to you bundle file
    ```ruby
    gem 'glyptic_gifs'
    ```
With the rest of your requirements
    require GlypticPageObject


## Creating Page Objects
 
Example:
```ruby

 class ContactPage

 	def send_message()
 	    #This should return the element from the page.
 	    #This is an example using Watir
       $driver.button(:id, "submit")
 	end

 	def email_error()
 		$driver.div(:text, "Please Enter Valid Email address")
 	end
 end
```

## Interacting with Page Objects
Below is an example of how to interact with a page object and an element.
:::::
    Map_example:  {'english name' => [className, 'ruby_file']}
:::::

```ruby
    page_map = {'Home Page' => [HomePage, 'home_page.rb'], 'Contact Page' => [ContactPage, 'contact_page.rb'] }

    page_objects_folder = "#{Dir.pwd}/features/support/pageobjects/"

    @@page_loader = GlypticPageObject.new(page_map, page_objects_folder)

    email_error = @@page_loader.load('Contact Page').get_element('email_error')

    email_error().visible?
```
## Warranty

This software is provided "as is" and without any express or implied
warranties, including, without limitation, the implied warranties of
merchantability and fitness for a particular purpose.