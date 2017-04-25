Setting up and using ein with the jupyter system.
=================================================================

1.  Install jupyter, I added xetex here in order to be able to output notebooks
    as pdf files, which in turn requires xetex.
    a.  > apt-get install python3-notebook texlive-xetex python3-nbformat \
        python3-ipykernel
    b.  There are a bunch of other jupyter related packages which are useful,
        too.
    c.  Then be sad because the jupyter in apt-get does not work.
    d.  > apt-get install python3-pip
    e.  > apt-get --purge remove $(dpkg -l | grep jupyter | awk '{print $2}')
    e.  > pip3 install jupyter
    f.  > jupyter notebook password
2.  In emacs, start the jupyter system:
    a. M-x ein:jupyter-server-start, the web browser interface should pop up.
    b. M-x ein:notebooklist-login  (put in the password from 'f' above.
    c. M-x ein:notebooklist-open
    d. Click the kernel to use and then 'new worksheet'

There are a few helpful keystrokes:
* C-c C-a adds a new block above the current block.
* C-c C-t changes the cell type between input, markdown, and raw.
