import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const rn = '/filter';

  final Function(Map<String, bool>) _saveData;
  final Map<String, bool> _updatedFilters;

  const FiltersScreen(this._updatedFilters, this._saveData);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFree = false;
  var _isVegan = false;
  var _isVegetarian = false;
  var _isLactoseFree = true;

  @override
  void initState() {
    super.initState();
    _isGlutenFree = widget._updatedFilters['gluten']!;
    _isVegan = widget._updatedFilters['vegan']!;
    _isVegetarian = widget._updatedFilters['vegetarian']!;
    _isLactoseFree = widget._updatedFilters['lactose']!;
  }

  Widget builtSwitchListTile(String title, String subtitle, bool indicator,
      void Function(bool) updatedValue) {
    return SwitchListTile(
        value: indicator,
        title: Text(title),
        subtitle: Text(subtitle),
        onChanged: updatedValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _isGlutenFree,
                  'vegan': _isVegan,
                  'vegetarian': _isVegetarian,
                  'lactose': _isLactoseFree
                };
                widget._saveData(selectedFilters);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 20),
            alignment: Alignment.center,
            child: const Text(
              "Adjust your meal selection",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.pink),
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView(
              children: [
                builtSwitchListTile(
                    'Gluten-free',
                    'Only include gluten-free meals',
                    _isGlutenFree,
                    (value) => setState(() => _isGlutenFree = value)),
                builtSwitchListTile(
                    'Lactose-free',
                    'Only include gluten-free meals',
                    _isLactoseFree,
                    (value) => setState(() => _isLactoseFree = value)),
                builtSwitchListTile('Vegan', 'Only include vegan meals',
                    _isVegan, (value) => setState(() => _isVegan = value)),
                builtSwitchListTile(
                    'Vegetarian',
                    'Only include vegetarian meals',
                    _isVegetarian,
                    (value) => setState(() => _isVegetarian = value)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
