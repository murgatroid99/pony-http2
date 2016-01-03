primitive NO_ERROR fun apply() => 0x0
primitive PROTOCOL_ERROR fun apply() => 0x1
primitive INTERNAL_ERROR fun apply() => 0x2
primitive FLOW_CONTROL_ERROR fun apply() => 0x3
primitive SETTINGS_TIMEOUT fun apply() => 0x4
primitive STREAM_CLOSED fun apply() => 0x5
primitive FRAME_SIZE_ERROR fun apply() => 0x6
primitive REFUSED_STREAM fun apply() => 0x7
primitive CANCEL fun apply() => 0x8
primitive COMPRESSION_ERROR fun apply() => 0x9
primitive CONNECT_ERROR fun apply() => 0xa
primitive ENHANCE_YOUR_CALM fun apply() => 0xb
primitive INADEQUATE_SECURITY fun apply() => 0xc
primitive HTTP_1_1_REQUIRED fun apply() => 0xd

type ErrorCode is (NO_ERROR | PROTOCOL_ERROR | INTERNAL_ERROR | FLOW_CONTROL_ERROR | SETTINGS_TIMEOUT | STREAM_CLOSED | FRAME_SIZE_ERROR | REFUSED_STREAM | CANCEL | COMPRESSION_ERROR | CONNECT_ERROR | ENHANCE_YOUR_CALM | INADEQUATE_SECURITY | HTTP_1_1_REQUIRED)

primitive STREAM_ERROR
primitive CONNECTION_ERROR

type ErrorLevel is (STREAM_ERROR | CONNECTION_ERROR)
