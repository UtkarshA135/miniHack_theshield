import 'package:flutter/material.dart';
class Dinner extends StatefulWidget {
  @override
  _DinnerState createState() => _DinnerState();
}

class _DinnerState extends State<Dinner> {
    int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: PaginatedDataTable(
        header: Text('Dinner items'),
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
    );
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
    new Dessert('Gochujang roast sweet potato with mixed grain salad ', 227 ),
    new Dessert('Green frittata', 315),
    new Dessert('Balsamic lentils with pork fillet', 371),
    new Dessert('Healthy vegan quinoa and black bean chilli', 169),
    new Dessert('Turkey kheema matar (mince and peas curry) with tomato salad', 356),
    new Dessert('Spelt and mushroom risotto ', 296),
    new Dessert('Spelt and mushroom risotto', 400),
    new Dessert('Mexican prawn soup', 115),
    new Dessert('Gigantes plaki (Greek baked beans) ', 385),
    new Dessert('Moroccan veggie soup', 168),
    new Dessert('Low-calorie pad Thai', 246),
    new Dessert('Chicken saag', 40),
    new Dessert('Low-calorie beef bourguignon', 314),
    new Dessert('Courgetti with pesto and balsamic tomatoes', 345),
    new Dessert('Low-calorie lasagne', 113),
    new Dessert('Low-calorie lamb stew', 115),
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