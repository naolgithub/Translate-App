import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/app_state.dart';
import '/data/constants.dart';
import '/data/models.dart';

enum ChooseLanguagePageType { translateFrom, translateTo }

enum ParentPage { text, image }

class ChooseLanguagePage extends StatefulWidget {
  final ChooseLanguagePageType pageType;
  final ParentPage parentPage;

  const ChooseLanguagePage({
    Key? key,
    required this.pageType,
    required this.parentPage,
  }) : super(key: key);

  @override
  ChooseLanguagePageState createState() => ChooseLanguagePageState();
}

class ChooseLanguagePageState extends State<ChooseLanguagePage> {
  late List<SupportedLanguage> filteredLanguages;
  final List<SupportedLanguage> allLanguages = [...supportedLanguages];

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    if (widget.pageType == ChooseLanguagePageType.translateFrom) {
      allLanguages.insert(0, detectLanguage);
    }
    filteredLanguages = allLanguages;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    var languageFrom = appState.languageFrom;
    var languageTo = appState.languageTo;

    String pageTitle;
    SupportedLanguage selectedLanguage;
    switch (widget.pageType) {
      case ChooseLanguagePageType.translateFrom:
        pageTitle = 'Translate From';
        selectedLanguage = languageFrom;
        break;
      case ChooseLanguagePageType.translateTo:
        pageTitle = 'Translate To';
        selectedLanguage = languageTo;
        break;
      default:
        throw ArgumentError('Unhandled page type: ${widget.pageType}');
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                onChanged: (query) {
                  setState(() {
                    filteredLanguages = allLanguages
                        .where((language) => language.name
                            .toLowerCase()
                            .contains(query.toLowerCase()))
                        .toList();
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Search language',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.check_circle),
              title: Text(
                'Selected: ${selectedLanguage.name}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            Expanded(
              child: Scrollbar(
                controller: _scrollController,
                child: ListView.builder(
                  itemCount: filteredLanguages.length,
                  itemBuilder: (context, index) {
                    final language = filteredLanguages[index];
                    final isSelected = language == selectedLanguage;

                    return Container(
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.blue : null,
                        borderRadius: BorderRadius.circular(
                          isSelected ? 10.0 : 0.0,
                        ),
                      ),
                      child: ListTile(
                        title: Text(
                          language.name,
                          style: TextStyle(
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: isSelected ? Colors.white : null,
                          ),
                        ),
                        onTap: () {
                          switch (widget.pageType) {
                            case ChooseLanguagePageType.translateFrom:
                              appState.changeLanguageFrom(language);
                              break;
                            case ChooseLanguagePageType.translateTo:
                              appState.changeLanguageTo(language);
                              break;
                          }
                          if (widget.parentPage == ParentPage.text) {
                            appState.triggerTranslation();
                          } else {
                            appState.translateImageDetections();
                          }
                          Navigator.pop(context);
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
