function cmd_open() {
  case "$OSTYPE" in
  darwin*) open $1 ;;
  linux*) xdg-open $1 ;;
  msys*) rundll32 $1 ;;
  *) echo "unknown os: $OSTYPE" ;;
  esac
}
