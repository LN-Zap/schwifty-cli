# Schwifty CLI

Schwifty CLI is a command-line interface tool that allows users to get bank details from an International Bank Account Number (IBAN). It uses the `schwifty` Python package to validate and extract data from IBANs.

## Installation

Clone the repository and navigate to the project directory:

```bash
git clone https://github.com/LN-Zap/schwifty-cli.git
cd schwifty-cli
```

If you have [`devenv`](https://devenv.sh/) and [`direnv`](https://direnv.net/) setup, the Schwifty development environment should activate automatically on entering the project directory. If not, install those dependencies. Alternativly, install the Python project dependencies.

## Build

To build the Schwifty CLI (using PyInstaller), run the following command in the terminal:

```bash
make build
```

## Test

To run the tests for the Schwifty CLI, use the following command in the terminal:

```bash
make test
```

## Usage

To run the Schwifty CLI direct from the source code, run the following command in the terminal:
```bash
schwifty-src [IBAN]
```

To use the Schwifty CLI, run the following command in the terminal:

```bash
schwifty [IBAN]
```

Example:
```shell
$ schwifty "DE89370400440532013000"
{"bank_code": "37040044", "name": "Commerzbank", "short_name": "Commerzbank K\u00f6ln", "bic": "COBADEFFXXX", "primary": true, "country_code": "DE", "checksum_algo": "13"}
```

The output is json, so you can use `jq` to format it, like so:
```shell
schwifty "DE89370400440532013000" | jq '.'
{
  "bank_code": "37040044",
  "name": "Commerzbank",
  "short_name": "Commerzbank Köln",
  "bic": "COBADEFFXXX",
  "primary": true,
  "country_code": "DE",
  "checksum_algo": "13"
}
```
