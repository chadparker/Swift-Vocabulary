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
        VocabularyWord(word: "guard", definition: "A guard statement, like an if statement, executes statements depending on the Boolean value of an expression. You use a guard statement to require that a condition must be true in order for the code after the guard statement to be executed. Unlike an if statement, a guard statement always has an else clause—the code inside the else clause is executed if the condition is not true.")
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

    // MARK: - Actions

    @IBAction func addButtonWasTapped(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add word", message: nil, preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Word"
        }
        alert.addTextField { textField in
            textField.placeholder = "Definition"
        }
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            guard let word = alert.textFields![0].text,
                let definition = alert.textFields![1].text,
                !word.isEmpty,
                !definition.isEmpty else { return }
            let vocabWord = VocabularyWord(word: word, definition: definition)
            self.vocabWords.append(vocabWord)
            self.tableView.reloadData()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
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
