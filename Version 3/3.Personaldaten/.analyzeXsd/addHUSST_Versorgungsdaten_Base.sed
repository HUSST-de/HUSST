# weist zwei Datentypen einer HUSST_Versorgungsdaten_xxx.sed das Base-Schema zu
#

/name="DynAttribut_Subtype"/{
  :n
  N
  /\/xs:documentation/!bn
  s/$/\n      <xs:appinfo>\
        <api:schema name="Basis"\/>\
      <\/xs:appinfo>/
}

/name="DynAttributWert_Subtype"/{
  s/$/\n    <xs:annotation>\
      <xs:appinfo>\
        <api:schema name="Basis"\/>\
      <\/xs:appinfo>\
    <\/xs:annotation>/
}
