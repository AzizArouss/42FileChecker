#!/bin/bash

if [ "$FILECHECKER_SH" == "1" ]
then

	declare -a CHK_FT_PRINTF_LIST

	# easy
	CHK_FT_PRINTF_LIST+=("0" "")
	CHK_FT_PRINTF_LIST+=("0" "\n")
	CHK_FT_PRINTF_LIST+=("0" "test")
	CHK_FT_PRINTF_LIST+=("0" "test\n")
	CHK_FT_PRINTF_LIST+=("0" "1234")

	# wrong flag
	CHK_FT_PRINTF_LIST+=("0" "%")
	CHK_FT_PRINTF_LIST+=("0" "% ")
	CHK_FT_PRINTF_LIST+=("0" "% h")
	CHK_FT_PRINTF_LIST+=("0" "%Z")
	CHK_FT_PRINTF_LIST+=("0" "% hZ")

	# %
	CHK_FT_PRINTF_LIST+=("0" "%%")
	CHK_FT_PRINTF_LIST+=("0" "%5%")
	CHK_FT_PRINTF_LIST+=("0" "%-5%")
	CHK_FT_PRINTF_LIST+=("0" "%05%")
	CHK_FT_PRINTF_LIST+=("0" "%-05%")
	CHK_FT_PRINTF_LIST+=("0" "% hZ%")
	CHK_FT_PRINTF_LIST+=("0" "%.0%")

	# hexadecimal
	#CHK_FT_PRINTF_LIST+=("0p" "%p|(void *)(str = \"I am a void\")")




	CHK_FT_PRINTF_LIST+=("s" "% Z|test")
	CHK_FT_PRINTF_LIST+=("s" "% Z |test")
	CHK_FT_PRINTF_LIST+=("s" "% Z%s|test")
	CHK_FT_PRINTF_LIST+=("s" "%%|test")
	CHK_FT_PRINTF_LIST+=("s" "%   %|test")
	CHK_FT_PRINTF_LIST+=("s" "%000   %|test")
	CHK_FT_PRINTF_LIST+=("s" "%%%|test")
	CHK_FT_PRINTF_LIST+=("s" "%%   %|test")



	# x X
	CHK_FT_PRINTF_LIST+=("x" "%x|42")
	CHK_FT_PRINTF_LIST+=("x" "%X|42")
	CHK_FT_PRINTF_LIST+=("x" "%x|0")
	CHK_FT_PRINTF_LIST+=("x" "%X|0")
	CHK_FT_PRINTF_LIST+=("x" "%x|-42")
	CHK_FT_PRINTF_LIST+=("x" "%X|-42")
	CHK_FT_PRINTF_LIST+=("x" "%x|4294967296")
	CHK_FT_PRINTF_LIST+=("x" "%X|4294967296")
	CHK_FT_PRINTF_LIST+=("xs" "%x|test")

	CHK_FT_PRINTF_LIST+=("x" "%10x|42")
	CHK_FT_PRINTF_LIST+=("x" "%-10x|42")

	CHK_FT_PRINTF_LIST+=("x" "%lx|4294967296")
	CHK_FT_PRINTF_LIST+=("x" "%llX|4294967296")

	CHK_FT_PRINTF_LIST+=("x" "%hx|4294967296")
	CHK_FT_PRINTF_LIST+=("x" "%hhX|4294967296")

	CHK_FT_PRINTF_LIST+=("x" "%jx|4294967295")
	CHK_FT_PRINTF_LIST+=("x" "%jx|4294967296")

	CHK_FT_PRINTF_LIST+=("x" "%jx|-4294967296")
	CHK_FT_PRINTF_LIST+=("x" "%jx|-4294967297")

	CHK_FT_PRINTF_LIST+=("x" "%llx|9223372036854775807")
	CHK_FT_PRINTF_LIST+=("x" "%llx|9223372036854775808")

	CHK_FT_PRINTF_LIST+=("x" "%010x|542")
	CHK_FT_PRINTF_LIST+=("x" "%-15x|542")
	CHK_FT_PRINTF_LIST+=("x" "%2x|542")
	CHK_FT_PRINTF_LIST+=("x" "%.2x|5427")
	CHK_FT_PRINTF_LIST+=("x" "%5.2x|5427")

	CHK_FT_PRINTF_LIST+=("x" "%#x|42")
	CHK_FT_PRINTF_LIST+=("x" "%ll#x|9223372036854775807")
	CHK_FT_PRINTF_LIST+=("x" "%#llx|9223372036854775807")


	# string
	CHK_FT_PRINTF_LIST+=("s" "%s|abc")
	CHK_FT_PRINTF_LIST+=("s" "%s|this is a string")
	CHK_FT_PRINTF_LIST+=("s" "%s |this is a string")
	CHK_FT_PRINTF_LIST+=("s" "%s  |this is a string")
	CHK_FT_PRINTF_LIST+=("s" "this is a %s|string")
	CHK_FT_PRINTF_LIST+=("s" "%s is a string|this")
	CHK_FT_PRINTF_LIST+=("s" "Line Feed %s|\n")

	CHK_FT_PRINTF_LIST+=("s" "%10s is a string|this")
	CHK_FT_PRINTF_LIST+=("s" "%010s is a string|this")
	CHK_FT_PRINTF_LIST+=("s" "%.2s is a string|this")
	CHK_FT_PRINTF_LIST+=("s" "%5.2s is a string|this")
	CHK_FT_PRINTF_LIST+=("s" "%10s is a string|")
	CHK_FT_PRINTF_LIST+=("s" "%.2s is a string|")
	CHK_FT_PRINTF_LIST+=("s" "%5.2s is a string|")

	CHK_FT_PRINTF_LIST+=("s" "%-10s is a string|this")
	CHK_FT_PRINTF_LIST+=("s" "%-010s is a string|this")
	CHK_FT_PRINTF_LIST+=("s" "%-.2s is a string|this")
	CHK_FT_PRINTF_LIST+=("s" "%-5.2s is a string|this")
	CHK_FT_PRINTF_LIST+=("s" "%-10s is a string|")
	CHK_FT_PRINTF_LIST+=("s" "%-.2s is a string|")
	CHK_FT_PRINTF_LIST+=("s" "%-5.2s is a string|")

	CHK_FT_PRINTF_LIST+=("s" "%s %s|this|is")
	CHK_FT_PRINTF_LIST+=("s" "%s %s %s|this|is|a")
	CHK_FT_PRINTF_LIST+=("s" "%s %s %s %s|this|is|a|multi")
	CHK_FT_PRINTF_LIST+=("s" "%s %s %s %s string. gg!|this|is|a|multi|string")
	CHK_FT_PRINTF_LIST+=("s" "%s%s%s%s%s|this|is|a|multi|string")

	CHK_FT_PRINTF_LIST+=("sN" "%s|NULL")
	CHK_FT_PRINTF_LIST+=("sN" "%s %s|NULL|string")




	# c
	CHK_FT_PRINTF_LIST+=("dc" "%c|42")
	CHK_FT_PRINTF_LIST+=("dc" "%5c|42")
	CHK_FT_PRINTF_LIST+=("dc" "%05c|42")
	CHK_FT_PRINTF_LIST+=("dc" "%-5c|42")
	CHK_FT_PRINTF_LIST+=("dc" "%c|0")

	# o
	CHK_FT_PRINTF_LIST+=("dc" "%o|40")
	CHK_FT_PRINTF_LIST+=("dc" "%5o|41")
	CHK_FT_PRINTF_LIST+=("dc" "%05o|42")
	CHK_FT_PRINTF_LIST+=("dc" "%-5o|2500")
	CHK_FT_PRINTF_LIST+=("dc" "%o|0")



	# integer
	CHK_FT_PRINTF_LIST+=("d" "% Z|42")

	CHK_FT_PRINTF_LIST+=("d" "%d|1")
	CHK_FT_PRINTF_LIST+=("d" "the %d|1")
	CHK_FT_PRINTF_LIST+=("d" "%d is one|1")
	CHK_FT_PRINTF_LIST+=("d" "%d|-1")
	CHK_FT_PRINTF_LIST+=("d" "%d|4242")
	CHK_FT_PRINTF_LIST+=("d" "%d|-4242")
	CHK_FT_PRINTF_LIST+=("d" "%d|2147483647")
	CHK_FT_PRINTF_LIST+=("d" "%d|2147483648")
	CHK_FT_PRINTF_LIST+=("d" "%d|–2147483648")
	CHK_FT_PRINTF_LIST+=("d" "%d|–2147483649")

	CHK_FT_PRINTF_LIST+=("d" "% d|42")
	CHK_FT_PRINTF_LIST+=("d" "% d|-42")
	CHK_FT_PRINTF_LIST+=("d" "%0 d|42")
	CHK_FT_PRINTF_LIST+=("d" "%0 d|-42")
	CHK_FT_PRINTF_LIST+=("d" "% 0d|42")
	CHK_FT_PRINTF_LIST+=("d" "% 0d|-42")

	CHK_FT_PRINTF_LIST+=("d" "%+d|42")
	CHK_FT_PRINTF_LIST+=("d" "%+d|-42")
	CHK_FT_PRINTF_LIST+=("d" "%+d|0")
	CHK_FT_PRINTF_LIST+=("d" "%+d|4242424242424242424242")
	CHK_FT_PRINTF_LIST+=("d" "% +d|42")
	CHK_FT_PRINTF_LIST+=("d" "% +d|-42")
	CHK_FT_PRINTF_LIST+=("d" "%+ d|42")
	CHK_FT_PRINTF_LIST+=("d" "%+ d|-42")
	CHK_FT_PRINTF_LIST+=("d" "%  +d|42")
	CHK_FT_PRINTF_LIST+=("d" "%  +d|-42")
	CHK_FT_PRINTF_LIST+=("d" "%+  d|42")
	CHK_FT_PRINTF_LIST+=("d" "%+  d|-42")
	CHK_FT_PRINTF_LIST+=("d" "% ++d|42")
	CHK_FT_PRINTF_LIST+=("d" "% ++d|-42")
	CHK_FT_PRINTF_LIST+=("d" "%++ d|42")
	CHK_FT_PRINTF_LIST+=("d" "%++ d|-42")

	CHK_FT_PRINTF_LIST+=("d" "%0d|-42")
	CHK_FT_PRINTF_LIST+=("d" "%00d|-42")

	CHK_FT_PRINTF_LIST+=("d" "%5d|42")
	CHK_FT_PRINTF_LIST+=("d" "%5+d|42")
	CHK_FT_PRINTF_LIST+=("d" "%05d|42")
	CHK_FT_PRINTF_LIST+=("d" "%0+5d|42")
	CHK_FT_PRINTF_LIST+=("d" "%5d|-42")
	CHK_FT_PRINTF_LIST+=("d" "%5+d|-42")
	CHK_FT_PRINTF_LIST+=("d" "%05d|-42")
	CHK_FT_PRINTF_LIST+=("d" "%0+5d|-42")

	CHK_FT_PRINTF_LIST+=("d" "%-5d|42")
	CHK_FT_PRINTF_LIST+=("d" "%-5+d|42")
	CHK_FT_PRINTF_LIST+=("d" "%-05d|42")
	CHK_FT_PRINTF_LIST+=("d" "%-0+5d|42")
	CHK_FT_PRINTF_LIST+=("d" "%-5d|-42")
	CHK_FT_PRINTF_LIST+=("d" "%-5+d|-42")
	CHK_FT_PRINTF_LIST+=("d" "%-05d|-42")
	CHK_FT_PRINTF_LIST+=("d" "%-0+5d|-42")

	# integer short
	CHK_FT_PRINTF_LIST+=("dh" "%hd|32767")
	CHK_FT_PRINTF_LIST+=("dh" "%hd|−32768")
	CHK_FT_PRINTF_LIST+=("dh" "%hd|32768")
	CHK_FT_PRINTF_LIST+=("dh" "%hd|−32769")

	# signed char
	CHK_FT_PRINTF_LIST+=("dH" "%hhd|127")
	CHK_FT_PRINTF_LIST+=("dH" "%hhd|128")
	CHK_FT_PRINTF_LIST+=("dH" "%hhd|-128")
	CHK_FT_PRINTF_LIST+=("dH" "%hhd|-129")

	# integer long
	CHK_FT_PRINTF_LIST+=("dl" "%ld|2147483647")
	CHK_FT_PRINTF_LIST+=("dl" "%ld|–2147483648")
	CHK_FT_PRINTF_LIST+=("dl" "%ld|2147483648")
	CHK_FT_PRINTF_LIST+=("dl" "%ld|–2147483649")

	# integer long long
	CHK_FT_PRINTF_LIST+=("dL" "%lld|9223372036854775807")
	CHK_FT_PRINTF_LIST+=("dL" "%lld|-9223372036854775808")

	# interger intmax_t
	CHK_FT_PRINTF_LIST+=("dj" "%jd|9223372036854775807")
	CHK_FT_PRINTF_LIST+=("dj" "%jd|–9223372036854775808")

	# interger size_t
	CHK_FT_PRINTF_LIST+=("dz" "%zd|4294967295")
	CHK_FT_PRINTF_LIST+=("dz" "%zd|4294967296")
	CHK_FT_PRINTF_LIST+=("dz" "%zd|–0")
	CHK_FT_PRINTF_LIST+=("dz" "%zd|–1")


	CHK_FT_PRINTF_LIST+=("d" "%d|1")
	CHK_FT_PRINTF_LIST+=("d" "%d %d|1|-2")
	CHK_FT_PRINTF_LIST+=("d" "%d %d %d|1|-2|33")
	CHK_FT_PRINTF_LIST+=("d" "%d %d %d %d|1|-2|33|42")
	CHK_FT_PRINTF_LIST+=("d" "%d %d %d %d gg!|1|-2|33|42|0")




	# u
	CHK_FT_PRINTF_LIST+=("u" "%u|0")
	CHK_FT_PRINTF_LIST+=("u" "%u|1")
	CHK_FT_PRINTF_LIST+=("u" "%u|-1")
	CHK_FT_PRINTF_LIST+=("u" "%u|4294967295")
	CHK_FT_PRINTF_LIST+=("u" "%u|4294967296")

	CHK_FT_PRINTF_LIST+=("u" "%5u|4294967295")
	CHK_FT_PRINTF_LIST+=("u" "%15u|4294967295")
	CHK_FT_PRINTF_LIST+=("u" "%-15u|4294967295")
	CHK_FT_PRINTF_LIST+=("u" "%015u|4294967295")

	CHK_FT_PRINTF_LIST+=("ul" "%lu|4294967295")
	CHK_FT_PRINTF_LIST+=("ul" "%lu|4294967296")
	CHK_FT_PRINTF_LIST+=("ul" "%lu|-42")

	CHK_FT_PRINTF_LIST+=("uL" "%llu|4999999999")

	CHK_FT_PRINTF_LIST+=("uj" "%ju|4999999999")

	CHK_FT_PRINTF_LIST+=("uz" "%ju|4294967296")

	CHK_FT_PRINTF_LIST+=("uU" "%U|4294967295")
	CHK_FT_PRINTF_LIST+=("uU" "%U|4294967296")
	CHK_FT_PRINTF_LIST+=("uU" "%hU|4294967296")
	CHK_FT_PRINTF_LIST+=("uU" "%U|4294967296")












	# extra !!
	# integer long long ??
	# m == L


fi;
