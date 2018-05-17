var expect = require('chai').expect;
var itemPage = require('../../aut/po/item/item.page');
var searchPage = require('../../aut/po/search/search-result.page');


var cucumberParameter = require('todo/cucumber/runner/parameter');

// examine correct price is displayed
describe('display correct price tag for item', function(){

    var id = '';
    var expected_price = '';

    before(function() {
        // $id is parased and provided by cucumberParameter
        id = cucumberParameter.scenario.parameters.id;
        price = cucumberParameter.scenario.parameters.price;


    // step: user open item page of item $id
    it('user open item page of item $id', function(){

        searchPage.open(id);

    });    

    // step: correct price value is displayed for item $id
    it('correct price value is displayed for item $id', function(){

        var price = itemPage.itemPrice;

        expect(price).to.equal(expected_price);

    });



      });
    
   


    // step: correct currency symbol is displayed for item $id
    it('correct currency symbol is displayed for item $id', function(){

        var currency = itemPage.itemCurrency()
        expect(currency).to.equal("$");

        // verifty that we've got what we have searched for:
        // todo
    });

    // step: use quantity plus button increase quantity by 1

    
 
    
});

// scenario purchase quantity control 
describe('purchase quantity control ', function(){

    var id = '';
    var expected_price = '';

    before(function() {
        // $id is parased and provided by cucumberParameter
        id = cucumberParameter.scenario.parameters.id;
        price = cucumberParameter.scenario.parameters.price;


    // step: user open item page of item $id
    it('user open item page of item $id', function(){

        searchPage.open(id);

    });    

    // step: use quantity plus button increase quantity by 1
    it('use quantity plus button increase quantity by 1', function(){

        var quantityValueBefore = parseInt(itemPage.quantityValue.getText());
 
        itemPage.quantityPlus.click(); 

        var quantityValueAfter = parseInt(itemPage.quantityValue.getText());

        expect(quantityValueBefore + 1).to.equal(quantityValueAfter);

    });

    // step: use quantity plus button decrease quantity by 1
    it('use quantity plus button decrease quantity by 1', function(){

        var quantityValueBefore = parseInt(itemPage.quantityValue.getText());
 
        itemPage.quantityPlus.click(); 

        var quantityValueAfter = parseInt(itemPage.quantityValue.getText());

        expect(quantityValueBefore - 1).to.equal(quantityValueAfter);

    });

    // step: 
    it('enter quantity value directly', function(table){

        var expectedQuantity = table.raw[0];
        var quantityValueBefore = parseInt(itemPage.quantityValue.getText());
 
        itemPage.quantityValue.setValue(expectedQuantity); 

        var quantityValueAfter = parseInt(itemPage.quantityValue.getText());

        expect(quantityValueAfter ).to.equal(expectedQuantity);

    });



      });
    
   


    
 
    
});