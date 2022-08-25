import 'package:flutter/material.dart';
import '../Widgets/main_drawer.dart';

class FliterScreen extends StatefulWidget {
  static const routeName = '/fliter-screen';

  final Function saveFilters;
  final Map<String, bool?> currentFilters;

  FliterScreen(this.currentFilters, this.saveFilters);

  @override
  State<FliterScreen> createState() => _FliterScreenState();
}

class _FliterScreenState extends State<FliterScreen> {
  bool? _glutenFree = false;
  bool? _vegetarian = false;
  bool? _vegan = false;
  bool? _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fliters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFliters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFliters);
              print('Clicked');
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust Your Meal Selection.',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                    title: Text('Gluten-Free'),
                    value: _glutenFree!,
                    subtitle: Text('Only include gluten-free Meals'),
                    onChanged: (newValue) {
                      setState(() {
                        _glutenFree = newValue;
                      });
                    }),
                SwitchListTile(
                    title: Text('Lactose-Free'),
                    value: _lactoseFree!,
                    subtitle: Text('Only include lactose-free Meals'),
                    onChanged: (newValue) {
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    }),
                SwitchListTile(
                    title: Text('Vegan'),
                    value: _vegan!,
                    subtitle: Text('Only include Vegan Meals'),
                    onChanged: (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    }),
                SwitchListTile(
                    title: Text('Vegetarian'),
                    value: _vegetarian!,
                    subtitle: Text('Only include Vegetarian Meals'),
                    onChanged: (newValue) {
                      setState(() {
                        _vegetarian = newValue;
                      });
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
