// this is the page object model for item page
import Page from '../page';


class SearchPage extends Page {

    var pageUrl = 'https://www.walmart.ca/search/';
     
    get result(id)  { return browser.element('//section[@id="shelf-page"]//a[@class="product-link" and contains(@href,"' + id + '")]'); }
 
    /**
     * keyword is: what ever you enter in search box, such as
     *      product id
     *      product description
     *      product description
     */
    open( keyword ) {
        super.open(pageUrl + keyword);
    }

    found(id) {
        isVisible = browser.isVisible(result(id));
        return isVisible;
    }

}

export default new SearchPage();