//
//  ViewController.swift
//  ZZBase
//
//  Created by czz_8023 on 02/07/2023.
//  Copyright (c) 2023 czz_8023. All rights reserved.
//

import UIKit
import ZZBase
import SwiftUI


class ViewController: UIViewController {
    
    @ZZUserDefaults(key: "ViewController_Name", defaultValue: "")
    static var name: String
    
    @ZZNotificationPost(name: "Test_Notification_Post")
    var testCount: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(forName: $testCount.notificationName, object: self, queue: .main) { notification in
            
        }
        
        // Do any additional setup after loading the view, typically from a nib.
//        self.view
//            .zz_backgroundColor(.red)
//            .zz_alpha(0.5)
        
//        self.view.zz.borderColor(.black).borderWidth(1).borderWidth = 1
//        
//       let 的 = UserDefaults.object(forKey: "")
        
        ZZLogger.info("jfdlaf")
        
        UIImage.zz_initializeMethod()
        
        
        let _ = UIEdgeInsets().zz_copy(top: 100)
        
        UIButton().zz_hitEdgeInset(.zz_all(-10))
        
        let d = "".zz_Lager(version: "")
        UIStackView.zz_h([], alignment: .center, distribution: .equalSpacing, spacing: 10)
        
        let tab = UITableView
            .zz_make(delegate: self, registerCells: [UITableViewCell.self])
            .zz_dataSource(self)
            .zz_separatorColor(.red)
            .zz_separatorInset(.zero)
            .zz_separatorStyle(.none)

        ZZLog(zz_file_bundle("testImgage", type: "png"))
        ZZLog(zz_file_documents("123.png"))
        
        ZZLog(ZZFile.path(for: .documents))
        ZZLog(ZZFile.path(for: .library))
        ZZLog(ZZFile.path(for: .caches))
        ZZLog(ZZFile.path(for: .temp))
        ZZLog(ZZFile.path(for: .bundle))
        
        
        ZZLog(ZZFile.filePath(for: .documents, filename: "123.png"))
        ZZLog(ZZFile.filePath(for: .library, filename: "123.png"))
        ZZLog(ZZFile.filePath(for: .caches, filename: "123.png"))
        ZZLog(ZZFile.filePath(for: .temp, filename: "123.png"))
        ZZLog(ZZFile.filePath(for: .bundle, filename: "testImgage.png"))


//        ZZFile.create(directory: .bundle, folderName: "fjdlsa")

        var file1 = ZZFile.filePath(for: .documents, intermediates: "/PDF", filename: "1234.pdf")

        var isDir: ObjCBool = false
        var file2 = ZZFile.filePath(for: .documents, intermediates: "/PDF2", filename: "")

//        let file1Create = ZZFile.createDirectory(to: file1)
//        let file2Create = ZZFile.createDirectory(to: file2, isDirectory: &isDir)
//
//        ZZLog("file1Create \(file1Create)   file2Create \(file2Create)   \(isDir.boolValue)")


        let textData = "hello world aaaaaaa111dd 66".data(using: .utf8)

        let createFile1 = "\(file1)/12345.txt"

        let file1Create1 = ZZFile.createFile(to: createFile1, contents: textData)
        ZZLog("file1Create1  \(file1Create1)")

        let createFile2 = "\(file1)/123456.txt"
        let file1Create2 = ZZFile.createFile(to: createFile2, contents: textData, isUpdataData: false)
        ZZLog("file1Create1  \(file1Create2)")



        var inset = UIEdgeInsets()
        inset.zz_left = 10
        inset.zz_left(10)
        inset.zz_right(20)
        ZZLog("inset is \(inset)")



        let button = UIButton().zz_backgroundColor(.yellow)
        button.zz_hitEdgeInset(.zz_all(10))
        button.frame = .zz_only(x:50, y: 100, width: 300, height: 300)
        view.addSubview(button)

//        button.zz_dottedBorder(corners: .allCorners, radii: 10, color: .black, lineDashPattern: [5, 2])

//        button.zz_addGradient(form: .orange, to: .blue)
//
        button.zz_addGradient(form: .systemPink, to: .systemTeal)
            .zz_gradientLayer({$0?.zz_cornerRadius(10).zz_masksToBounds(true)})

        button.zz_shadow(color: .orange,
                         radius: 10,
                         bgColor: .red)


//        button.zz_round(.allCorners, radii: 15)

        button.zz_addBlock(for: .touchUpInside) { sender in
            UIView.performWithoutAnimation {
                if button.zz_width < 350 {
                    button.zz_width += 10
                }else {
                    button.zz_width -= 10
                }
            }
        }
        
        
        button.zz_addLine(alignment: .topLine, color: .purple)
        button.zz_addLine(alignment: .leftLine, color: .purple)
        button.zz_addLine(alignment: .rightLine, color: .purple)
        button.zz_addLine(alignment: .bottomLine, color: .purple)
        
