# CalcuLEAdora ![Android](https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white)  

![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)

![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white)
![Git](https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white)
![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)
![Figma](https://img.shields.io/badge/figma-%23F24E1E.svg?style=for-the-badge&logo=figma&logoColor=white)

## Sobre o projeto

Descreva aqui o objetivo do seu sistema de login simples em Flutter, quais problemas ele resolve e qualquer outra informação relevante sobre o que o sistema faz.

## Como clonar o repositório

Para começar a usar o sistema de login simples, você precisa clonar o repositório para a sua máquina local. Siga os passos abaixo para fazer isso:

1. Abra o terminal.
2. Clone o repositório utilizando o comando:
   ```bash
   git clone [URL-do-seu-repositório]
   ```
   Substitua `[URL-do-seu-repositório]` pela URL do seu repositório no GitHub.
3. Entre na pasta do projeto:
   ```bash
   cd nome-da-pasta
   ```
4. Instale as dependências necessárias:
   ```bash
   flutter pub get
   ```

## Configuração do Firebase

Para conectar o seu sistema de login ao Firebase, siga estas etapas:

1. **Crie um projeto no Firebase:**
   - Acesse [Firebase Console](https://console.firebase.google.com/) e crie um novo projeto.

2. **Adicione o Firebase ao seu app Flutter:**
   - No Firebase Console, clique em "Adicionar app" e selecione o ícone do Flutter.
   - Siga as instruções fornecidas para registrar seu app e baixe o arquivo `google-services.json`.
   - Coloque este arquivo na pasta `android/app` do seu projeto Flutter.

3. **Configure as dependências do Firebase no Flutter:**
   - Adicione as dependências do Firebase ao seu arquivo `pubspec.yaml`:
     ```yaml
     dependencies:
       firebase_core: ^latest_version
       firebase_auth: ^latest_version
     ```
   - Rode `flutter pub get` para instalar as novas dependências.

4. **Inicialize o Firebase no seu aplicativo Flutter:**
   - Modifique o arquivo `main.dart` para inicializar o Firebase antes de rodar o app:
     ```dart
     void main() async {
       WidgetsFlutterBinding.ensureInitialized();
       await Firebase.initializeApp();
       runApp(MyApp());
     }
     ```

## Como executar o projeto

Para executar o projeto, utilize o seguinte comando no terminal dentro da pasta do projeto:

```bash
flutter run
```

Certifique-se de que um dispositivo ou emulador esteja conectado para ver o aplicativo em ação.
