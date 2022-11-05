/* eslint-env browser */

class LoadingAnimation extends HTMLElement {
  connectedCallback () {
    this.refreshLink.classList.add("is-enhanced");
    setTimeout(this.refresh.bind(this), this.refreshDelay);
  }

  refresh () {
    window.location.replace(this.refreshLink.href);
  }

  get refreshLink () {
    return this.querySelector(".LoadingAnimation_refreshLink");
  }

  get refreshDelay () {
    return parseInt(this.getAttribute("refresh-delay"), 10);
  }
}

customElements.define("loading-animation", LoadingAnimation);
