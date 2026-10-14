# Future tests

Tests worth adding later, in priority order. Run the suite in the VM with `bin/rails test`.

Already covered: login/logout (`test/controllers/user_controller_test.rb`), admin page access (`test/integration/admin_access_test.rb`), model validations (`test/models/`), and public file links (`test/integration/managed_file_links_test.rb`).

## 1. Public pages render

Smoke tests that catch view or helper breakage after upgrades, such as the move to Rails 8.1.

- `/` redirects to `/businesses`
- `/businesses` returns 200 and lists published businesses
- Unpublished businesses (`is_published: false`) do not appear on `/businesses`, which shows only published ones
- `/businesses/:id` returns 200 for a published business
- The about pages return 200: `/about/about_us`, `/about/about_join_golocal`, `/about/about_catering_tips`, `/about/about_our_partners`, `/about/about_testimonials`
- `/about` redirects to `/about/about_us`
- `/about/news` and `/about/news/:id` return 200

Suggested file: `test/integration/public_pages_test.rb`. The fixtures in `test/fixtures/businesses.yml` need one published business.

## 2. Business model keywords and filter text

`app/models/business.rb` holds the logic behind the filters and the dietary and catering text on the public pages. These are fast unit tests in `test/models/business_test.rb`.

- `generate_keywords` returns the right keys for each boolean, e.g. `vegan_options: true` gives `"vegan_options"`, `cater_pick_up: true` gives `"cater_pickup"`, and `handles_tax_exemption: true` gives `"tax_exempt"`
- `generate_keywords` returns `[]` when every flag is false
- `generate_keywords_for_filter` only returns keys that appear in `Business.filter_keywords`
- `generate_span_text_for_dietary_restrictions` joins display names, e.g. `"Vegetarian, Vegan"`
- `generate_span_text_for_catering_options` and `generate_span_text_for_event_sizes` work the same way
- Every key in the `keywords_dietary_restrictions`, `keywords_catering_options` and `keywords_event_sizes` lists has an entry in `filter_keywords_to_display`, which catches a typo in either list

## 3. Business create and edit

`BusinessesController#create` and `#update` save keywords and cuisines from the `keywords_selected` and `cuisines_selected` checkbox params, outside strong params.

- When logged in, creating a business with `keywords_selected: { id => "1" }` and `cuisines_selected: { id => "1" }` attaches that keyword and cuisine
- A checkbox submitted as `"0"` is not attached
- An unknown keyword or cuisine id is ignored and does not raise an error
- Updating a business replaces its keywords and cuisines with the new selection
- `Admin::BusinessesController` create and update redirect to `/admin/businesses` and save the permitted fields, including `is_published`

Suggested files: `test/controllers/businesses_controller_test.rb` and `test/controllers/admin/businesses_controller_test.rb`. This needs a `keywords.yml` fixture.
