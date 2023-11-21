# Pyenv / pipx
PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ] ; then
  export PYENV_ROOT
  command -v pyenv > /dev/null || export PATH="${PYENV_ROOT}/bin:${PATH}"
  if command -v pyenv > /dev/null; then
    eval "$(pyenv init -)"

    # Pipx default python from pipx_default_python venv
    PYENV_PIPX_VENV="$(pyenv prefix pipx_default_python 2> /dev/null)" \
      && export PIPX_DEFAULT_PYTHON="${PYENV_PIPX_VENV}/bin/python"
  fi
fi
