---
theme: the-unnamed
background: https://images.nightcafe.studio/jobs/mkNMeMTAWWFDM4TpziuJ/mkNMeMTAWWFDM4TpziuJ_6x.jpg?tr=w-1600,c-at_max
title: Accesibilidad en Flutter
class: text-center
drawings:
  persist: false
transition: slide-left
mdc: true
themeConfig:
  background: "#0B121D"
  default-background: "#0B121D"
  center-background: "#0B121D"
  cover-background: "#0B121D"
  section-background: "#0B121D"
  aboutme-background: "#0B121D"
  default-headingBg: "#127CE4"
  aboutme-color: "#ffffff"
---

<FlutterConfLatamLogo />

# Flutter Accesibility

Primeros pasos para lograr aplicaciones accessibles

<!--
Notes:

- Dato Van gogh

-->

---
layout: about-me
helloMsg: Hola!
transition: fade-out
name: Enzo Lizama Paredes
imageSrc: https://avatars.githubusercontent.com/u/22333076
job: Senior Software Engineer
social1: @enzoftware
---

<FlutterConfLatamLogo />






---
transition: fade-out
---

# Agenda

<v-clicks>

- 📝 **Definicion**
- 🎨 **Estandares A11y**
- 🧑‍💻 **Tamaños de fuente**
- 🎥 **Contraste de pantalla**
- 🏋️‍♂️ **Semantic Widgets**
- 📤 **Herramientas**
- 💀 **Best practices**
- 🛠 **Testing**
- 🤹 **Activando screen readers**
- 🛠 **Bonus: Probando accesibilidad en la web**

</v-clicks>

<!--
Notes:

-->

---
transition: fade-out
---

# Definicion


<!--
Notes:

-
-->


---
transition: fade-out
---

# A11Y


<!--
Notes:

-
-->

---
transition: fade-out
---

# Tamaños de fuente


<!--
Notes:

-
-->

---
layout: image-right
transition: fade-out
image: /assets/talkback.png
---

# Utilizando screeen readers

<v-clicks>

- TalkBack (Android) & VoiceOver (iOS) son los lectores de pantalla.
- Permite navegar la aplicación mediante gestos.
- S

</v-clicks>
<!--
Notes:

- VoiceOver & TalkBack
- How to use screen readers on devices (Android)
-->

---
transition: fade-out
---

# `Semantics` Widgets

````md magic-move {lines: false}
```dart
return _SpeakerListTile(
  onTap: onTap,
  speaker: speaker,
  onFavoriteTap: onFavoriteTap,
  isFavorite: isFavorite,
  label: label,
);
```
```dart {*|2|*}
return Semantics(
  label: speaker.name,
  child: _SpeakerListTile(
    onTap: onTap,
    speaker: speaker,
    onFavoriteTap: onFavoriteTap,
    isFavorite: isFavorite,
    label: label,
  ),
);
```
````

<!--
Notes:
- showSemanticsDebugger
- A widget that annotates the widget tree with a description of the meaning of the widgets.
- Used by assistive technologies, search engines, and other semantic analysis software to determine the meaning of the application.
-->

---
transition: fade-out
---

# 🏋️‍♂️ Semantics Tree



<!--
Notes:

-
-->


---
transition: fade-out
---

# Semantic Widgets: `ExcludeSemantics`

- Excluir widget del arbol semantico

````md magic-move
```dart {*|1|*}
ExcludeSemantics(
  child: Text(
    speaker.flagEmoji,
    ...
  ),
),
```
````

- Excluir widget condicionalmente

````md magic-move
```dart {*|2|*}
ExcludeSemantics(
  excluding: speaker.company.isEmpty,
  child: SpeakerDetailItem(title: 'Compañia', text: speaker.company),
),
```
````

<!--
Notes:

-
-->
---
transition: fade-out
---

# Semantic Widgets: `MergeSemantics`


<!--
Notes:

