# Requirements Template

This is the template for requirements published by Netwerk Digitaal Erfgoed.

Requirements are written in Markdown and transformed to HTML using the
[Bikeshed preprocessor](https://tabatkins.github.io/bikeshed/).


## Usage

1. Create a new repository using this template by clicking the green _Use this template_ button on Github.

![](images/step-1.png)

2. Fill in the necessary repository information.

![](images/step-2.png)
   
1. Clone the new repository using `git clone https://github.com/<your_repository>` and edit the `index.bs` to start the requirements specification writing!

## Generate HTML locally

The build, the NDE logo and the house style come from
[spec-boilerplate](https://github.com/netwerk-digitaal-erfgoed/workflows/tree/main/spec-boilerplate),
at the version of the shared workflow that `.github/workflows` calls. `make spec` downloads that version once,
so a local build matches CI. Dependabot proposes each new version as a pull request, which merges itself once the
spec builds with it.

To view HTML output locally (using Node.js and a [Docker container](https://github.com/netwerk-digitaal-erfgoed/bikeshed-docker)),
run:

```bash
make spec
```

and open the `index.html` file:

```bash
open index.html
```

**WARNING: Do NOT add the generated `index.html` to your `.gitignore` as this will make github actions unable to automatically publish the rendered version of your specification on github pages.**

Alternatively, to update the HTML every time you make changes to [the source document](index.bs):

```bash
make watch
```

## Versioning

Requirements are versioned using [release-please](https://github.com/googleapis/release-please).
A version lets implementers state which requirements they conform to, and the changelog shows them what changed
between versions. The spec is published only when a version is released, so the published spec is always a finished
version.

Only the specs created from this template are versioned, not the template itself: a new spec starts as a copy of
the template, so the template’s own version and changelog would end up in every new spec.

Use [Conventional Commits](https://www.conventionalcommits.org/) in your commit messages to trigger version bumps:

- `feat:` bumps the minor version (e.g. 1.0 → 1.1)
- `fix:` bumps the patch version (e.g. 1.0.0 → 1.0.1)

When commits are pushed to `main`, release-please opens a release PR that bumps `version.txt`, `CHANGELOG.md`,
and syncs the changelog into the spec's Changes section.
