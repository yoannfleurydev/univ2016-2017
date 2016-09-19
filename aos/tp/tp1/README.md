# Rappels

## Exercice 2

### Web Service de convertion

[Lien](http://www.webservicex.net/New/Home/ServiceDetail/21)

Ce Web service permet la convertion d'une distance dans une unité différente.

Request `POST` :

```xml
<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <ChangeLengthUnit xmlns="http://www.webserviceX.NET/">
      <LengthValue>double</LengthValue>
      <fromLengthUnit>Angstroms or Nanometers or Microinch or Microns or Mils or Millimeters or Centimeters or Inches or Links or Spans or Feet or Cubits or Varas or Yards or Meters or Fathoms or Rods or Chains or Furlongs or Cablelengths or Kilometers or Miles or Nauticalmile or League or Nauticalleague</fromLengthUnit>
      <toLengthUnit>Angstroms or Nanometers or Microinch or Microns or Mils or Millimeters or Centimeters or Inches or Links or Spans or Feet or Cubits or Varas or Yards or Meters or Fathoms or Rods or Chains or Furlongs or Cablelengths or Kilometers or Miles or Nauticalmile or League or Nauticalleague</toLengthUnit>
    </ChangeLengthUnit>
  </soap:Body>
</soap:Envelope>
```

Response :

```xml
<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <ChangeLengthUnitResponse xmlns="http://www.webserviceX.NET/">
      <ChangeLengthUnitResult>double</ChangeLengthUnitResult>
    </ChangeLengthUnitResponse>
  </soap:Body>
</soap:Envelope>
```


