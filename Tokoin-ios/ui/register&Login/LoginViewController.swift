import UIKit
import RxSwift
class LoginViewController: UIViewController{
    let viewModel = LoginViewModel()
    private let disposeBag = DisposeBag()
    let loginHeader : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.text="Login"
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .center
        return label
        }()
    let userCard : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let emailIcon : UIImageView = {
        let image = UIImageView(image: UIImage(named: "emailicon"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    let userTitle : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.text="User name"
        label.textAlignment = .left
        return label
        }()
    let userEdit : UITextField = {
        let textField = UITextField()
        textField.placeholder = "input your user name here ..."
        return textField
        }()
    let passwordCard : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let lock : UIImageView = {
        let image = UIImageView(image: UIImage(named: "lock"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    let password : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.text="Password"
        label.textAlignment = .left
        return label
        }()
    let passwordEdit : UITextField = {
        let textField = UITextField()
        textField.isSecureTextEntry = true
        textField.placeholder = "input your password here ..."
        return textField
        }()
    let loginBtn : UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.cornerRadius = 10
        button.setTitle("Login", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let createPass : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 0.4274509847164154, green: 0.4274509847164154, blue: 0.43529412150382996, alpha: 1)
        label.text="Create new account"
        label.textAlignment = .left
        label.isUserInteractionEnabled = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViewAndLayout()
        actions()
        observeData()
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }

    func observeData(){
        viewModel.error.observeOn(MainScheduler.instance).subscribe(onNext: {error in
            if(error.httpCode == 404){
                let alert = UIAlertController(title: "Alert", message: error.message, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }).disposed(by: disposeBag)
        
        viewModel.userName.observeOn(MainScheduler.instance).subscribe(onNext: {success in
            AppConfig.saveUserName(success)
            self.navigationController?.popViewController(animated: false)
        }).disposed(by: disposeBag)
        
    }
    
    func addViewAndLayout(){
        view.backgroundColor = .white
        view.addSubview(loginHeader)
        view.addSubview(userCard)
        view.addSubview(passwordCard)
        view.addSubview(loginBtn)
        view.addSubview(createPass)
        userCard.addSubview(emailIcon)
        userCard.addSubview(userTitle)
        userCard.addSubview(userEdit)
        passwordCard.addSubview(lock)
        passwordCard.addSubview(password)
        passwordCard.addSubview(passwordEdit)
        loginHeader.anchor(view.topAnchor,left: view.leftAnchor,bottom: nil,right: view.rightAnchor,topConstant: 150,leftConstant: 0,bottomConstant: 0,rightConstant: 0, widthConstant: 0, heightConstant: 40)
        userCard.anchor(loginHeader.bottomAnchor,left: view.leftAnchor,bottom: nil,right: view.rightAnchor,topConstant: 110,leftConstant: 16,bottomConstant: 0,rightConstant: 21, widthConstant: 0, heightConstant: 85)
        emailIcon.anchor(userCard.topAnchor,left: userCard.leftAnchor,bottom: nil,right: nil,topConstant: 10,leftConstant: 9,bottomConstant: 0,rightConstant: 0, widthConstant: 20, heightConstant: 16)
        userTitle.anchor(emailIcon.topAnchor,left: emailIcon.rightAnchor,bottom: emailIcon.bottomAnchor,right: nil,topConstant: 0,leftConstant: 13,bottomConstant: 0,rightConstant: 0, widthConstant: 100, heightConstant: 0)
        userEdit.anchor(emailIcon.bottomAnchor,left: userCard.leftAnchor,bottom: nil,right: userCard.rightAnchor,topConstant: 20,leftConstant: 17,bottomConstant: 0,rightConstant: 21, widthConstant: 0, heightConstant: 25)
        passwordCard.anchor(userCard.bottomAnchor,left: view.leftAnchor,bottom: nil,right: view.rightAnchor,topConstant: 37,leftConstant: 16,bottomConstant: 0,rightConstant: 21, widthConstant: 0, heightConstant: 85)
        lock.anchor(passwordCard.topAnchor,left: passwordCard.leftAnchor,bottom: nil,right: nil,topConstant: 7,leftConstant: 5,bottomConstant: 0,rightConstant: 0, widthConstant: 24, heightConstant: 24)
        password.anchor(lock.topAnchor,left: lock.rightAnchor,bottom: lock.bottomAnchor,right: nil,topConstant: 0,leftConstant: 12,bottomConstant: 0,rightConstant: 0, widthConstant: 86, heightConstant: 0)
        passwordEdit.anchor(lock.bottomAnchor,left: passwordCard.leftAnchor,bottom: nil,right: passwordCard.rightAnchor,topConstant: 12,leftConstant: 19,bottomConstant: 0,rightConstant: 19, widthConstant: 0, heightConstant: 25)
        loginBtn.anchor(passwordCard.bottomAnchor,left: view.leftAnchor,bottom: nil,right: view.rightAnchor,topConstant: 38,leftConstant: 18,bottomConstant: 0,rightConstant: 21, widthConstant: 0, heightConstant: 52)
        createPass.anchorCenterXToSuperview()
        createPass.anchor(loginBtn.bottomAnchor,left: nil,bottom: nil,right: nil,topConstant: 42,leftConstant: 0,bottomConstant: 0,rightConstant: 0, widthConstant: 0, heightConstant: 25)
    }
    
    func actions(){
        createPass.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openRegister)))
        loginBtn.addTarget(self, action: #selector(login), for: .touchDown)
    }
    @objc func openRegister(){
        navigationController!.pushViewController(RegisterViewController(), animated: true)
    }
    @objc func login(){
        viewModel.login(userName: userEdit.text ?? "", password: passwordEdit.text ?? "")
    }
}
