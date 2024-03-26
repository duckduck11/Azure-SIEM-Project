FAILED_RDP_WITH_GEO_CL
| extend Latitude = todouble(extract(@"latitude:(\d+\.\d+)", 1, RawData)),
         Longitude = todouble(extract(@"longitude:(\d+\.\d+)", 1, RawData)),
         DestinationHost = extract(@"destinationhost:(.*?),", 1, RawData),
         Username = extract(@"username:(.*?),", 1, RawData),
         SourceHost = extract(@"sourcehost:(.*?),", 1, RawData),
         State = extract(@"state:(.*?),", 1, RawData),
         Country = extract(@"country:(.*?),", 1, RawData),
         Label = extract(@"label:(.*?),", 1, RawData),
         Timestamp = todatetime(extract(@"timestamp:(.*?),", 1, RawData))

| summarize event_count=count() by SourceHost, Latitude, Longitude, Country, Label, DestinationHost
| where DestinationHost != "samplehost"
| where SourceHost != ""
