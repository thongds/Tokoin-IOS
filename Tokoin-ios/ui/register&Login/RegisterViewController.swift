import UIKit
import RxSwift

class RegisterViewController: UIViewController{
    let viewModel = RegisterViewModel()
    private let disposeBag = DisposeBag()
    let loginHeader : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.text="Register"
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .center
        return label
        }()
    let emailCard : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let emailIcon : UIImageView = {
        let image = UIImageView(image: UIImage(named: "emailicon"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    let UserNameTitle : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.text="User Name"
        label.textAlignment = .left
        return label
        }()
    let usernameEdit : UITextField = {
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
        textField.placeholder = "input your password here ..."
        return textField
        }()
    let passwordCardConfirm : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let lockCf : UIImageView = {
        let image = UIImageView(image: UIImage(named: "lock"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    let passwordCf : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.text="Confirm password"
        label.textAlignment = .left
        return label
        }()
    let passwordEditCf : UITextField = {
        let textField = UITextField()
        textField.placeholder = "input your password here ..."
        return textField
        }()
    let registerBtn : UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.cornerRadius = 10
        button.setTitle("Register", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViewAndLayout()
        actions()
        observeData()
    }
    
    func observeData(){
        viewModel.error.observeOn(MainScheduler.instance).subscribe(onNext: {error in
            if(error.httpCode == 403){
                let alert = UIAlertController(title: "Alert", message: error.message, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }).disposed(by: disposeBag)
        viewModel.success.observeOn(MainScheduler.instance).subscribe(onNext: {success in
            self.navigationController?.popViewController(animated: true)
        }).disposed(by: disposeBag)
    }
    
    func actions(){
        registerBtn.addTarget(self, action: #selector(registerToLocal), for: .touchDown)
    }
    @objc func registerToLocal(){
        viewModel.createUser(userName: usernameEdit.text ?? "", password: passwordEdit.text ?? "", confirmPassword: passwordEditCf.text ?? "")
    }
    func addViewAndLayout(){
        view.backgroundColor = .white
        view.addSubview(loginHeader)
        view.addSubview(emailCard)
        view.addSubview(passwordCard)
        view.addSubview(passwordCardConfirm)
        view.addSubview(registerBtn)
        emailCard.addSubview(emailIcon)
        emailCard.addSubview(UserNameTitle)
        emailCard.addSubview(usernameEdit)
        passwordCard.addSubview(lock)
        passwordCard.addSubview(password)
        passwordCard.addSubview(passwordEdit)
        passwordCardConfirm.addSubview(lockCf)
        passwordCardConfirm.addSubview(passwordCf)
        passwordCardConfirm.addSubview(passwordEditCf)
        loginHeader.anchor(view.topAnchor,left: view.leftAnchor,bottom: nil,right: view.rightAnchor,topConstant: 100,leftConstant: 0,bottomConstant: 0,rightConstant: 0, widthConstant: 0, heightConstant: 40)
        emailCard.anchor(loginHeader.bottomAnchor,left: view.leftAnchor,bottom: nil,right: view.rightAnchor,topConstant: 110,leftConstant: 16,bottomConstant: 0,rightConstant: 21, widthConstant: 0, heightConstant: 85)
        emailIcon.anchor(emailCard.topAnchor,left: emailCard.leftAnchor,bottom: nil,right: nil,topConstant: 10,leftConstant: 9,bottomConstant: 0,rightConstant: 0, widthConstant: 20, heightConstant: 16)
        UserNameTitle.anchor(emailIcon.topAnchor,left: emailIcon.rightAnchor,bottom: emailIcon.bottomAnchor,right: nil,topConstant: 0,leftConstant: 13,bottomConstant: 0,rightConstant: 0, widthConstant: 140, heightConstant: 0)
        usernameEdit.anchor(emailIcon.bottomAnchor,left: emailCard.leftAnchor,bottom: nil,right: emailCard.rightAnchor,topConstant: 20,leftConstant: 17,bottomConstant: 0,rightConstant: 21, widthConstant: 0, heightConstant: 25)
        passwordCard.anchor(emailCard.bottomAnchor,left: view.leftAnchor,bottom: nil,right: view.rightAnchor,topConstant: 37,leftConstant: 16,bottomConstant: 0,rightConstant: 21, widthConstant: 0, heightConstant: 85)
        lock.anchor(passwordCard.topAnchor,left: passwordCard.leftAnchor,bottom: nil,right: nil,topConstant: 7,leftConstant: 5,bottomConstant: 0,rightConstant: 0, widthConstant: 24, heightConstant: 24)
        password.anchor(lock.topAnchor,left: lock.rightAnchor,bottom: lock.bottomAnchor,right: nil,topConstant: 0,leftConstant: 12,bottomConstant: 0,rightConstant: 0, widthConstant: 86, heightConstant: 0)
        passwordEdit.anchor(lock.bottomAnchor,left: passwordCard.leftAnchor,bottom: nil,right: passwordCard.rightAnchor,topConstant: 12,leftConstant: 19,bottomConstant: 0,rightConstant: 19, widthConstant: 0, heightConstant: 25)
        passwordCardConfirm.anchor(emailCard.bottomAnchor,left: view.leftAnchor,bottom: nil,right: view.rightAnchor,topConstant: 157,leftConstant: 14,bottomConstant: 0,rightConstant: 23, widthConstant: 0, heightConstant: 85)
        lockCf.anchor(passwordCardConfirm.topAnchor,left: passwordCardConfirm.leftAnchor,bottom: nil,right: nil,topConstant: 7,leftConstant: 5,bottomConstant: 0,rightConstant: 0, widthConstant: 24, heightConstant: 24)
        passwordCf.anchor(lockCf.topAnchor,left: lockCf.rightAnchor,bottom: lockCf.bottomAnchor,right: nil,topConstant: 0,leftConstant: 12,bottomConstant: 0,rightConstant: 0, widthConstant: 164, heightConstant: 0)
        passwordEditCf.anchor(lockCf.bottomAnchor,left: passwordCardConfirm.leftAnchor,bottom: nil,right: passwordCardConfirm.rightAnchor,topConstant: 12,leftConstant: 19,bottomConstant: 0,rightConstant: 19, widthConstant: 0, heightConstant: 25)
        registerBtn.anchor(passwordCard.bottomAnchor,left: view.leftAnchor,bottom: nil,right: view.rightAnchor,topConstant: 156,leftConstant: 21,bottomConstant: 0,rightConstant: 18, widthConstant: 0, heightConstant: 52)
        }
}
