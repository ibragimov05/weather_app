import 'package:flutter/material.dart';

import '../bloc/blocs.dart';
import '../../../../../core/core.dart';
import '../../../../../injector_container.dart';

class AddNewPlaceModal extends StatefulWidget {
  const AddNewPlaceModal({super.key});

  @override
  State<AddNewPlaceModal> createState() => _AddNewPlaceModalState();
}

class _AddNewPlaceModalState extends State<AddNewPlaceModal> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  void _onAddTap() {
    if (_formKey.currentState!.validate()) {
      getIt.get<SavedLocationBloc>().add(AddNewLocationEvent(
            cityName: _controller.text.trim(),
          ));
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: TextFormField(
            controller: _controller,
            validator: (String? value) => value == null || value.trim().isEmpty
                ? 'Enter city name'
                : null,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.grey),
              ),
              labelText: 'Enter city name',
              labelStyle: const TextStyle(color: AppColors.grey),
              suffixIcon: IconButton(
                onPressed: _onAddTap,
                icon: const Icon(Icons.check),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
