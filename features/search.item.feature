Feature: Search form on item page

    Feature Description:
    search form allows user search item by the following keywords
    . product name
    . product Description
    . product name + specification

    @data($id='6000166640889')
    Scenario: search item by full product name and open the item page
        Description: 

        Given user open item page of item $id
        Then user should see the search form right next to logo
        When user search for product name  
            | 'Intex Metal Frame Pool' |
        Then item $id is found on search result list
        When open item $id on search result list
        Then item $id page is displayed

    @data($id='6000166640889')
    Scenario: search item by product name and specification and open the item page
        Description: 

        Given user open item page of item $id
        Then user should see the search form right next to logo
        When user search for product name  
            | 'Intex Metal Frame Pool 7825728211' |
        Then item $id is found on search result list
        When open item $id on search result list
        Then item $id page is displayed





        
