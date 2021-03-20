//
//  CountriesTableViewController.swift
//  Table
//
//  Created by Mamitiana RAKOTO on 20/03/2021.
//

import UIKit

class CountriesTableViewController: UITableViewController {
	
	let countryDico = Dictionary(grouping: countries, by: {$0.continent})
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Uncomment the following line to preserve selection between presentations
		// self.clearsSelectionOnViewWillAppear = false
		
		// Uncomment the following line to display an Edit button in the navigation bar for this view controller.
		// self.navigationItem.rightBarButtonItem = self.editButtonItem
	}
	
	// MARK: - Table view data source
	
	func getContinents() -> [String] {
		var continents: [String] = []
		for c in countries {
			if !continents.contains(c.continent) {
				continents.append(c.continent)
			}
		}
		return continents
	}
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		
		return getContinents().count
	}
	
	override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
		let footerView = UIView()
		footerView.backgroundColor = UIColor(cgColor: CGColor.init(red: 255, green: 255, blue: 255, alpha: 1))
		return footerView
	}
	
	override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
		return 10
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		let continent = getContinents()[section]
		let contDico = countryDico[continent]
		return contDico!.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath)
		
		let continent = getContinents()[indexPath.section]
		let contDico = countryDico[continent]
		if indexPath.row < contDico!.count {
			let country = contDico![indexPath.row]
			cell.textLabel?.text = country.name
			cell.detailTextLabel?.text = country.isoCode
			cell.imageView?.image = UIImage(named: country.isoCode)
			return cell
		}
		return cell
	}
	
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		let continents = getContinents();
		return "\(continents[section])"
	}
	
	/*
	// Override to support conditional editing of the table view.
	override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
	// Return false if you do not want the specified item to be editable.
	return true
	}
	*/
	
	/*
	// Override to support editing the table view.
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
	if editingStyle == .delete {
	// Delete the row from the data source
	tableView.deleteRows(at: [indexPath], with: .fade)
	} else if editingStyle == .insert {
	// Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
	}
	}
	*/
	
	/*
	// Override to support rearranging the table view.
	override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
	
	}
	*/
	
	/*
	// Override to support conditional rearranging of the table view.
	override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
	// Return false if you do not want the item to be re-orderable.
	return true
	}
	*/
	
	/*
	// MARK: - Navigation
	
	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
	// Get the new view controller using segue.destination.
	// Pass the selected object to the new view controller.
	}
	*/
	
}
