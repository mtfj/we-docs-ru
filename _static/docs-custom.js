function setDocLink() {
    var div = document.createElement('div');
    div.className = 'doc-link';
    div.innerHTML = '<a class="reference internal" href="https://docs.vostok.io/vostokdocs.pdf">Документация</a>' +
        '<span class="doc-link__label">.pdf</span>';
    var menu = document.querySelector('.wy-side-scroll');
    menu.appendChild(div);
}

function setLangSwitcherLink() {
    var ruToggle = document.getElementById('lang-ru');
    var enToggle = document.getElementById('lang-en');
    var ruHref = window.location.href.replace('/en', '');
    var enHref = '';
    if (window.location.pathname !== '/') {
        enHref = window.location.href.replace(window.location.pathname, '/en' + window.location.pathname);
    } else {
        enHref = window.location.href + 'en/';
    }
    enToggle.setAttribute("href", enHref);
    ruToggle.setAttribute("href", ruHref);
}

function main() {
    setDocLink();
    setLangSwitcherLink();
}

document.addEventListener("DOMContentLoaded", main);
