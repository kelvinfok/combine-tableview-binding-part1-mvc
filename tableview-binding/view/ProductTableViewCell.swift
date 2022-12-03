//
//  ProductTableViewCell.swift
//  tableview-binding
//
//  Created by Kelvin Fok on 3/12/22.
//

import UIKit
import Combine

enum ProductCellEvent {
  case quantityDidChange(value: Int)
  case heartDidTap
}

class ProductTableViewCell: UITableViewCell {
  
  private let eventSubject = PassthroughSubject<ProductCellEvent, Never>()
  var eventPublisher: AnyPublisher<ProductCellEvent, Never> {
    eventSubject.eraseToAnyPublisher()
  }

  var cancellables = Set<AnyCancellable>()
  
  @IBOutlet weak var productImageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var quantityLabel: UILabel!
  @IBOutlet weak var heartButton: UIButton!
  @IBOutlet weak var stepper: UIStepper!
  
  override func prepareForReuse() {
    super.prepareForReuse()
    cancellables = Set<AnyCancellable>()
  }
  
  func setProduct(product: Product, quantity: Int, isLiked: Bool) {
    nameLabel.text = product.name + " - $\(product.price)"
    quantityLabel.text = String(quantity)
    stepper.value = Double(quantity)
    let image: UIImage? = isLiked ? .init(systemName: "heart.fill"): .init(systemName: "heart")
    heartButton.setImage(image, for: .normal)
    productImageView.image = UIImage(systemName: product.imageName)
  }
  
  @IBAction func stepperDidChange(_ sender: UIStepper) {
    let value = Int(sender.value)
    eventSubject.send(.quantityDidChange(value: value))
  }
  
  @IBAction func heartButtonDidTap(_ sender: UIButton) {
    eventSubject.send(.heartDidTap)
  }
}
