import 'package:flutter/material.dart';
import '../models/grocery_category.dart';
import '../models/grocery_item.dart';

class NewItem extends StatefulWidget {
  NewItem({super.key, this.item});
  final GroceryItem? item;

  @override
  State<NewItem> createState() {
    return _NewItemState();
  }
}

class _NewItemState extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();

  late String _enteredName;
  late int _enteredQuantity;
  late GroceryCategory _enteredCategory;

  @override
  void initState() {
    super.initState();
    if (widget.item != null) {
      _enteredName = widget.item!.name;
      _enteredQuantity = widget.item!.quantity;
      _enteredCategory = widget.item!.category;
    } else {
      _enteredName = '';
      _enteredQuantity = 0;
      _enteredCategory = GroceryCategory.vegetables;
    }
  }

  void _saveItem() {
    bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();

      final newItem = GroceryItem(
        id: widget.item?.id ?? DateTime.now().toString(),
        name: _enteredName,
        quantity: _enteredQuantity,
        category: _enteredCategory,
      );

      Navigator.of(context).pop(newItem);
    }
  }

  void _updateItem() {
    bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();

      final updatedItem = GroceryItem(
        id: widget.item!.id,
        name: _enteredName,
        quantity: _enteredQuantity,
        category: _enteredCategory,
      );

      Navigator.of(context).pop(updatedItem);
    }
  }
  void _resetForm() {
    _formKey.currentState!.reset();
    // setState(() {
    //   if (widget.item != null) {
    //     _enteredName = widget.item!.name;
    //     _enteredQuantity = widget.item!.quantity;
    //     _enteredCategory = widget.item!.category;
    //   } else {
    //     _enteredName = '';
    //     _enteredQuantity = 0;
    //     _enteredCategory = GroceryCategory.vegetables;
    //   }
    // });
  }

  String? validateTitle(String? value) {
    if (value == null ||
        value.isEmpty ||
        value.trim().length <= 1 ||
        value.trim().length > 50) {
      return 'Must be between 1 and 50 characters.';
    }
    return null;
  }

  String? validateQuantity(String? value) {
    if (value == null || value.isEmpty || int.tryParse(value) == null || int.parse(value) <= 0) {
      return 'Must be a valid positive number.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item == null ? 'Add a new item' : 'Edit item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _enteredName,
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Name'),
                ),
                validator: validateTitle,
                onSaved: (value) {
                  _enteredName = value!;
                },
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Quantity'),
                      ),
                      initialValue: _enteredQuantity.toString(),
                      validator: validateQuantity,
                      onSaved: (value) {
                        _enteredQuantity = int.parse(value!);
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField<GroceryCategory>(
                      value: _enteredCategory,
                      items: [
                        for (final category in GroceryCategory.values)
                          DropdownMenuItem<GroceryCategory>(
                            value: category,
                            child: Row(
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  color: category.color,
                                ),
                                const SizedBox(width: 6),
                                Text(category.label),
                              ],
                            ),
                          ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _enteredCategory = value!;
                        });
                      },
                      onSaved: (value) {
                        _enteredCategory = value!;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: _resetForm,
                    child: const Text('Reset'),
                  ),
                  ElevatedButton(
                    onPressed: widget.item == null ?  _saveItem : _updateItem,
                    child: Text(widget.item == null ? 'Add Item' : 'Update Item'),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
