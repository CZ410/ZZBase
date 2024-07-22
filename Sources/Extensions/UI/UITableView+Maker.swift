//
//  UITableView+Maker.swift
//  ZZBase
//
//  Created by 陈钟 on 2023/11/8.
//

import Foundation

public typealias UITableViewProtocol = UITableViewDelegate & UITableViewDataSource

public extension UITableView{

    static func zz_make<T: UITableView, C: UITableViewCell, H: UITableViewHeaderFooterView>(
        frame: CGRect = .zero,
        style: UITableView.Style = .plain,
        delegate: UITableViewProtocol,
        dataSource: UITableViewProtocol? = nil,
        registerCells: [C.Type]? = nil,
        registerHeaders: [H.Type]? = nil,
        registerFooters: [H.Type]? = nil
    ) -> T{
        let tb = T.init(frame: frame, style: style)
        tb.zz_delegate(delegate).zz_dataSource(dataSource ?? delegate)

        registerCells?.forEach({ tb.zz_register(cell: $0) })
        registerHeaders?.forEach({ tb.zz_register(headerFooter: $0) })
        registerFooters?.forEach({ tb.zz_register(headerFooter: $0) })

        return tb
    }

}

public extension UITableView{

    @discardableResult
    func zz_dataSource(_ v: UITableViewDataSource?) -> Self{
        self.dataSource = v
        return self
    }

    @discardableResult
    func zz_delegate(_ v: UITableViewDelegate?) -> Self{
        self.delegate = v
        return self
    }

    @available(iOS 10.0, *)
    @discardableResult
    func zz_prefetchDataSource(_ v:  UITableViewDataSourcePrefetching?) -> Self{
        self.prefetchDataSource = v
        return self
    }

    @available(iOS 15.0, *)
    @discardableResult
    func zz_isPrefetchingEnabled(_ v: Bool) -> Self{
        self.isPrefetchingEnabled = v
        return self
    }

    @available(iOS 11.0, *)
    @discardableResult
    func zz_dragDelegate(_ v: UITableViewDragDelegate?) -> Self{
        self.dragDelegate = v
        return self
    }

    @available(iOS 11.0, *)
    @discardableResult
    func zz_dropDelegate(_ v: UITableViewDropDelegate?) -> Self{
        self.dropDelegate = v
        return self
    }

    /// default is UITableViewAutomaticDimension
    @discardableResult
    func zz_rowHeight(_ v: CGFloat) -> Self{
        self.rowHeight = v
        return self
    }

    /// default is UITableViewAutomaticDimension
    @discardableResult
    func zz_sectionHeaderHeight(_ v: CGFloat) -> Self{
        self.sectionHeaderHeight = v
        return self
    } 

    /// default is UITableViewAutomaticDimension
    @discardableResult
    func zz_sectionFooterHeight(_ v: CGFloat) -> Self{
        self.sectionFooterHeight = v
        return self
    }

    /// default is UITableViewAutomaticDimension, set to 0 to disable
    @available(iOS 7.0, *)
    @discardableResult
    func zz_estimatedRowHeight(_ v: CGFloat) -> Self{
        self.estimatedRowHeight = v
        return self
    }

    /// default is UITableViewAutomaticDimension, set to 0 to disable
    @available(iOS 7.0, *)
    @discardableResult
    func zz_estimatedSectionHeaderHeight(_ v: CGFloat) -> Self{
        self.estimatedSectionHeaderHeight = v
        return self
    }

    /// default is UITableViewAutomaticDimension, set to 0 to disable
    @available(iOS 7.0, *)
    @discardableResult
    func zz_estimatedSectionFooterHeight(_ v: CGFloat) -> Self{
        self.estimatedSectionFooterHeight = v
        return self
    }

    /// The height for filler rows added below the last row when there aren't enough rows to fill a plain style table view.
    /// Set 0 to disable filler rows entirely, use `UITableViewAutomaticDimension` for the default height.
    @available(iOS 15.0, *)
    @discardableResult
    func zz_fillerRowHeight(_ v: CGFloat) -> Self{
        self.fillerRowHeight = v
        return self
    }


    /// Padding above each section header. The default value is `UITableViewAutomaticDimension`.
    @available(iOS 15.0, *)
    @discardableResult
    func zz_sectionHeaderTopPadding(_ v: CGFloat) -> Self{
        self.sectionHeaderTopPadding = v
        return self
    }

    /// allows customization of the frame of cell separators; see also the separatorInsetReference property. Use UITableViewAutomaticDimension for the automatic inset for that edge.
    @available(iOS 7.0, *)
    @discardableResult
    func zz_separatorInset(_ v: UIEdgeInsets) -> Self{
        self.separatorInset = v
        return self
    }

    /// Changes how custom separatorInset values are interpreted. The default value is UITableViewSeparatorInsetFromCellEdges
    @available(iOS 11.0, *)
    @discardableResult
    func zz_separatorInsetReference(_ v: UITableView.SeparatorInsetReference) -> Self{
        self.separatorInsetReference = v
        return self
    }

    @available(iOS 16.0, *)
    @discardableResult
    func zz_selfSizingInvalidation(_ v: UITableView.SelfSizingInvalidation) -> Self{
        self.selfSizingInvalidation = v
        return self
    }

    /// the background view will be automatically resized to track the size of the table view.  this will be placed as a subview of the table view behind all cells and headers/footers.  default may be non-nil for some devices.
    @available(iOS 3.2, *)
    @discardableResult
    func zz_backgroundView(_ v: UIView?) -> Self{
        self.backgroundView = v
        return self
    }

    /// default is NO. setting is not animated.
    @discardableResult
    func zz_isEditing(_ v: Bool) -> Self{
        self.isEditing = v
        return self
    }

