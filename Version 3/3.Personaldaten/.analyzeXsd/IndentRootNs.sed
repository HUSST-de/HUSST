# indents root attributes 
:l;s/(<xs:schema[^\n]*) +([^\s\n]+)/\1\n  \2/;tl

":l;s/(^<xs:schema[^^\n]*) ^+([^^\s\n]^+)/\1\n  \2/;tl"

sed -r -e":l;s/(<xs:schema[^\n]*) +([^\s\n]+)/\1\n  \2/;tl" Test.xsd