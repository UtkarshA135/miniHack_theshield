import 'package:flutter/material.dart';
class Breakfast extends StatefulWidget {
  @override
  _BreakfastState createState() => _BreakfastState();
}

class _BreakfastState extends State<Breakfast> {
   int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  @override
  Widget build(BuildContext context) {
     return Scaffold(appBar: AppBar(title: Text('Breakfast ',
       ),
    ),body :
     SingleChildScrollView(
      child: PaginatedDataTable(
        header: Text('BreakFast items'),
        rowsPerPage: _rowsPerPage,
        availableRowsPerPage: <int>[5, 10, 20],
        onRowsPerPageChanged: (int value) {
          setState(() {
            _rowsPerPage = value;
          });
        },
        columns: kTableColumns,
        source: DessertDataSource(),
      ),
      ) );
  }
}
const kTableColumns = <DataColumn>[
  DataColumn(
    label: const Text(' Items serving)'),
  ),
  DataColumn(
    label: const Text('Calories'),
    tooltip: 'The total amount of food energy in the given serving size.',
    numeric: true,
  ),];
  class Dessert {
  Dessert(this.name, this.calories);
  final String name;
  final int calories;
   bool selected = false;
  }
  class DessertDataSource extends DataTableSource {
  int _selectedCount = 0;
  final List<Dessert> _desserts = <Dessert>[
    new Dessert('Herbed Ricotta & Tomato Toast ', 227 ),
    new Dessert('PB & J Yogurt Parfait', 315),
    new Dessert('Microwave Egg & Veggie Sandwich', 371),
    new Dessert('Smoked Salmon Cucumber Wraps ', 169),
    new Dessert('Gingerbread', 356),
    new Dessert('Apple Vanilla Greek Yogurt Pancakes ', 296),
    new Dessert('Ham, Egg & Avocado Burrito ', 400),
    new Dessert('Steel Cut Oatmeal', 115),
    new Dessert('Waffle PBJ-Wich ', 385),
    new Dessert('Frozen yogurt with sugar', 168),
    new Dessert('Mint Cacao Green Smoothie ', 246),
    new Dessert('BREAKFAST SAUSAGE', 40),
    new Dessert('Chocolate Chip Oatmeal Cookie Smoothie', 314),
    new Dessert('Gingerbread with sugar', 345),
    new Dessert('CEREAL', 113),
    new Dessert('GRITS', 115),
  ];

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= _desserts.length) return null;
    final Dessert dessert = _desserts[index];
    return DataRow.byIndex(
        index: index,
        selected: dessert.selected,
        onSelectChanged: (bool value) {
          if (dessert.selected != value) {
            _selectedCount += value ? 1 : -1;
            assert(_selectedCount >= 0);
            dessert.selected = value;
            notifyListeners();
          }
        },
        cells: <DataCell>[
          DataCell(Text('${dessert.name}')),
          DataCell(Text('${dessert.calories}')),
       
        ]);
  }

  @override
  int get rowCount => _desserts.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}