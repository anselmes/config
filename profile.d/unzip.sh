unzip_multi() {
  find . -type f -name '*.zip' -exec unzip -- '{}' -x '*.zip' \;
}
