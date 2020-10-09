//
//  ProdutoTableViewCell.swift
//  TableView-LojaVirtual
//
//  Created by Fabio Makihara on 07/10/20.
//

import UIKit

/* XIB  -->  é uma VIEW
    XIB vs STORYBOARD
        _ xib é mais rápido pra carregar -> só tem uma tela
        _ xib tem manuteção mais facil do que stoyyboard
 */

class ProdutoTableViewCell: UITableViewCell {
    
    
    // MARK: IBOutlet
    
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var subtituloLabel: UILabel!
    @IBOutlet weak var imageProduto: UIImageView!
    
    
    func setup(produto:Produto?) {
        // guard let -> forma de desempacotar optional
        // Checa se a variável tem valor ou é nil
        // diferença com if let é que a variável criada não fica dentro do escopo de um if
        // _produto -> padrão pra eu saber que a variável era opcional, foi checada e foi desembrulhada
        // se ela estiver vazia, já retorna e nem passa pelas próximas linhas
        guard let _produto = produto else{return}
        
        self.tituloLabel.text = _produto.nome
        self.subtituloLabel.text = _produto.preco
        
        self.imageProduto.image = self.loadImagem(categoria: _produto.categoaria)
        
    }
    
    
    private func loadImagem(categoria:Categorias) -> UIImage? {
        // Imagem pode estar em jpeg ou em png
        switch categoria {
        case .lazer:
            return UIImage(named: "lazer.jpeg")  // se for em jpeg tem que colocar a extensão
        case .eletrodomesticos:
            return UIImage(named: "eletrodomesticos")  // se for em png não precisa colocar a extensão
        case .eletronicos:
            return UIImage(named: "eletronicos.jpeg")
        }
    }
    
    // MARK: awakeFromNib
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    // MARK: setSelected
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
