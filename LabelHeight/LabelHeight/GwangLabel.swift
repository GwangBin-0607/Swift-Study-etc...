import UIKit

open class GwangLabel:UILabel{
    open override func draw(_ rect: CGRect) {
        super.draw(rect)
        print("draw")
        font = UIFont.boldSystemFont(ofSize: rect.height)
        print(rect.height)
    }
    open override func drawText(in rect: CGRect) {
        super.drawText(in: rect)
        print("draw---Text")
    }
}
