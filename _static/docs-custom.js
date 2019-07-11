function setDocLink() {
    var div = document.createElement('div');
    div.className = 'doc-link';
    div.innerHTML = '<a class="reference internal" href="https://docs.vostok.io/vostokdocs.pdf">Документация</a>' +
        '<span class="doc-link__label">.pdf</span>';
    var menu = document.querySelector('.wy-side-scroll');
    menu.appendChild(div);
}

function setLangSwitcherLink() {
    if (window.location.href.indexOf('/en/') === -1) {
        document.getElementById('lang-ru')
            .setAttribute(
                "href",
                window.location.origin + '/en' + window.location.pathname + window.location.hash
            );
    } else {
        document.getElementById('lang-en')
            .setAttribute("href", window.location.href.replace('/en', ''));
    }
}

function main() {
    setDocLink();
    setLangSwitcherLink();
}

document.addEventListener("DOMContentLoaded", main);
