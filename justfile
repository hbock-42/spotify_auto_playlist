import './just_modules/flutter.just'
import './just_modules/table_of_content.just'
import './just_modules/ccusage.just'

# List recipe
[group('just')]
list-recipe:
    @just --list --unsorted

alias c := choose

# Choose a recipe in the list, no need to type its name
[group('just')]
choose:
    @just --choose

# Summarize recipe [including submodule]
[group('just')]
summarize:
    just --summary --unsorted

# Format justfile (unstable feature)
[group('just')]
fmt:
    just --fmt --unstable
