//
//  ChartDetailView.swift
//  Components
//
//  Created by Jesus Alejandro Pablo Ojeda on 03/06/22.
//
import UIKit
/// Clase para generar el componente visual de gráfica y detalle.
open class ChartDetailView: UIView {
    /// View padre
    var view: UIView!
    /// Variable para almacenar el parámetro título.
    var title: String = ""
    /// Variable para almacenar el parámetro subtítulo.
    var subtitle: String = ""
    /// View que contiene todos los elementos de la representación.
    @IBOutlet fileprivate weak var viewParent: UIView!
    /// View para independizar la gráfica.
    @IBOutlet fileprivate weak var viewPieChart: UIView!
    /// TableView para mostrar datos descriptivos de la gráfica.
    @IBOutlet fileprivate weak var tableView: UITableView!
    /// Etiqueta para el título del componente.
    @IBOutlet weak var lblTitle: UILabel!
    /// Variable que contiene todos los items a representar en la gráfica.
    var items: [PieChart.Slice] = [PieChart.Slice()] {
        didSet {
            let piechart = PieChart()
            piechart.title = self.title
            piechart.subtitle = self.subtitle
            piechart.slices = self.items
            if let removable = self.viewPieChart.viewWithTag(10) {
               removable.removeFromSuperview()
            }
            piechart.tag = 10
            self.viewPieChart.addSubview(piechart)
            self.tableView.reloadData()
        }
    }
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpView()
    }
    public required init?(coder aDeacoder: NSCoder) {
        super.init(coder: aDeacoder)
        self.setUpView()
    }
    func setUpView() {
        self.loadViewFromNib()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "RowViewCell", bundle: nil), forCellReuseIdentifier: "RowViewCell")
        self.tableView.reloadData()
    }
    public func loadViewFromNib() {
        let bundle = Bundle(for: ChartDetailView.self)
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as? UIView
        view?.frame = bounds
        addSubview(view ?? UIView())
        self.view = view
    }
}
/// Delegate y datasource de la tabla (Componete informativo de la gráfica).
extension ChartDetailView: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RowViewCell", for: indexPath) as? RowViewCell else {
            return UITableViewCell() }
        cell.tag = indexPath.row
        cell.selectionStyle = .none
        let item = self.items[indexPath.row]
        cell.viewBulletPoint.backgroundColor = item.color
        cell.lblName.text = item.text
        cell.lblDetail.text = item.valueFormat
        return cell
    }
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
}
/// Clase que sirve para modelar una gráfica de pastel personalizada.
open class PieChart: UIControl {
    /// Entidad para el item de la gráfica.
    public struct Slice {
        public var color: UIColor = .black
        public var value: CGFloat = 0.0
        public var text: String = ""
        public var valueFormat: String = ""
    }
    /// Entidad para el radio de la gráfica.
    public struct Radius {
        public var inner: CGFloat = 54
        public var outer: CGFloat = 60
    }
    /// Etiqueta para el título dentro de la gráfica
    fileprivate var titleLabel: UILabel!
    /// Etiqueta para el el subtítulo dentro de la gráfica
    fileprivate var subtitleLabel: UILabel!
    /// Variable para el total de todos los datos
    fileprivate var total: CGFloat!
    /// Variable para la entidad Radius que genera el arco y su anchor
    open var radius: Radius = Radius()
    /// Variable para la vista que contendra la gráfica definida.
    open var rectGlobal = CGRect(x: 0, y: 0, width: 140, height: 140)
    /// Variable para el título de la etiqueta.
    open var title: String = "title" {
        didSet {
            titleLabel.text = title
        }
    }
    /// Variable para el subtítulo de la etiqueta.
    open var subtitle: String = "subtitle" {
        didSet {
            subtitleLabel.text = subtitle
        }
    }
    /// Variable para la entidad de cada item que sera representado en la gráfica.
    open var slices: [Slice] = [] {
        didSet {
            total = 0
            for slice in slices {
                total = slice.value + total
            }
        }
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    /// Inicializador
    override public init(frame: CGRect) {
        super.init(frame: rectGlobal)
        self.backgroundColor = UIColor.clear
        titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline)
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor.black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.minimumScaleFactor = 0.2
        self.addSubview(titleLabel)
        subtitleLabel = UILabel()
        subtitleLabel.text = subtitle
        subtitleLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.caption1)
        subtitleLabel.textColor = UIColor.gray
        subtitleLabel.font = UIFont.systemFont(ofSize: 12)
        subtitleLabel.textAlignment = .center
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.adjustsFontSizeToFitWidth = true
        subtitleLabel.minimumScaleFactor = 0.4
        self.addSubview(subtitleLabel)
        self.addConstraint(NSLayoutConstraint(item: titleLabel as Any, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: titleLabel as Any, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: subtitleLabel as Any, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: subtitleLabel as Any, attribute: .top, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
    /// Función para pintar la gráfica y sus datos.
    open override func draw(_ rect: CGRect) {
        super.draw(rectGlobal)
        let center = CGPoint(x: rectGlobal.width / 2, y: rectGlobal.height / 2)
        var startValue: CGFloat = 0 - 0.10
        var startAngle: CGFloat = 0
        var endValue: CGFloat = 0
        var endAngle: CGFloat = 0
        if total == 0 {
            /// Si no hay valores se deja una gráfica vacia.
            startAngle = (startValue * 2 * CGFloat(Double.pi)) - CGFloat(Double.pi / 2)
            endValue = startValue + 1 / 1
            endAngle = (endValue * 2 * CGFloat(Double.pi)) - CGFloat(Double.pi / 2)
            let path = UIBezierPath()
            path.move(to: center)
            path.addArc(withCenter: center, radius: radius.outer, startAngle: startAngle, endAngle: endAngle, clockwise: true)
            let color = UIColor(red: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1)
            color.setFill()
            path.fill()
            UIColor.white.setStroke()
            path.stroke()
            startValue += 1 / 1
        }else {
            /// Se realiza el arco de cada item que tenga valor para hacer la gráfica.
            for (_, slice) in slices.enumerated() {
                if slice.value > 0 {
                    startAngle = (startValue * 2 * CGFloat(Double.pi)) - CGFloat(Double.pi / 2)
                    endValue = startValue + (slice.value - 0.20) / (self.total - 0.10)
                    endAngle = (endValue * 2 * CGFloat(Double.pi)) - CGFloat(Double.pi / 2)
                    let path = UIBezierPath()
                    path.move(to: center)
                    path.addArc(withCenter: center, radius: radius.outer, startAngle: startAngle, endAngle: endAngle, clockwise: true)
                    var color = UIColor(red: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1)
                    color = slice.color
                    color.setFill()
                    path.fill()
                    UIColor.white.setStroke()
                    path.stroke()
                    startValue += slice.value / self.total
                }
            }
        }
        ///Círculo interno de la gráfica para formar el estilo deseado.
        let innerPath = UIBezierPath()
        innerPath.move(to: center)
        innerPath.addArc(withCenter: center, radius: radius.inner, startAngle: 0, endAngle: CGFloat(Double.pi) * 2, clockwise: true)
        UIColor.white.setFill()
        innerPath.fill()
    }
}
