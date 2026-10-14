# The following report was generated with Claude Code on Oct 14 2026.
# It outlines the process for updating Ruby+Rails for the project.
# -Mike
#
# Upgrading Ruby 3.1 → 3.3 and Rails 7.0 → 8.1

Branch: `upgrade-ruby-rails` (see `git log main..upgrade-ruby-rails`). Ruby is managed with rvm.

## Steps

```
Ruby 3.1.4 / Rails 7.0.5
│
├─ rvm install 3.2.11 && rvm use 3.2.11
├─ edit .ruby-version + Gemfile `ruby "3.2.11"`, rails "~> 7.0.10"
├─ pin i18n 1.14.8, stringio 3.0.1.2, tsort 0.1.0 (stop bundler upgrading them)
├─ bundle install
├─ tests, manually test app
└─ commit
↓
Rails 7.1
│
├─ Gemfile: rails "~> 7.1", puma "~> 6.0"
├─ bundle update rails
├─ bin/rails app:update   (review each diff; adds new_framework_defaults_7_1.rb)
├─ bin/rails zeitwerk:check
├─ tests, manually test app
└─ commit
↓
Rails 7.2   (same steps; adds new_framework_defaults_7_2.rb)
↓
Rails 8.0   (same steps; sqlite3 "~> 2.1"; adds new_framework_defaults_8_0.rb)
↓
Rails 8.1
│
├─ Gemfile: rails "~> 8.1", tsort 0.2.0 (8.1 requires it)
├─ bundle update rails
├─ bin/rails app:update
├─ re-comment config.assume_ssl / config.force_ssl in production.rb
├─ bin/rails zeitwerk:check
├─ tests, manually test app
└─ commit
↓
Ruby 3.3.12
│
├─ rvm install 3.3.12 && rvm use 3.3.12
├─ edit .ruby-version + Gemfile `ruby "3.3.12"`
├─ remove the stringio pin
├─ bundle install   (execjs bumps 2.8.1 → 2.10.2 for json 3)
├─ tests, manually test app
└─ commit
```

## Notable changes and gotchas

- **Rails 7.1: missing callback actions now raise.** `before_action ... only: %i[show ...]` fails if the controller has no `show`. Removed `show` from the lists in `Admin::BusinessesController` and `Admin::ManagedFilesController`.
- **Turbo 2: failed form renders need a 4xx status.** The login page flash didn't appear until `render :user_login, status: :unprocessable_entity` in `UserController`.
- **Rails 8.1 `app:update` turns on SSL settings** (`assume_ssl`, `force_ssl`) because it assumes Kamal. This app deploys with Capistrano, so keep them commented out.
- **Gem pins:** `i18n` stays at 1.14.8; `tsort` 0.1.0 → 0.2.0 for Rails 8.1; `stringio` pin dropped for Ruby 3.3.
- `config.load_defaults` is still `7.0`. The `new_framework_defaults_*.rb` files hold the newer defaults to flip on one at a time later.
- `app:update` also regenerated `config/environments/*`, `puma.rb`, `public/*.html` error pages, added `bin/ci`, `config/ci.rb`, and Active Storage migrations.
