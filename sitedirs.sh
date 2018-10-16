#! /bin/bash
# sitedirs.sh
#
# Constructed by h8rt3rmin8r on 20181015
#
# Build a series of directories for every letter of the alphabet and write
# an index.html redirect page into every directory.
# Build a series of directories for the numbers 0 through 9 and write an
# index.html redirect page into every directory.
#

alpha_arr=( a b c d e f g h i j k l m n o p q r s t u v w x y z )
num_arr=( 0 1 2 3 4 5 6 7 8 9 )
ht_01='PCFET0NUWVBFIGh0bWw+PGh0bWwgbGFuZz0iZW4iPjxoZWFkPg=='
ht_02='PG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg=='
ht_03='PG1ldGEgbmFtZT0idmlld3BvcnQiIGNvbnRlbnQ9IndpZHRoPWRldmljZS13aWR0aCwgaW5pdGlhbC1zY2FsZT0xLjAiPg=='
ht_04='PG1ldGEgaHR0cC1lcXVpdj0iWC1VQS1Db21wYXRpYmxlIiBjb250ZW50PSJJRT1lZGdlIj4='
ht_05='PHRpdGxlPkdPIEJBQ0s8L3RpdGxlPjwvaGVhZD4='
ht_06='PCEtLSBBdXRvbWF0aWMgcmVkaXJlY3Rpb24gLS0+PGJvZHkgb25sb2FkPSJnb0JhY2soKSI+'
ht_07='PGJyPjxwPlRoaXMgcGFnZSBwZXJmcG9ybXMgYW4gaW50ZW50aW9uYWwgcmVkaXJlY3Rpb24uPC9wPjxicj4='
ht_08='PHNjcmlwdD5mdW5jdGlvbiBnb0JhY2soKSB7d2luZG93Lmhpc3RvcnkuYmFjaygpO308L3NjcmlwdD4='
ht_09='PC9ib2R5PjwvaHRtbD4='
html_part1=( "${ht_01}" "${ht_02}" "${ht_03}" "${ht_04}" "${ht_05}" )
html_part2=( "${ht_06}" "${ht_07}" "${ht_08}" "${ht_09}" )
html_core=( $(echo ${html_part1[@]} ${html_part2[@]}) )
vb_01='VGhpcyBzY3JpcHQgYnVpbGRzIHR3byBzZXRzIG9mIHdlYnNpdGUgZGlyZWN0b3JpZXMu'
vb_02='ICAgIDEpIExldHRlcnMgLSA='
vb_03='ICAgIDIpIE51bWJlcnMgLSA='
vb_04='QnVpbGRpbmcgZmlsZXMgYW5kIGRpcmVjdG9yaWVzIG5vdy4uLg=='
vb_05='RG9uZSE='

function alpha_dirs() {
    # Build a series of directories for every letter of the alphabet and write
    # an index.html redirect page into every directory.
    for i in "${alpha_arr[@]}"; do
        mkdir -p $i; touch $i/index.html
        echo $(html_build) >> $i/index.html
    done; return
}

function html_build() {
    # HTML file content constructor function
    for i in "${html_core[@]}"; do echo -n $i | base64 -d; done
}

function num_dirs() {
    # Build a series of directories for the numbers 0 through 9 and write an
    # index.html redirect page into every directory.
    for i in "${num_arr[@]}"; do
        mkdir -p $i; touch $i/index.html
        echo $(html_build) >> $i/index.html
    done
}

function vbs_out() {
    # Verbosity function
    case "$1" in
        -1) echo ${vb_01} | base64 -d ;;
        -2) echo ${vb_02} | base64 -d ;;
        -3) echo ${vb_03} | base64 -d ;;
        -4) echo ${vb_04} | base64 -d ;;
        -5) echo ${vb_05} | base64 -d ;;
    esac; return
}

echo "$(vbs_out -1)"; sleep 0.6
echo "$(vbs_out -2)${alpha_arr[@]}"; echo "$(vbs_out -3)${num_arr[@]}"
sleep 0.6; echo "$(vbs_out -4)"; sleep 0.8
alpha_dirs
num_dirs
echo "$(vbs_out -5)"

