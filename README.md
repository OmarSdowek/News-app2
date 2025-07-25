# 📰 News App – Flutter Application

A modern Flutter application that displays real-time news using an external API. The app supports **English and Arabic localization**, includes a **search feature**, and consists of four core screens. It follows clean architecture and uses reusable widgets and responsive layouts.

---

## 📱 App Screens

1. **Home Screen** – Displays top headlines and latest news.
2. **Search Screen** – Allows users to input search queries.
3. **Search Results Screen** – Displays articles matching the search.
4. **Detail Screen** – Shows full details of a selected article.

---

## ✨ Features

- 🔗 **API Integration** – Fetches news articles dynamically using [NewsAPI.org](https://newsapi.org/)
- 🌐 **Localization** – Multi-language support (**English 🇺🇸** and **Arabic 🇸🇦**) via `flutter_localizations` and `intl`
- 🔍 **Search Capability** – Users can search for news with real-time query handling
- 🧩 **Modular & Reusable Widgets** – Clean UI architecture using reusable components
- 📱 **Responsive Design** – Works seamlessly on different screen sizes
- ⚠️ **Error & Loading States** – Handles loading indicators, no results, and error messages smoothly

---


---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK installed
- Dart SDK
- News API key from [https://newsapi.org](https://newsapi.org)

### Installation

```bash
git clone https://github.com/OmarSdowek/News-app2.git
cd news-app-flutter
flutter pub get
flutter run

🌍 Localization
This app uses flutter_localizations and intl for localization.
You can switch between Arabic and English from the main Screen and Search result screen .

📦 Dependencies Used
http – for API calls

flutter_localizations – localization support
intl – translations


