import argparse
import json
from schwifty import IBAN

def get_bank_details(iban):
    iban = IBAN(iban)
    return iban.bank

def main():
    parser = argparse.ArgumentParser(description='Get bank details from an IBAN.')
    parser.add_argument('iban', type=str, help='The IBAN to get details for.')

    args = parser.parse_args()

    details = get_bank_details(args.iban)
    print(json.dumps(details))

if __name__ == '__main__':
    main()