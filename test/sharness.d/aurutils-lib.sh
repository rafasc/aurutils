if [ ! -x "$SHARNESS_BUILD_DIRECTORY/aur" ]; then
    echo 'Did you forget to run make test in the parent directory?' >&2
    exit 1
fi
