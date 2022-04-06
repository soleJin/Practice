# Multiple Sections In TableView
<br>
<br>

### DataSource
1. `snapshot()` - current snapshot
2. `apply(_, animatingDifferences:)`
3. `itemIdentifier(for:)` - use the index path
4. CellProvider - (tableView, indexPath, itemIdentifier)
<br>
<br>

### Snapshot
1. `appendSections(_:)`
2. `appendItems(_:)`
3. `appendItems(_:, toSection:_)`
4. `sectionIdentifiers` - get back all the sections
5. `deleteItems(_:)`
6. `indexOfItem` - return the index of item
7. `sectionIdentifier(containingItem: _)` - get the section for a given item
8. `insertItems(_:, afterItem: _)` - insert a given source item(s) after a destination item
9. `insertItems(_:, beforeItem: _)` - insert a given source item(s) before a destination item
<br>
<br>

### Reordering items 
case 1: Move to self  
case 2: After Destination  
case 3: Before Destinamtion  
case 4: New IndexPath  
<br>
<br>

### Reference
- [alexpaul/Diffable-Data-Source](https://github.com/alexpaul/Diffable-Data-Source)

