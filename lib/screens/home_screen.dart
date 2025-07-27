import 'package:flutter/material.dart';
import 'package:notes_using_local_storage/providers/name_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (mounted) {
        Provider.of<NameProvider>(context, listen: false).getName();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NameProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Local storage using shared preferences')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            spacing: 12,
            children: [
              TextField(controller: nameController),
              ElevatedButton(
                onPressed: () async {
                  await provider.save(nameController.text.trim());
                },
                child: Text('Save'),
              ),

              Consumer<NameProvider>(
                builder: (context, provider, child) {
                  return provider.name != null
                      ? Text(provider.name!)
                      : Text('No name saved');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
