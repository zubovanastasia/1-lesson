import UIKit


class ViewController: UIViewController {

    @IBOutlet private weak var ScrollView: UIScrollView!
    @IBOutlet private weak var LoginText: UITextField!
    @IBOutlet private weak var PassText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGesture()
    
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
            
        if login == "admin" && pass == "123456" {
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

