// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:sliver/sourece_api/api.dart';
import 'package:sliver/sourece_api/source_model.dart';

class SourceNeutrantScreen extends StatefulWidget {
  const SourceNeutrantScreen({super.key});

  @override
  _SourceNeutrantScreenState createState() => _SourceNeutrantScreenState();
}

class _SourceNeutrantScreenState extends State<SourceNeutrantScreen> {
  List<SourceNeutrant>? sourceNeutrants;
  List<SourceNeutrant>? filteredNeutrants;
  bool isLoading = true;
  String selectedFilter = 'All'; // Default filter

  // List to store selected favorite items
  List<SourceNeutrant> selectedFavorites = [];

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
          filteredNeutrants = sourceNeutrants; // By default show all data
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
      // ignore: avoid_print
      print('Error occurred: $e');
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error occurred while fetching data')),
      );
    }
  }

  void applyFilter(String filter) {
    setState(() {
      selectedFilter = filter;

      if (filter == 'All') {
        filteredNeutrants = sourceNeutrants;
      } else {
        filteredNeutrants = sourceNeutrants
            ?.where((source) =>
                (source.source?.likelyToEatIn?.toLowerCase() ?? '')
                    .contains(filter.toLowerCase()))
            .toList();
      }
    });
  }

  // Function to handle checkbox change
  void toggleFavorite(SourceNeutrant sourceNeutrant, bool? isSelected) {
    setState(() {
      if (isSelected == true) {
        selectedFavorites.add(sourceNeutrant);
      } else {
        selectedFavorites.remove(sourceNeutrant);
      }
    });
  }

  // Function to calculate total price of selected items
  double calculateTotalPrice() {
    return selectedFavorites.fold(
        0.0, (sum, item) => sum + (item.price ?? 0.0));
  }

  // Function to show the details in a dialog
  void showDetailsPopup(BuildContext context, SourceNeutrant sourceNeutrant) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title:
              Text('${sourceNeutrant.source?.foodName ?? 'FoodName'} Details'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(
                    'Food Name: ${sourceNeutrant.source?.foodName ?? 'FoodName'}'),
                Text('Category: ${sourceNeutrant.source?.category ?? ''}'),
                Text(
                    'Likely to Eat In: ${sourceNeutrant.source?.likelyToEatIn ?? 'Unknown'}'),
                Text(
                    'Quantity: ${sourceNeutrant.source?.quantity?.toString() ?? 'Unknown'}'),
                Text(
                    'Unit: ${sourceNeutrant.source?.unit?.toString() ?? 'Unknown'}'),
                Text(
                    'Water: ${sourceNeutrant.source?.water?.toString() ?? 'Unknown'}'),
                Text(
                    'Vitamin B12: ${sourceNeutrant.source?.vitaminB12?.toString() ?? 'Unknown'}'),
                Text(
                    'Fiber: ${sourceNeutrant.source?.fiber?.toString() ?? 'Unknown'}'),
                Text(
                    'Calcium: ${sourceNeutrant.source?.calcium?.toString() ?? 'Unknown'}'),
                Text(
                    'Iron: ${sourceNeutrant.source?.iron?.toString() ?? 'Unknown'}'),
                Text(
                    'Magnesium: ${sourceNeutrant.source?.magnesium?.toString() ?? 'Unknow'}'),
                // Add more details here if needed
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.green,
        title: const Text(
          'Food sources Gallery',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        actions: [
          PopupMenuButton<String>(
            color: Colors.white,
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onSelected: applyFilter,
            itemBuilder: (BuildContext context) {
              return {'All', 'Breakfast', 'Lunch', 'Dinner'}
                  .map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                // Display total price

                Expanded(
                  child: ListView.builder(
                    itemCount: filteredNeutrants?.length ?? 0,
                    itemBuilder: (context, index) {
                      final sourceNeutrant = filteredNeutrants![index];
                      final isSelected =
                          selectedFavorites.contains(sourceNeutrant);

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () =>
                              showDetailsPopup(context, sourceNeutrant),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Column for Text and Quantity
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Text(
                                            // ignore: unnecessary_string_interpolations
                                            '${sourceNeutrant.source?.foodName ?? 'FoodName'}',
                                            style:
                                                const TextStyle(fontSize: 20),
                                            softWrap: false,
                                            overflow: TextOverflow.visible,
                                          ),
                                        ),
                                        Text(
                                          'Quantity: ${sourceNeutrant.source?.quantity?.toString() ?? 'Unknown'}g',
                                        ),
                                        Text(
                                            'Rs: ${sourceNeutrant.price.toString()}'),
                                      ],
                                    ),
                                  ),
                                  // Checkbox to add/remove from favorites
                                  Checkbox(
                                    value: isSelected,
                                    onChanged: (bool? value) {
                                      toggleFavorite(sourceNeutrant, value);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Total Price: Rs ${calculateTotalPrice().toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
