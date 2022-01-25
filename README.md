# Props

## A collection of reusable SwiftUI components

Note this is prerelease software subject to robust changes.

### Background

The props concept grew from a collaboration between the designer and development teams while building rapid prototypes. Working together, we saw the parallels between what we were doing and what a photo stylist and photographer do during a photo shoot. From this, the idea of a catalog of props, reusable visual elements, grew and became this repository. 

These components largely leverage the styling system of SwiftUI. For example, all of the button Props are implemented as ButtonStyles. To use one, import Props into your project and apply a button style like `Button(...).buttonStyle(HandwrittenButtonStyle())`

The Catalog project under Examples shows all of the Props and some additional third party UI components available in swift packages. These are shown in cards that include the name of the style and provide a code sample for each card. The catalog app also demonstrates the built-in system styles for reference.

### Installation

Add Props to your project through Xcode by adding a project with the repository's url. 

### Usage

Examine the Catalog sample application for usage examples of all props in this repo plus some other cool UI elements we've found in our github travels. As most of the Props follow SwiftUI's styling approach, their use follows the pattern of:

```swift
    Button {} label: {
        Text("Handwritten Button")
    }
    .buttonStyle(HandwrittenButtonStyle())
```
where `Button {} ...` is a normal SwiftUI Button and `HandwrittenButtonStyle` is a `ButtonStyle` Prop.

## License

Props is free software distributed under the terms of the MIT license, reproduced below. Props may be used for any purpose, including commercial purposes, at absolutely no cost. No paperwork, no royalties, no GNU-like "copyleft" restrictions. Just download and enjoy.

Copyright (c) 2022 [Small Planet Digital, LLC](http://smallplanet.com)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## About Small Planet

Small Planet is a mobile agency in Brooklyn, NY that creates lovely experiences for smartphones and tablets. Props has made our lives a lot easier and we hope it does the same for you. You can find us at [smallplanet.com](http://smallplanet.com).
