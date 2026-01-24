# patrol_example

A simple example patrol project. 

## Getting Started

- Install patrol_cli by Follow only step 1 and 2 [here](https://patrol.leancode.co/documentation#setup). All Other step is already done for this repo.

Run this command to test whether the setup is successful or not.

```patrol test -t patrol_test/example_test.dart```

Run this command to run integration test (Replace the directory for your test file)

```patrol test -t patrol_test/features/cypher/cypher_flow_test.dart```

On Windows (Untested on Mac) placing test file on other folder will cause the test to error. patrol test only work when put the test file in patrol_test folder.
