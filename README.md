# CalcuLEAdora ![Android](https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white)  

![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)

![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white)
![Git](https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white)
![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)
![Figma](https://img.shields.io/badge/figma-%23F24E1E.svg?style=for-the-badge&logo=figma&logoColor=white)

## 📖 Sobre o projeto

Um sistema de login e registro em Flutter integrado ao Firebase, usando Firebase Authentication para autenticação segura e Cloud Firestore para armazenar dados do usuário, como nome e email.

## 🖼️ Imagens do projeto (UI)

 | ![Screen2](https://github.com/AntonioSantosFilho/APP-Sistema-Login-Registro-Firebase/blob/main/readme-assets/login.png) | ![Screen4](https://raw.githubusercontent.com/AntonioSantosFilho/APP-Sistema-Login-Registro-Firebase/main/readme-assets/registro.png) | ![Screen3](https://raw.githubusercontent.com/AntonioSantosFilho/APP-Sistema-Login-Registro-Firebase/main/readme-assets/registro-texto.png) | ![Logo](https://raw.githubusercontent.com/AntonioSantosFilho/APP-Sistema-Login-Registro-Firebase/main/readme-assets/logado.png)|
|:---:|:---:|:---:|:---:|

## 📥 Como clonar o repositório

Para começar a usar o sistema, você precisa clonar o repositório para a sua máquina local. Siga os passos abaixo para fazer isso:

1. Abra o terminal.
2. Clone o repositório utilizando o comando:
   ```bash
   git clone https://github.com/AntonioSantosFilho/APP-Sistema-Login-Registro-Firebase
   ```
3. Entre na pasta do projeto e instale as dependências necessárias:
   ```bash
   cd APP-Sistema-Login-Registro-Firebase

   ```
     ```bash

   flutter pub get
   ```

## 🔥 Configuração do Firebase

Para conectar o seu sistema de login ao Firebase, siga estas etapas:

1. **Crie um projeto no Firebase:**
   - Acesse [Firebase Console](https://console.firebase.google.com/) e crie um novo projeto.

2. **Adicione o Firebase ao seu app Flutter:**
   - No Firebase Console, clique em "Adicionar app" e selecione o ícone do Flutter.
   - Siga as instruções fornecidas para registrar seu app.

3. **Configure as dependências do Firebase no Flutter:**
   - Verifique se as dependências do Firebase estão atualizadas no seu `pubspec.yaml`.

## 📦 Bibliotecas utilizadas

- cupertino_icons
- firebase_auth
- firebase_core
- cloud_firestore
- intl_phone_field

## ▶️ Como executar o projeto

Para executar o projeto, utilize o seguinte comando no terminal dentro da pasta do projeto:

```bash
flutter run
```

Certifique-se de que um dispositivo ou emulador esteja conectado para ver o aplicativo em ação.