    @discardableResult
    func zz_setEditing(_ editing: Bool, animated: Bool)-> Self{
        setEditing(editing, animated: animated)
        return self
    }

    /// default is YES. Controls whether rows can be selected when not in editing mode
    @available(iOS 3.0, *)
    @discardableResult
    func zz_allowsSelection(_ v: Bool) -> Self{
        self.allowsSelection = v
        return self
    }

    /// default is NO. Controls whether rows can be selected when in editing mode/
    @discardableResult
    func zz_allowsSelectionDuringEditing(_ v: Bool) -> Self{
        self.allowsSelectionDuringEditing = v
        return self
    }

    /// default is NO. Controls whether multiple rows can be selected simultaneously/
    @available(iOS 5.0, *)
    @discardableResult
    func zz_allowsMultipleSelection(_ v: Bool) -> Self{
        self.allowsMultipleSelection = v
        return self
    }

    /// default is NO. Controls whether multiple rows can be selected simultaneously in editing mode
    @available(iOS 5.0, *)
    @discardableResult
    func zz_allowsMultipleSelectionDuringEditing(_ v: Bool) -> Self{
        self.allowsMultipleSelectionDuringEditing = v
        return self
    }

    // Appearance

    /// show special section index list on right when row count reaches this value. default is 0/
    @discardableResult
    func zz_sectionIndexMinimumDisplayRowCount(_ v: Int) -> Self{
        self.sectionIndexMinimumDisplayRowCount = v
        return self
    }

    /// color used for text of the section index/
    @available(iOS 6.0, *)
    @discardableResult
    func zz_sectionIndexColor(_ v: UIColor?) -> Self{
        self.sectionIndexColor = v
        return self
    }

    /// the background color of the section index while not being touched/
    @available(iOS 7.0, *)
    @discardableResult
    func zz_sectionIndexBackgroundColor(_ v: UIColor?) -> Self{
        self.sectionIndexBackgroundColor = v
        return self
    }

    /// the background color of the section index while it is being touched/
    @available(iOS 6.0, *)
    @discardableResult
    func zz_sectionIndexTrackingBackgroundColor(_ v: UIColor?) -> Self{
        self.sectionIndexTrackingBackgroundColor = v
        return self
    }

    /// default is UITableViewCellSeparatorStyleSingleLine/
    @discardableResult
    func zz_separatorStyle(_ v: UITableViewCell.SeparatorStyle) -> Self{
        self.separatorStyle = v
        return self
    }

    /// default is the standard separator gray/
    @discardableResult
    func zz_separatorColor(_ v: UIColor?) -> Self{
        self.separatorColor = v
        return self
    }

    /// effect to apply to table separators/
    @available(iOS 8.0, *)
    @discardableResult
    func zz_separatorEffect(_ v: UIVisualEffect?) -> Self{
        self.separatorEffect = v
        return self
    }

    /// if cell layout margins are derived from the width of the readableContentGuide. default is NO./
    @available(iOS 9.0, *)
    @discardableResult
    func zz_cellLayoutMarginsFollowReadableWidth(_ v: Bool) -> Self{
        self.cellLayoutMarginsFollowReadableWidth = v
        return self
    }

    /// default value is YES
    @available(iOS 11.0, *)
    @discardableResult
    func zz_insetsContentViewsToSafeArea(_ v: Bool) -> Self{
        self.insetsContentViewsToSafeArea = v
        return self
    }

    /// accessory view for above row content. default is nil. not to be confused with section header/
    @discardableResult
    func zz_tableHeaderView(_ v: UIView?) -> Self{
        self.tableHeaderView = v
        return self
    }

    /// accessory view below content. default is nil. not to be confused with section footer/
    @discardableResult
    func zz_tableFooterView(_ v: UIView?) -> Self{
        self.tableFooterView = v
        return self
    }

    // Focus

    /// defaults to NO. If YES, when focusing on a table view the last focused index path is focused automatically. If the table view has never been focused, then the preferred focused index path is used./
    @available(iOS 9.0, *)
    @discardableResult
    func zz_remembersLastFocusedIndexPath(_ v: Bool) -> Self{
        self.remembersLastFocusedIndexPath = v
        return self
    }

    /// When enabled, the table view ensures that selection is automatically triggered when focus moves to a cell.
    /// Defaults to a system derived value based on platform and other properties of the table view.
    @available(iOS 14.0, *)
    @discardableResult
    func zz_selectionFollowsFocus(_ v: Bool) -> Self{
        self.selectionFollowsFocus = v
        return self
    }


    /// Determines if the table view allows its cells to become focused.
    /// When tableView:canFocusRowAtIndexPath: is implemented, its return value takes precedence over this method.
    /// Defaults to a system derived value based on platform and other properties of the table view.
    @available(iOS 15.0, *)
    @discardableResult
    func zz_allowsFocus(_ v: Bool) -> Self{
        self.allowsFocus = v
        return self
    }


    /// Determines if the table view allows its cells to become focused while editing.
    /// When tableView:canFocusRowAtIndexPath: is implemented, its return value takes precedence over this method.
    /// Defaults to a system derived value based on platform and other properties of the table view.
    @available(iOS 15.0, *)
    @discardableResult
    func zz_allowsFocusDuringEditing(_ v: Bool) -> Self{
        self.allowsFocusDuringEditing = v
        return self
    }


    // Drag & Drop

    // You can force drags to be disabled for this table view by setting this to NO.
    // As of iOS 15, this is true for both iPhone and iPad by default. Prior to iOS 15, it defaulted to false on iPhone.
    @available(iOS 11.0, *)
    @discardableResult
    func zz_dragInteractionEnabled(_ v: Bool) -> Self{
        self.dragInteractionEnabled = v
        return self
    }

}
