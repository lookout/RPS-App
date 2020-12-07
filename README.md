# RPS-App
This is a simple flask app that was built was originally built for spinnaker-hackaton

The intent was to create an image that would utilize a few environment variables.

Then deploy the app into a kubernetes cluster, with a matching configmap.  See k8s manifests in gitops/manifests

A sample Spinnaker pipeline is also saved in the gitops/pipelines folder 

## How to build the image: 
Dockerfile will create a docker image of the Flask App /RPS-App

`docker build -t rps .`

## Environment Variables:

`RPS_USER` - this is username that gets displayed
`RPS_VERSION` - just a version number that gets added to v0.1.2+
`RPS_WEBPORT` - if specified determines which port the app runs.  

## Development
The `VERSION` file at the base of this repo contains the semver version number for the container that will be built by `./scripts/docker-build.sh`. This script will run via GitHub Actions whenever the `master` branch is pushed to GitHub. You can run it manually to build and push the `away168/rps` container like so:

```shell
$ ./scripts/docker-build.sh
```

For convenience, you can use the script `./scripts/bump-version.sh` to update the `VERSION` file. This script depends on the Python script [bump2version](https://pypi.org/project/bump2version/). The configuration file for `bump2version` is found in this repo at `./.bumpversion.cfg`.

### `bump-version` Examples

```shell
$ ./scripts/bump-version.sh --help
Usage: bump-version.sh [--dry-run] [PART]
Arguments:
  PART            The part of the semver version to bump: major, minor, or patch
                  Default: patch
Options:
  -h | --help     Print this usage guide.
  -d | --dry-run  Do a dry run and print what the version bump would do
Note:
  This script requires bump2version -- https://pypi.org/project/bump2version/

$ ./scripts/bump-version.sh --dry-run
/usr/local/bin/bump2version
current_version=1.0.4
new_version=1.0.5
SUCCESS: Version is now set to 1.0.4.
```
