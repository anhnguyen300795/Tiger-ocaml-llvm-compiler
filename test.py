import os, fnmatch, sys, argparse

TEST_DIR = "./test"
TEST_FILE_PATTERN = '*.tig'
SUCCESS_CODE = 0

def print_success(file_name):
    print('\033[92m' + u'\u2713' + ' ' + file_name + '\033[0m')

def print_error(file_name):
    print('\033[91m' + u'\u2718' + ' ' + file_name + '\033[0m')


def build_compiler():
    cmd = ("ocamlbuild -tag 'debug, explain' -use-menhir -use-ocamlfind -package llvm src/parse.native &&"
           "mv _build/src/parse.native bin/compiler")
    exit_code = os.system(cmd)
    if exit_code != SUCCESS_CODE:
        print_error("Build Ocaml compiler fail")
        exit(exit_code)

def run_single_test_without_compile(file_name):
    cmd = ("./bin/compiler test/" + file_name + " &&"
     "opt -f -S llvm_byte_code/test/"+ file_name +".ll -o llvm_byte_code/test/"+ file_name +"-opt.ll"
     " -mem2reg -adce -argpromotion -constmerge -globaldce -globalopt -loop-deletion -constprop &&"
     "llc llvm_byte_code/test/" + file_name + "-opt.ll &&"
     "clang llvm_byte_code/test/" + file_name + "-opt.s src/bindings.c -o run_prog &&"
     "./run_prog")

    code = os.system(cmd)
    return code


def run_single_test_compile(file_name):
    print "================== RUN SINGLE TEST =================="
    build_compiler()
    exit_code = run_single_test_without_compile(file_name)

    if exit_code != SUCCESS_CODE:
        print_error(file_name)
    else:
        print_success(file_name)
        

def run_all_test():
    print "================== RUN ALL TESTS =================="
    all_files_in_test_dir = os.listdir(TEST_DIR)
    test_files = list(filter(lambda file_name: fnmatch.fnmatch(file_name, TEST_FILE_PATTERN), all_files_in_test_dir))

    build_compiler()
    test_fails = []
    
    for test_file in test_files:
        exit_code = run_single_test_without_compile(test_file)
        if exit_code != SUCCESS_CODE:
            print_error(test_file)
            test_fails.append(test_file)
        else:
            print_success(test_file)

    if len(test_fails) > 0:
        print "================== FAILED TESTS =================="
        for test_fail in test_fails:
            print_error(test_fail)
    else:
        print "================== ALL TESTS PASSED =================="

        
parser = argparse.ArgumentParser()
parser.add_argument("-s", "--single", type=str,
                        help="run single test")
args = parser.parse_args()

def main():
    if args.single != None:
        run_single_test_compile(args.single)
    else:
        run_all_test()

if __name__ == '__main__':
    main()