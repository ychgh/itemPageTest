// this is the page object model for item page
import Page from '../page';

import Header from './header'

class ItemPage extends Page {

    var pageUrl = 'https://www.walmart.ca/en/ip/intex-metal-frame-pool/6000166640889';

    get itemName()  { return browser.element('xpath of item name').getText(); }
    get itemPrice()  { return browser.element('xpath of item price').getText(); }
    get itemCurrency()  { return browser.element('xpath of item currency').getText(); }
    get searchForm()  { return browser.element('xpath of search form'); }
    get quantityPlus()  { return browser.element('xpath of quantity plus icon'); }
    get quantityMinus()  { return browser.element('xpath of quantity minus icon'); }
    get quantityValue()  { return browser.element('xpath of quantity value input field'); }





    open() {
        super.open(pageUrl);
    }

    isDisplayed() {

        return this.itemName.isVisible() && itemPrice.isVisible();
        
    }


    isSearchFormAvailable() {
        this.searchForm.isVisible();
    }

}

export default new ItemPage();