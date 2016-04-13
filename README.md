# cap-api-docker

Minimal Docker setup to access the CAP API via Ruby

## Dependencies

- Docker

## Installation

- Clone this repo and `cd` into it.

- Create a `.env` file and add your API keys:

```
$ cp .env.example .env
# then add the keys
```

- Build the image:

```
$ docker-build -t cap-api-ruby .
```

This will likely end in an error. That's ok. This is solved in the next step.

- Create a `Gemfile.lock`:

```
$ docker run --rm -v "$PWD":/usr/src/app -w /usr/src/app ruby:2.1 bundle install
```

## Usage

Once you have the container built properly, you can run the script:

```
$ docker run -t -i cap-api ruby cap.rb
```

## Development

If you want to edit `cap.rb`, you'll have to rebuild the image (`docker-build -t cap-api-ruby .`).

## Public domain

This project is in the public domain within the United States, and
copyright and related rights in the work worldwide are waived through
the [CC0 1.0 Universal public domain dedication](https://creativecommons.org/publicdomain/zero/1.0/).

All contributions to this project will be released under the CC0
dedication. By submitting a pull request, you are agreeing to comply
with this waiver of copyright interest.
