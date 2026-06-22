# Pickles In Docker

[![Docker](https://github.com/prmiguel/pickles-report/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/prmiguel/pickles-report/actions/workflows/docker-publish.yml)

`Pickles` is an open source living documentation generator that works on feature files written in the `Gherkin` language.

`pickles-report` is a Docker image containing the `Pickles` command line tool (v4.0.3), ready to generate living documentation from your feature files.

## Requirements

- Docker installed

## Usage

### Basic usage

```sh
docker run --rm -v $PWD:/pickles ghcr.io/prmiguel/pickles-report:latest \
  --feature-directory=./features \
  --output-directory=./report \
  -df=dhtml
```

### All options

```sh
docker run --rm -v $PWD:/pickles ghcr.io/prmiguel/pickles-report:latest --help
```

Pickles supports the following output formats:

| Flag | Format |
|------|--------|
| `-df=dhtml` | Dynamic HTML (self-contained, interactive) |
| `-df=html` | Static HTML |
| `-df=json` | JSON output |
| `-df=excel` | Excel spreadsheet |
| `-df=word` | Word document |
| `-df=openxml` | OpenXML (.docx) |

## Examples

### Generate DHTML report from a Maven project

```sh
docker run --rm \
  -v $PWD:/pickles \
  ghcr.io/prmiguel/pickles-report:latest \
  --feature-directory=src/test/resources/features \
  --output-directory=target/pickles-report \
  -df=dhtml
```

Open `target/pickles-report/index.html` in a browser.

### Generate JSON for CI pipelines

```sh
docker run --rm \
  -v $PWD:/pickles \
  ghcr.io/prmiguel/pickles-report:latest \
  --feature-directory=src/test/resources/features \
  --output-directory=target/pickles-report \
  -df=json
```

## Example project

See [pickles-serenitybdd-example](https://github.com/prmiguel/pickles-serenitybdd-example) for a complete working example with Serenity BDD + Pickles.

## References

- [Pickles Official Site](https://www.picklesdoc.com/)
- [Pickles Documentation](http://docs.picklesdoc.com/en/latest/)
- [Pickles GitHub](https://github.com/picklesdoc/pickles)
