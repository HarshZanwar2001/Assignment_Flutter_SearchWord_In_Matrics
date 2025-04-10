# 🔠 Word Grid Search App (Flutter)

A Flutter application where users can:
- Create a customizable alphabet grid
- Search for words in **three directions** (East, South, South-East)
- Highlight matches
- Reset the setup anytime

---

## 🚀 Features

- 📱 **Splash Screen**
- 🭮 Input rows (m) and columns (n) to form an m×n grid
- 🔤 Enter alphabets into the grid (m×n total)
- 🧠 Search for a word in the grid
  - ➡️ East (left to right)
  - ⬇️ South (top to bottom)
  - ↘ South-East (diagonal)
- ✅ Highlight matched letters
- 🔁 Reset to initial input screen at any time

---

## 🧩 Screenshots

> ![image](https://github.com/user-attachments/assets/ea04ef75-d6aa-4dad-bc07-a8e74c479538)
> ![image](https://github.com/user-attachments/assets/3284f238-d5f9-4cae-a6ef-115ecc90ae71)
> ![image](https://github.com/user-attachments/assets/a1b52aec-3a13-4efa-bdae-efe742ab41a9)
> ![image](https://github.com/user-attachments/assets/3b17456d-698a-494e-88b8-5ace17c092a7)


---

## 📂 Project Structure

```bash
lib/
├── main.dart
├── screens/
│   ├── splash_screen.dart
│   ├── input_screen.dart
│   ├── grid_input_screen.dart
│   └── grid_display_screen.dart
└── providers/
    └── grid_provider.dart
```

---

## 🔧 Tech Stack

- [Flutter](https://flutter.dev/)
- [Provider](https://pub.dev/packages/provider) (state management)

---

## 🛠️ How to Run

1. Clone the repository:
   ```bash
   git clone https://github.com/HarshZanwar2001/Assignment_Flutter_SearchWord_In_Matrics.git
   cd word-grid-search
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

---



---

## 🧑‍💼 Developer

**👤 Harsh**  
💼 [LinkedIn](https://www.linkedin.com/in/harsh-zanwar-46a9b61aa/)  

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

