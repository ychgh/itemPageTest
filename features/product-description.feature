Feature: item page presents product  description 

    Feature Description:
    just right beside the product image, there are following product description
    . product name
    . product Description
    . rating
    . reviews
    . seller
    . brand 
    and product feature section provide detailed description:
		- detailed description 
			should present detailed description 

    # these annotation are parsed by customized gherkin api
    @data($id='6000166640889')
    @device($device='desktop,iphone,android')
    Scenario: there is correct brief description of product
        Description: 

        Given user open item page of item $id
        Then the product name text is displayed for product $id 
        And the product description text is displayed for product $id 
        And the product brand link is displayed for product $id 
        And the product seller link is displayed for product $id 
        And the product rating value is displayed for product $id 
        And the product review value is displayed for product $id 
        
    # these annotation are parsed by customized gherkin api
    @data($id='6000166640889')
    @device($device='desktop,iphone,android')
    Scenario: there is correct detailed description of product
        Description: 

        Given user open item page of item $id
        And user navigate to "product description and features" section
        Then the product description & features is displayed for product $id 
       
        


       








        
