# cc-lit
This application will generate a series of courses that students should take to improve their competency in reading, given a domain order and a lists of students with optional test results.

All commands in this doc assume you're working directory is the project root.
## Install and Run Tests

```` bundle install ````

```` bundle exec rspec spec ````

## Utilizing The Wildly Simplistic Console Application

The console app is written with defaults in mind for ease of use.

Place files you'd like to use as input in the data directory with the following filenames, run the script, and you're done.

```
    > ruby console/lesson_plan_generator.rb

    Generating lesson plans using "domain_order.csv" and "student_tests.csv" in the data/ directory.
    What would you like to name the file? (Do not include the .csv extension)

    > output

    File written at data/output.
```

## Developer Retrospective
Additional notes for the sake of myself and whoever happens to be interested.
### What went well?
- It works and my schedule working on it was both consistent and maintainable.
- Used TDD from beginning to end and ultimately the app uses very little code to do its job as a result.
- I think the majority of the code is very easy to read and modify.
### What would you do next, given additional time?
- I would refactor the PathGenerator so that one instance of it could generate lesson plans for multiple students. The highest level abstractions of the system could be somewhat simplified as a result. 
- The console app is basically a 5 minute hack to show that the underlying system works. I wouldn't ship that app to... anyone, really. So, a modern interface would be a logical next step.
- I would package the entire underlying system into a gem for reuse with multiple interfaces. 
