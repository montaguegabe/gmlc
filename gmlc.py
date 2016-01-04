#!/usr/bin/python

import sys
import argparse
import glob
import os
import shutil
from enum import Enum
from gmlc_compiler import Compiler, CHAR_SYMBOLS
from gmlc_utils import *

class BColors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

class AlertType(Enum):
    ERR = 1
    WARN = 2

def main():

    # Parse input
    parser = argparse.ArgumentParser()
    parser.add_argument('files', nargs='+', help='File/s to compile. Globs allowed.')
    parser.add_argument('-o', '--output', type=str, help='Output file path, not including extension.', default='out')
    parser.add_argument('-el', '--errorlim', type=int, help='Maximum number of errors before aborting.', default=10)
    args = parser.parse_args()
    
    # Find files to compile
    compile_files = []
    for glob_path in args.files:
        matches = glob.glob(glob_path)
        compile_files.extend(matches)

    # Create executable by copying
    outpath = args.output + '.exe' if args.output[-4:] != ".exe" else args.output
    shutil.copy('run.exe', outpath)

    compiler = Compiler()
    alerts = []
    error_num = 0

    # Compile files
    with open(outpath, 'a') as f_out:

        # Helper to process feed result
        def process_feed_results(results):
            
            (out, warn, err) = results
            map(lambda warning : alerts.append((alerttype.WARN source, line, col, warning)), warn)
            map(lambda error : alerts.append((alerttype.ERR, source, line, col, error)), err)
            error_num += len(err)

            if out:
                # Add transpiled code to executable
                f_out.write(out)

        for source in compile_files:
            with open(source,'r') as f_in:
                line = 1
                col = 1
                for line in f_in:
                    words = line.split(' ')
                    symbols = flatten(map(lambda word: explode_keep(word, CHAR_SYMBOLS)))

                    for symbol in symbols:

                        # Generate compiled code, warnings, errors
                        results = compiler.feed(symbol)
                        process_feed_results(results)

                        col += len(word)
                        if error_num > args.errorlim: break

                    line += 1
                    if error_num > args.errorlim: break

            if error_num > args.errorlim: break

        # Finalize compilation
        final_results = compiler.feed_final()
        process_feed_results(final_results)

    # Notify the user of results
    map(lambda alert: print_alert(alert), alerts)

    if error_num == 0:
        print "Compilation passed. Output file:", outpath, "generated."
    else:
        # Delete output file
        os.remove(outpath)

        print "Compilation failed due to errors."

# Prints an alert
def print_alert(alert):
    (typ, source, line, col, string) = alert

    # Print type
    if typ == alerttype.ERR:
        print BColors.FAIL + "ERROR" + BColors.ENDC,
    elif typ == alerttype.WARN:
        print BColors.WARNING + "WARNING" + BColors.ENDC,

    # Print location
    print "in file", source + ", line", line, "col", col

    # Print string
    print string

if __name__ == '__main__':
    main()