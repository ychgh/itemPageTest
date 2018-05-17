
/**
 * the page object 'Page' contains general attributes and methods that all children will inherit from.
 */

export default class Page {
  constructor() {
    this.title = 'generic page';
  }

  open(url) {
    browser.url( url );
  }
}


