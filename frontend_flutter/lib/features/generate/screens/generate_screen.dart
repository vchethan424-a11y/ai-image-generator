import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/generate_provider.dart';

import '../widgets/generated_image_card.dart';
import '../widgets/prompt_input.dart';
import '../widgets/style_selector.dart';

class GenerateScreen extends StatefulWidget {

  const GenerateScreen({
    super.key,
  });

  @override
  State<GenerateScreen> createState() =>
      _GenerateScreenState();
}

class _GenerateScreenState
    extends State<GenerateScreen> {

  final TextEditingController
      promptController =
      TextEditingController();

  @override
  void dispose() {

    promptController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(

      create: (_) => GenerateProvider(),

      child: Scaffold(

        appBar: AppBar(

          title: const Text(
            "Generate Image",
          ),
        ),

        body: SafeArea(

          child: Padding(

            padding:
                const EdgeInsets.all(20),

            child:
                Consumer<GenerateProvider>(

              builder:
                  (
                    context,
                    provider,
                    child,
                  ) {

                return SingleChildScrollView(

                  child: Column(

                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [

                      // ============================================
                      // TITLE
                      // ============================================

                      const Text(

                        "Enter Prompt",

                        style: TextStyle(
                          fontSize: 22,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                      const SizedBox(
                        height: 15,
                      ),

                      // ============================================
                      // PROMPT INPUT
                      // ============================================

                      PromptInput(
                        controller:
                            promptController,
                      ),

                      const SizedBox(
                        height: 25,
                      ),

                      // ============================================
                      // STYLE TITLE
                      // ============================================

                      const Text(

                        "Select Style",

                        style: TextStyle(
                          fontSize: 20,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                      const SizedBox(
                        height: 15,
                      ),

                      // ============================================
                      // STYLE SELECTOR
                      // ============================================

                      StyleSelector(

                        selectedStyle:
                            provider
                                .selectedStyle,

                        onChanged:
                            provider
                                .changeStyle,
                      ),

                      const SizedBox(
                        height: 30,
                      ),

                      // ============================================
                      // GENERATE BUTTON
                      // ============================================

                      SizedBox(

                        width: double.infinity,

                        height: 60,

                        child: ElevatedButton(

                          onPressed:
                              provider.isGenerating

                                  ? null

                                  : () async {

                                      if (promptController
                                          .text
                                          .trim()
                                          .isEmpty) {

                                        ScaffoldMessenger.of(
                                                context)
                                            .showSnackBar(

                                          const SnackBar(

                                            content: Text(
                                              "Please enter prompt",
                                            ),
                                          ),
                                        );

                                        return;
                                      }

                                      try {

                                        await provider
                                            .generateImage(

                                          prompt:
                                              promptController
                                                  .text
                                                  .trim(),
                                        );

                                        if (!context
                                            .mounted) {

                                          return;
                                        }

                                      } catch (e) {

                                        if (!context
                                            .mounted) {

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

                          child:
                              provider.isGenerating

                                  ? const SizedBox(

                                      width: 25,
                                      height: 25,

                                      child:
                                          CircularProgressIndicator(
                                        strokeWidth: 3,
                                      ),
                                    )

                                  : const Text(
                                      "Generate Image",
                                    ),
                        ),
                      ),

                      const SizedBox(
                        height: 30,
                      ),

                      // ============================================
                      // GENERATED IMAGE
                      // ============================================

                      if (provider
                          .generatedImage
                          .isNotEmpty)

                        GeneratedImageCard(

                          imagePath:
                              provider
                                  .generatedImage,
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}