import 'package:flutter/material.dart';
import 'package:sliver/nutroviteapp/api.dart';
import 'package:sliver/nutroviteapp/source_model.dart';

class SourceNeutrantScreen extends StatefulWidget {
  const SourceNeutrantScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SourceNeutrantScreenState createState() => _SourceNeutrantScreenState();
}

class _SourceNeutrantScreenState extends State<SourceNeutrantScreen> {
  List<SourceNeutrant>? sourceNeutrants;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchSourceNeutrants();
  }

  void fetchSourceNeutrants() async {
    try {
      SourceApi apiService = SourceApi();
      dynamic fetchedData = await apiService.getSourceOfNeutrents();

      if (fetchedData != null) {
        setState(() {
          sourceNeutrants = fetchedData;
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No data available')),
        );
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error occurred: $e');
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error occurred while fetching data')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Source of Neutrents')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: sourceNeutrants?.length ?? 0,
              itemBuilder: (context, index) {
                final sourceNeutrant = sourceNeutrants![index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'ID: ${sourceNeutrant.source?.sId ?? 'Unknown'}'),
                          Text(
                              'FID: ${sourceNeutrant.source?.fId ?? 'Unknown'}'),
                          Text(
                              'FoodName: ${sourceNeutrant.source?.foodName ?? 'FoodName'}'),
                          Text(
                              'Catogry: ${sourceNeutrant.source?.category ?? ''}'),
                          Text(
                              'likelyToEatIn: ${sourceNeutrant.source?.likelyToEatIn ?? 'Unknown'}'),
                          Text(
                              'Quantity: ${sourceNeutrant.source?.quantity?.toString() ?? 'Unknown'}'),
                          Text(
                              'Unit: ${sourceNeutrant.source?.unit?.toString() ?? 'Unknown'}'),
                          Text(
                              'Water: ${sourceNeutrant.source?.water?.toString() ?? 'Unknown'}'),
                          Text(
                              'VitaminD: ${sourceNeutrant.source?.vitaminB12?.toString() ?? 'Unknown'}'),
                          Text(
                              'VitaminDB12: ${sourceNeutrant.source?.vitaminB12?.toString() ?? 'Unknown'}'),
                          Text(
                              'fiber: ${sourceNeutrant.source?.fiber?.toString() ?? 'Unknown'}'),
                          Text(
                              'Calciun: ${sourceNeutrant.source?.calcium?.toString() ?? 'Unknown'}'),
                          Text(
                              'Iron: ${sourceNeutrant.source?.iron?.toString() ?? 'Unknown'}'),
                          Text(
                              'Magnesium: ${sourceNeutrant.source?.magnesium?.toString() ?? 'Unknown'}'),
                          Text(
                              'Potassium: ${sourceNeutrant.source?.potassium?.toString() ?? 'Unknown'}'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
