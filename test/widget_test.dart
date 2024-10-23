import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterconflatam_accesibility/data/speakers_data.dart';
import 'package:flutterconflatam_accesibility/data/speakers_repository.dart';
import 'package:flutterconflatam_accesibility/main.dart';
import 'package:flutterconflatam_accesibility/models/speaker.dart';
import 'package:flutterconflatam_accesibility/ui/bloc/speakers_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockSpeakersRepository extends Mock implements SpeakersRepository {}

void main() {
  late final SpeakersRepository repository;

  setUp(() {
    repository = MockSpeakersRepository();

    when(() => repository.fetchSpeakers()).thenAnswer(
      (_) async => speakersData.map((s) => Speaker.fromJson(s)).toList(),
    );
  });

  testWidgets('FlutterConfLatamApp meets a11y guidelines', (tester) async {
    final SemanticsHandle handle = tester.ensureSemantics();

    await tester.pumpWidget(
      BlocProvider(
        create: (_) => SpeakersBloc(repository)..add(const FetchSpeakers()),
        child: FlutterConfLatamApp(
          speakersRepository: repository,
        ),
      ),
    );

    expect(find.bySemanticsLabel('Cargando speakers'), findsOneWidget);

    await tester.pumpAndSettle();

    final finder = find.bySemanticsLabel('Boton favorito Desactivado').first;
    await tester.tap(finder);
    await tester.pump();

    expect(
      tester.getSemantics(find.text('Mike Diarmid')),
      matchesSemantics(label: 'Mike Diarmid - UK'),
    );

    expect(tester, meetsGuideline(androidTapTargetGuideline));
    expect(tester, meetsGuideline(textContrastGuideline));
    handle.dispose();
  });
}
