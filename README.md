# meck-issue
Project for issue encountered with Meck

This is demonstration of the problem happening when runing eunit using test generator and meck. 
Software: 
tested on MacOS Yosimite, CentOS 6.5

Problem:

Module a executes a test using test generator function -> module b executes test, mecking module a-> module b fails with 
```
undefined
*unexpected termination of test process*
::killed
```

```
1> eunit:test([a,b]).

----------------------------------------------------
2015-06-18 13:39:47.547
Calling setup

undefined
*unexpected termination of test process*
::killed

=======================================================
  Failed: 0.  Skipped: 0.  Passed: 1.
One or more tests were cancelled.
error
```

First revealed when used rebar:
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
In case test generator is not used, both tests pass. 

When using clean Erlang shell issue is not reproduced:

```
3> a:test().
  Test passed.
ok
4> b:test().

----------------------------------------------------
2015-06-18 12:10:34.006
Calling setup

  Test passed.
ok
5>
```
