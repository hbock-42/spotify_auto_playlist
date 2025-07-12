alias ccw := cc-watch
# Live monitoring of Claude Code usage
[group('claud code usage')]
cc-watch:
    bunx ccusage blocks --live
