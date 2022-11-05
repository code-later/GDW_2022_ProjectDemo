/* eslint-env browser */

class EmbedLink extends HTMLElement {
  connectedCallback () {
    this.loadContent();
  }

  loadContent (ev) {
    this.classList.add("is-loading");

    const rejectIfNotOK = (response) => {
      return response.ok ? response : Promise.reject(new Error(response.statusText));
    };

    const headers = {
      "X-Embed-Link": "True"
    };

    fetch(this.url, { credentials: "include", headers })
      .then(rejectIfNotOK)
      .then(response => response.text())
      .then(text => {
        this.classList.remove("is-loading");

        // To ensure a correct loading of custom elements (and pony fills) it
        // is necessary to invoke the fetched data via an html element object
        this.outerHTML = text;

        return null;
      })
      .catch((e) => {
        this.remove();
        console.error(`Failed to embed link ${this.url}`, e);
      });

    if (ev) {
      ev.preventDefault();
    }
  }

  get url () {
    return this.querySelector("a").getAttribute("href");
  }
}

customElements.define("embed-link", EmbedLink);
