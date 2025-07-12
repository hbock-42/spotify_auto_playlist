# Run any flutter command using fvm as a proxy
[group('flutter')]
flutter *command:
    @echo "{{BLUE}}\c"
    fvm flutter {{command}}
    @echo "{{NORMAL}}\c"


alias pub := flutter-pub-get
# Get flutter pub
[group('flutter')]
flutter-pub-get:
    @echo "{{BLUE}}\c"
    fvm flutter pub get
    @echo "{{NORMAL}}\c"


# Run any dart command using fvm as a proxy
[group('dart')]
dart *command:
    @echo "{{BLUE}}\c"
    fvm dart {{command}}
    @echo "{{NORMAL}}\c"


alias br := build-runner
# Run any build runner command with delete conflicting outputs option
[group('flutter')]
[group('build-runner')]
build-runner command:
    @echo "{{BLUE}}\c"
    fvm dart run build_runner {{command}} --delete-conflicting-outputs
    @echo "{{NORMAL}}\c"


alias brb := build-runner-build
# Run build runner build command with delete conflicting outputs option
[group('flutter')]
[group('build-runner')]
@build-runner-build:
    just br build


alias brw := build-runner-watch
# Run build runner watch command with delete conflicting outputs option
[group('flutter')]
[group('build-runner')]
@build-runner-watch:
    just br watch

# Run flutter analyze only on lib folder
[group('flutter')]
lint:
    @echo "{{BLUE}}\c"
    fvm flutter analyze lib
    @echo "{{NORMAL}}\c"


alias fg := flutter-gen
# Generate assets using flutter_gen (via build_runner)
[group('flutter')]
[group('flutter-gen')]
flutter-gen:
    @echo "{{BLUE}}\c"
    fvm dart run build_runner build --delete-conflicting-outputs
    @echo "{{NORMAL}}\c"

