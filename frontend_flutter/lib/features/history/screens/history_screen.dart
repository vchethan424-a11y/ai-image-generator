import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/history_provider.dart';

import '../widgets/history_image_card.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() =>
      _HistoryScreenState();
}

class _HistoryScreenState
    extends State<HistoryScreen> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>
          HistoryProvider()
            ..fetchHistory(),

      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Generation History",
          ),
        ),

        body: Consumer<HistoryProvider>(
          builder:
              (context, provider, child) {

            // ============================================
            // LOADING
            // ============================================

            if (provider.isLoading) {
              return const Center(
                child:
                    CircularProgressIndicator(),
              );
            }

            // ============================================
            // EMPTY HISTORY
            // ============================================

            if (provider
                .historyList.isEmpty) {
              return const Center(
                child: Text(
                  "No History Found",
                ),
              );
            }

            // ============================================
            // HISTORY LIST
            // ============================================

            return ListView.builder(
              padding:
                  const EdgeInsets.all(20),

              itemCount:
                  provider.historyList.length,

              itemBuilder: (context, index) {

                final history =
                    provider.historyList[index];

                return HistoryImageCard(
                  history: history,

                  onDelete: () async {

                    try {

                      await provider
                          .deleteHistory(
                        history.id,
                      );

                      if (!context.mounted) {
                        return;
                      }

                      ScaffoldMessenger.of(
                              context)
                          .showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Deleted Successfully",
                          ),
                        ),
                      );

                    } catch (e) {

                      if (!context.mounted) {
                        return;
                      }

                      ScaffoldMessenger.of(
                              context)
                          .showSnackBar(
                        SnackBar(
                          content: Text(
                            e.toString(),
                          ),
                        ),
                      );
                    }
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}