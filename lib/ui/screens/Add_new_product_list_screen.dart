import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AddNewProductListScreen extends StatefulWidget {
  const AddNewProductListScreen({super.key});
  static const String name = '/add_new_product';

  @override
  State<AddNewProductListScreen> createState() =>
      _AddNewProductListScreenState();
}

class _AddNewProductListScreenState extends State<AddNewProductListScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _totalPriceController = TextEditingController();
  final TextEditingController _imageTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _addNewProductInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Product'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _buildProductForm(),
        ),
      ),
    );
  }

  Widget _buildProductForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(padding: EdgeInsets.all(16.0)),
          TextFormField(
            controller: _nameController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              hintText: 'Name',
              labelText: 'Product Name',
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Please enter product name';
              }
              return null;
            },
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: _codeController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              hintText: 'Code',
              labelText: 'Product Code',
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Please enter product code';
              }
              return null;
            },
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: _quantityController,
            keyboardType: TextInputType.number,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              hintText: 'Quantity',
              labelText: 'Product Quantity',
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Please enter product quantity';
              }
              return null;
            },
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: _priceController,
            keyboardType: TextInputType.number,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              hintText: 'Price',
              labelText: 'Product Price',
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Please enter product price';
              }
              return null;
            },
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: _totalPriceController,
            keyboardType: TextInputType.number,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              hintText: 'Total Price',
              labelText: 'Product Total Price',
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Please enter product total price';
              }
              return null;
            },
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: _imageTEController,
            keyboardType: TextInputType.number,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              hintText: 'Image',
              labelText: 'Product Image',
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Please enter product image ';
              }
              return null;
            },
          ),

          SizedBox(height: 16),
          Visibility(
            visible: _addNewProductInProgress == false,
            replacement: Center(child: CircularProgressIndicator()),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _addNewProduct();
                }
              },
              child: const Text('Add Product'),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _addNewProduct() async {
    _addNewProductInProgress = true;
    setState(() {});
    Uri uri = Uri.parse('https://crud.teamrabbil.com/api/v1/CreateProduct');
    Map<String, dynamic> requestBody = {
      "Img": _imageTEController.text.trim(),
      "ProductCode": _codeController.text.trim(),
      "ProductName": _nameController.text.trim(),
      "Qty": _quantityController.text.trim(),
      "TotalPrice": _totalPriceController.text.trim(),
      "UnitPrice": _priceController.text.trim(),
    };
    Response response = await post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(requestBody),
    );
    print(response.statusCode);
    print(response.body);
    _addNewProductInProgress = false;
    setState(() {});
    if (response.statusCode == 200) {
      _clearTextFields();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Product added successfully')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add product! Try again')),
      );
    }
  }

  void _clearTextFields() {
    _nameController.clear();
    _codeController.clear();
    _quantityController.clear();
    _priceController.clear();
    _totalPriceController.clear();
    _imageTEController.clear();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _codeController.dispose();
    _quantityController.dispose();
    _priceController.dispose();
    _totalPriceController.dispose();
    _imageTEController.dispose();
    super.dispose();
  }
}
