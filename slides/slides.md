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
  aboutme-background: "#ffffff"
  default-headingBg: "#127CE4"
  aboutme-color: "#000000"
---

<FlutterConfLatamLogo />

<v-clicks>

# Accesibilidad en Flutter
Primeros pasos para lograr aplicaciones accessibles

</v-clicks>

<!--
Notes:

- Dato Van gogh

-->

---
layout: about-me
background: "#ffffff"
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
- 🤹 **Utilizando lectores de pantalla**
- 🏋️‍♂️ **Semantic Widgets**
- 📤 **accesibility_tools**
- 🛠 **Unit Testing**
- 🕸️ **Bonus: Probando accesibilidad en la web**

</v-clicks>

<!--
Notes:

- 📝 Definición: Introducción a qué es accesibilidad (A11Y) y por qué es importante en el desarrollo de aplicaciones Flutter.
- 🎨 Estándares A11Y: Explicación de los estándares de accesibilidad, como WCAG y cómo aplicarlos en nuestras aplicaciones.
- 🧑‍💻 Tamaños de fuente: Recomendaciones de tamaño de fuente según las guías de WCAG y cómo evitar problemas como el desbordamiento de texto en Flutter.
- 🎥 Contraste de pantalla: Explicación de la importancia del contraste de color y cómo garantizar que el texto sea legible para personas con discapacidades visuales.
- 🏋️‍♂️ Semantic Widgets: Uso de widgets semánticos en Flutter como Semantics, MergeSemantics, y ExcludeSemantics para mejorar la accesibilidad.
- 🤓 Herramientas: Presentación de las herramientas y paquetes que nos permiten analizar y mejorar la accesibilidad en Flutter, como accessibility_tools.
- 👍 Best practices: Prácticas recomendadas para garantizar que tu aplicación Flutter sea accesible desde el inicio.
- 🛠 Testing: Cómo probar los widgets semánticos para asegurarnos de que cumplen con las pautas de accesibilidad y son usables con lectores de pantalla.
- 🤹 Activando screen readers: Explicación de cómo funcionan los lectores de pantalla (TalkBack en Android y VoiceOver en iOS) en combinación con Flutter.
- Bonus: Probando accesibilidad en la web: Breve demostración de cómo probar accesibilidad cuando desarrollas aplicaciones Flutter para la web.
-->

---
transition: fade-out
---

# Definición

![data](/assets/data.webp)


<!--
Notes:
Level A
The minimum level of accessibility, addressing the most fundamental considerations for a wide range of users.
Level AA
A level of accessibility that works for most devices and assistive technologies, such as screen readers. This is the level that most organizations aim for, and is commonly included in regulations or legal agreements.
Level AAA
The highest level of conformance, providing accessibility for the widest range of users. However, it isn't always practical or necessary in every situation.
-->


---
transition: fade-out
layout: image-right
image: https://miro.medium.com/v2/format:webp/0*il0WGc8SDQKjfIwV.gif
---

# a11y

<v-clicks>

- 🌎 4.5% de la población mundial tiene problemas visuales ([Color Blind Awareness](https://www.colourblindawareness.org/colour-blindness/))
- 🦾 Aproximadamente 1,000 millones de personas viven con alguna forma de discapacidad.
- 👨‍⚖️ En muchos países, como en los EE.UU. existen leyes que exigen que las aplicaciones sean accesibles, o las empresas podrían enfrentar sanciones legales.
- ⚪️ Proporcionar suficiente [contraste](https://webaim.org/resources/contrastchecker/)

</v-clicks>

<!--
Notes:
- Proporcionar accesibilidad asegura que las aplicaciones móviles lleguen a más usuarios.
- Otros numerismos l10n - localization o i18n - internazionalization
-->
---
transition: fade-out
---

# A11Y

![contrast](https://developer.android.com/static/images/guide/topics/ui/accessibility/color-contrast.svg)


<!--
Notes:

-
-->

---
transition: fade-out
layout: image-right
image: /assets/abuela.webp
---

# Tamaños de fuente
<v-clicks>

- WCAG recomienda un tamaño mínimo de fuente de 16px (aprox. 12pt) para mantener la legibilidad.
- Siempre prueba tu aplicación con configuraciones de tamaño de texto grande en dispositivos reales para asegurar que no se rompa la UI.


</v-clicks>

<!--
Notes:
- - `TextOverflow.ellipsis` en Flutter corta el texto largo con “…” para evitar que desborde su contenedor.
- Flexible widget
- Lo siguiente es ir un paso más alla.
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
- Los widgets básicos de Flutter ya contienen información accesible que es interpretada por estas herramientas sin la necesidad de configuraciones adicionales.

</v-clicks>
<!--
Notes:
- VoiceOver & TalkBack
- How to use screen readers on devices (Android)
-->

---
layout: section
transition: fade-out
---

# Revisando la aplicación
Encontrando elementos de mejora utilizando lectores de pantalla

<!--
Notes:
- VoiceOver & TalkBack
- How to use screen readers on devices (Android)
-->

---
transition: fade-out
---

# `Semantics` Widgets

- `label`: La descripción del elemento para el lector de pantalla. En este caso, se describe el item con el nombre del speaker.

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

# 🏋️‍♂️ Widget Tree

<img src="/assets/wtree.png" class="h100"/>


<!--
Notes:

-
-->
---
transition: fade-out
---

# 🏋️‍♂️ Semantics Tree

<img src="/assets/stree.png" class="h100"/>


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

````md magic-move
```dart
return Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.bold),
    ),
    const SizedBox(width: 8),
    Flexible(
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
      ),
    ),
  ],
);
```
```dart
return MergeSemantics(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      const SizedBox(width: 8),
      Flexible(
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  ),
);
```
````


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

# [`accessibility_tools`](https://pub.dev/packages/accessibility_tools)

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

# [`accessibility_tools`](https://pub.dev/packages/accessibility_tools)

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

# Unit Testing


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
layout: image-right
image: /assets/webaccessibility.png
---

# **Bonus**: Utilizando Accesibilidad en la Web

```bash
flutter run -d chrome --profile --dart-define=FLUTTER_WEB_DEBUG_SHOW_SEMANTICS=true
```
<!--
Notes:

- VoiceOver & TalkBack
- How to use screen readers on devices (Android)
-->
---
transition: fade-out
---

# Conclusiones

- **Accesibilidad es clave para todos**: Asegurar que las aplicaciones sean accesibles no solo beneficia a las personas con discapacidades, sino que puede expandir el mercado de tu producto.
- **A11Y no es complicado**: Flutter ofrece herramientas como `Semantics` y `accessibility_tools` que hacen fácil implementar accesibilidad sin mucho esfuerzo adicional.
- **Escalabilidad y Legibilidad**: Asegúrate de que los textos y elementos interactivos se adapten al tamaño de pantalla y ajustes de accesibilidad del dispositivo sin romper el diseño.
- **Cumplimiento de estándares**: Cumplir con guías como WCAG no es solo una recomendación, sino que puede ser una exigencia legal en muchos países.
- **Testing**: Usa los guidelines de accesibilidad para asegurarte de que tu aplicación pasa las pruebas de accesibilidad y sea fácil de usar para todos.
<!--
Notes:

- VoiceOver & TalkBack
- How to use screen readers on devices (Android)
-->
---
layout: about-me
helloMsg: Gracias!
transition: fade-out
name: @enzoftware
imageSrc: /assets/repo.png
---


<!--
Notes:

- VoiceOver & TalkBack
- How to use screen readers on devices (Android)
-->