-
-->
---
transition: fade-out
---

# Semantic Widgets: `OrdinalSortKey`

````md magic-move

```dart
return Scaffold(
  appBar: AppBar(
    centerTitle: true,
    title: Text('FlutterConf Latam 2024'),
  ),
  body: const SpeakersListView(),
  floatingActionButton: FloatingActionButton(),
);
```

```dart {*|6,11,15|*}
return Scaffold(
  appBar: AppBar(
    centerTitle: true,
    title: Semantics(
      header: true,
      sortKey: const OrdinalSortKey(0),
      child: const Text('FlutterConf Latam 2024'),
    ),
  ),
  body: Semantics(
    sortKey: const OrdinalSortKey(2),
    child: const SpeakersListView(),
  ),
  floatingActionButton: Semantics(
    sortKey: const OrdinalSortKey(1),
    button: true,
   ...
  ),
);
```
````


<!--
Notes:

-
-->
---
layout: image-right
transition: fade-out
image: /assets/tools.png
---

# Herramientas

- Agregar la dependencia en `pubspec.yaml`
```yaml
dependencies:
  accessibility_tools: ^2.2.3
```

- Configurar `AccesibilityTools` dentro de `MaterialApp`.

```dart {*|4|*}
@override
Widget build(BuildContext context) {
  return MaterialApp(
    builder: (context, child) => AccessibilityTools(child: child),
    home: SpeakersView(speakersRepository: speakersRepository),
  );
}
```

<!--
Notes:

- accesibility_tools
-->

---
layout: image-right
transition: fade-out
image: /assets/tools.png
---

# Herramientas : accesibility_tools

- Configurar `AccesibilityTools` dentro de `MaterialApp`.

```dart {*|2,3|4,5|6,7|8,9|*}
AccessibilityTools(
  // Set to null to disable tap area checking
  minimumTapAreas: MinimumTapAreas.material,
  // Check for semantic labels
  checkSemanticLabels: false,
  // Check for flex overflows
  checkFontOverflows: true,
  // Check for image labels
  checkImageLabels: true,
  // Set how much info about issues is printed
  logLevel: LogLevel.verbose,
  // Set where the buttons are placed
  buttonsAlignment: ButtonsAlignment.bottomRight,
  // Enable or disable draging the buttons around
  enableButtonsDrag: false,
  child: child,
)
```

<!--
Notes:

- accesibility_tools
-->

---
transition: fade-out
---

# Testing


```dart {*|2,3|5,6|7-10|12-15|17-18|19|*}
testWidgets('FlutterConfLatamApp meets a11y guidelines', (tester) async {
  final SemanticsHandle handle = tester.ensureSemantics();
  await tester.pumpWidget(...);

  expect(find.bySemanticsLabel('Cargando speakers'), findsOneWidget);
  await tester.pumpAndSettle();

  final finder = find.bySemanticsLabel('Boton favorito Desactivado').first;
  await tester.tap(finder);
  await tester.pump();

  expect(
    tester.getSemantics(find.text('Mike Diarmid')),
    containsSemantics(label: 'Mike Diarmid - UK'),
  );

  expect(tester, meetsGuideline(androidTapTargetGuideline));
  expect(tester, meetsGuideline(textContrastGuideline));
  handle.dispose();
});
```

<!--
Notes:

- findByLabel
- meetsGuideline
-->


---
transition: fade-out
---

# Bonus: Utilizando Accesibilidad en la Web

```bash
flutter run -d chrome --profile --dart-define=FLUTTER_WEB_DEBUG_SHOW_SEMANTICS=true
```
<!--
Notes:

- VoiceOver & TalkBack
- How to use screen readers on devices (Android)
-->
---
layout: center
transition: fade-out
---

# Gracias
- GitHub - @enzoftware
- X - @enzoftware
<!--
Notes:

- VoiceOver & TalkBack
- How to use screen readers on devices (Android)
-->