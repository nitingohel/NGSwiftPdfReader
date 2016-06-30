# NGSwiftPdfReader
This is a sample project of Swift2x Pdf reader that done by using vrf reader objective c class

# RunTime Output

![ScreenShot](https://github.com/nitingohel/NGSwiftPdfReader/blob/master/reader.gif)

# How to use:

* First you need to create a Bridge header file in to you swift project.
* Then you need to add vfr required file in to you project (that will be attached in my Sample code).
* Now you need to set import statement in to Bridge Header file.

```objective-c
#ifndef Bridge_Header_h
#define Bridge_Header_h
#import "ReaderViewController.h"
#endif /* Bridge_Header_h */
```

* Add this Bridge file in to Project->target-> build Setting -> Objective-c Bridging Header and set Bridge file.
* Now Opne your project View Controller from that you wish to open pdf set Delegate file like:

```objective-c
class ViewController: UIViewController , ReaderViewControllerDelegate {
```

# ViewDiDLoad

```objective-c
override func viewDidLoad() {
        super.viewDidLoad()
        let filepath = (NSBundle.mainBundle().pathForResource("Reader", ofType:"pdf"))! as String

        if let document = ReaderDocument.withDocumentFilePath(filepath, password: "")
        {
            let readerViewController: ReaderViewController = ReaderViewController(readerDocument: document)
            readerViewController.delegate = self
            // Set the ReaderViewController delegate to self
            self.navigationController!.pushViewController(readerViewController, animated: true)
        }
    }
```

That all creadit gose to vfr/Reader i just make this sample using https://github.com/vfr/Reader in swift project

