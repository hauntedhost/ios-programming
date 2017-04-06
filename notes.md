### todo:

☐ google: implicitly unwrapped optionals? wtf.
☐ programmatic constraints, margins, fuzzy
☐ programmatic controls are fuzzy
☐ downcasting understanding is fuzzy
☐ alternatives to downcasting?
✔ how to get url to simulator app folder?
☐ in Item.swift, how to inline a dictionary w/ typedef?
☐ named tab behaviors
☐ read docs on NSValue: let lineKey = NSValue(nonretainedObject: touch)

## day 1

- arrays
- optionals
- implicitly unwrapped optionals
- let can be used to _declare_ an optional (outside of repl)
- prefer non-optional types
- prefer optional chaining vs optional binding
- avoid implicitly unwrapped optionals
- sets are rad

## day 3

- views > subviews
- we're building view hierarchies
- mvc
  - model - holds data, knows nothing about ui
  - view - objects visible to user
  - controller - configure views and keep view/model objects in sync

## day 4

- map view
- tab bar controller
- tab bar icons
- programmatic views redux
- programmatic constraints, margins, fuzzy
- segmented control
- programmatic controls are fuzzy

no clue what is happening here:
```swift
segmentedControl.addTarget(
  self,
  action: #selector(MapViewController.mapTypeChanged(_:)),
  for: .valueChanged
)
```

- animations
  - bring in quartzCore
  - ca layer
  - ca basic animation
  - ca keyframe animation
  - ca grouped animation
  - https://www.cocoacontrols.com

## day 5

- downcasting understanding is fuzzy
- alternatives to downcasting?
- url to simulator app folder - how to get
- in Item.swift, how to inline a dictionary w/ typedef?

## day 6

- named tab behaviors
- what is `NSValue(nonretainedObject: touch)`?
