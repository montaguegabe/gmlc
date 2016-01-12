#!/usr/bin/python

import sys
import argparse
import glob
import os
import shutil
from gmlc_compiler import Compiler, CHAR_SYMBOLS
from gmlc_sbltranslator import SblTranslator
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

class AlertType:
    ERR = 1
    WARN = 2

def main():

    # Parse input
    parser = argparse.ArgumentParser()
    parser.add_argument("files", nargs="+", help="File/s to compile. Globs allowed.")
    parser.add_argument("-o", "--output", type=str, help="Output file path, not including extension.", default="out")
    parser.add_argument("-se", "--script-export", help="Allow parsing of exported scripts from Game Maker.", action="store_true")
    parser.add_argument("-r", "--release", help="Minify GML code. Runtime errors will be illegible.", action="store_true")
    parser.add_argument("-el", "--errorlim", type=int, help="Maximum number of errors before aborting.", default=10)
    parser.add_argument("-dne", "--dbg-no-encrypt", help="Will break the executable but share code output.", action="store_true")
    parser.add_argument("-minstr", "--minify-strings", help="Will minify strings that consist solely of a name.", action="store_true")
    args = parser.parse_args()
    
    # Find files to compile
    compile_files = []
    for glob_path in args.files:
        matches = glob.glob(glob_path)
        compile_files.extend(matches)

    # Temporary file for compiling
    tmppath = ".tmpcomp"
    exepath = "run.exe"

    compiler = Compiler(args.script_export)
    alerts = []
    error_num = 0

    # Compile files
    with open(tmppath, "w") as f_out:

        # Helper to process feed result
        def process_feed_results(results, alerts):
            
            (out, warn, err) = results
            map(lambda warning : alerts.append((AlertType.WARN, source, line, col, warning)), warn)
            map(lambda error : alerts.append((AlertType.ERR, source, line, col, error)), err)

            if out:
                # Add transpiled code to executable
                f_out.write(out)

            return error_num + len(err)

        for source in compile_files:
            print "Compiling", source + "..."
            with open(source,"r") as f_in:
                line = 1
                ml_comment = False
                for linestr in f_in:

                    symbols, ml_comment = line_to_symbols(linestr, CHAR_SYMBOLS, ml_comment)
                    for symbol, idx in symbols:

                        col = idx + 1

                        # Generate compiled code, warnings, errors
                        results = compiler.feed(symbol)
                        error_num = process_feed_results(results, alerts)

                        if error_num > args.errorlim: break

                    line += 1
                    if error_num > args.errorlim: break

            if error_num > args.errorlim: break

            # Finalize file
            #final_results = compiler.feed_final

        # Finalize compilation
        final_results = compiler.feed_final()
        error_num = process_feed_results(final_results, alerts)

    # Simple warnings
    if args.dbg_no_encrypt:
        alerts.append((AlertType.WARN, None, None, None, "Encryption is disabled. Executable is not runnable."))

    # Notify the user of results
    map(lambda alert: print_alert(alert), alerts)

    if error_num != 0:

        # Delete output file
        os.remove(tmppath)

        # Alert
        print "Compilation failed due to errors."
        return 1

    # Create the executable by copying
    outpath = args.output + ".exe" if args.output[-4:] != ".exe" else args.output
    shutil.copy(exepath, outpath)

    # Translate to the executable
    resource_names = compiler.get_resource_names()
    script_names = compiler.get_script_names()
    exe_size = os.path.getsize(exepath)
    translator = SblTranslator(resource_names, script_names, exe_size, args.release, not args.dbg_no_encrypt)

    with open(outpath, "a") as f_out, open(tmppath, "r") as f_in:
        for compiled_line in f_in:
            symbols = explode_preserve(compiled_line, None)
            for symbol in symbols:
                f_out.write(translator.feed(symbol))

    print translator.mini_maps

    # Delete temporary file
    os.remove(tmppath)

    print "Compilation passed. Output file:", outpath, "generated."

# Prints an alert
def print_alert(alert):
    (typ, source, line, col, string) = alert

    # Print type
    if typ == AlertType.ERR:
        print BColors.FAIL + "ERROR" + BColors.ENDC,
    elif typ == AlertType.WARN:
        print BColors.WARNING + "WARNING" + BColors.ENDC,

    # Print location
    if source: print "in file", source + ", line", line, "col", col

    # Print string
    print string

if __name__ == "__main__":
    main()