# Wordpress Build Tools

[![](https://images.microbadger.com/badges/version/digitalmobil/wp-build-tools.svg)](http://microbadger.com/images/digitalmobil/wp-build-tools "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/digitalmobil/wp-build-tools.svg)](http://microbadger.com/images/digitalmobil/wp-build-tools "Get your own image badge on microbadger.com")

# What is this?
A docker image that contains all build tools required for building [dm-wordpress](https://www.digitalmobil.com) images.

Features:
  * [composer](https://getcomposer.org)
  * [nodejs](https://nodejs.org) / [npm](https://npmjs.org)
  * [grunt](https://gruntjs.com) / [grunt-cli](https://github.com/gruntjs/grunt-cli)
  * [bower](https://bower.io)
  * [sass](https://sass-lang.com)
  * Uniformly use `/data` as the working directory for any of the tools above
  * Executing as non-privileged user `wp-build`
  * Preserving file permissions by adopting the `/data` dir owner's UID

# How to use this image

## Installation

```sh
docker pull digitalmobil/wp-build-tools
```

## Usage

1. Run Composer

    Simple composer call in the current directory: 

    ```sh
    docker run --rm -v $(pwd):/data digitalmobil/wp-build-tools composer --help
    ```

    If working with packages installed via git ssh the local .ssh directory shall be mapped into the container: 

    ```sh
    docker run --rm -v $(pwd):/data               \
                    -v ~/.ssh:/home/wp-build/.ssh \
                    digitalmobil/wp-build-tools composer install
    ```

    To speed up things the local cache can be utilized as well: 

    ```sh
    docker run --rm -v $(pwd):/data                         \
                    -v ~/.ssh:/home/wp-build/.ssh           \
                    -v ~/.composer:/home/wp-build/.composer \
                    digitalmobil/wp-build-tools composer install
    ```

2. Run npm

    ```sh
    docker run --rm -v $(pwd):/data digitalmobil/wp-build-tools npm install
    ```

3. Run grunt
    
    ```sh
    docker run --rm -v $(pwd):/data digitalmobil/wp-build-tools grunt prod
    ```

