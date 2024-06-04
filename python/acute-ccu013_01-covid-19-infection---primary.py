# Johan H Thygesen, Christopher Tomlinson, et al., 2024.

import sys, csv, re

codes = [{"code":"1240421000000101","system":"snomedct"},{"code":"1240571000000101","system":"snomedct"},{"code":"1240741000000103","system":"snomedct"},{"code":"1240521000000100","system":"snomedct"},{"code":"1321241000000105","system":"snomedct"},{"code":"1240531000000103","system":"snomedct"},{"code":"1240561000000108","system":"snomedct"},{"code":"1240551000000105","system":"snomedct"},{"code":"1240381000000105","system":"snomedct"},{"code":"1240751000000100","system":"snomedct"},{"code":"1240541000000107","system":"snomedct"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('ccu013_01-covid-19-infection-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["acute-ccu013_01-covid-19-infection---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["acute-ccu013_01-covid-19-infection---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["acute-ccu013_01-covid-19-infection---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)