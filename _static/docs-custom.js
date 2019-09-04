function delete_href()
{
let val=document.getElementsByTagName('html')[0].getAttribute('lang');
 let val_lang='en';
 	if (val_lang==val) 
	{ $('#rus_link').remove();}
 }

function setDocLink() {
    var div = document.createElement('div');
    div.className = 'doc-link';
    div.innerHTML =
    '<div id="rus_link">' +
        '<a  class="reference internal" href="https://docs.wavesenterprise.com/vostokdocs.pdf">Документация</a>' +
        '<span class="doc-link__label">.pdf</span>' +
    '</div>';
	div.innerHTML=	 
    '<div class="version-text">Release 0.9.0</div>';
    var menu = document.querySelector('.wy-side-scroll');
    menu.appendChild(div);
    delete_href();
	
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
