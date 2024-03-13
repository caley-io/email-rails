# Caley Email

<img width="2310" alt="Screenshot 2023-12-29 at 14 33 35" src="https://github.com/caley-io/caley/assets/15782436/274f1430-8eb5-4650-98f2-debdfec4a8e9">

<b>Get involved: [Discord](https://discord.gg/caley) • [Website](https://caley.io) • [Issues](https://github.com/caley-io/caley/issues)</b>

## The Product

Caley Email reimagines your inbox with a fusion of AI brilliance and unmatched efficiency with smarter analytics, streamlined conversations, and effortless newsletter management all in one sleek package. More than an email client,
it's your unfair advantage.

## Local Development Setup

### Requirements

- `ruby 3.3.0`
- PostgreSQL >9.3 (ideally, latest stable version)

After cloning the repo, set the app up with:

```sh
cd email-rails
cp .env.example .env
bundle install
rails db:setup
```

Then to run Caley Email:

run `foreman start -f Procfile.dev`
and visit `http://localhost:5000`

You can sign in with the following credentials:

Email: `user@caley.to`
Password: `password`

## Contributing

Before contributing, you'll likely find it helpful to [join the discord](https://discord.gg/caley). We can help you get involved with Rails or mobile development.

Once you've done that, please visit our [contributing guide](https://github.com/caley-io/caley/blob/main/CONTRIBUTING.md) to get started!

We will update this section as we get closer to an initial release.

## Repo Activity

![Alt](https://repobeats.axiom.co/api/embed/df98a3d367e25c3052772e6c00022da9cb393167.svg "Repobeats analytics image")

## Copyright & license

Caley.io is distributed under an [AGPLv3 license](https://github.com/caley-io/caley/blob/main/LICENSE).
