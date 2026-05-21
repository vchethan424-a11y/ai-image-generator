import 'dart:io';

import 'package:flutter/material.dart';

import '../models/history_model.dart';

class HistoryImageCard
    extends StatelessWidget {
  final HistoryModel history;

  final VoidCallback onDelete;

  const HistoryImageCard({
    super.key,
    required this.history,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          const EdgeInsets.only(bottom: 20),

      decoration: BoxDecoration(
        color: Colors.grey.shade900,

        borderRadius:
            BorderRadius.circular(20),
      ),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(
              top: Radius.circular(20),
            ),

            child: Image.file(
              File(history.imageUrl),

              height: 250,

              width: double.infinity,

              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding:
                const EdgeInsets.all(16),

            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [
                Text(
                  history.prompt,

                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment:
                      MainAxisAlignment
                          .spaceBetween,

                  children: [
                    Container(
                      padding:
                          const EdgeInsets
                              .symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),

                      decoration:
                          BoxDecoration(
                        color: Colors
                            .deepPurple,

                        borderRadius:
                            BorderRadius
                                .circular(
                          20,
                        ),
                      ),

                      child: Text(
                        history.style,
                      ),
                    ),

                    IconButton(
                      onPressed: onDelete,

                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}