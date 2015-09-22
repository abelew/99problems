// Get the last element of a list.

// The following is a quick example of using node.js within emacs
// The following was copy/pasted from a node tutorial and evaluated
// with 'meta-x js-send-buffer'.

/* var http = require('http');

http.request({ hostname: 'example.com' }, function(res) {
  res.setEncoding('utf8');
  res.on('data', function(chunk) {
    console.log(chunk);
  });
}).end();
*/

var start = [1,2,3,4,5,6];

function get_last (list) {
    var len = list.length;
    var answer = list[len-1];
    console.log("The final element of " + list + " is: " + answer + ".");
    return(1);
}

get_last(start);
