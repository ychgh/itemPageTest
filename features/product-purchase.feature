 # these annotation can be specified @ Feature level so that all scenarios will access;  are parsed by customized gherkin api
    # imageIcons specified image files saved locally where the tests is running. these images are retrieved from the item page under testing
    # images specifies image files saved locally where the tests is running. these images are retrieved from the item page under testing
    # this is done/prepared during test data preparation
    @data($priceTag='1.99')
    @data($id='6000166640889')
    @device($device='desktop,iphone,android')
    # these annotation are parsed by customized gherkin api
  
Feature: item page purchase process

   Feature Description:
	- product purchase & shipping section

		- pricing	-> xpath = //div[@data-automation='product-purchase-cartridge' and @data-sku-id='10320406']//sup
			should display correct price tag for the product
			should display correct currency symbol for the product

		- purchase quantity control
			xpath = //div[@data-automation='product-purchase__quantity-controls']
			- decrement button
			- increment button
			- product quantity	-> xpath = //div[@data-automation='product-purchase__quantity-controls']//input[@name='productQty']


		- stock status
			- item in stock
				should display 'Add to cart' button

				- 'Add to cart' by specified quantity number
					specify quantity of product in 'purchase quantity control' section
					should open the 'add to cart' form open
					shopping cart icon should display a quantity number same as the number specified in 'purchase quantity control' section
					close the form
				

				- change the quantity in 'Add to cart' form
					change the quantity in the form
					use 'add to cart' button
					examine the price summary in the form
					examine the quantity in shopping cart
						issue: when click minus button, the number in shopping cart also decreased

				- examine 'item in cart' section
					perform 'add to cart' test
            		'item in your cart' should present the item just added
					use minus control, should decrese the quantity in your cart
					use plus control, should increase the quantity in your cart
					use 'remove' button 
						should remove all quantity of the item from the cart 
					
				

				- use 'continue shopping' button back to item page
				- use 'checkout ' button, navigate to checkout page when quantity shows 1
					issue: when click checkout, 'your shopping cart' shows no items


			

		- item out of stocks
			should present the stock status 'Out of stock'

		- item not sold in my area
				should display 'Not sold in my area' status 


		- shipping option
			- item available for pickup
				examine tab-fulfillment-pickup
				open the pickup option form
				fulfillment pickup should present a number of pick up locations
				the postal code in pickup options is displayed

			- item available for pickup - change postal code
				change postal code
				available pickup locations should be updated
				close the form
				open the form again
				should have the updated postal code 
				should have the same locations before closing the form



			- item available for shipping
				open fulfillment shipping form
				should present shipping method options
				should present shipping date
				should present shipping cost
				should present postal code 

			- item available for shipping - update postal code
				open fulfillment shipping form
				update the postal code
				should present updated shipping method options
				should present updated shipping date
				should present updated shipping cost
				close and re-open the form
				should present the updated postal code
	


			- item available for buy-in-store - change postal code
				change postal code
				available store locations should be updated
				close the form
				open the form again
				should have the updated postal code 
				should have the same locations before closing the form




   Scenario: display correct price tag for item
        Description: 
		- pricing	-> xpath = //div[@data-automation='product-purchase-cartridge' and @data-sku-id='10320406']//sup
			should display correct price tag for the product
			should display correct currency symbol for the product

        Given user open item page of item $id
        Then correct price value is displayed for item $id

		And correct currency symbol is displayed for item $id
       
   Scenario: purchase quantity control
		- purchase quantity control
			xpath = //div[@data-automation='product-purchase__quantity-controls']
			- decrement button
			- increment button
			- product quantity	-> xpath = //div[@data-automation='product-purchase__quantity-controls']//input[@name='productQty']

        Given user open item page of item $id
        And use quantity plus button increase quantity by 1
	    And use quantity minus button decrease quantity by 1
		And enter quantity value directly
			| 100 |
 
   Scenario: purchase quantity control - boundary value
		- purchase quantity control
			xpath = //div[@data-automation='product-purchase__quantity-controls']
			- product quantity	-> xpath = //div[@data-automation='product-purchase__quantity-controls']//input[@name='productQty']

        Given user open item page of item $id
		And enter quantity value directly
			| 256 |
 			| 65536 |
 			| 6294967296 |

   Scenario: purchase quantity control - negative
		- purchase quantity control
			xpath = //div[@data-automation='product-purchase__quantity-controls']
			- product quantity	-> xpath = //div[@data-automation='product-purchase__quantity-controls']//input[@name='productQty']

        Given user open item page of item $id
		And enter quantity value directly is rejected
			| 0 |
 			| -1 |
  			| -65535 |

	# should put the following scenario in sepearate feature file
	# we put in single file just for this demo
    Scenario: purchase item in stock - add to cart
		- stock status
			- item in stock
				should display 'Add to cart' button

				- 'Add to cart' by specified quantity number
					specify quantity of product in 'purchase quantity control' section
					should open the 'add to cart' form open
					shopping cart icon should display a quantity number same as the number specified in 'purchase quantity control' section
					close the form
				
		# use $id which is in stock
        Given user open item page of item $id
		Then purchase control 'Add to cart' is enabled for item $id
		Given enter quantity value directly
			|2|
		When click add to cart control to open 'add to cart' form
		Then shopping cart icon is dispayed with number value '2'
		And close the 'Add to cart' form
		And item is displayed correctly in 'item in your cart' summary
		When remove item in 'item in your cart' summary
		Then shopping cart icon is dispayed with number value '0'
	



    Scenario: purchase item in stock - change quantity in 'Add to cart' form
		- change the quantity in 'Add to cart' form
				change the quantity in the form
				use 'add to cart' button
				examine the price summary in the form
				examine the quantity in shopping cart
					issue: when click minus button, the number in shopping cart also decreased

	    Given user open item page of item $id
		Then purchase control 'Add to cart' is enabled for item $id
		Given enter quantity value directly
			|1|
		When click add to cart control to open 'add to cart' form
		Then shopping cart icon is displayed with number value increased by '1'
		And the price summary is correctly caculated by quantity shown on cart icon and price tag 
		When click plus button on 'add to cart' form
		Then quantity in 'add to cart' is increased by 1
		And shopping cart icon quantity number is not changed
		When click minus button on 'add to cart' form
		Then quantity in 'add to cart' is decreased by 1
		And shopping cart icon quantity number is not changed
		Then enter quantity value directly in 'add to cart' form
		And shopping cart icon quantity number is not changed
		And close the 'Add to cart' form
		And item is displayed correctly in 'item in your cart' summary
		When remove item in 'item in your cart' summary
		Then shopping cart icon is dispayed with number value '0'
	
    Scenario: item in 'Add to cart' form
				- examine 'item in cart' section
				- use 'continue shopping' button back to item page
				- use 'checkout ' button, navigate to checkout page when quantity shows 1
					issue: when click checkout, 'your shopping cart' shows no items
	    Given user open item page of item $id
		Then purchase control 'Add to cart' is enabled for item $id
		Given enter quantity value directly
			|10|
		When click add to cart control to open 'add to cart' form
		Then shopping cart icon is displayed with number value increased by '1'
		And the price summary is correctly caculated by quantity shown on cart icon and price tag 
		When click plus button on 'add to cart' form
		Then quantity in 'add to cart' is increased by 1
		And shopping cart icon quantity number is not changed
			And item is displayed correctly in 'item in your cart' summary
		When remove item in 'item in your cart' summary
		Then shopping cart icon is dispayed with number value '0'
	

   Scenario: continue shopping in 'Add to cart' form
	    Given user open item page of item $id
		Then purchase control 'Add to cart' is enabled for item $id
		When click 'continue shopping' control
		Then user lands on item page of item $id 
		And shopping cart icon is dispayed with number value '0'

   Scenario: checkout in 'Add to cart' form
	    Given user open item page of item $id
		Then purchase control 'Add to cart' is enabled for item $id
		And enter quantity value directly
			| 10 |
		When click add to cart control to open 'add to cart' form
		Then shopping cart icon is dispayed with number value '10'
		And click checkout in 'add to cart' form
		Then user lands on shopping cart checkout page of item $id 
