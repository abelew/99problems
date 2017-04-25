// Problem 02
// Get the penultimate element of a list.

var start = [1,2,3,4];
penultimate(start);

function penultimate (list) {
    var len = list.length;
    var answer = list[len - 2];
    console.log("Tbe penultimate element of " + list + " is " + answer + ".");
    return(answer);
}


// testing cua
