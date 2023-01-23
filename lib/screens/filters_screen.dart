import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  Map<String, bool> currentFilters;

  FilterScreen(this.currentFilters, this.saveFilters, {Key? key})
      : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'] as bool;
    _lactoseFree = widget.currentFilters['lactose'] as bool;
    _vegan = widget.currentFilters['vegan'] as bool;
    _vegetarian = widget.currentFilters['vegetarian'] as bool;
    super.initState();
  }

  Widget _buildSwitchListTile(
      String title, String desc, bool currentVal, dynamic updateValue) {
    return SwitchListTile(
        value: currentVal,
        title: Text(title),
        subtitle: Text(desc),
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilters);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your Meal Selection',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile('Gluten-Free',
                    'Only include Gluten free meals', _glutenFree, (newvalue) {
                  setState(() {
                    _glutenFree = newvalue;
                  });
                }),
                _buildSwitchListTile(
                    'Lactose-Free',
                    'Only include Lactose free meals',
                    _lactoseFree, (newvalue) {
                  setState(() {
                    _lactoseFree = newvalue;
                  });
                }),
                _buildSwitchListTile(
                    'Vegetarian', 'Only include Vegetarian meals', _vegetarian,
                    (newvalue) {
                  setState(() {
                    _vegetarian = newvalue;
                  });
                }),
                _buildSwitchListTile(
                    'Vegan', 'Only include Vegan meals', _vegan, (newvalue) {
                  setState(() {
                    _vegan = newvalue;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
