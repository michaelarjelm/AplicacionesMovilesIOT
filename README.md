AplicacionesMovilesIOT

Proyecto Flutter de ejemplo para la materia de Aplicaciones Móviles e IoT.

Este repositorio contiene una aplicación Flutter multiplataforma (Windows, web, iOS, Android) creada como proyecto de práctica. Contiene la lógica principal en `lib/`, recursos en `assets/` y configuraciones para cada plataforma en las carpetas `android/`, `ios/`, `web/`, `windows/`, `macos/` y `linux/`.

## Requisitos

- Flutter SDK instalado y agregado al PATH
- Un dispositivo o emulador disponible (Android/iOS) o un navegador para ejecutar la versión web
- En Windows, PowerShell o el terminal que prefieras

## Ejecutar la aplicación

Abre una terminal en la raíz del proyecto (donde está `pubspec.yaml`) y ejecuta:

```powershell
cd AplicacionesMovilesIOT
flutter run
```

El comando listará dispositivos conectados. Selecciona el dispositivo deseado (por ejemplo `chrome` para ejecutar en el navegador) y la aplicación arrancará en modo debug.

Para compilar para una plataforma específica:

- Windows (build de escritorio):

```powershell
flutter build windows
```

- Web (release):

```powershell
flutter build web
```

## Estructura principal

- `lib/` - Código Dart de la aplicación
  - `main.dart` - Punto de entrada
  - `proyecto_uno.dart` - Lógica/Widgets principales
- `android/`, `ios/`, `web/`, `windows/`, `macos/`, `linux/` - Código y configuraciones por plataforma
- `test/` - Tests unitarios
- `pubspec.yaml` - Dependencias y assets

## Desarrollo y pruebas

- Ejecuta tests:

```powershell
flutter test
```

- Formatea el código:

```powershell
flutter format .
```

## Resolución de problemas

- "No pubspec.yaml file found": asegúrate de ejecutar comandos desde la carpeta `AplicacionesMovilesIOT` donde existe `pubspec.yaml`.
- Si Flutter no detecta dispositivos: ejecuta `flutter doctor` y sigue las instrucciones.

## Contribuciones

Este repositorio es para práctica académica. Si deseas mejorar la documentación o añadir features, crea un fork y un pull request.

---

Fecha de actualización: 2025-10-11
