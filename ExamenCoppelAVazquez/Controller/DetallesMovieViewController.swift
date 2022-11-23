import UIKit

class DetallesMovieViewController: UIViewController {
    
    @IBOutlet weak var Imagen: UIImageView!
    
    @IBOutlet weak var Lenguaje: UILabel!
    
    @IBOutlet weak var Titulo: UILabel!
    
    @IBOutlet weak var Fecha: UILabel!
    
    @IBOutlet weak var Descripcion: UILabel!
    
    
    //------------------------------------------------
    private var detailsMovie = DetailsMovie()
    private var movie : Movie?
    var IdMovie : Int?
//---------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsMovie.GetDetailMovie(idMovie: IdMovie!) { movie, error in
            self.movie = movie
            DispatchQueue.main.async {
                self.loadData()
            }
        }
        }
    //--------------------------------------------
    func loadData(){
        if let url = URL( string:("https://image.tmdb.org/t/p/w1280" + (movie?.posterPath)!))
        {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url)
              {
                DispatchQueue.main.async {
                    self.Imagen.image = UIImage( data:data)
                }
              }
           }
        }
        self.Titulo.text = movie?.title
        //self.Lenguaje.text = movie?.originalLanguage
        self.Fecha.text = movie?.releaseDate
        self.Lenguaje.text = movie?.originalLanguage
        self.Descripcion.text = movie?.overview
    }
    }

