# ShapeSearch

## Change Log

2016-Sep-14: Updated for 10.0.1

2016-Sep-6: First version. Book is incomplete, but a proof-of-concept of the authoring system

## About

ShapeSearch is an iOS Swift Playground Book to teach binary search hosted in an app project to allow building, LiveView running, and unit-testing.

It uses [PlaygroundSupportMock](https://github.com/loufranco/playgroundsupportmock) and [pgbookc](https://github.com/loufranco/pgbookc)

If you just want to run the book on your iPad, use AirDrop to share it -- it's in the `book/` folder.

To build, run `carthage bootstrap` in the project root and open `ShapeSearch.xcodeproj` in Xcode 8.  The project is buildable. If you run it, it will load the first page's LiveView (change this in the AppDelegate). There are also unit tests.

To build the `.playgroundbook`, you need `pgbookc`. Run

`pgbookc ShapeSearch/Contents book/Shape\ Search.playgroundbook`