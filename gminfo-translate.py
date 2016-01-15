"""
Translates game object information to a file. Right now this excludes all properties about the object.
"""
import argparse
import os
import glob

INDENT_SPACES = 4

def codewrite(f_out, string, indent=0):
    f_out.write("\n")
    f_out.write(" " * INDENT_SPACES * indent)
    f_out.write(string)

def main():

    # Parse input
    parser = argparse.ArgumentParser()
    parser.add_argument("files", nargs="+", help="File/s to compile. Globs allowed.")
    parser.add_argument("-o", "--out-dir", type=str, help="Output directory including final slash.", default="translated")
    args = parser.parse_args()

    outdir = args.out_dir

    # Find files to translate
    translate_files = []
    for glob_path in args.files:
        matches = glob.glob(glob_path)
        translate_files.extend(matches)

    if not translate_files:
        print "Error: No files matched file specifications"
        return 1

    # Translate files
    for source in translate_files:
        name = os.path.splitext(os.path.basename(source))[0]

        running_object = False
        running_event = False
        running_codeblock = False
        obj_name = None

        with open(outdir + name + ".gml", "w") as f_out:
            with open(source,"r") as f_in:
                for linestr in f_in:

                    linestr = linestr.translate(None, "\n\r")

                    # Check if end of object declaration
                    if linestr == "______________________________________________________":
                        continue

                    # Check if object declaration
                    splitstr = linestr.split(":")

                    if splitstr[0] == "Information about object":
                        obj_name = splitstr[1]
                        if obj_name[0] == " ": obj_name = obj_name[1:]
                        print "Declare object", obj_name

                        if running_event: codewrite(f_out, "}", 1)
                        if running_object: codewrite(f_out, "}")
                        codewrite(f_out, "object " + obj_name + " {")
                        running_object = True
                        running_event = False
                        running_codeblock = False
                        continue

                    first_words = splitstr[0].split()
                    if "Event" in first_words:
                        if running_event: codewrite(f_out, "}", 1)
                        codewrite(f_out, "// " + linestr, 1)
                        codewrite(f_out, "event ??? {", 1)
                        running_event = True
                        running_codeblock = False
                        continue

                    if running_event and linestr == "execute code:":
                        running_codeblock = True
                        continue

                    if running_codeblock and linestr.translate(None, " "):
                        codewrite(f_out, linestr, 2)

            if running_event:
                codewrite(f_out, "}", 1)

            if running_object:
                codewrite(f_out, "}")

    print "Translation finished"

if __name__ == "__main__":
    main()