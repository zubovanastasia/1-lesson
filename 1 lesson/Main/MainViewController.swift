import UIKit


class ViewController: UIViewController {

    @IBOutlet private weak var ScrollView: UIScrollView!
    @IBOutlet private weak var LoginText: UITextField!
    @IBOutlet private weak var PassText: UITextField!
    @IBOutlet weak var textPass: UILabel!
    @IBOutlet weak var textLogin: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var vk: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGesture()
        animateTitleAppearing()
        animateTitlesAppearing()
        animateAuthButton()
        animateFieldsAppearing()
    }
    
    func animateTitlesAppearing() {
        let offset = view.bounds.width
        textLogin.transform = CGAffineTransform(translationX: -offset, y: 0)
        textPass.transform = CGAffineTransform(translationX: offset, y: 0)
        UIView.animate(withDuration: 1, delay: 1, options: .curveEaseOut, animations: {
            self.textLogin.transform = .identity
            self.textPass.transform = .identity
            
        },
                       completion: nil)
    }
    
    func animateTitleAppearing() {
        self.vk.transform = CGAffineTransform(translationX: 0, y: -self.view.bounds.height/2)
        
        UIView.animate(withDuration: 1, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            self.vk.transform = .identity
                       },
                       completion: nil)
    }
    
    func animateFieldsAppearing() {
        let fadeInAnimation = CABasicAnimation(keyPath: "opacity")
        fadeInAnimation.fromValue = 0
        fadeInAnimation.toValue = 1
        fadeInAnimation.duration = 1
        fadeInAnimation.beginTime = CACurrentMediaTime() + 1
        fadeInAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        fadeInAnimation.fillMode = CAMediaTimingFillMode.backwards
        
        self.textLogin.layer.add(fadeInAnimation, forKey: nil)
        self.textPass.layer.add(fadeInAnimation, forKey: nil)
    }
    
    func animateAuthButton() {
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 0
        animation.toValue = 1
        animation.stiffness = 200
        animation.mass = 2
        animation.duration = 2
        animation.beginTime = CACurrentMediaTime() + 1
        animation.fillMode = CAMediaTimingFillMode.backwards
        
        self.button.layer.add(animation, forKey: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.addObservers()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.removeObservers()
    }
    private func addGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleGesture))
        self.ScrollView.addGestureRecognizer(gesture)
    }
    @objc private func handleGesture() {
        self.ScrollView.endEditing(true)
    }
    private func addObservers () {
        NotificationCenter.default
            .addObserver(self, selector: #selector(handleKeyboardWillShow) , name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default
            .addObserver(self, selector: #selector(handleKeyboardWillHide), name: UIResponder.keyboardDidHideNotification, object: nil)
        
    }
    
    private func removeObservers () {
        NotificationCenter.default
            .removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default
            .removeObserver(self, name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    @objc private func handleKeyboardWillShow () {
        self.ScrollView.contentInset.bottom += 110
    }
    @objc private func handleKeyboardWillHide () {
        self.ScrollView.contentInset.bottom = 0
    }

    private func ChekPass () {
    let login = self.LoginText.text
        let pass = self.PassText.text
            
        if login == "1" && pass == "1" {
            self.showAdmin()
        } else {
            self.showAlert()
        }

    }
    private func showAdmin () {
        let storyboard = UIStoryboard(name: "TabBar", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController()
        if let viewController = viewController as? TabBarViewController {
            self.present(viewController, animated: true)
        }
    }
    
    private func showAlert () {
        let alertController = UIAlertController(title: "Ошибка",
                                                message: "Введены неверные данные пользователя",
                                                preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        
        alertController.addAction(action)
        
    self.present(alertController, animated: true)
    }
    
    @IBAction private func Button(_ sender: Any) {
        self.ChekPass()
    }
    
}

