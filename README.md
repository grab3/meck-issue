# meck-issue
Project for issue encountered with Meck

This is demonstration of the problem happening when runing eunit tests with rebar and using meck. 
Software: 
rebar(2.5.1) built with Erlang 16B03-1

Problem:

Module a executes a test -> module b executes test using test generator function -> module b fails with 
```
undefined
*unexpected termination of test process*
::killed
```

```
rebar eu -v suites=a,b
INFO:  Looking for meck-.* ; found meck-0.8.3 at /Users/grab3/module_test_meck/meck-issue/deps/meck
INFO:  Looking for meck-.* ; found meck-0.8.3 at /Users/grab3/module_test_meck/meck-issue/deps/meck
==> meck-issue (eunit)
INFO:  sh info:
	cwd: "/Users/grab3/module_test_meck/meck-issue"
	cmd: cp -R src/b.erl src/a.erl ".eunit"
INFO:  Skipped src/b.erl
INFO:  Skipped src/a.erl
======================== EUnit ========================
a: setup_test_ (module 'a')...ok
module 'b'

----------------------------------------------------
2015-06-18 11:46:20.258
Calling setup

undefined
*unexpected termination of test process*
::killed

=======================================================
  Failed: 0.  Skipped: 0.  Passed: 1.
One or more tests were cancelled.
ERROR: One or more eunit tests failed.
ERROR: eunit failed while processing /Users/grab3/module_test_meck/meck-issue: rebar_abort
```
