function setDocLink() {
    var div = document.createElement('div');
    div.className = 'doc-link';
    div.innerHTML = '<div class="version-text">Release 1.0.2</div>';
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
