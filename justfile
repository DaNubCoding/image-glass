build:
  rm -rf dist
  mkdir dist
  for flavor in $(whiskers --list-flavors -o plain); do \
    for accent in $(whiskers --list-accents -o plain); do \
      name="Catppuccin-${flavor^}-${accent^}"; \
      (cd "./themes/${flavor^}" && zip -rq "../../dist/$name.igtheme" "${accent^}"); \
    done; \
  done
