//
//  ProdutoVC.swift
//  TableView-LojaVirtual
//
//  Created by Fabio Makihara on 02/10/20.
//

import UIKit


class ProdutosVC: UIViewController {
    
    @IBOutlet weak var produtosTableView: UITableView!
    
    var categorias:[String] = ["Eletrônicos", "Lazer", "Eletrodomésticos"]
    
    var produtos:[Produto] = [Produto(nome:"Bicicleta", preco: "R$ 400,00"), Produto(nome:"Bola de futebol", preco:"R$ 10,00"), Produto(nome:"Macbook", preco:"R$ 5.000,00")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // quem vai controlar o produtosTableView (a table view) é essa view controller (ProdutosVC)
        produtosTableView.dataSource = self
    }
    
}



// MARK: Table View Data Source

extension ProdutosVC: UITableViewDataSource {
    
    // No caso, é pra definir o número de categorias
    func numberOfSections(in tableView: UITableView) -> Int {
        return categorias.count  // sempre pega o numero de categorias que tem no array
    }
    
    
    // método essencial para estar em conformidade com o protocolo UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var qtdLinhas = 0
        // OU faz com IF
//        if section == 0 {
//            qtdLinhas = 3
//        } else if section == 1 {
//            qtdLinhas = 2
//        } else {
//            qtdLinhas = 1
//        }

        // OU faz com SWITCH
        switch section {
        case 0:
            qtdLinhas = 3
        case 1:
            qtdLinhas = 2
        default:
            qtdLinhas = 1
        }
        
        return qtdLinhas   // a quantidade de linhas em cada seção (categoria) é a quantidade de produtos
    }
    
    
    // método essencial para estar em conformidade com o protocolo UITableViewDataSource
    // Que tipo de célula eu espero dentro dos índex
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = produtosTableView.dequeueReusableCell(withIdentifier: "ProdutosCell", for: indexPath)
        // PERGUNTA!! -> ele passa por todos os index devido ao .row
        cell.textLabel?.text = produtos[indexPath.row].nome
        cell.detailTextLabel?.text = produtos[indexPath.row].preco
        print(indexPath.row)
        return cell
    }
    
    
    
}
