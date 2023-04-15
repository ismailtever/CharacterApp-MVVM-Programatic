//
//  RickMortyViewModel.swift
//  CharacterApp-MVVM-Programmatic
//
//  Created by Ismail Tever on 15.04.2023.
//

import Foundation

protocol IRickMortyViewModel {
    func fetchItems()
    func changeLoading()
    
    var rickMortyCharacters: [Result] { get set }
    var rickMortyService: IRickMortyService { get }
    var rickMortyOutPut: RickMortyOutPut? { get }

    func setDelegate(outPut: RickMortyOutPut)
}

class RickMortyViewModel: IRickMortyViewModel {
    var rickMortyOutPut: RickMortyOutPut?
    
    
    func setDelegate(outPut: RickMortyOutPut) {
        rickMortyOutPut = outPut
    }
    
    
    var rickMortyCharacters: [Result] = []
    let rickMortyService: IRickMortyService
    private var isLoading = false
    
    init() {
        rickMortyService = RickMortyService()
    }

    func fetchItems() {
        changeLoading()
        rickMortyService.fetchAllDatas { response in
            self.changeLoading()
            self.rickMortyCharacters = response ?? []
            self.rickMortyOutPut?.saveDatas(values: self.rickMortyCharacters)
        }
    }
    
    func changeLoading() {
        isLoading = !isLoading
        rickMortyOutPut?.changeLoading(isLoad: isLoading)
    }
     
    
    
    
    
}
