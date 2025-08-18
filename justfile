build: templates add_preview create_igthemes

templates:
  whiskers templates/igtheme.tera
  whiskers templates/svg.tera
  whiskers templates/logo.tera

add_preview:
  for flavor in $(whiskers --list-flavors -o plain); do \
    for accent in $(whiskers --list-accents -o plain); do \
      cp "./assets/$flavor.webp" "./themes/${flavor^}/${accent^}/preview.webp"; \
    done; \
  done

create_igthemes:
  for flavor in $(whiskers --list-flavors -o plain); do \
    for accent in $(whiskers --list-accents -o plain); do \
      igtheme_path="./themes/${flavor^}/${accent^}.igtheme"; \
      folder_name="Catppuccin-${flavor^}-${accent^}"; \
      cp -r "./themes/${flavor^}/${accent^}" "$folder_name"; \
      zip -rq $igtheme_path "$folder_name"; \
      rm -rf "$folder_name"; \
    done; \
  done
