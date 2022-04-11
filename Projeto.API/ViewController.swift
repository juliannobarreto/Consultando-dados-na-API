//
//  ViewController.swift
//  Projeto.API
//
//  Created by user212674 on 4/6/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: "https://reqres.in/api/users") {
            
            let tarefa = URLSession.shared.dataTask(with: url) { dados, requisicao, erro in
                
                if erro == nil {
                    if let dadosRetorno = dados {
                        
                        do {
                            
                            let objetoJson = try JSONSerialization.jsonObject(with: dadosRetorno, options: [])
                            print(objetoJson)
                            
                        } catch  {
                            print("Erro ao consultar o retorno!")
                        }
                    }
                    
                    print("Consulta com sucesso!")
                }else{
                    print("Erro ao consultar!")
                }
            }
            tarefa.resume()
        }
        

    }


}

