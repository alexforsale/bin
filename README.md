#+TITLE: Compilation of My Scripts
#+AUTHOR: Christian Alexander

* logcatnow

A script for automatically saves adb logcat outputs into files. By
default it will create logs in ~/logs:

#+begin_src shell
logcatnow
#+end_src

Will create a logfile in ~/logs. Alternate path can be used as a parameter.

#+begin_src shell
logcatnow [path]
#+end_src
