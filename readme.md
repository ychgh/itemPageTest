
# project setup
## runtime environment

tests are executed in nodejs/WebdriverIO environment.

## layout

aut/po
	item/
		contains all page level, section based page object model
	home/
		home page object model ( should be the existing one)
		item test specs may have a few dependencies on the home page object
			such as navigate back to home page
		
	shopping-cart/
		for item test specs dependencies purpose
			such as a purchas test lands on the shopping-cart page

	department/
		for item test specs dependencies purpose
			such as test links on breadcrumb then back navigate to item page

	return-help/
		test link on retury policy will land on this page

	device-specified/
		desktop-only/
			responsive tests related po on browser launched from desktop platforms (Windows, Linux, Mac)

		mobile-only/
			responsive tests related po on browser launched from mobile devices ( smart phone, tablet, ...)

features/
	there are feature files that describe the test senarios.

	so far, there are 16 test scenarios are defined in four feature files in this directory.

specs/
	all test specs (mocha tests), which has extension '.spec.js'
		they are also step defintion implementation for cucumber scenarios

	files or directories in this folder:

		functional/
			page component or section based tests
			these tests can be re-used or included in higher order tests (such as keyword tests, or e2e tests)
		performance/
			page component or sectino based performance tests
			can be reused to create e2e tests

		security/
			page component or sectino based security tests
			can be reused to create e2e tests

	
			
		e2e/  
			contains all test scenarios involed all sections on the item page, and cover end user's intention of completing a transaction: 
				browse or search for the item interested
				examine the product: product details 
				examine review/ rating
				inventory status, shipping option, pickup option, 
				purchase/cart control and land @ shopping cart page at the end
				



automation/
	framework will be built in house, on top of mocha (alt: Jasmine), cucumber,galen,webdriverio (or selenium-webdriver )
	cucumber mocha test runner
		execute mocha as cucumber step definition

## create project

	$ npm init

## install main dependencies

	$ npm install webdriverio --save
	$ npm install mocha --save
	$ npm install cucumberjs --save
	$ npm install galenframework-cli --save
	$ npm install appium --save
	$ npm install chai --save
	$ npm install mocha-param --save

# get started 

## create mocha tests to back up test scenarios defined in features/*.feature files.
	tests are saved in 
## create bare framework 
todo 
	to process gherkin file 
	to support @data, @devices tags in gherkin file

	running out of time
	not enough time to create the framework to execute the tests.



## tests created as mocha specs

spec/search.item.spec.js has one scenario implemented, which is defined in search.item.feature file
	scenario name:
		"search item by full product name and open the item page"

spec/product-purchase-spec.js implements two scenarios defined in features/product-purchase.feature

	scenario name:
		"display correct price tag for item"
		"purchase quantity control"


not able to run the mocha specs due to a missing dependencies: 'cucumberParameter'.
it is a customized gherkin parser to process data, devices tags in feature files and inject the proper cucumber parameters in mocha specs 

