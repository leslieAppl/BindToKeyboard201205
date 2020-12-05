//
//  ViewController.swift
//  BindToKeyboard201205
//
//  Created by leslie on 12/5/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sendTxtView: UITextField!
    @IBOutlet weak var bindKeyView2: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.bindToKeyboard()

        setupView()
    }

    //MARK: Dismiss Keyboard 1
    func setupView() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
    
    //MARK: Dismiss Keyboard 2
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super.touchesBegan(touches, with: event)
//
//        view.endEditing(true)
//    }


}

//MARK: - Bind to keyboard 1
//extension UIView {
//
//    //    func bindToKeyboard(){
//    //        NotificationCenter.default.addObserver(self, selector: #selector(UIView.keyboardWillChange(_:)), name: NOTIF_KEYBOARD_WILL_CHANGE, object: nil)
//    //    }
//
//    func bindToKeyboard(){
//        NotificationCenter.default.addObserver(self, selector: #selector(UIView.keyboardWillChange(_:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
//    }
//
//    @objc func keyboardWillChange(_ notification: NSNotification) {
//        let duration = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
//        let curve = notification.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
//        let curFrame = (notification.userInfo![UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
//        let targetFrame = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
//        let deltaY = targetFrame.origin.y - curFrame.origin.y
//
//        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIView.KeyframeAnimationOptions(rawValue: curve), animations: {
//            self.frame.origin.y += deltaY
//
//        },completion: {(true) in
//            self.layoutIfNeeded()
//        })
//    }
//}

//MARK: - Bind to keyboard 2 same as 1
extension UIView {
    // Any sub class of UIView can be bound to the Keyboard [ e.g UIButton.bindToKeyboard() ]
    // Bound components have to be under the hierarchy of root 'UIView'.
    func bindToKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(_:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc func keyboardWillChange(_ notification: NSNotification) {
        let duration = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt

    //Identifies the starting frame rectangle of the keyboard in screen coordinates.
         let startingFrame = (notification.userInfo![UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
    //Identifies the ending frame rectangle of the keyboard in screen coordinates.
         let endingFrame = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
         let deltaY = endingFrame.origin.y - startingFrame.origin.y
        
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIView.KeyframeAnimationOptions(rawValue: curve), animations: { self.frame.origin.y += deltaY }, completion: nil)
    }

}
