 # these annotation can be specified @ Feature level so that all scenarios will access;  are parsed by customized gherkin api
    # imageIcons specified image files saved locally where the tests is running. these images are retrieved from the item page under testing
    @data($imageIcons='[1.icon.png, 2.icon.png,3.icon.png]')
    # images specifies image files saved locally where the tests is running. these images are retrieved from the item page under testing
    # this is done/prepared during test data preparation
    @data($image='[1.png, 2.png,3.png]')
    @data($id='6000166640889')
    @device($device='desktop,iphone,android')
    # these annotation are parsed by customized gherkin api
  
Feature: item page presents product images 

    Feature Description:
    At the top section of the page, there is product image section presents the following:
	    - slider
			- active slide
				expect correct image is displayed properly
			
		- carousel
			- carousel slide
				exercise each slide and examine image in active slide
			- carousel slide control (vertical)
				previous/up arrow control
					expect that each click will replace active slide image in slider with the image above 
					expect that the behaviour of 

				next/down arrow control
					expect that each click will replace active slide image in slider with the image below
				

				
		- zoom control
			- open zoom
				- should display the same image as in carousel slide
				- should have the same product name as title of the zoom form
			
			- close zoom
				- should close the form

			- carousel-track
				- should display horizontally same sequence images as in carousel  
				- click on each image on track 
					clicked image should be displayed in the zoom container
					clicked image should be displayed in the active slide 

			- zoom plus button
				should zoom in the image on display
			
			- zoom minus button
				should zoom out the image on display

			- zoom refresh button
				should back to original image size when the zoom form is displayed


   Scenario: active image slide
        Description: 
	    - slider
			- active slide
				expect correct image is displayed properly
	
        Given user open item page of item $id
        Then image slider displays product image $images[1] for product $id 
        # verify that the carousel has the correct number of image displayed
        And image carousel displays image $imageIcons[1] 
       
   Scenario: carouse slide control: displays each image in carousel slide 
        Description: 
		- carousel
			- carousel slide
				exercise each slide and examine image in active slide
				previous/up arrow control
					expect that each click will replace active slide image in slider with the image above 
					expect that the behaviour of 

				next/down arrow control
					expect that each click will replace active slide image in slider with the image below
	
        Given user open item page of item $id
        Then image slider displays product image $images[1] for product $id 
        And image slider holds $imageIcons.size image icons for product $id 
        When click on carousel up arrow
        # expectation: first image is already displayed, and use up arrow to move to previous/above should still select the first image
        Then active slide displays $images[1]
        When click on carousel down arrow
        Then active slide displays $images[2]
        When click on carousel down arrow
        Then active slide displays $images[4]
        When click on carousel down arrow
        # expectation: last image is already displayed, and use down arrow to move to next/below should still select the last image
        Then active slide displays $images[4]


   Scenario: open and close zoom 
		- zoom control
			- open zoom
				- should display the same image as in carousel slide
				- should have the same product name as title of the zoom form
	    Given user open item page of item $id
        Then image slider displays product image $images[1] for product $id 
        When click zoom button to open zoom control form
        Then zoom form is displayed
        When close the zoom form
        Then zoom form is not displayed

    Scenario: exercise carouse track in zoom form
			- carousel-track
				- should display horizontally same sequence images as in carousel  
				- click on each image on track 
					clicked image should be displayed in the zoom container
					clicked image should be displayed in the active slide 

			- zoom plus button
				should zoom in the image on display
			
			- zoom minus button
				should zoom out the image on display

			- zoom refresh button
				should back to original image size when the zoom form is displayed
	    Given user open item page of item $id
        When click zoom button to open zoom control form
        Then zoom form is displayed
        Then click each image on track and image is displayed
            | @iamges[1] |
            | @iamges[2] |
            | @iamges[3] |
            | @iamges[4] |
        When zoom in the image
        Then display increased image in zoom 
        When zoom out the image
        Then display decreased image in zoom 
        When zoom out the image
        Then display decreased image in zoom 
        When refresh the zoom image
        Then display image in original size in zoom 
        When close the zoom form
        Then zoom form is not displayed




 







        
