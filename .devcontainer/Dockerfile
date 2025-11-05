FROM sauloefo/devcontainer:latest

# install postgresql

RUN <<EOF
  apt update
  apt full-upgrade -y
  apt install libpq-dev postgresql postgresql-contrib gnupg2 -y
EOF

RUN <<EOF
  service postgresql start;
  su - postgres -c psql\ --command\ "ALTER\ USER\ postgres\ WITH\ PASSWORD\ \'postgres\';"
EOF

# install rbenv

RUN <<EOF
  apt install -y autoconf patch build-essential rustc libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libgmp-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev uuid-dev
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv

  ~/.rbenv/bin/rbenv init

  # install ruby-build

  git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
  ~/.rbenv/plugins/ruby-build/install.sh

EOF

# install ruby globally

RUN <<EOF
  eval "$(~/.rbenv/bin/rbenv init - --no-rehash bash)"
  latest_stable_version=`rbenv install -l | grep -v - | tail -1`

  rbenv install $latest_stable_version
  rbenv global $latest_stable_version
EOF

# install rails globally

RUN <<EOF
  apt install -y tzdata

  eval "$(~/.rbenv/bin/rbenv init - --no-rehash bash)"
  gem install bundler
  bundle config --global set silence_root_warning true
  gem install rails
EOF

# install ruby version of the project to save time when rebuilding the container

ENV project_files_folder=/tmp/project-files

COPY .devcontainer/cp.md .devcontainer/tmp/project-files/.ruby-version "$project_files_folder"/

RUN <<EOF
  eval "$(~/.rbenv/bin/rbenv init - --no-rehash bash)"
  if [ -f "$project_files_folder"/.ruby-version ]; then
    rbenv install $(cat "$project_files_folder"/.ruby-version) --skip-existing
    rbenv global $(cat "$project_files_folder"/.ruby-version)
  fi
EOF

# install heroku-cli

RUN curl https://cli-assets.heroku.com/install-ubuntu.sh | sh

# authenticate to heroku: https://devcenter.heroku.com/articles/authentication

# install claude
RUN <<EOF
  curl -fsSL claude.ai/install.sh | bash
EOF
