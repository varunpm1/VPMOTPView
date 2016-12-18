# VPMOTPView

VPMOTPView is a helper class for displaying OTP entering view. The UI can be customized in different ways. See `Usage` for more info.

## Requirements

1. iOS 8.0 or later.
2. ARC memory management.

## Usage

Drag and drop the folder `VPMOTPView` into your project. Add a view wherever needed in you xib or storyboard and change the parent class of the added view to `VPMOTPView`.

Set the delegate of `VPMOTPView` instance, if needed, to handle 2 protocol methods for identifying if all the codes have been entered and to receive the entered code.

The supported UI are - Circular, Square, Diamond and UnderlinedBottom shaped OTP fields.

The UI can further be modified based on border color, background color, data input type, cursor color, secure field or not, Apple kind of OTP field etc. For a list of possible options please refer `VPMOTPView` class.

# ![Screenshot](/Circular.png)
# ![Screenshot](/Secure.png)
# ![Screenshot](/Square.png)
# ![Screenshot](/AppleFilled.png)
# ![Screenshot](/UnderlinedBottom.png)

## Contributing
**Type - 1**

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

**Type - 2**

1. Create an issue
2. I'll try to add the necessry feature
3. You can download the update code :P

## History

### Version 1.0.0

OTP view displaying with various customizations. It supports circular, square, diamond and underlinedBottom fields with secure entry, different keyboard inputs, filled type and border type. 

## License
MIT License

Copyright (c) 2016 Varun P M

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
