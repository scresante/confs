// ==UserScript==
// @name         remove_fbclid
// @namespace    remove_fbclid
// @version      0.1
// @description  alter facebook links to remove fbclid!
// @author       scresante
// @include      facebook.com
// @grant        none
// @copyright 2018, mesak (https://openuserjs.org/users/mesak)
// @license GPL-3.0-or-later
// ==/UserScript==

function clean_fblink(fblink) {
    // change an l.facebook.com external link to a regular, stripped link
    var retstr = fblink.replace(RegExp('https://l.facebook.com/l.php\\?u=(.*)%3Ffbclid.*'), '$1');
    retstr = decodeURIComponent(retstr);
    return retstr;
}

function clean_node(cur_link) {
    // this function has the side effect of removing all listeners from old and replacing it in the document
    cur_link.classList = [];
    cur_link.removeAttribute('role');
    var new_link = cur_link.cloneNode(true);
    cur_link.parentNode.replaceChild(new_link, cur_link);
    delete cur_link;
}

function add_listeners() {
// add listeners for onClick on any span that is view more comments
// to rerun remove_fbclid after click
}

function remove_fbclid() {
    console.debug('remove_fbclid run');
    var all_links = document.links;
    for (var i=0;i<all_links.length;i++) {
        var cur_link = all_links[i];
        if (! cur_link.href.match('https://www.facebook.com')) {
            if ( cur_link.href.match('https://l.facebook.com/') ) {
                console.debug(i + ': facebook outbound link : ' + cur_link);
                cur_link.href = clean_fblink(cur_link.href);
                console.debug('newlink: ' + cur_link.href);
            } else {
                cur_link.href = cur_link.href.replace(RegExp('(https://.*)\\?fbclid.*'), '$1')
                console.debug('newlink: ' + cur_link.href);
            }
            console.debug('clean_node()');
            clean_node(cur_link);
            }
        }
    return all_links;
}
//(function () {
console.debug('############ running remove_fbclid() ###############');
var all_links = remove_fbclid();
//})();
