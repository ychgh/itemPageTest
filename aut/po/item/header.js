class HeaderSection extends Section {

    get logoImage()  { return browser.element('#logo'); }
    get homeLink()  { return browser.element('#logo'); }

    get searchForm() { return browser.element('//form[@data-automation="search-form"]'); }
    get searchInput() { return browser.element('//input[@data-automation="search-form-input"]'); }
    get searchSubmitButton() { return browser.element('//input[@data-automation="search-form-submit"]'); }


    search (keyword) {
        // clear the input field
        this.searchInput.clearElement();
        // enter keyword 
        this.searchInput.setValue(keyword);

        // submit the search
        this.searchForm.submitForm();
    }

}

export default new HeaderSection();