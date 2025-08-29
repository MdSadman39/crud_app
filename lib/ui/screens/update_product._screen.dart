import 'package:flutter/material.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key});
  static const String name = '/update_product';

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _totalPriceController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Product'),
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
            decoration: InputDecoration(hintText: 'Name'),
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
            decoration: InputDecoration(hintText: 'Code'),
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
            decoration: InputDecoration(hintText: 'Quantity'),
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
            decoration: InputDecoration(hintText: 'Price'),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Please enter product price';
              }
              return null;
            },
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: _quantityController,
            decoration: InputDecoration(hintText: 'Quantity'),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Please enter product quantity';
              }
              return null;
            },
          ),

          SizedBox(height: 16),
          ElevatedButton(onPressed: () {}, child: const Text('Update Product')),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _codeController.dispose();
    _quantityController.dispose();
    _priceController.dispose();
    _totalPriceController.dispose();
    super.dispose();
  }
}
