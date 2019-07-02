function setDocLink() {
    var div = document.createElement('div');
    div.className = 'doc-link';
    div.innerHTML = '<a class="reference internal" href="https://docs.vostok.io/vostokdocs.pdf">Документация</a>' +
        '<span class="doc-link__label">.pdf</span>';
    var menu = document.querySelector('.wy-side-scroll');
    menu.appendChild(div);
}

document.addEventListener("DOMContentLoaded", setDocLink);
