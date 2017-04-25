# javascript

I am using nodejs and npm to play with javascript.
Emacs' mode js-comint provides a way to evaluate commands much like
one would do in haskell/lisp/etc.

The file node.el contains the lines I added to my emacs
configuration in order to get node.js to work so that I may
quickly/easily send commands to a running node.js process.

1.  Add a package.json in the cwd (use the one here as a template)
2.  npm install -g swank-js if it is not already installed.
    a.  But then be sad because the swank-js in npm is borken.
    b.  > git clone http://github.com/MC-Escherichia/swank-js.git
    c.  > cd swank-js && npm link && cd ../ && npm link swank-js
    d.  Try again.
2.  Start node with swank:
    a.  One may either start swank from the command line:
    > npm run swank
    b.  Or if setup-slime-js is available, M-x slime-js-run-swank
    c.  Or I think just M-x slime-js-jack-in-node
3.  In emacs, invoke slime-connect : localhost:4005




