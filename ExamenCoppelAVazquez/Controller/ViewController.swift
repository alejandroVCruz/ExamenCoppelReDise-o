import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Usuario: UITextField!
    
    @IBOutlet weak var Contraseña: UITextField!
    
    @IBOutlet weak var BotonMostrarContraseña: UIButton!
    
    
    
    private var requestTokenViewModel = RequestTokenViewModel()
    
    
    private var requestToken : RequestToken?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GenerarToken()
    }
    
    
    @IBAction func Ingresar(_ sender: Any) {
         var user : User?
            guard let usuario = self.Usuario.text else {print("Usuario no valido"); return}
            guard let contraseña = self.Contraseña.text else {print("Contraseña no valida"); return}
            guard let token = self.requestToken?.request_token else{return}
            
            user = User(username: usuario, password: contraseña, request_token: token)

        let userViewModel = UserViewModel()
        userViewModel.Login(user: user!) { result, data in
            DispatchQueue.main.async {
        
                if userViewModel.requestToken.success {
                    let alert = UIAlertController(title: "DATOS CORRECTOS", message: "BIENVENIDO", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    self.performSegue(withIdentifier: "MOVIE", sender: self)
                    
                    UserDefaults.standard.set(userViewModel.requestToken.request_token, forKey:"requestToken")
                    UserDefaults.standard.synchronize()
                    
                }else{
                    let alert = UIAlertController(title: "SUCCESS FALSE", message: "HUBO UN ERROR A LA HORA DE INGRESAR", preferredStyle: UIAlertController.Style.alert)
                                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                                        self.present(alert, animated: true, completion: nil)
                }
            }
            }
        }
    func GenerarToken(){
        requestTokenViewModel.GetRequestToken { object, error in
            guard let _ = object else {
                print("Error")
                return
            }
            self.requestToken = object
        }
    }
    
    @IBAction func MostrarContrasena(_ sender: UIButton) {
        BotonMostrarContraseña.isSelected = !BotonMostrarContraseña.isSelected
        Contraseña.isSecureTextEntry = !BotonMostrarContraseña.isSelected
    
    }
}

	
