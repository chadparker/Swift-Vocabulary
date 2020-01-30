//
//  WordsTableViewController.swift
//  Swift Vocabulary
//
//  Created by Chad Parker on 1/29/20.
//  Copyright © 2020 Chad Parker. All rights reserved.
//

import UIKit

class WordsTableViewController: UITableViewController {

    var vocabWords: [VocabularyWord] = [
        VocabularyWord(word: "variable", definition: "Named position in memory to hold stuff. Can be re-assigned."),
        VocabularyWord(word: "constant", definition: "Named position in memory to hold stuff. Can only be assigned once."),
        VocabularyWord(word: "guard", definition: "Pure awesomeness")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vocabWords.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WordCell", for: indexPath)

        let word = vocabWords[indexPath.row]
        cell.textLabel?.text = word.word

        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDefinitionSegue" {
            guard let definitionVC = segue.destination as? DefinitionViewController else { return }
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            definitionVC.vocabWord = vocabWords[indexPath.row]
        }
    }
}
