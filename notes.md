### todo:
- google: implicitly unwrapped optionals? wtf.

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
- programmatic constraints, margins,  #FUZZY
- segmented control
- programmatic controls #FUZZY

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
