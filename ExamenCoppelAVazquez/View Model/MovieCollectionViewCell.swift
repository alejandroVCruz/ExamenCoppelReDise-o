import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var Imagen: UIImageView!
    
    @IBOutlet weak var Titulo: UILabel!
    
    @IBOutlet weak var Fecha: UILabel!
    
    @IBOutlet weak var Lenguaje: UILabel!
    
    @IBOutlet weak var Descripcion: UILabel!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

}
