var expect = require('chai').expect;
var searchPage = require('../../aut/po/search/search-result.page');
var itemPage = require('../../aut/po/item/item.page');
var cucumberParameter = require('todo/cucumber/runner/parameter');

// search item 
describe('search item by full product name and open the item page', function(){

    var id = '';

    before(function() {
        // $id is parased and provided by cucumberParameter
        id = ucumberParameter.scenario.parameters.id;

        // open search page by item product id

      });


    // step user open item page of item $id
    it('user open item page of item $id', function(){

        itemPage.open(id);

        // verifty that we've got what we have searched for:
        // todo
    });

    // step: Then user should see the search form right next to logo
    it('user should see the search form right next to logo', function(){

        found = itemPage.isSearchFromAvailable();
        expect(found).to.be.true;

      
    });

    // step: When user search for product name
    it('user search for product name', function(table){

        var productName = table.raw[0];

        searchPage.open(productName);
        found = searchPage.searchResult(productName).found();
        expect(found).to.be.true;

        // verifty that we've got what we have searched for:
        // todo
    });

    // step: item $id is found on search result list
    it('item $id is found on search result list', function(){

        found = searchPage.searchResult(id).found();
        expect(found).to.be.true;

        // verifty that we've got what we have searched for:
        // todo
    });
 

    // step: open item $id on search result list
    it('user open item page $id from search result list', function(){

        searchPage.open(id);
        found = searchPage.searchResult(id).found();
        expect(found).to.be.true;
        found.click();

        // verifty that we've got what we have searched for:
        // todo
    });

    // step: item $id page is displayed
    it('item $id page is displayed ', function(table){

        expect(itemPage.isDisplayed)
      
    });



    
});