        button.zz_addLine(alignment: .centerLineX, color: .purple)
        button.zz_addLine(alignment: .centerLineY, color: .purple)
        
        
        button.zz_addLine(CGSize(width: 10, height: 10), alignment: .top, color: .red)
        button.zz_addLine(CGSize(width: 10, height: 10), alignment: .left, color: .yellow)
        button.zz_addLine(CGSize(width: 10, height: 10), alignment: .bottom, color: .purple)
        button.zz_addLine(CGSize(width: 10, height: 10), alignment: .right, color: .purple)
        
        button.zz_addLine(CGSize(width: 10, height: 10), alignment: .center, color: .purple)
        button.zz_addLine(CGSize(width: 10, height: 10), alignment: .topCenter, color: .purple)
        button.zz_addLine(CGSize(width: 10, height: 10), alignment: .leftCenter, color: .purple)
        button.zz_addLine(CGSize(width: 10, height: 10), alignment: .bottomCenter, color: .purple)
        button.zz_addLine(CGSize(width: 10, height: 10), alignment: .rightCenter, color: .purple)
        button.zz_addLine(CGSize(width: 10, height: 10), alignment: [.bottom, .right], color: .purple)
        
        button.zz_addLine(CGSize(width: 10, height: 10), alignment: [.left, .right, .center], color: .orange , inset: .zz_all(20))
        button.zz_addLine(CGSize(width: 10, height: 10), alignment: [.top, .bottom], color: .orange , inset: .zz_all(20))
        
        let button2 = UIButton().zz_border(radius: 30)
        view.zz_addSubViews([button2]) { superView in
            [
                button2.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 10),
//                button2.widthAnchor.constraint(equalToConstant: 200),
                button2.heightAnchor.constraint(equalToConstant: 200),
                button2.centerXAnchor.constraint(equalTo: superView.centerXAnchor)
            ]
        }
        
        button2
            .zz_setTitle("123", for: .normal)
            .zz_setImage(.zz_named("testImgage")?.zz_image(tintColor: .red), for: .normal)
            .zz_setTitleColor(.red, for: .normal)
            .zz_titleLabel(label: { $0?.zz_font(.systemFont(ofSize: 20, weight: .black)) })
            .zz_setImageAlignment(.left, spacing: 0)

        var num = 1
        var spacing = 1
        button2.zz_addBlock(for: .touchUpInside) { sender in
            num = num + 1
            spacing = spacing + 5
            button2
                .zz_setImageAlignment(.right, spacing: CGFloat(spacing))
                .zz_setTitle("123+" + Array(repeating: "A", count: num), for: .normal)
        }
        
        let testDate = Date.zz_date("2025-07-23 17:22:12", formatter: "yyyy-MM-dd HH:mm:ss")
        
        let offset1 = testDate?.zz_offset(.year, value: -1)
        let offset2 = testDate?.zz_offset(.month, value: -1)
        let offset3 = testDate?.zz_offset(.day, value: -1)
        let offset4 = testDate?.zz_offset(.hour, value: -1)
        let offset5 = testDate?.zz_offset(.minute, value: -1)
        let offset6 = testDate?.zz_offset(.second, value: -1)
        
        let firstDay = testDate?.zz_firstdayOfMonth()
        let lastDay = testDate?.zz_lastdayOfMonth()
        let cusDay = testDate?.zz_month(day: 2)
        let cusDay1 = testDate?.zz_month(day: 50)
        let cusDay2 = testDate?.zz_month(day: -1)
        
        let formatter = "yyyy-MM-dd HH:mm:ss"
        
        ZZLog(testDate?.zz_dateString(formatter))
        ZZLog(offset1?.zz_dateString(formatter))
        ZZLog(offset2?.zz_dateString(formatter))
        ZZLog(offset3?.zz_dateString(formatter))
        ZZLog(offset4?.zz_dateString(formatter))
        ZZLog(offset5?.zz_dateString(formatter))
        ZZLog(offset6?.zz_dateString(formatter))
        
        ZZLog(firstDay?.zz_dateString(formatter))
        ZZLog(lastDay?.zz_dateString(formatter))
        ZZLog(cusDay?.zz_dateString(formatter))
        ZZLog(cusDay1?.zz_dateString(formatter))
        ZZLog(cusDay2?.zz_dateString(formatter))
        
        let value = [offset1, offset2, offset3, offset4, offset5, offset6, firstDay, lastDay]
            .compactMap({ "\($0!.zz_dateString(formatter)) -- \($0!.zz_dateToRequiredTimeStr())" })
        ZZLog(value)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


extension ViewController: UITableViewDelegate, UITableViewDataSource{

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{

        return tableView.zz_cell()
    }

}
