import sys
from bs4 import BeautifulSoup

def process_roster(xls):
    with open(xls, "r") as f:
        soup = BeautifulSoup(f)
    tbl = soup.table
    for tr in tbl.find_all('tr'):
        td = list(tr.find_all('td'))
        if len(td) > 3:
            print(td[3].string)

def main(args):
    for xls in args:
        process_roster(xls)

if __name__ == "__main__":
    main(sys.argv[1:])
